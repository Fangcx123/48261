`timescale 1ns/1ps
// Independent lesson 8 reader: reserve one complete burst, account for every
// return, then issue another burst. Bundled bank is held until request ACK.
// Unlike a fixed CAS delay, the drain state tolerates gaps/refresh in returns.
module media_frame_reader #(
    parameter ADDR_BITS=21, IMAGE_WORDS=307200, BURST_SIZE=128,
    parameter RETURN_TIMEOUT=4166667,ENABLE_PREVIEW=0
)(
    input mem_clk, rst, pix_clk, pix_rst,
    input controller_init_done, write_busy,
    input read_req, input [1:0] active_index,
    output reg read_req_ack, output reg frame_read_done,
    output read_busy, output app_rd_en, output [ADDR_BITS-1:0] app_rd_addr,
    input sdram_rd_valid, input [31:0] sdram_rd_data,
    input pixel_consume, input display_valid,
    output [31:0] pixel_data, output pixel_valid,
    output reg underflow, output reg [3:0] reader_error,
    input active_thumbnail,output read_urgent
);
    localparam IDLE=0, ACK=1, WAIT_ROOM=2, ISSUE=3, DRAIN=4, HALT=5;
    localparam [ADDR_BITS-1:0] WORDS=IMAGE_WORDS;
    localparam [ADDR_BITS-1:0] BANK1=WORDS,BANK2=WORDS*2,BANK3=WORDS*3;
    reg [2:0] state;
    (* async_reg="true" *) reg [2:0] req_sync;
    (* async_reg="true" *) reg [1:0] bank_s1,bank_s2;
    reg [1:0] bank;
    (* async_reg="true" *) reg [1:0] view_sync;
    reg view;
    (* async_reg="true" *) reg [1:0] display_sync;
    reg [ADDR_BITS-1:0] issued;
    reg [8:0] sent, returned;
    reg [31:0] stall;
    wire [8:0] used;
    wire full,empty;
    // The FIFO clear is an asynchronous reset. Drive it from a register that
    // mirrors state==ACK: a LUT decode of the binary state glitches through
    // 3'b001 on ISSUE(011)->DRAIN(100) and wipes the FIFO mid-frame.
    reg fifo_clear /* fehdl keep="true" */;
    wire clear_fifo=rst || fifo_clear;
    // Keep burst addresses/data identical to the working RGB-in-[31:8] path.
    assign app_rd_addr=(view ? WORDS*4 : bank==0 ? {ADDR_BITS{1'b0}} : bank==1 ? BANK1 : bank==2 ? BANK2 : BANK3)+issued;
    assign app_rd_en=(state==ISSUE);
    assign read_urgent=req_sync[2] || state==ACK || (state==WAIT_ROOM && used<=(511-BURST_SIZE-8));
    assign read_busy=(state==ISSUE || state==DRAIN);
    rfifo_32_32_512 u_pixels(
        .rst(clear_fifo), .clkw(mem_clk), .clkr(pix_clk),
        .we(sdram_rd_valid && read_busy), .di(sdram_rd_data),
        .re(pixel_consume), .dout(pixel_data),
        .full_flag(full), .empty_flag(empty), .wrusedw(used), .rdusedw(),
        .valid(pixel_valid), .afull(), .aempty()
    );
    always @(posedge pix_clk or posedge pix_rst) begin
        if(pix_rst) underflow<=0;
        else if(display_valid && pixel_consume && empty) underflow<=1;
    end
    always @(posedge mem_clk or posedge rst) begin
        if(rst) begin
            req_sync<=0;bank_s1<=0;bank_s2<=0;bank<=0;issued<=0;view_sync<=0;view<=0;
            sent<=0;returned<=0;stall<=0;state<=IDLE;fifo_clear<=0;
            read_req_ack<=0;frame_read_done<=0;reader_error<=0;display_sync<=0;
        end else begin
            req_sync<={req_sync[1:0],read_req};
            display_sync<={display_sync[0],display_valid};
            bank_s1<=active_index;bank_s2<=bank_s1;
            view_sync<={view_sync[0],ENABLE_PREVIEW ? active_thumbnail : 1'b0};
            frame_read_done<=0;
            case(state)
              IDLE: if(req_sync[2] && controller_init_done) begin
                  state<=ACK;fifo_clear<=1;read_req_ack<=1;bank<=bank_s2;view<=view_sync[1];issued<=0;
              end
              ACK: if(!req_sync[2]) begin
                  read_req_ack<=0;fifo_clear<=0;
                  // Preload stays black, but ACK every video request so the
                  // first mailbox commit can still reach a new frame edge.
                  state<=display_sync[1] ? WAIT_ROOM : IDLE;
              end
              WAIT_ROOM: begin
                  if(req_sync[2]) begin
                      // Abandon old *unissued* pixels only at a new video frame.
                      state<=ACK;fifo_clear<=1;read_req_ack<=1;bank<=bank_s2;view<=view_sync[1];issued<=0;
                      if(display_sync[1]) reader_error<=4'he;
                  end else if(!write_busy && used<=(511-BURST_SIZE-8)) begin
                      state<=ISSUE;sent<=0;returned<=0;stall<=0;
                  end
              end
              ISSUE: begin
                  issued<=issued+1'b1;sent<=sent+1'b1;
                  if(sdram_rd_valid) returned<=returned+1'b1;
                  if(sent==BURST_SIZE-1) state<=DRAIN;
              end
              DRAIN: begin
                  if(sdram_rd_valid) begin returned<=returned+1'b1;stall<=0;end
                  else stall<=stall+1'b1;
                  if(returned==BURST_SIZE || (sdram_rd_valid && returned==BURST_SIZE-1)) begin
                      if(issued==WORDS) begin state<=IDLE;frame_read_done<=1;end
                      else state<=WAIT_ROOM;
                  end else if(stall>=RETURN_TIMEOUT-1) begin state<=HALT;reader_error<=4'he;end
              end
              HALT: begin read_req_ack<=0;end // No tags: reset required after lost returns.
              default: state<=IDLE;
            endcase
            if(sdram_rd_valid && read_busy && full) begin reader_error<=4'hd;state<=HALT;end
        end
    end
endmodule

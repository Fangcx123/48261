`timescale 1ns/1ps
// Lesson 8 loader, adapted to the board's 100 MHz BMP / 41.667 MHz SDRAM
// domains. Reuse the proven show-ahead FIFO and bottom-up row address engine.
// The vendor controller has no per-word ready: do not gate an active burst
// with Sdr_busy/refresh. O_rd_busy arbitrates whole transactions instead.
module media_frame_loader #(
    parameter ADDR_BITS=21,
    parameter FRAME_WIDTH=640, FRAME_HEIGHT=480,
    parameter BURST_SIZE=128
)(
    input mem_clk, rst, source_clk, source_rst,
    input controller_init_done, controller_busy, refresh_active,
    input read_busy,
    input write_req, input [1:0] image_index,
    input pixel_valid, input [31:0] pixel_data,
    output write_req_ack, output reg load_done,
    output write_busy, output reg memory_error,
    output app_wr_en, output [ADDR_BITS-1:0] app_wr_addr,
    output [31:0] app_wr_data, output [3:0] app_wr_mask,output pixel_ready
);
    localparam [ADDR_BITS-1:0] WORDS=FRAME_WIDTH*FRAME_HEIGHT;
    localparam [ADDR_BITS-1:0] BANK1=WORDS, BANK2=WORDS*2, BANK3=WORDS*3;
    wire clear_fifo, full, raw_done;
    wire [8:0] used,source_used;
    assign pixel_ready=!full && source_used<380;
    // FIFO IP already synchronizes reset release separately in both domains.
    wire fifo_rst=rst || clear_fifo;
    reg [4:0] drain_guard;
    // This IP's occupancy is 9 bits (max usable 511), unlike some course
    // boundary models. Zero-extend explicitly; never interpret full as zero.
    wfifo_32_32_512 u_pixels(
        .rst(fifo_rst), .clkw(source_clk), .clkr(mem_clk),
        .we(pixel_valid), .di(pixel_data), .re(app_wr_en),
        .dout(app_wr_data), .full_flag(full), .empty_flag(),
        .wrusedw(source_used), .rdusedw(used), .valid(), .afull(), .aempty()
    );
    always @(posedge source_clk or posedge source_rst) begin
        if(source_rst) memory_error<=0;
        else memory_error<=pixel_valid && full;
    end
    frame_fifo_write #(
        .ADDR_BITS(ADDR_BITS), .BURST_BITS(9), .BURST_SIZE(BURST_SIZE),
        .WRITE_V_FLIP(1), .FRAME_WIDTH(FRAME_WIDTH), .FRAME_HEIGHT(FRAME_HEIGHT)
    ) u_writer(
        .rst(rst), .mem_clk(mem_clk), .Sdr_init_done(controller_init_done),
        .Sdr_init_ref_vld(refresh_active), .Sdr_busy(controller_busy),
        .App_rd_busy(read_busy), .O_wr_busy(write_busy),
        .App_wr_en(app_wr_en), .App_wr_addr(app_wr_addr),
        .write_req(write_req), .write_req_ack(write_req_ack), .write_finish(raw_done),
        .write_addr_0({ADDR_BITS{1'b0}}), .write_addr_1(BANK1),
        .write_addr_2(BANK2), .write_addr_3(BANK3), .write_addr_index(image_index),
        .write_len(WORDS), .fifo_aclr(clear_fifo), .rdusedw({1'b0,used})
    );
    assign app_wr_mask=4'b0;
    // Allow the inherited controller's write pipeline to drain before the
    // completion toggle crosses back to the source (no write ACK port exists).
    always @(posedge mem_clk or posedge rst) begin
        if(rst) begin drain_guard<=0;load_done<=0;end
        else begin
            load_done<=0;
            if(raw_done) drain_guard<=16;
            else if(drain_guard!=0) begin
                drain_guard<=drain_guard-1'b1;
                if(drain_guard==1) load_done<=1;
            end
        end
    end
endmodule

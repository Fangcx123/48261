// Build fifth SDRAM frame in bounded transactions alongside display. Four source
// banks are decimated 2:1 in both axes into true 320x240 RGB888 tiles.
module media_preview_builder #(parameter ADDR_BITS=21,RETURN_TIMEOUT=4166667)(
 input clk,rst,preload_done,input [3:0] complete,
 input controller_ready,controller_busy,refresh_active,loader_busy,reader_busy,
 input rd_valid,input [31:0] rd_data,
 output busy,output reg done,output reg error,
 output rd_en,output [ADDR_BITS-1:0] rd_addr,
 output wr_en,output [ADDR_BITS-1:0] wr_addr,output [31:0] wr_data
);
 localparam IDLE=0,WAIT_READ=1,READ=2,DRAIN=3,WAIT_WRITE=4,WRITE=5,GUARD=6,FINISH=7,FAIL=8;
 reg [3:0] state;
 (* async_reg="true" *) reg [2:0] preload_sync;
 (* async_reg="true" *) reg [3:0] complete_s1,complete_s2;
 reg [3:0] valid_tiles;
 reg [1:0] tile;reg [7:0] row;reg [2:0] chunk;
 reg [7:0] sent,returned;reg [6:0] written;
 reg [4:0] guard_count;reg [31:0] stall;
 reg [31:0] pixels[0:63];reg [31:0] write_q;
 wire [ADDR_BITS-1:0] source_base=tile*21'd307200+row*21'd1280+chunk*21'd128;
 wire [ADDR_BITS-1:0] target_base=21'd1228800+(tile[1] ? 21'd153600 : 21'd0)+row*21'd640+(tile[0] ? 21'd320 : 21'd0)+chunk*21'd64;
 assign busy=state==READ || state==DRAIN || state==WRITE || state==GUARD;
 assign rd_en=state==READ;assign rd_addr=source_base+sent;
 assign wr_en=state==WRITE;assign wr_addr=target_base+written;
 assign wr_data=valid_tiles[tile] ? write_q : 32'h30303000;
 always @(posedge clk) begin
  if(rd_valid && (state==READ || state==DRAIN) && !returned[0]) pixels[returned[6:1]]<=rd_data;
  write_q<=pixels[state==WRITE ? (written[5:0]+6'd1) : 6'd0];
 end
 always @(posedge clk or posedge rst) begin
  if(rst) begin
   state<=IDLE;preload_sync<=0;complete_s1<=0;complete_s2<=0;valid_tiles<=0;
   done<=0;error<=0;tile<=0;row<=0;chunk<=0;sent<=0;returned<=0;written<=0;guard_count<=0;stall<=0;
  end else begin
   preload_sync<={preload_sync[1:0],preload_done};complete_s1<=complete;complete_s2<=complete_s1;
   case(state)
    IDLE:if(preload_sync[2] && controller_ready && !loader_busy && !reader_busy) begin valid_tiles<=complete_s2;state<=WAIT_READ;end
    WAIT_READ:if(!controller_busy && !refresh_active && !loader_busy && !reader_busy) begin
     sent<=0;returned<=0;stall<=0;state<=valid_tiles[tile] ? READ : WAIT_WRITE;
    end
    READ:begin sent<=sent+1'b1;if(rd_valid) returned<=returned+1'b1;if(sent==127) state<=DRAIN;end
    DRAIN:begin
     if(rd_valid) begin returned<=returned+1'b1;stall<=0;end else stall<=stall+1'b1;
     if(returned==128 || (rd_valid && returned==127)) state<=WAIT_WRITE;
     else if(stall>=RETURN_TIMEOUT-1) begin state<=FAIL;error<=1;end
    end
    WAIT_WRITE:if(!controller_busy && !refresh_active && !loader_busy && !reader_busy) begin written<=0;state<=WRITE;end
    WRITE:begin written<=written+1'b1;if(written==63) begin guard_count<=0;state<=GUARD;end end
    GUARD:if(guard_count==16 && !controller_busy && !refresh_active) begin
     if(chunk!=4) begin chunk<=chunk+1'b1;state<=WAIT_READ;end
     else begin
      chunk<=0;
      if(row!=239) begin row<=row+1'b1;state<=WAIT_READ;end
      else begin row<=0;if(tile!=3) begin tile<=tile+1'b1;state<=WAIT_READ;end else begin done<=1;state<=FINISH;end end
     end
    end else if(guard_count<16) guard_count<=guard_count+1'b1;
    default:;
   endcase
  end
 end
endmodule

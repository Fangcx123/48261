`timescale 1ns/1ps
// Behavioural SDR SDRAM for the sdr_as_ram netlist: MRS-programmed CAS latency
// and burst length (1/2/4/8), sequential bursts, auto-precharge ignored.
module sdram_bl_model #(parameter DEPTH_BITS=21)(
 input clk,ras,cas,we,input [1:0] ba,input [10:0] addr,input [3:0] dm,inout [31:0] dq);
 reg [31:0] ram[0:(1<<DEPTH_BITS)-1];
 reg [10:0] openrow[0:3];
 reg [2:0] cl=3;reg [3:0] bl=4;
 reg wr_act=0;reg [3:0] wr_left=0;reg [DEPTH_BITS-1:0] wr_a;
 reg [31:0] pipe_d[0:7];reg [7:0] pipe_v=0;
 reg [3:0] rd_left=0;reg [DEPTH_BITS-1:0] rd_a;
 integer i;
 assign dq=pipe_v[cl-1] ? pipe_d[cl-1] : 32'bz;
 function [DEPTH_BITS-1:0] lin(input [10:0] row,input [1:0] b,input [7:0] col);
  lin={row,b,col};
 endfunction
 always @(posedge clk) begin
  for(i=7;i>0;i=i-1) begin pipe_d[i]<=pipe_d[i-1];pipe_v[i]<=pipe_v[i-1];end
  pipe_v[0]<=0;
  // continuing bursts
  if(wr_left!=0) begin ram[wr_a]<=dq;wr_a<=wr_a+1'b1;wr_left<=wr_left-1'b1;end
  if(rd_left!=0) begin pipe_d[0]<=ram[rd_a];pipe_v[0]<=1;rd_a<=rd_a+1'b1;rd_left<=rd_left-1'b1;end
  case({ras,cas,we})
   3'b011:openrow[ba]<=addr;
   3'b000:begin cl<=addr[6:4];bl<=(addr[2:0]==0)?1:(addr[2:0]==1)?2:(addr[2:0]==2)?4:8;end
   3'b100:begin // WRITE: first word now
    if(dm!=0) $display("SDRAM model: masked write ignored");
    ram[lin(openrow[ba],ba,addr[7:0])]<=dq;
    wr_a<=lin(openrow[ba],ba,addr[7:0])+1'b1;wr_left<=bl-1;rd_left<=0;
   end
   3'b101:begin // READ
    pipe_d[0]<=ram[lin(openrow[ba],ba,addr[7:0])];pipe_v[0]<=1;
    rd_a<=lin(openrow[ba],ba,addr[7:0])+1'b1;rd_left<=bl-1;wr_left<=0;
   end
  endcase
 end
endmodule

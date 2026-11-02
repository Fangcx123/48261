// Dual-clock BRAM queue. Extended binary pointers distinguish full/empty.
// Gray values are registered in their SOURCE domain, then synchronized.
// Both resets derive from the same board reset; no local one-sided clears.
module pcm_async_fifo #(parameter AW=12)(
 input wr_clk,wr_rst_n,wr_en,input [31:0] wr_data,
 output full,output [AW:0] wr_level,
 input rd_clk,rd_rst_n,rd_en,output reg [31:0] rd_data,
 output empty,output [AW:0] rd_level
);
 reg [31:0] mem[0:(1<<AW)-1];
 reg [AW:0] wp,rp,wgray,rgray;
 (* async_reg="true" *) reg [AW:0] rgray_s1,rgray_s2,wgray_s1,wgray_s2;
 function [AW:0] binary;
 input [AW:0] g;integer i;
 begin binary[AW]=g[AW];for(i=AW-1;i>=0;i=i-1) binary[i]=binary[i+1]^g[i];end
 endfunction
 wire [AW:0] wn=wp+1'b1,rn=rp+1'b1;
 assign wr_level=wp-binary(rgray_s2);
 assign rd_level=binary(wgray_s2)-rp;
 assign full=(wgray=={~rgray_s2[AW:AW-1],rgray_s2[AW-2:0]});
 assign empty=(rgray==wgray_s2);
 always @(posedge wr_clk) if(wr_en && !full) mem[wp[AW-1:0]]<=wr_data;
 // Synchronous prefetch; pointer changes only at 48 kHz consumption ticks.
 // After a pop the next word is ready one pixel clock later.
 always @(posedge rd_clk) rd_data<=mem[rp[AW-1:0]];
 always @(posedge wr_clk or negedge wr_rst_n)
 if(!wr_rst_n) begin wp<=0;wgray<=0;rgray_s1<=0;rgray_s2<=0;end
 else begin
  rgray_s1<=rgray;rgray_s2<=rgray_s1;
  if(wr_en && !full) begin wp<=wn;wgray<=wn^(wn>>1);end
 end
 always @(posedge rd_clk or negedge rd_rst_n)
 if(!rd_rst_n) begin rp<=0;rgray<=0;wgray_s1<=0;wgray_s2<=0;end
 else begin
  wgray_s1<=wgray;wgray_s2<=wgray_s1;
  if(rd_en && !empty) begin rp<=rn;rgray<=rn^(rn>>1);end
 end
endmodule

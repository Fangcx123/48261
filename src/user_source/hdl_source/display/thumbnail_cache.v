// Four full-screen 320x240 previews come from the fifth SDRAM frame.
// This stage only decorates focus and unavailable tiles; no reduced cache.
module thumbnail_cache(
 input wr_clk,wr_rst,write_req,pixel_valid,input [1:0] bank,input [23:0] pixel,
 input clk,rst,vs,de,input [23:0] rgb,input view,
 input [1:0] focus,input [3:0] complete,
 output reg vs_out,de_out,output reg [23:0] rgb_out
);
 reg [9:0] x,y;reg dq;
 wire [1:0] tile={y>=240,x>=320};
 wire [9:0] lx=x>=320 ? x-320 : x,ly=y>=240 ? y-240 : y;
 wire border=tile==focus && (lx<3 || lx>=317 || ly<3 || ly>=237);
 always @(posedge clk or posedge rst) begin
  if(rst) begin x<=0;y<=0;dq<=0;vs_out<=1;de_out<=0;rgb_out<=0;end
  else begin
   dq<=de;vs_out<=vs;de_out<=de;
   if(!vs) begin x<=0;y<=0;end
   else begin if(!de) x<=0;else x<=x+1'b1;if(dq && !de) y<=y+1'b1;end
   rgb_out<=!de ? 24'd0 : !view ? rgb : border ? 24'hffff00 : complete[tile] ? rgb : 24'h303030;
  end
 end
endmodule

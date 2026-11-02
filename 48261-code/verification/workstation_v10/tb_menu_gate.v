`timescale 1ns/1ps
module tb_menu_gate;
reg clk=0,rst=1,vs=1,de=0;always #5 clk=~clk;
reg [1:0] mode=2;reg [2:0] field=2;
reg ab=0,aa=1;reg [7:0] brightness=255,contrast=128,volume=96;reg [5:0] period_s=3;
wire v1,d1,v2,d2;wire [23:0] r1,r2;
media_menu_overlay reference(.clk(clk),.rst(rst),.vs(vs),.de(de),.rgb(24'h123456),.mode(mode),.field(field),
 .audio_busy(ab),.audio_available(aa),.brightness(brightness),.contrast(contrast),.volume(volume),.period_s(period_s),.vs_out(v1),.de_out(d1),.rgb_out(r1));
media_menu_gate mapped(.clk(clk),.rst(rst),.vs(vs),.de(de),.rgb(24'h123456),.mode(mode),.field(field),
 .audio_busy(ab),.audio_available(aa),.brightness(brightness),.contrast(contrast),.volume(volume),.period_s(period_s),.vs_out(v2),.de_out(d2),.rgb_out(r2));
integer x,y,n=0,f,errors=0;reg checking=0;
always @(negedge clk)if(checking)begin
 if({v1,d1}!=={v2,d2})$fatal(1,"gate timing mismatch");
 if(d1)begin
  if(r1!==r2)begin
   if(errors<10)$display("Mismatch frame=%d x=%d y=%d RTL=%h GATE=%h",f,n%640,n/640,r1,r2);
   errors=errors+1;
  end
  n=n+1;
 end
end
initial begin
 repeat(8)@(negedge clk);rst=0;
 for(f=0;f<4;f=f+1)begin
  case(f)
   1:begin brightness=64;volume=0;contrast=255;period_s=12;ab=1;field=4;end
   2:begin brightness=192;volume=128;contrast=64;period_s=63;ab=0;aa=0;end
   3:mode=0;
  endcase
  checking=0;vs=0;repeat(8)@(negedge clk);vs=1;repeat(8)@(negedge clk);n=0;checking=1;
  for(y=0;y<480;y=y+1)begin
   for(x=0;x<640;x=x+1)begin de=1;@(negedge clk);end
   de=0;repeat(10)@(negedge clk);
  end
  repeat(8)@(negedge clk);checking=0;
  if(n!=307200)$fatal(1,"gate pixel count");
 end
 if(errors)$fatal(1,"menu RTL/gate mismatches=%d",errors);
 $display("PASS menu synthesized netlist equals RTL: all pixels, numeric values, mute/status and bypass");$finish;
end
endmodule

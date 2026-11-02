`timescale 1ns/1ps
module tb_adjust;
 reg clk=0,rst=1,vs=1,de=0;always #5 clk=~clk;
 reg [23:0] rgb;reg [7:0] b,c;wire vo,dd;wire [23:0] out;
 brightness_contrast_adjust dut(clk,rst,vs,de,rgb,b,c,vo,dd,out);
 reg [23:0] expected[0:2];reg [2:0] valids=0;integer n=0,i,j,t,a,v;reg [23:0] gold;
 function [7:0] channel;input integer x,br,co;integer z;
 begin z=br==255 ? x : x*br/256;z=((z-128)*co)>>>7;z=z+128;channel=z<0 ? 0 : z>255 ? 255 : z;end endfunction
 always @(posedge clk)if(!rst)begin
  expected[2]=expected[1];expected[1]=expected[0];
  expected[0]={channel(rgb[23:16],b,c),channel(rgb[15:8],b,c),channel(rgb[7:0],b,c)};
  valids={valids[1:0],de};#1;
  if(dd!==valids[2])$fatal(1,"DE latency");
  if(dd && out!==expected[2])$fatal(1,"adjust got%h exp%h",out,expected[2]);
  if(dd)n=n+1;
 end
 initial begin
  b=255;c=128;rgb=0;repeat(3)@(negedge clk);rst=0;
  for(i=0;i<256;i=i+1)for(j=0;j<5;j=j+1)for(t=0;t<5;t=t+1)begin
   de=1;b=j==4 ? 255 : j*64;c=t==4 ? 255 : t*64;rgb={i[7:0],(8'd255-i[7:0]),(i[7:0]^8'h5a)};@(negedge clk);
  end
  de=0;repeat(5)@(negedge clk);if(n!=6400)$fatal(1,"pixel count");
  $display("PASS adjustment 6400 signed/saturation/identity/DE cases");$finish;
 end
endmodule

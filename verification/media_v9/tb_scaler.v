`timescale 1ns/1ps
module tb_scaler;
 reg clk=0,rst=1,start=0,bv=0;always #5 clk=~clk;
 integer w,h,n,x,y,k,pad,xx,yy,count=0,cycle=0;reg [7:0] b;
 wire allow,pv,done,overflow;wire [23:0] rgb;
 bmp_nearest_scaler dut(clk,rst,start,w[11:0],h[11:0],pad[1:0],bv,b,allow,1'b1,pv,rgb,done,overflow);
 function [23:0] color;input integer a,c;begin color={a[7:0],c[7:0],(a[7:0]^c[7:0])};end endfunction
 always @(negedge clk) begin
  cycle=cycle+1;if(cycle>25000000)$fatal(1,"scaler timeout");
  if(pv)begin
   xx=(count%640)*w/640;yy=h-1-((479-count/640)*h/480);
   if(rgb!==color(xx,yy))$fatal(1,"scale W%0d H%0d pixel%0d got%h expected%h sx%0d sy%0d",w,h,count,rgb,color(xx,yy),xx,yy);
   count=count+1;
  end
  if(overflow)$fatal(1,"sector FIFO overflow");
 end
 task send;input [7:0] value;
 begin
  if(n%512==0) begin bv=0;while(!allow) @(negedge clk);end
  b=value;bv=1;@(negedge clk);n=n+1;
 end endtask
 reg [23:0] c;
 initial begin
  if(!$value$plusargs("w=%d",w))w=641;if(!$value$plusargs("h=%d",h))h=481;
  pad=(4-(w*3)%4)%4;n=0;repeat(3)@(negedge clk);rst=0;start=1;@(negedge clk);start=0;
  for(y=0;y<h;y=y+1)begin
   for(x=0;x<w;x=x+1)begin c=color(x,y);send(c[7:0]);send(c[15:8]);send(c[23:16]);end
   for(k=0;k<pad;k=k+1)send(8'ha5);
  end
  bv=0;wait(done);repeat(3)@(negedge clk);
  if(count!=307200)$fatal(1,"count %0d",count);
  $display("PASS scaler %0dx%0d padding=%0d full-frame golden",w,h,pad);$finish;
 end
endmodule

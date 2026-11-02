`timescale 1ns/1ps
module tb_preview_builder;
 reg clk=0,rst=1,preload=0;always #5 clk=~clk;
 reg [3:0] complete=4'b1011;
 wire busy,done,error,re,we;wire [20:0] ra,wa;wire [31:0] wd;
 reg rv=0;reg [31:0] rd=0;reg cb=0,refresh=0,lb=1,rb=0;
 media_preview_builder #(.RETURN_TIMEOUT(500)) dut(clk,rst,preload,complete,1'b1,cb,refresh,lb,rb,rv,rd,busy,done,error,re,ra,we,wa,wd);
 reg [20:0] queued[0:127];integer qp=0,rp=0,cycle=0,writes=0,reads=0;
 reg seen[0:307199];integer i,x,y,t,sx,sy,offset;reg [31:0] expected;
 function [31:0] source;input integer a;integer b,xx,yy;
 begin b=a/307200;xx=a%640;yy=(a%307200)/640;source={b[7:0],xx[7:0],yy[7:0],8'ha5};end endfunction
 always @(negedge clk) begin
  rv=0;cycle=cycle+1;
  // Gapped SDRAM returns, including returns after all requests were issued.
  if(qp>rp && cycle%3!=0) begin rv=1;rd=source(queued[rp%128]);rp=rp+1;end
  cb=(cycle%173<4);refresh=(cycle%223<7);
 end
 always @(posedge clk)if(!rst)begin
  if((re || we) && !busy)$fatal(1,"bus ownership missing");
  if(!preload && (re || we))$fatal(1,"read before preload");
  if(re)begin
   if(ra>=1228800)$fatal(1,"source outside four banks");
   queued[qp%128]=ra;qp=qp+1;reads=reads+1;
  end
  if(we)begin
   if(wa<1228800 || wa>=1536000)$fatal(1,"preview overwrites source");
   offset=wa-1228800;if(seen[offset])$fatal(1,"duplicate output pixel");seen[offset]=1;
   x=offset%640;y=offset/640;t=(y>=240 ? 2:0)+(x>=320 ? 1:0);
   sx=(x%320)*2;sy=(y%240)*2;
   expected=complete[t] ? source(t*307200+sy*640+sx) : 32'h30303000;
   if(wd!==expected)$fatal(1,"preview (%d,%d) addr%d got%h expected%h",x,y,wa,wd,expected);
   writes=writes+1;
  end
 end
 initial begin
  for(i=0;i<307200;i=i+1)seen[i]=0;
  repeat(5)@(negedge clk);rst=0;repeat(20)@(negedge clk);preload=1;
  repeat(30)@(negedge clk);if(busy)$fatal(1,"builder stole loader bus");lb=0;
  wait(done);repeat(30)@(negedge clk);
  if(error || busy || writes!=307200 || reads!=460800)$fatal(1,"builder count/error %d %d",writes,reads);
  for(i=0;i<307200;i=i+1)if(!seen[i])$fatal(1,"missing pixel %d",i);
  $display("PASS preview: all 307200 pixels, three RGB888 tiles, missing tile, gapped returns, source banks intact");$finish;
 end
 initial begin #30000000;$fatal(1,"preview timeout state%d",dut.state);end
endmodule

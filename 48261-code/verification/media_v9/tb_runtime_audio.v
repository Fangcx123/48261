`timescale 1ns/1ps
module tb_runtime_audio;
 reg clk=0,rst_n=0,sv=0,wav=0,display_on=1;reg [7:0] alpha=255;
 reg [7:0] user=0; reg [15:0] l=0,r=0;wire ov;wire [15:0] ol,orr;
 always #5 clk=~clk;
 pcm_fade_output #(.USE_RUNTIME_VOLUME(1)) dut(user,clk,rst_n,sv,l,r,wav,display_on,alpha,ov,ol,orr);
 integer i,j,k,a,b,g,u;integer cases=0;
 reg signed [15:0] values[0:6];
 initial begin
  values[0]=-32768;values[1]=32767;values[2]=-1;values[3]=0;values[4]=1;values[5]=12000;values[6]=-12000;
  repeat(3)@(negedge clk);rst_n=1;
  for(u=0;u<256;u=u+1)for(i=0;i<7;i=i+1)for(j=0;j<256;j=j+1)for(k=0;k<2;k=k+1)begin
   @(negedge clk);l=values[i];r=values[6-i];alpha=j;wav=k;sv=1;user=u;
   a=($signed(l)*(k?(u==255?256:u):256))>>>8;b=($signed(r)*(k?(u==255?256:u):256))>>>8;g=j==255?256:j;
   a=(a*g)>>>8;b=(b*g)>>>8;
   @(negedge clk);sv=0;@(negedge clk);
   if(!ov || ol!==a[15:0] || orr!==b[15:0])$fatal(1,"gain/sign i=%d alpha=%d wav=%d got=%h,%h expected=%h,%h",i,j,k,ol,orr,a[15:0],b[15:0]);
   @(negedge clk);if(ov)$fatal(1,"valid stretched");cases=cases+1;
  end
  display_on=0;sv=1;alpha=255;l=32767;r=32768;repeat(3)@(negedge clk);
  if(ol || orr)$fatal(1,"preload not muted");rst_n=0;@(negedge clk);if(ov)$fatal(1,"reset valid");
  $display("PASS runtime PCM output: %d signed-edge/alpha/stereo/volume cases, bit-exact fallback, silence and valid alignment",cases);$finish;
 end
endmodule

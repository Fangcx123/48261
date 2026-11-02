`timescale 1ns/1ps
// Test the actual new pixel chain, including all synchronous RAM latencies.
module tb_preview_chain;
 reg wc=0,pc=0,rst=1;always #5 wc=~wc;always #20 pc=~pc;
 reg wr=0,pv=0;reg [1:0] bank=0;reg [23:0] pixel=0;
 reg vs=1,de=0,view=1;reg [23:0] rgb=24'h123456;
 reg [3:0] complete=15;reg [1:0] focus=2;
 wire v1,d1,v2,d2,v3,d3,v4,d4,v5,d5;wire [23:0] c1,c2,c3,c4,c5;wire fs;
 thumbnail_cache cache(wc,rst,wr,pv,bank,pixel,pc,rst,vs,de,rgb,view,focus,complete,v1,d1,c1);
 brightness_contrast_adjust adjust(pc,rst,v1,d1,c1,8'd255,8'd128,v2,d2,c2);
 video_effects_pipeline #(.ENABLE_OSD(0)) fx(.clk(pc),.rst_n(!rst),.vsync(v2),.de(d2),.rgb_in(c2),
 .status_clk(wc),.status_rst_n(!rst),.display_valid(1'b1),.active_index(2'd0),.auto_enabled(1'b0),
 .error_code(4'd0),.alpha(8'd255),.wipe_active(1'b0),.wipe_boundary(10'd640),
 .frame_start(fs),.vs_out(v3),.de_out(d3),.rgb_out(c3));
 media_menu_overlay menu(pc,rst,v3,d3,c3,2'd0,2'd0,8'd255,8'd128,8'd96,6'd3,v4,d4,c4);
 audio_visualizer #(.ENABLE(0)) wav(.clk(pc),.rst_n(!rst),.vsync(v4),.de(d4),.rgb_in(c4),
 .pcm_valid(1'b0),.pcm_left(16'd0),.wav_active(1'b0),.underflow(1'b0),.audio_failed(1'b0),
 .rgb_out(c5),.vs_out(v5),.de_out(d5));
 function [23:0] color;input integer b,x,y;
 begin color={x[7:0],y[7:0],(b[7:0]*8'd64)};end endfunction
 function [23:0] expand;input [23:0] c;reg [7:0] q;
 begin q={c[23:21],c[15:13],c[7:6]};expand={{q[7:5],q[7:5],q[7:6]},{q[4:2],q[4:2],q[4:3]},{q[1:0],q[1:0],q[1:0],q[1:0]}};end endfunction
 integer b,x,y,n=0,ox,oy,t,lx,ly;reg [23:0] expected;reg checking=0;
 always @(negedge pc)if(checking && d5)begin
  ox=n%640;oy=n/640;t=(oy>=120 ? 2:0)+(ox>=160 ? 1:0);lx=ox%160;ly=oy%120;
  if(!view) expected=24'h123456;
  else if(ox>=320 || oy>=240) expected=24'h101018;
  else if(t==focus && (lx<2 || lx>=158 || ly<2 || ly>=118)) expected=24'hffff00;
  else if(!complete[t]) expected=24'h303030;
  else expected=expand(color(t,(lx/2)*8,(ly/3)*12));
  if(c5!==expected)$fatal(1,"preview pixel %0d (%0d,%0d) got%h exp%h",n,ox,oy,c5,expected);
  n=n+1;
 end
 task frame;
 begin
  n=0;checking=1;vs=0;repeat(10)@(negedge pc);vs=1;repeat(10)@(negedge pc);
  for(y=0;y<480;y=y+1)begin
   for(x=0;x<640;x=x+1)begin de=1;@(negedge pc);end
   de=0;repeat(16)@(negedge pc);
  end
  repeat(20)@(negedge pc);checking=0;
  if(n!=307200)$fatal(1,"chain count %0d",n);
 end endtask
 initial begin
  repeat(5)@(negedge wc);rst=0;
  for(b=0;b<4;b=b+1)begin
   bank=b;wr=1;@(negedge wc);wr=0;
   for(y=479;y>=0;y=y-1)for(x=0;x<640;x=x+1)begin
    pv=1;pixel=color(b,x,y);@(negedge wc);
   end
   pv=0;repeat(3)@(negedge wc);
  end
  @(negedge pc);frame;
  complete=5;focus=3;frame;
  view=0;frame;
  $display("PASS preview pixel chain: 3 full frames, 4 banks, RGB332, focus, missing, RGB888 identity");$finish;
 end
 initial begin #100000000;$fatal(1,"preview timeout");end
endmodule

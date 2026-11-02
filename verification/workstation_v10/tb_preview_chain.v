`timescale 1ns/1ps
module tb_preview_chain;
 reg clk=0,rst=1,vs=1,de=0,view=1;always #5 clk=~clk;
 reg [23:0] rgb;reg [1:0] focus=2;reg [3:0] complete=15;
 wire v1,d1,v2,d2,v3,d3,v4,d4,v5,d5,v6,d6;wire [23:0] c1,c2,c3,c4,c5,c6;
 thumbnail_cache cache(1'b0,rst,1'b0,1'b0,2'd0,24'd0,clk,rst,vs,de,rgb,view,focus,complete,v1,d1,c1);
 brightness_contrast_adjust adjust(clk,rst,v1,d1,c1,8'd255,8'd128,v2,d2,c2);
 video_effects_pipeline #(.RUNTIME_HIDE(1)) fx(.clk(clk),.rst_n(!rst),.vsync(v2),.de(d2),.rgb_in(c2),
 .hide_osd(view),.brightness(8'd255),.volume(8'd96),.period_ms(32'd3000),
 .status_clk(clk),.status_rst_n(!rst),.display_valid(1'b1),.active_index(2'd0),.auto_enabled(1'b0),
 .error_code(4'd0),.alpha(8'd255),.wipe_active(1'b0),.wipe_boundary(10'd640),.frame_start(),.vs_out(v3),.de_out(d3),.rgb_out(c3));
 media_menu_overlay menu(clk,rst,v3,d3,c3,2'd0,3'd0,1'b0,1'b1,8'd255,8'd128,8'd96,6'd3,v4,d4,c4);
 audio_visualizer #(.RUNTIME_HIDE(1)) wave(.clk(clk),.rst_n(!rst),.vsync(v4),.de(d4),.rgb_in(c4),.hide_overlay(view),
 .pcm_valid(1'b0),.pcm_left(16'd0),.wav_active(1'b1),.underflow(1'b0),.audio_failed(1'b0),.rgb_out(c5),.vs_out(v5),.de_out(d5));
 speech_caption_overlay captions(clk,rst,v5,d5,c5,!view,1'b1,32'd10000,v6,d6,c6);
 integer x,y,n,ox,oy,t,lx,ly,f,fd;reg [23:0] expected;reg checking=0;
 function [23:0] color;input integer xx,yy;begin color={xx[7:0],yy[7:0],8'h37};end endfunction
 always @(negedge clk)if(checking && d6)begin
  ox=n%640;oy=n/640;t=(oy>=240 ? 2:0)+(ox>=320 ? 1:0);lx=ox%320;ly=oy%240;
  expected=t==focus && (lx<3 || lx>=317 || ly<3 || ly>=237) ? 24'hffff00 : complete[t] ? color(ox,oy) : 24'h303030;
  if(c6!==expected)$fatal(1,"preview chain pixel %d,%d got%h expected%h",ox,oy,c6,expected);
  if(f==0)$fwrite(fd,"%c%c%c",c6[23:16],c6[15:8],c6[7:0]);n=n+1;
 end
 initial begin
  fd=$fopen("verification/workstation_v10/preview_frame.ppm","wb");$fwrite(fd,"P6\n640 480\n255\n");
  repeat(5)@(negedge clk);rst=0;
  for(f=0;f<2;f=f+1)begin
   focus=f==0 ? 2:3;complete=f==0 ? 15:5;vs=0;repeat(10)@(negedge clk);vs=1;repeat(10)@(negedge clk);n=0;checking=1;
   for(y=0;y<480;y=y+1)begin
    for(x=0;x<640;x=x+1)begin de=1;rgb=color(x,y);@(negedge clk);end
    de=0;repeat(16)@(negedge clk);
   end
   repeat(20)@(negedge clk);checking=0;if(n!=307200)$fatal(1,"preview chain count");
  end
  $fclose(fd);$display("PASS preview pixel chain: full-screen tiles/focus/missing, no old OSD/wave/captions, RGB888/DE alignment");$finish;
 end
endmodule

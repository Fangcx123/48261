`timescale 1ns/1ps
module tb_osd;
reg clk=0,sc=0,rst_n=0,vs=1,de=0,visible=1,auto_en=0,wipe=0;
always #20 clk=~clk;always #5 sc=~sc;
reg [23:0] rgb=0;reg [1:0] id=0;reg [3:0] err=0;
reg [7:0] alpha=255;reg [9:0] boundary=320;
wire ov,od,fs;wire [23:0] out;
wire axis_valid,axis_last,axis_sof;wire [23:0] axis_rgb;
video_effects_pipeline dut(.clk(clk),.rst_n(rst_n),.vsync(vs),.de(de),.status_clk(sc),.status_rst_n(rst_n),
 .source_width(12'd640),.source_height(12'd480),.rgb_in(rgb),.display_valid(visible),.active_index(id),.auto_enabled(auto_en),.error_code(err),
 .alpha(alpha),.wipe_active(wipe),.wipe_boundary(boundary),.frame_start(fs),.vs_out(ov),.de_out(od),.rgb_out(out));
video_rgb_to_axis_640x480 axis_adapter(clk,!rst_n,ov,od,out,axis_sof,axis_valid,axis_last,axis_rgb);
integer axis_x=0,axis_y=0,axis_frames=0;
reg expected_axis_valid;reg [23:0] expected_axis_rgb;
always @(posedge clk) begin
 expected_axis_valid=od;expected_axis_rgb=out;
 #2;
 if(rst_n) begin
   if(axis_valid!==expected_axis_valid || (axis_valid && axis_rgb!==expected_axis_rgb)) $fatal(1,"AXIS pixel alignment");
   if(axis_valid) begin
     if(axis_last!==(axis_x==639)) $fatal(1,"AXIS end-of-line x=%d",axis_x);
     if(axis_sof!==((axis_x==0)&&(axis_y==0))) $fatal(1,"AXIS start-of-frame");
     if(axis_x==639) begin
       axis_x=0;
       if(axis_y==479) begin axis_y=0;axis_frames=axis_frames+1;end
       else axis_y=axis_y+1;
     end else axis_x=axis_x+1;
   end
 end
end
integer x,y,f,pixels=0,fd,red_pixels=0,yellow_pixels=0,subtitle_pixels=0;
reg [23:0] expected[0:1];reg vd[0:1],vvs[0:1],check_pixel[0:1];
reg [9:0] xs[0:1],ys[0:1];reg active_test=0;
integer r,g,b;
reg outside_osd;
always @(posedge clk) begin
 if(!rst_n) begin vd[0]=0;vd[1]=0;vvs[0]=1;vvs[1]=1;end
 else begin
  vd[1]=vd[0];vvs[1]=vvs[0];expected[1]=expected[0];check_pixel[1]=check_pixel[0];
  xs[1]=xs[0];ys[1]=ys[0];
  vd[0]=de;vvs[0]=vs;xs[0]=x;ys[0]=y;
  // This scoreboard independently computes video arithmetic and excludes
  // only the three documented OSD rectangles; every other pixel is exact.
  outside_osd=!((x>=8 && x<72 && y>=8 && y<24) ||
    (x>=8 && x<632 && y>=40 && y<56) ||
    (x>=8 && x<632 && y>=448 && y<468) ||
    (x>=500 && x<540 && y>=8 && y<24));
  check_pixel[0]=outside_osd;
  r=rgb[23:16];g=rgb[15:8];b=rgb[7:0];
  if(!visible || (wipe && x>=boundary)) begin r=0;g=0;b=0;end
  else if(alpha!=255) begin r=(r*alpha)/256;g=(g*alpha)/256;b=(b*alpha)/256;end
  expected[0]={r[7:0],g[7:0],b[7:0]};
  #1;
  if(od!==vd[1] || ov!==vvs[1]) $fatal(1,"RGB/sync latency mismatch");
  if(od) begin
    pixels=pixels+1;
    if(check_pixel[1] && out!==expected[1]) $fatal(1,"background mismatch x=%d y=%d got=%h want=%h",xs[1],ys[1],out,expected[1]);
    if(xs[1]>=8 && xs[1]<72 && ys[1]>=8 && ys[1]<24) begin
      if(out==24'hffff00) yellow_pixels=yellow_pixels+1;
      if(out==24'hff4444) red_pixels=red_pixels+1;
    end
    if(ys[1]>=448 && ys[1]<468 && out==24'hffffff) subtitle_pixels=subtitle_pixels+1;
    if(f==0) $fwrite(fd,"%d %d %d\n",out[23:16],out[15:8],out[7:0]);
  end else if(out!==0) $fatal(1,"blanking is not black");
 end
end
task tick(input integer n);repeat(n) @(negedge clk);endtask
task draw_frame;
begin
 de=0;vs=0;tick(10);vs=1;tick(20);
 for(y=0;y<480;y=y+1) begin
   for(x=0;x<640;x=x+1) begin
     de=1;rgb={x[7:0],y[7:0],8'had};tick(1);
     // Change the live ID and error inside frame 0; OSD must stay unchanged
     // until frame 1, while the mailbox coherently transfers error/mode.
     if(f==0 && y==4 && x==100) begin id=3;err=4'hd;auto_en=1;end
   end
   de=0;tick(8);
 end
 tick(4);
end endtask
initial begin
 fd=$fopen("verification/osd_preview.ppm","w");$fwrite(fd,"P3\n640 480\n255\n");
 x=0;y=0;f=0;tick(4);rst_n=1;tick(8);
 for(f=0;f<5;f=f+1) begin
   case(f) 1:alpha=128;2:alpha=0;3:begin alpha=255;wipe=1;end 4:begin wipe=0;visible=0;end endcase
   draw_frame;
   if(f==0 && (red_pixels!=0 || yellow_pixels==0)) $fatal(1,"status tore during frame");
   if(f==1 && red_pixels==0) $fatal(1,"hex D / error color missing");
 end
 $fclose(fd);
 if(pixels!=5*640*480 || subtitle_pixels!=0 || axis_frames!=5) $fatal(1,"frame size or stale fixed subtitle");
 if(dut.u_text.scroll_pos!=1) $fatal(1,"subtitle did not advance once per three frames");
 if(dut.u_status.u_osd.index_q!=3 || dut.u_status.u_osd.error_q!=8'h0d) $fatal(1,"status CDC/commit");
 $display("PASS OSD pixels: 5 full 640x480 frames, RGB/sync alignment, exact bypass, fade, wipe, preload black, frame-latched status, hex D, no stale fixed subtitle");
 $display("PASS HDMI AXIS: exact RGB, one SOF per frame, one EOL at pixel 639 per line");
 $finish;
end
initial begin #100000000;$fatal(1,"OSD timeout");end
endmodule

module tb_osd_timer;
reg clk=0,rst=0,vs=1;always #5 clk=~clk;
timestamp_osd #(.CLOCK_HZ(10)) timer(.pix_clk(clk),.pix_rst_n(rst),.enable(1'b1),
 .vsync(vs),.de(1'b0),.pixel_x(10'd0),.pixel_y(12'd0),.rgb_in(24'd0),.rgb_out(),.ts_active(),.sys_rst_n(rst));
initial begin
 repeat(3) @(negedge clk);rst=1;
 repeat(600) @(negedge clk);
 if({timer.mt,timer.mo,timer.st,timer.so}!=16'h0100) $fatal(1,"60 second rollover");
 if({timer.mm_tens,timer.mm_ones,timer.ss_tens,timer.ss_ones}!=0) $fatal(1,"timer digits changed mid-frame");
 vs=0;@(negedge clk);vs=1;
 if({timer.mm_tens,timer.mm_ones,timer.ss_tens,timer.ss_ones}!=16'h0100) $fatal(1,"timer frame capture");
 repeat(59400-1) @(negedge clk);
 if({timer.mt,timer.mo,timer.st,timer.so}!=0) $fatal(1,"99:59 rollover");
 rst=0;@(negedge clk);
 if(timer.mo!=0 || timer.tick_count!=0) $fatal(1,"timer reset");
 $display("PASS OSD timer: real clock seconds, minute rollover, 99:59 wrap, frame capture, reset");$finish;
end
endmodule

`timescale 1ns/1ps
module tb_visualizer;
 reg clk=0,rst_n=0,vs=1,de=0,pv=0;reg [23:0] rgb=0;reg [15:0] pcm=16'h4000;
 wire [23:0] out,bypass;wire ovs,ode,bvs,bde;
 always #5 clk=~clk;
 audio_visualizer dut(clk,rst_n,vs,de,rgb,pv,pcm,1'b1,1'b0,1'b0,out,ovs,ode);
 audio_visualizer #(.ENABLE(0)) off(clk,rst_n,vs,de,rgb,pv,pcm,1'b1,1'b0,1'b0,bypass,bvs,bde);
 integer x,y,f,fd;reg [23:0] expected;
 task drive(input vv,input dd,input [23:0] c,input [23:0] e);
 begin
  @(negedge clk);vs=vv;de=dd;rgb=c;pv=1;
  @(posedge clk);#1;
  if(ovs!==vv || ode!==dd || out!==(dd?e:24'd0))$fatal(1,"visual pixel f=%d x=%d y=%d out=%h expected=%h",f,x,y,out,e);
  if(bvs!==vv || bde!==dd || bypass!==(dd?c:24'd0))$fatal(1,"bypass/alignment");
 end endtask
 initial begin
  repeat(3)@(negedge clk);rst_n=1;
  for(f=0;f<3;f=f+1)begin
   if(f==2)pcm=0;
   drive(0,0,0,0);drive(0,0,0,0);drive(1,0,0,0);
   if(f==1)fd=$fopen("verification/wav_v8/waveform_preview.ppm","w");
   if(f==1)$fwrite(fd,"P3\n640 480\n255\n");
   for(y=0;y<480;y=y+1)begin
    for(x=0;x<640;x=x+1)begin
     rgb={x[7:0],y[7:0],8'h44};expected=rgb;
     if(x>=64 && x<576 && y==400)expected=24'h406060;
     if(f>0 && x>=64 && x<576 && y>=383 && y<=385)expected=24'h20ff90;
     if(f>0 && x>=584 && x<592 && y>=416 && y<432)expected=24'hffb020;
     if(x>=48 && x<56 && y>=368 && y<376)expected=24'h20ff90;
     drive(1,1,rgb,expected);
     if(f==1)$fwrite(fd,"%d %d %d\n",out[23:16],out[15:8],out[7:0]);
    end
    drive(1,0,0,0);drive(1,0,0,0);
   end
   if(f==1)$fclose(fd);
  end
  // The zero capture becomes visible only at the next frame boundary.
  drive(0,0,0,0);drive(1,0,0,0);
  if(dut.u_wave.display_peak!=0)$fatal(1,"peak did not return to zero");
  // Incomplete capture must clear the current write bank's old peak.
  pcm=16'h8000;repeat(20)drive(1,0,0,0);pcm=0;drive(0,0,0,0);drive(1,0,0,0);
  repeat(400)drive(1,0,0,0);drive(0,0,0,0);drive(1,0,0,0);
  if(dut.u_wave.display_peak!=0)$fatal(1,"partial-frame peak contaminated later capture");
  rst_n=0;@(negedge clk);if(ode || dut.u_wave.display_valid)$fatal(1,"visual reset");
  $display("PASS visualizer: 3 full frames, waveform/axis/peak/source marker, unchanged subtitle/background pixels, RGB/VS/DE delay, bypass, frame-latched banks, incomplete capture/reset");$finish;
 end
endmodule

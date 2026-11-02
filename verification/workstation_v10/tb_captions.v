`timescale 1ns/1ps
module tb_captions;
 reg clk=0,rst=1,vs=1,de=0,enabled=1,active=1;reg [31:0] samples=10000;
 reg [23:0] rgb=24'h2468ac;wire vo,do_;wire [23:0] ro;always #5 clk=~clk;
 speech_caption_overlay dut(clk,rst,vs,de,rgb,enabled,active,samples,vo,do_,ro);
 integer x,y,n=0,ox,oy,ink=0,fd,f;reg checking=0;
 always @(negedge clk)if(checking && do_)begin
  ox=n%640;oy=n/640;
  if(f==0)begin
   if(ox>=160 && ox<480 && oy>=440 && oy<472)begin
    if(ro!=24'hffffff && ro!=24'h101018)$fatal(1,"caption alignment %d,%d rgb%h",ox,oy,ro);
    if(ro==24'hffffff)ink=ink+1;
   end else if(ro!=24'h2468ac)$fatal(1,"caption touches other pixels %d,%d",ox,oy);
   $fwrite(fd,"%c%c%c",ro[23:16],ro[15:8],ro[7:0]);
  end else if(f==3)begin
   if(ox>=144 && ox<496 && oy>=440 && oy<472)begin
    if(ro!=24'hffffff && ro!=24'h101018)$fatal(1,"centered cue alignment %d,%d rgb%h",ox,oy,ro);
    if(ro==24'hffffff)ink=ink+1;
   end else if(ro!=24'h2468ac)$fatal(1,"centered cue touches other pixels %d,%d",ox,oy,ro);
  end else if(ro!=24'h2468ac)$fatal(1,"hidden/inactive/gap caption not exact bypass");
  n=n+1;
 end
 task step(input integer k);repeat(k)@(negedge clk);endtask
 initial begin
  fd=$fopen("verification/workstation_v10/caption_frame.ppm","wb");$fwrite(fd,"P6\n640 480\n255\n");
  step(4);rst=0;step(10);
  // Cue progression, pause and replay all use sample positions only.
  samples=150000;step(30);if(dut.cue!=1)$fatal(1,"cue boundary");
  step(100);if(dut.cue!=1)$fatal(1,"caption advances without WAV samples");
  samples=10000;step(30);if(dut.cue!=0)$fatal(1,"replay caption did not restart");
  for(f=0;f<4;f=f+1)begin
   enabled=f!=1;active=f!=2;samples=f==3 ? 150000 : 10000;
   vs=0;step(6);vs=1;step(6);n=0;checking=1;
   for(y=0;y<480;y=y+1)begin
    for(x=0;x<640;x=x+1)begin de=1;@(negedge clk);end
    de=0;step(10);
   end
   step(6);checking=0;if(n!=307200)$fatal(1,"caption DE count %d",n);
  end
  if(ink<1000)$fatal(1,"Chinese glyphs missing %d",ink);
  $fclose(fd);$display("PASS captions: Chinese glyph frame, cue samples, pause, replay, gap, hidden/idle RGB and DE alignment");$finish;
 end
 initial begin #30000000;$fatal(1,"caption timeout");end
endmodule

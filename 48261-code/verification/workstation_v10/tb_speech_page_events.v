`timescale 1ns/1ps
module tb_speech_page_events;
 reg clk=0,rst=1,active=0,preparing=0; reg [31:0] samples=0;
 wire toggle; wire [1:0] index;
 speech_page_events #(.OPERATE_SAMPLE(4),.CHECK_SAMPLE(8),.FINISH_SAMPLE(12)) dut(
  .preparing(preparing),.clk(clk),.rst(rst),.wav_active(active),.played_samples(samples),
  .req_toggle(toggle),.req_index(index));
 always #5 clk=~clk;
 integer count,last_toggle;
 initial begin
  count=0;last_toggle=0;
  repeat(2) @(posedge clk); rst=0; preparing=1;
  @(posedge clk); #1;
  if(toggle===last_toggle || index!==0) $fatal(1,"missing start event");
  last_toggle=toggle; count=count+1;
  preparing=0;active=1;@(posedge clk);#1;
  if(toggle!==last_toggle)$fatal(1,"duplicate start transition");
  samples=4; @(posedge clk); #1;
  if(toggle===last_toggle || index!==1) $fatal(1,"missing operate event");
  last_toggle=toggle; count=count+1;
  samples=8; @(posedge clk); #1;
  if(toggle===last_toggle || index!==2) $fatal(1,"missing check event");
  last_toggle=toggle; count=count+1;
  samples=12; @(posedge clk); #1;
  if(toggle===last_toggle || index!==3) $fatal(1,"missing finish event");
  last_toggle=toggle; count=count+1;
  active=0; @(posedge clk); #1; preparing=1; samples=0; @(posedge clk); #1;
  $display("replay toggle=%b last=%b index=%0d",toggle,last_toggle,index);
  if(index!==0 || toggle===last_toggle) $fatal(1,"replay did not restart at image 0");
  $display("PASS speech page events=%0d",count+1); $finish;
 end
endmodule

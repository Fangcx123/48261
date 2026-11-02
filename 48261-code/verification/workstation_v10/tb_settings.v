`timescale 1ns/1ps
module tb_settings;
 reg sc=0,pc=0,rst=1,fs=0;always #5 sc=~sc;always #17 pc=~pc;
 reg [40:0] source=0;wire [40:0] snapshot;reg [40:0] previous,held;reg was_busy;integer i;
 media_settings_cdc dut(sc,rst,source,pc,rst,fs,snapshot);
 always @(posedge sc)if(!rst)begin
  if(was_busy && held!==dut.held)$fatal(1,"held bus changed while pending");
  held=dut.held;was_busy=dut.req!=dut.ack_sync[2];
 end
 always @(posedge pc)if(!rst)begin
  previous=snapshot;#1;if(snapshot!==previous && !fs)$fatal(1,"settings changed mid-frame");
 end
 initial begin
  repeat(5)@(negedge sc);rst=0;was_busy=0;
  for(i=0;i<100;i=i+1)begin source={1'b1,i[19:0],~i[19:0]};repeat(3)@(negedge sc);end
  repeat(5)begin @(negedge pc);fs=1;@(negedge pc);fs=0;repeat(20)@(negedge pc);end
  if(snapshot!==source)$fatal(1,"latest settings lost");
  $display("PASS settings CDC stable mailbox and frame-only capture");$finish;
 end
endmodule

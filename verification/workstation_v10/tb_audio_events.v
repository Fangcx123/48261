`timescale 1ns/1ps
module tb_audio_events;
 reg clk=0,rst=1,ack=0,valid=0,view=0,speech=1,replay=0;reg [1:0] id=0;
 always #5 clk=~clk;
 wire enable,page,tick,wav_enable;wire signed [15:0] l,r;wire cue;
 media_audio_events #(.CLOCK_HZ(1000),.STARTUP_MS(20)) dut(clk,rst,ack,valid,view,id,enable,page,replay,wav_enable);
 media_page_cue #(.CLOCK_HZ(1000),.SAMPLE_HZ(480)) tone(clk,!rst,page,speech,tick,l,r,cue);
 integer pages=0,nonzero=0;
 always @(negedge clk)begin if(page)pages=pages+1;if(tick && l!=0)nonzero=nonzero+1;end
 task step(input integer n);repeat(n)@(negedge clk);endtask
 task commit(input [1:0] target,input preview);begin id=target;view=preview;ack=~ack;step(4);end endtask
 initial begin
  step(4);rst=0;step(30);if(enable || pages)$fatal(1,"started before first commit");
  valid=1;commit(0,0);if(enable || pages || cue)$fatal(1,"first display cue/start early");
  step(16);if(enable)$fatal(1,"startup delay short");step(5);if(!enable)$fatal(1,"startup delay missing");
  commit(0,0);commit(0,1);commit(0,0);if(pages)$fatal(1,"same image/preview cue");
  commit(1,0);if(pages!=1 || cue)$fatal(1,"speech arbitration");
  speech=0;step(150);if(cue || nonzero)$fatal(1,"busy cue deferred");
  commit(2,0);if(!cue)$fatal(1,"successful page cue missing");step(140);
  if(cue || nonzero!=48)$fatal(1,"100ms cue samples %d",nonzero);
  commit(3,0);speech=1;step(3);if(cue || l!=0)$fatal(1,"speech must cancel running cue");
  if(!enable)$fatal(1,"startup gate closed on later page");
  commit(3,1);replay=1;step(6);if(wav_enable)$fatal(1,"replay consumes prefix during return transition");
  step(100);if(wav_enable)$fatal(1,"replay gate opened without full commit");
  commit(3,0);if(!wav_enable)$fatal(1,"replay gate not released after full commit");
  $display("PASS audio events: first/same/preview filtering, delayed startup, 100ms cue, speech drop/cancel/no queue");$finish;
 end
endmodule

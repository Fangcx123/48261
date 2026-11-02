`timescale 1ns/1ps
module tb_transition;
reg clk=0,rst=1,fs=0,token=0,kind=0,visible=0,ack=0;
always #20 clk=~clk;
wire bt,done,wipe,busy;wire [7:0] alpha;wire [9:0] boundary;
video_transition_commit #(.FADE_FRAMES(16)) dut(clk,rst,fs,token,kind,visible,ack,bt,done,alpha,wipe,boundary,busy);
wire bypass_token,bypass_ack,bypass_wipe,bypass_busy;wire [7:0] bypass_alpha;wire [9:0] bypass_boundary;
video_transition_commit #(.FADE_FRAMES(0)) bypass(clk,rst,fs,token,kind,visible,ack,
 bypass_token,bypass_ack,bypass_alpha,bypass_wipe,bypass_boundary,bypass_busy);
task tick(input integer n);repeat(n) @(negedge clk);endtask
task frame;begin fs=1;tick(1);fs=0;tick(4);end endtask
integer i;
reg [7:0] old_alpha;
initial begin
 tick(3);rst=0;tick(2);token=1;tick(8);
 if(bt!=1 || done!=0 || alpha!=255) $fatal(1,"first frame request/bypass");
 repeat(3) frame;
 if(done!=0) $fatal(1,"premature ACK");
 ack=1;visible=1;tick(4);
 if(done!=1 || busy || alpha!=255) $fatal(1,"initial frame completion");
 // Request while active: current frame must remain at exactly full brightness.
 token=0;tick(10);
 if(alpha!=255 || bt!=1 || done!=1) $fatal(1,"manual event changed current frame");
 old_alpha=alpha;
 for(i=0;i<16;i=i+1) begin
   frame;
   if(alpha>=old_alpha) $fatal(1,"nonmonotonic fade out");
   old_alpha=alpha;
   if(i<15 && bt!=1) $fatal(1,"bank released before black");
 end
 if(alpha!=0 || bt!=0 || done!=1) $fatal(1,"black swap handshake");
 repeat(7) frame;
 if(alpha!=0 || done!=1) $fatal(1,"black hold did not wait for SDRAM ACK");
 ack=0;tick(4);old_alpha=0;
 for(i=0;i<16;i=i+1) begin
   frame;
   if(alpha<=old_alpha) $fatal(1,"nonmonotonic fade in");
   old_alpha=alpha;
   if(i<15 && done!=1) $fatal(1,"source ACK before effect completion");
 end
 if(done!=0 || busy || alpha!=255) $fatal(1,"fade completion");
 $display("PASS transition fade: 16 complete fade-out frames, black ACK wait, 16 fade-in frames, source backpressure");
 // Auto mode is latched with the token, so toggling the UI mode cannot turn
 // an in-flight automatic wipe into a fade or vice versa.
 kind=1;token=1;tick(10);kind=0;
 if(bt!=1 || done!=0) $fatal(1,"auto request not released");
 ack=1;tick(4);
 if(!wipe || boundary!=0) $fatal(1,"wipe starts at zero");
 for(i=1;i<=16;i=i+1) begin
   frame;
   if(boundary!=40*i || alpha!=255) $fatal(1,"wipe boundary %d",boundary);
   if(i<16 && (!wipe || done!=0)) $fatal(1,"wipe prematurely ended");
 end
 if(busy || wipe || done!=1) $fatal(1,"wipe completion");
 // Reset during a transition must clear both sides of the handshake.
 token=0;tick(8);frame;rst=1;ack=0;visible=0;token=0;tick(2);
 if(done || bt || busy) $fatal(1,"reset cleanup");
 if(bypass_token!==token || bypass_ack!==ack || bypass_alpha!=255 || bypass_wipe || bypass_busy)
   $fatal(1,"FADE_FRAMES=0 bypass");
 $display("PASS transition wipe: latched mode, 40-pixel/frame reveal, reset, bypass");
 $finish;
end
initial begin #1000000;$fatal(1,"transition timeout");end
endmodule

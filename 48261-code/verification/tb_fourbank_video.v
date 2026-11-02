`timescale 1ns/1ps
// Actual frame timing, request delay, ACK CDC, mailbox, reader and video delay.
module tb_fourbank_video;
reg mc=0,pc=0,rst=1,commit=0;always #12 mc=~mc;always #20 pc=~pc;
reg [1:0] selected=0;reg selected_valid=0;
wire req,ack,hs,vs,de,consume,pvalid,visible,commit_ack,rb,ren,under,outde;
wire [1:0] bank,id;wire [20:0] addr;wire [31:0] pixel;wire [23:0] rgb;wire [3:0] err;
reg [3:0] req_delay=0;reg [1:0] ack_sync=0;
always @(posedge pc) if(rst) begin req_delay<=0;ack_sync<=0;end else begin req_delay<={req_delay[2:0],req};ack_sync<={ack_sync[0],ack};end
frame_commit_cdc mailbox(.clk(pc),.rst(rst),.commit_toggle(commit),.commit_bank(selected),.commit_id(selected),
 .commit_valid(selected_valid),.frame_read_req(req),.frame_read_ack(ack_sync[1]),
 .commit_ack(commit_ack),.read_bank(bank),.media_id(id),.display_valid(visible));
video_timing_data timing(.video_clk(pc),.rst(rst),.read_req(req),.read_req_ack(ack_sync[1]),.hs(hs),.vs(vs),.de(de));
video_delay delay_pixels(.video_clk(pc),.rst(rst),.read_en(consume),.read_data(pvalid?pixel[31:8]:24'd0),
 .hs(hs),.vs(vs),.de(de),.hs_r(),.vs_r(),.de_r(outde),.vout_data(rgb));
reg [7:0] vpipe=0;reg [20:0] apipe[0:7];integer j;
always @(posedge mc) begin
 if(rst) vpipe<=0;
 else begin vpipe<={vpipe[6:0],ren};apipe[0]<=addr;for(j=1;j<8;j=j+1) apipe[j]<=apipe[j-1];end
end
function [23:0] pattern(input integer b,input integer n);
 begin pattern=((b+1)<<20)|(n+1);end
endfunction
media_frame_reader reader(.mem_clk(mc),.rst(rst),.pix_clk(pc),.pix_rst(rst),.controller_init_done(!rst),
 .write_busy(1'b0),.read_req(req_delay[3]),.active_index(bank),.read_req_ack(ack),.frame_read_done(),
 .read_busy(rb),.app_rd_en(ren),.app_rd_addr(addr),.sdram_rd_valid(vpipe[7]),
 .sdram_rd_data({pattern(apipe[7]/307200,apipe[7]%307200),8'd0}),
 .pixel_consume(consume),.display_valid(visible),.pixel_data(pixel),.pixel_valid(pvalid),.underflow(under),.reader_error(err));
integer n=0,frames=0,requests=0;
reg req_old=0;reg [1:0] image_bank=0;
always @(posedge pc) begin
 #1;
 if(rst) begin n=0;frames=0;req_old=0;requests=0;end
 else begin
  if(req && !req_old) begin
   if(visible && n!=307200) $fatal(1,"incomplete preceding frame %d",n);
   n=0;requests=requests+1;
  end
  req_old=req;
  if(outde && visible) begin
   if(n==0) image_bank=bank;
   if(bank!=image_bank || rgb!==pattern(image_bank,n)) $fatal(1,"frame mixing/alignment n=%d bank=%d rgb=%h",n,bank,rgb);
   n=n+1;if(n==307200) frames=frames+1;
  end
  if(under || err) $fatal(1,"video underflow/error %h",err);
  if(!visible && ren) $fatal(1,"read before first valid commit");
 end
end
initial begin
 repeat(10) @(negedge pc);rst=0;
 // Leave video running black for a frame, then commit during active video.
 wait(requests==1);repeat(1000) @(negedge pc);
 selected=2;selected_valid=1;commit=1;
 wait(commit_ack==1);if(bank!=2 || !visible) $fatal(1,"first commit did not enable bank2");
 wait(frames==1);repeat(20) @(negedge pc);selected=3;commit=0;
 wait(commit_ack==0);wait(frames==2);repeat(10) @(negedge pc);
 if(bank!=3 || under || err) $fatal(1,"second frame/commit failed");
 $display("PASS fourbank video: actual 640x480 timing, blank preload ACK, first commit, complete frames, bank switch without mixing or underflow");
 $finish;
end
initial begin #100000000;$fatal(1,"video integration timeout");end
endmodule

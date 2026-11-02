`timescale 1ns/1ps
// Actual frame timing, request delay, ACK CDC, mailbox, reader and video delay.
module tb_background_display;
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
wire pb,pdone,pe,pre,pwe,urgent,wb,we,wa_ack,ldone,memerr,pready;
wire [20:0] pra,pwa,wa;wire [31:0] pwd,wd;
reg wrq=0,pv=0;reg [31:0] wdata=0;reg preload=0;
wire bus_read=pb ? pre:ren;wire [20:0] bus_addr=pb ? pra:addr;
media_preview_builder builder(.clk(mc),.rst(rst),.preload_done(preload),.complete(4'hf),
 .controller_ready(!rst),.controller_busy(1'b0),.refresh_active(1'b0),.loader_busy(wb),.reader_busy(rb || urgent),
 .rd_valid(vpipe[7]),.rd_data({pattern(apipe[7]/307200,apipe[7]%307200),8'd0}),
 .busy(pb),.done(pdone),.error(pe),.rd_en(pre),.rd_addr(pra),.wr_en(pwe),.wr_addr(pwa),.wr_data(pwd));
media_frame_loader loader(.mem_clk(mc),.rst(rst),.source_clk(pc),.source_rst(rst),
 .controller_init_done(!rst),.controller_busy(1'b0),.refresh_active(1'b0),.read_busy(rb || pb || urgent),
 .write_req(wrq),.image_index(2'd3),.pixel_valid(pv),.pixel_data(wdata),.write_req_ack(wa_ack),.load_done(ldone),
 .write_busy(wb),.memory_error(memerr),.pixel_ready(pready),.app_wr_en(we),.app_wr_addr(wa),.app_wr_data(wd),.app_wr_mask());
integer preview_writes=0,background_writes=0;
always @(posedge mc)if(!rst)begin
 if(pb && (rb || wb))$fatal(1,"SDRAM owners collide");
 if(we)begin if(wa<921600 || wa>=1228800)$fatal(1,"loader overwrote visible bank");background_writes=background_writes+1;end
 if(pwe)begin if(pwa<1228800 || pwa>=1536000)$fatal(1,"preview overwrote visible bank");preview_writes=preview_writes+1;end
end
always @(posedge pc)if(memerr)$fatal(1,"background loader overflow");
reg [7:0] vpipe=0;reg [20:0] apipe[0:7];integer j;
always @(posedge mc) begin
 if(rst) vpipe<=0;
 else begin vpipe<={vpipe[6:0],bus_read};apipe[0]<=bus_addr;for(j=1;j<8;j=j+1) apipe[j]<=apipe[j-1];end
end
function [23:0] pattern(input integer b,input integer n);
 begin pattern=((b+1)<<20)|(n+1);end
endfunction
media_frame_reader reader(.mem_clk(mc),.rst(rst),.pix_clk(pc),.pix_rst(rst),.controller_init_done(!rst),
 .write_busy(wb || pb),.read_req(req_delay[3]),.active_index(bank),.read_req_ack(ack),.frame_read_done(),
 .read_urgent(urgent),.read_busy(rb),.app_rd_en(ren),.app_rd_addr(addr),.sdram_rd_valid(vpipe[7]),
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
integer k;
initial begin
 repeat(10) @(negedge pc);rst=0;
 wait(requests==1);repeat(1000)@(negedge pc);
 selected=0;selected_valid=1;commit=1;wait(commit_ack==1);wait(frames==1);
 // Push a complete background frame as fast as loader backpressure allows.
 wrq=1;wait(wa_ack);@(negedge pc);wrq=0;wait(!wa_ack);repeat(8)@(negedge pc);
 for(k=0;k<307200;k=k+1)begin
  while(!pready)begin pv=0;@(negedge pc);end
  pv=1;wdata=k;@(negedge pc);
 end
 pv=0;wait(ldone);@(negedge pc);preload=1;
 wait(pdone);repeat(30)@(negedge pc);
 if(pe || under || err || preview_writes!=307200 || background_writes!=307200)$fatal(1,"background completion/count");
 if(frames<2)$fatal(1,"display stopped during background tasks");
 $display("PASS background loader + full preview + continuous 640x480 display: %0d frames, no collisions, overflow or underflow",frames);$finish;
end
initial begin #500000000;$fatal(1,"background timeout builder=%d writes=%d frames=%d",builder.state,preview_writes,frames);end
endmodule

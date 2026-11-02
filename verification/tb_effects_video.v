`timescale 1ns/1ps
// End-to-end timing with actual FIFO RTL and SDRAM response model. Includes
// the new transition gate, existing mailbox/reader/video_delay and effects.
module tb_effects_video;
reg mc=0,pc=0,rst=1,commit=0,auto_kind=0;
always #12 mc=~mc;always #20 pc=~pc;
reg [1:0] selected=0;reg selected_valid=0;
wire req,ack,hs,vs,de,consume,pvalid,visible,commit_ack,rb,ren,under,outde;
wire delayed_vs,fx_vs,fx_de,fx_frame,bt,ba,wipe,busy;
wire [1:0] bank,id;wire [20:0] addr;wire [31:0] pixel;
wire [23:0] rgb,fx_rgb;wire [3:0] err;wire [7:0] alpha;wire [9:0] boundary;
reg [3:0] req_delay=0;reg [1:0] ack_sync=0;
always @(posedge pc) if(rst) begin req_delay<=0;ack_sync<=0;end
else begin req_delay<={req_delay[2:0],req};ack_sync<={ack_sync[0],ack};end
video_transition_commit #(.FADE_FRAMES(4)) effect_control(pc,rst,fx_frame,commit,auto_kind,visible,ba,
 bt,commit_ack,alpha,wipe,boundary,busy);
frame_commit_cdc mailbox(.clk(pc),.rst(rst),.commit_toggle(bt),.commit_bank(selected),.commit_id(selected),
 .commit_valid(selected_valid),.frame_read_req(req),.frame_read_ack(ack_sync[1]),
 .commit_ack(ba),.read_bank(bank),.media_id(id),.display_valid(visible));
video_timing_data timing(.video_clk(pc),.rst(rst),.read_req(req),.read_req_ack(ack_sync[1]),.hs(hs),.vs(vs),.de(de));
video_delay delay_pixels(.video_clk(pc),.rst(rst),.read_en(consume),.read_data(pvalid?pixel[31:8]:24'd0),
 .hs(hs),.vs(vs),.de(de),.hs_r(),.vs_r(delayed_vs),.de_r(outde),.vout_data(rgb));
video_effects_pipeline #(.ENABLE_OSD(0)) effects(.clk(pc),.rst_n(!rst),.vsync(delayed_vs),.de(outde),
 .status_clk(mc),.status_rst_n(!rst),.rgb_in(rgb),.display_valid(visible),.active_index(id),.auto_enabled(auto_kind),
 .error_code(4'd0),.alpha(alpha),.wipe_active(wipe),.wipe_boundary(boundary),.frame_start(fx_frame),
 .vs_out(fx_vs),.de_out(fx_de),.rgb_out(fx_rgb));
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
integer n=0,frames=0,requests=0,px=0,r,g,b,fullframes=0;
reg req_old=0;reg [1:0] image_bank=0;
reg [7:0] frame_alpha;reg frame_wipe;reg [9:0] frame_boundary;
reg [23:0] expected[0:1];reg expected_de[0:1],expected_vs[0:1];
always @(posedge pc) begin
 if(rst) begin expected_de[0]=0;expected_de[1]=0;expected_vs[0]=1;expected_vs[1]=1;expected[0]=0;expected[1]=0;px=0;end
 else begin
  expected[1]=expected[0];expected_de[1]=expected_de[0];expected_vs[1]=expected_vs[0];
  expected_de[0]=outde;expected_vs[0]=delayed_vs;
  r=rgb[23:16];g=rgb[15:8];b=rgb[7:0];
  if(!visible || !outde || (wipe && px>=boundary)) begin r=0;g=0;b=0;end
  else if(alpha!=255) begin r=r*alpha/256;g=g*alpha/256;b=b*alpha/256;end
  expected[0]={r[7:0],g[7:0],b[7:0]};
  if(outde) px=px+1;else px=0;
  #1;
  if(fx_de!==expected_de[1] || fx_vs!==expected_vs[1] || fx_rgb!==expected[1])
    $fatal(1,"actual reader -> effects mismatch rgb=%h expected=%h",fx_rgb,expected[1]);
 end
end
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
   if(n==0) begin image_bank=bank;frame_alpha=alpha;frame_wipe=wipe;frame_boundary=boundary;end
   if(bank!=image_bank || rgb!==pattern(image_bank,n)) $fatal(1,"raw bank mixing/alignment n=%d",n);
   if(alpha!=frame_alpha || wipe!=frame_wipe || boundary!=frame_boundary) $fatal(1,"effect changes inside active frame");
   n=n+1;if(n==307200) begin frames=frames+1;if(alpha==255 && !wipe) fullframes=fullframes+1;end
  end
  if(under || err) $fatal(1,"video underflow/error %h",err);
 end
end
integer f;
initial begin
 repeat(10) @(negedge pc);rst=0;
 wait(requests==1);repeat(1000) @(negedge pc);selected=2;selected_valid=1;commit=1;
 wait(commit_ack==1);@(negedge pc);if(bank!=2 || !visible) $fatal(1,"first commit");
 wait(frames==1);wait(n==100000);@(negedge pc);selected=3;commit=0;
 wait(bank==3);@(negedge pc);if(alpha!=0) $fatal(1,"manual bank swap not black");
 // ACK, state and ramp update together via NBA; sample their combinational
 // outputs on the following falling edge, after the outputs have settled.
 wait(commit_ack==0);@(negedge pc);if(busy || alpha!=255 || id!=3)
   $fatal(1,"manual completion busy=%b alpha=%d id=%d",busy,alpha,id);
 f=fullframes;wait(fullframes>f);wait(n==90000);@(negedge pc);auto_kind=1;selected=1;commit=1;
 wait(bank==1);wait(commit_ack==1);@(negedge pc);if(busy || id!=1)
   $fatal(1,"auto completion busy=%b id=%d",busy,id);
 f=fullframes;wait(fullframes>f);repeat(10) @(negedge pc);
 $display("PASS effects video: real 640x480 timing/FIFO, initial black, manual bank swap at black, auto wipe, every pixel checked, no tearing/underflow");
 $finish;
end
initial begin #600000000;$fatal(1,"effects video timeout");end
endmodule

`timescale 1ns/1ps
// v11: real sdr_as_ram gate netlist (workstation_v10/sdram_gate.v) behind the
// shipped loader / reader / preview arbitration, wired as top_tf_hdmi_audio.v.
// Loads PIC1, displays it, loads a background bank and builds the preview
// while video runs, then shows the preview and the background bank.
// Every displayed pixel is compared; prints PASS only if all frames are exact.
// -DNO_ALIGN : omit the v11 Sdr_rd_dout realignment register (old top level).
module tb_system_ctrl;
reg mc=0,pc=0,sc=0,rst=1,commit=0;always #12 mc=~mc;always #20 pc=~pc;always #5 sc=~sc;
reg [1:0] selected=0;reg selected_valid=0;reg view_sel=0;
wire req,ack,hs,vs,de,consume,pvalid,visible,commit_ack,rb,ren,under,outde,rthumb,dthumb;
wire [1:0] bank,id;wire [20:0] addr;wire [31:0] pixel;wire [23:0] rgb;wire [3:0] err;
reg [3:0] req_delay=0;reg [1:0] ack_sync=0;
always @(posedge pc) if(rst) begin req_delay<=0;ack_sync<=0;end else begin req_delay<={req_delay[2:0],req};ack_sync<={ack_sync[0],ack};end
frame_commit_cdc #(.ENABLE_VIEW(1)) mailbox(.commit_view(view_sel),.display_thumbnail(dthumb),.read_thumbnail(rthumb),.clk(pc),.rst(rst),
 .commit_toggle(commit),.commit_bank(selected),.commit_id(selected),
 .commit_valid(selected_valid),.frame_read_req(req),.frame_read_ack(ack_sync[1]),
 .commit_ack(commit_ack),.read_bank(bank),.media_id(id),.display_valid(visible),
 .commit_dimensions(24'd0),.display_dimensions());
video_timing_data timing(.video_clk(pc),.rst(rst),.read_req(req),.read_req_ack(ack_sync[1]),.hs(hs),.vs(vs),.de(de));
video_delay delay_pixels(.video_clk(pc),.rst(rst),.read_en(consume),.read_data(pvalid?pixel[31:8]:24'd0),
 .hs(hs),.vs(vs),.de(de),.hs_r(),.vs_r(),.de_r(outde),.vout_data(rgb));
wire pb,pdone,pe,pre,pwe,urgent,wb,we,wa_ack,ldone,memerr,pready;
wire [20:0] pra,pwa,wa;wire [31:0] pwd,wd;wire [3:0] wmask;
reg wrq=0,pv=0;reg [31:0] wdata=0;reg preload=0;reg [1:0] widx=0;reg [3:0] complete=0;
wire cinit,cbusy,cref,crv;wire [31:0] crd;wire sclk,ras,cas,swe;wire [10:0] sa;wire [1:0] ba;wire [3:0] dm;tri [31:0] dq;
`ifdef NO_ALIGN
wire [31:0] rd_data=crd;
`else
reg [31:0] rd_data;always @(posedge mc) rd_data<=crd;
`endif
wire app_rd_en=pb ? pre : ren;
wire [20:0] app_rd_addr=pb ? pra : addr;
wire app_wr_en=pb ? pwe : we;
wire [20:0] app_wr_addr=pb ? pwa : wa;
wire [31:0] app_wr_din=pb ? pwd : wd;
media_preview_builder builder(.clk(mc),.rst(rst),.preload_done(preload),.complete(complete),
 .controller_ready(cinit),.controller_busy(cbusy),.refresh_active(cref),.loader_busy(wb),.reader_busy(rb || urgent),
 .rd_valid(crv),.rd_data(rd_data),
 .busy(pb),.done(pdone),.error(pe),.rd_en(pre),.rd_addr(pra),.wr_en(pwe),.wr_addr(pwa),.wr_data(pwd));
media_frame_loader loader(.mem_clk(mc),.rst(rst),.source_clk(sc),.source_rst(rst),
 .controller_init_done(cinit),.controller_busy(cbusy),.refresh_active(cref),.read_busy(rb || pb || urgent),
 .write_req(wrq),.image_index(widx),.pixel_valid(pv),.pixel_data(wdata),.write_req_ack(wa_ack),.load_done(ldone),
 .write_busy(wb),.memory_error(memerr),.pixel_ready(pready),.app_wr_en(we),.app_wr_addr(wa),.app_wr_data(wd),.app_wr_mask(wmask));
media_frame_reader #(.ENABLE_PREVIEW(1)) reader(.mem_clk(mc),.rst(rst),.pix_clk(pc),.pix_rst(rst),.controller_init_done(cinit),
 .write_busy(wb || pb || cbusy || cref),.read_req(req_delay[3]),.active_index(bank),.active_thumbnail(rthumb),.read_req_ack(ack),.frame_read_done(),
 .read_urgent(urgent),.read_busy(rb),.app_rd_en(ren),.app_rd_addr(addr),.sdram_rd_valid(crv),
 .sdram_rd_data(rd_data),
 .pixel_consume(consume),.display_valid(visible),.pixel_data(pixel),.pixel_valid(pvalid),.underflow(under),.reader_error(err));
sdr_as_ram controller(.Sdr_clk(mc),.Sdr_clk_sft(~mc),.Rst(rst),.App_ref_req(1'b0),
 .Sdr_init_done(cinit),.Sdr_init_ref_vld(cref),.Sdr_busy(cbusy),
 .App_rd_en(app_rd_en),.App_rd_addr(app_rd_addr),.Sdr_rd_en(crv),.Sdr_rd_dout(crd),
 .App_wr_en(app_wr_en),.App_wr_addr(app_wr_addr),.App_wr_din(app_wr_din),.App_wr_dm(4'd0),
 .SDRAM_CLK(sclk),.SDR_RAS(ras),.SDR_CAS(cas),.SDR_WE(swe),.SDR_ADDR(sa),.SDR_BA(ba),.SDR_DM(dm),.SDR_DQ(dq));
sdram_bl_model #(.DEPTH_BITS(21)) mem(.clk(sclk),.ras(ras),.cas(cas),.we(swe),.ba(ba),.addr(sa),.dm(dm),.dq(dq));

function [23:0] pattern(input integer b,input integer n);
 begin pattern=((b+1)<<20)|(n+1);end
endfunction
function [23:0] expected(input integer b,input thumb,input integer n);
 integer x,y,t;
 begin
  if(!thumb) expected=pattern(b,n);
  else begin
   x=n%640;y=n/640;t=(y>=240 ? 2:0)+(x>=320 ? 1:0);
   if(complete[t]) expected=pattern(t,(2*(y%240))*640+2*(x%320));
   else expected=24'h303030;
  end
 end
endfunction
// Bus checks: requests in aligned 4-word groups, never read and write together.
integer grp_r=0,grp_w=0,misalign=0,collide=0;reg prd=0,pwr=0;
always @(posedge mc) if(!rst && cinit) begin
 if(app_rd_en && app_wr_en) collide=collide+1;
 if(app_rd_en) begin if(!prd && app_rd_addr[1:0]!=0) misalign=misalign+1; grp_r=prd ? grp_r+1 : 1; end
 else if(prd && grp_r%4!=0) misalign=misalign+1;
 if(app_wr_en) begin if(!pwr && app_wr_addr[1:0]!=0) misalign=misalign+1; grp_w=pwr ? grp_w+1 : 1; end
 else if(pwr && grp_w%4!=0) misalign=misalign+1;
 prd<=app_rd_en;pwr<=app_wr_en;
end
integer n=0,frames=0,bad=0,frame_bad=0,bad_frames=0,thumb_frames=0;
reg req_old=0;reg [1:0] image_bank=0;reg image_thumb=0;
always @(posedge pc) begin
 #1;
 if(rst) begin n=0;req_old=0;end
 else begin
  if(req && !req_old) begin
   if(visible && n!=0) begin
    if(n!=307200) frame_bad=frame_bad+1;
    $display("frame %0d bank %0d view %0d: pixels=%0d mismatches=%0d",frames,image_bank,image_thumb,n,frame_bad);
    if(frame_bad!=0) bad_frames=bad_frames+1;
    if(image_thumb) thumb_frames=thumb_frames+1;
    frames=frames+1;frame_bad=0;
   end
   n=0;
  end
  req_old=req;
  if(outde && visible) begin
   if(n==0) begin image_bank=bank;image_thumb=dthumb;end
   if(rgb!==expected(image_bank,image_thumb,n)) begin
    frame_bad=frame_bad+1;bad=bad+1;
    if(bad<=6) $display("  mismatch frame %0d n=%0d (x=%0d y=%0d) got=%h want=%h",frames,n,n%640,n/640,rgb,expected(image_bank,image_thumb,n));
   end
   n=n+1;
  end
 end
end
task load_image(input [1:0] b);
 integer k;
 begin
  widx=b;@(negedge sc);wrq=1;wait(wa_ack);@(negedge sc);wrq=0;wait(!wa_ack);repeat(8)@(negedge sc);
  for(k=0;k<307200;k=k+1)begin
   while(!pready)begin pv=0;@(negedge sc);end
   // BMP stream is bottom-up: stream row r lands in memory row 479-r.
   pv=1;wdata={pattern(b,(479-k/640)*640+k%640),8'd0};@(negedge sc);
  end
  pv=0;wait(ldone);complete[b]=1;
 end
endtask
task show(input [1:0] b,input v);
 begin selected=b;view_sel=v;selected_valid=1;commit=~commit;wait(commit_ack==commit); end
endtask
integer f0;
initial begin
 repeat(10) @(negedge pc);rst=0;
 wait(cinit);
 load_image(0);
 show(0,0);f0=frames;wait(frames==f0+2);
 load_image(3);$display("background bank 3 loaded during display, frames=%0d",frames);
 @(negedge pc);preload=1;
 wait(pdone || pe);$display("preview done=%0d error=%0d frames=%0d",pdone,pe,frames);
 show(0,1);f0=frames;wait(frames==f0+3);
 show(3,0);f0=frames;wait(frames==f0+3);
 $display("SUMMARY frames=%0d thumb_frames=%0d bad_frames=%0d mismatches=%0d underflow=%0d reader_error=%h loader_overflow=%0d preview_error=%0d misaligned=%0d collisions=%0d",
  frames,thumb_frames,bad_frames,bad,under,err,memerr,pe,misalign,collide);
 if(bad==0 && bad_frames==0 && !under && err==0 && !memerr && !pe && misalign==0 && collide==0 && thumb_frames>=2)
  $display("PASS real-controller system: %0d frames exact incl. background load, preview build and preview view",frames);
 else $display("FAIL real-controller system");
 $finish;
end
initial begin #600000000;$display("FAIL TIMEOUT frames=%0d builder=%0d",frames,builder.state);$finish;end
endmodule

`timescale 1ns/1ps
// Real vendor FIFO RTL, SDRAM boundary RAM with delayed/gapped returns.
module tb_fourbank_datapath;
parameter W=640,H=480,N=W*H;
reg sc=0,mc=0,pc=0,rst=1;
always #5 sc=~sc; always #12 mc=~mc; always #20 pc=~pc;
reg check_video=1;
reg wreq=0,pv=0,rreq=0,display_valid=0,de=0,drop=0,gaps=0;
reg [1:0] wi=0,ri=0;reg [31:0] data=0;
wire wack,done,wb,rb,merr,we,re,rack,rend,valid,under;
wire [20:0] wa,ra;wire [31:0] wd,pdata;wire [3:0] err;
reg rv=0;reg [31:0] rd=0;
wire consume,outde; wire [23:0] rgb;
reg [31:0] ram[0:4*N-1];
integer writes=0,reads=0,outputs=0,write_burst=0,read_burst=0;
integer qaddr[0:1023],qtime[0:1023],qh=0,qt=0,cycle=0;
integer expected_bank=0;
reg overflow_seen=0;
always @(posedge sc) if(rst) overflow_seen<=0;else if(merr) overflow_seen<=1;
media_frame_loader #(.FRAME_WIDTH(W),.FRAME_HEIGHT(H)) loader(
 .mem_clk(mc),.rst(rst),.source_clk(sc),.source_rst(rst),.controller_init_done(!rst),
 .controller_busy(1'b0),.refresh_active(1'b0),.read_busy(rb),
 .write_req(wreq),.image_index(wi),.pixel_valid(pv),.pixel_data(data),
 .write_req_ack(wack),.load_done(done),.write_busy(wb),.memory_error(merr),
 .app_wr_en(we),.app_wr_addr(wa),.app_wr_data(wd),.app_wr_mask());
media_frame_reader #(.IMAGE_WORDS(N),.RETURN_TIMEOUT(1000)) reader(
 .mem_clk(mc),.rst(rst),.pix_clk(pc),.pix_rst(rst),.controller_init_done(!rst),.write_busy(wb),
 .read_req(rreq),.active_index(ri),.read_req_ack(rack),.frame_read_done(rend),.read_busy(rb),
 .app_rd_en(re),.app_rd_addr(ra),.sdram_rd_valid(rv),.sdram_rd_data(rd),
 .pixel_consume(consume),.display_valid(display_valid),.pixel_data(pdata),.pixel_valid(valid),
 .underflow(under),.reader_error(err));
video_delay vd(.video_clk(pc),.rst(rst),.read_en(consume),.read_data(valid?pdata[31:8]:24'd0),
 .hs(1'b0),.vs(1'b0),.de(de),.hs_r(),.vs_r(),.de_r(outde),.vout_data(rgb));
function [31:0] pattern(input integer b,input integer a);
 begin pattern=((b+1)<<28) | ((a+1)<<8);end
endfunction
always @(posedge mc) begin
 if(rst) begin rv<=0;qh=0;qt=0;cycle=0;writes=0;reads=0;write_burst=0;read_burst=0;end
 else begin
 cycle=cycle+1;
 if(we && (re || rb)) $fatal(1,"read/write transaction collision");
 if(we) begin
  if(wa>=4*N || wd!==pattern(wi,(H-1-(wa%N)/W)*W+wa%W))
   $fatal(1,"write address/data/flip bank=%d addr=%d got=%h",wi,wa,wd);
  ram[wa]=wd;writes=writes+1;write_burst=write_burst+1;
 end else if(write_burst!=0) begin
  if(write_burst!=128) $fatal(1,"write burst not 128: %d",write_burst);write_burst=0;
 end
 if(re) begin
  if(ra!==ri*N+(reads%N)) $fatal(1,"read bank/address mismatch %d",ra);
  reads=reads+1;read_burst=read_burst+1;
  if(!drop) begin qaddr[qt%1024]=ra;qtime[qt%1024]=cycle+7;qt=qt+1;end
 end else if(read_burst!=0) begin
  if(read_burst!=128) $fatal(1,"read burst not 128");read_burst=0;
 end
 rv<=0;
 if(qh<qt && cycle>=qtime[qh%1024] && (!gaps || cycle%11!=0)) begin
   rv<=1;rd<=ram[qaddr[qh%1024]];qh=qh+1;
 end
 end
end
always @(posedge pc) begin
 #1;
 if(outde && display_valid && check_video) begin
  if(rgb!==((pattern(expected_bank,(H-1-outputs/W)*W+outputs%W))>>8))
   $fatal(1,"video pixel mismatch bank=%d n=%d got=%h",expected_bank,outputs,rgb);
  outputs=outputs+1;
 end
end
task request_read(input integer bank);
 begin @(negedge pc);ri=bank;rreq=1;wait(rack);repeat(3) @(negedge pc);rreq=0;wait(!rack);end
endtask
integer b,i,y;
initial begin
 repeat(10) @(negedge mc);rst=0;repeat(10) @(negedge mc);
 // Blank preload must ACK video frames without issuing reads or deadlocking first commit.
 request_read(0);repeat(50) @(negedge mc);
 if(reads!=0 || err!=0) $fatal(1,"blank preload read/error");
 for(b=0;b<4;b=b+1) begin
  @(negedge sc);wi=b;wreq=1;wait(wack);@(negedge sc);wreq=0;wait(!wack);repeat(8) @(negedge sc);
  for(i=0;i<N;i=i+1) begin
   data=pattern(b,i);pv=1;@(negedge sc);pv=0;
   repeat(5) @(negedge sc);
  end
  wait(done);@(negedge mc);
  if(writes!=(b+1)*N || overflow_seen) $fatal(1,"write completion/count");
  $display("INFO fourbank write bank %0d verified",b);
 end
 for(b=0;b<4;b=b+1) begin
  expected_bank=b;outputs=0;display_valid=1;gaps=(b==2);
  request_read(b);repeat(1000) @(negedge pc);
  for(y=0;y<H;y=y+1) begin
   de=1;repeat(W) @(negedge pc);de=0;repeat(160) @(negedge pc);
  end
  repeat(30) @(negedge pc);
  if(outputs!=N || reads!=(b+1)*N || under || err) $fatal(1,"read output count/error %d %d %h",outputs,under,err);
   $display("INFO fourbank read bank %0d verified",b);
 end
 $display("PASS fourbank datapath: 640x480 four banks, real asynchronous FIFOs, RGB/vertical flip, 128-word bursts, video alignment, gapped returns");
 // Missing return fails closed with a bounded timeout; never advances banks.
 check_video=0;display_valid=0;rst=1;repeat(10) @(negedge mc);rst=0;repeat(10) @(negedge mc);
 display_valid=1;drop=1;request_read(0);repeat(1300) @(negedge mc);
 if(err!=14 || reader.state!=5) $fatal(1,"lost response not halted");
 $display("PASS fourbank read timeout: missing SDRAM returns halt until reset");
 // Underflow telemetry is tied to active display, not black preload.
 @(negedge pc);de=1;repeat(40) @(negedge pc);de=0;
 if(!under) $fatal(1,"underflow not detected");
 $display("PASS fourbank underflow: active video empty FIFO detected");
 rst=1;display_valid=0;drop=0;repeat(10) @(negedge mc);rst=0;repeat(10) @(negedge mc);
 force loader.u_writer.App_rd_busy=1;
 @(negedge sc);wi=0;wreq=1;wait(wack);@(negedge sc);wreq=0;wait(!wack);repeat(8) @(negedge sc);
 pv=1;repeat(600) @(negedge sc);pv=0;repeat(10) @(negedge sc);
 if(!overflow_seen) $fatal(1,"source overflow missing");
 release loader.u_writer.App_rd_busy;
 $display("PASS fourbank write overflow: real FIFO fills while memory unavailable");
 $finish;
end
initial begin #300000000;$fatal(1,"datapath timeout writes=%d reads=%d state=%d",writes,reads,reader.state);end
endmodule

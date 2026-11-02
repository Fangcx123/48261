`timescale 1ns/1ps
// Probe the real sdr_as_ram gate netlist: write/read integrity, read latency,
// Sdr_busy/refresh behaviour and sustained read throughput.
module tb_ctrl_probe;
reg mc=0,rst=1;always #12 mc=~mc;
reg ren=0,wen=0;reg [20:0] raddr=0,waddr=0;reg [31:0] wdin=0;
wire cinit,cbusy,cref,crv;wire [31:0] crd;wire sclk,ras,cas,swe;wire [10:0] sa;wire [1:0] ba;wire [3:0] dm;tri [31:0] dq;
sdr_as_ram controller(.Sdr_clk(mc),.Sdr_clk_sft(~mc),.Rst(rst),.App_ref_req(1'b0),
 .Sdr_init_done(cinit),.Sdr_init_ref_vld(cref),.Sdr_busy(cbusy),
 .App_rd_en(ren),.App_rd_addr(raddr),.Sdr_rd_en(crv),.Sdr_rd_dout(crd),
 .App_wr_en(wen),.App_wr_addr(waddr),.App_wr_din(wdin),.App_wr_dm(4'd0),
 .SDRAM_CLK(sclk),.SDR_RAS(ras),.SDR_CAS(cas),.SDR_WE(swe),.SDR_ADDR(sa),.SDR_BA(ba),.SDR_DM(dm),.SDR_DQ(dq));
sdram_bl_model #(.DEPTH_BITS(21)) mem(.clk(sclk),.ras(ras),.cas(cas),.we(swe),.ba(ba),.addr(sa),.dm(dm),.dq(dq));
integer cyc=0;
always @(posedge mc) cyc<=cyc+1;
reg [20:0] expect_q[0:4095];integer qh=0,qt=0,bad=0,rets=0,first_ret=-1;
integer busy_cycles=0,ref_cycles=0;reg pbusy=0,pref=0;
always @(posedge mc) if(cinit) begin
 if(cbusy) busy_cycles=busy_cycles+1;
 if(cref) ref_cycles=ref_cycles+1;
 pbusy<=cbusy;pref<=cref;
 if(ren) begin expect_q[qh%4096]=raddr;qh=qh+1;end
 if(crv) begin
  rets=rets+1;if(first_ret<0) first_ret=cyc;
  if(crd!=={11'h5a5,expect_q[qt%4096]}) begin bad=bad+1;if(bad<=8) $display("t=%0d BAD return addr=%0d data=%h",cyc,expect_q[qt%4096],crd);end
  qt=qt+1;
 end
end
integer k,t0,f,lastref=0,refgap=0;
always @(posedge mc) if(cinit && cref && !pref) begin if(lastref!=0 && refgap==0) refgap=cyc-lastref;lastref=cyc;end
task wr_burst(input integer base,input integer n);
 begin for(k=0;k<n;k=k+1) begin wen=1;waddr=base+k;wdin={11'h5a5,21'd0}+base+k;@(negedge mc);end wen=0; end
endtask
task rd_burst(input integer base,input integer n);
 begin for(k=0;k<n;k=k+1) begin ren=1;raddr=base+k;@(negedge mc);end ren=0; end
endtask
initial begin
 repeat(10)@(negedge mc);rst=0;
 wait(cinit);$display("init done t=%0d",cyc);
 repeat(50)@(negedge mc);
 t0=cyc;wr_burst(256,128);
 repeat(60)@(negedge mc);
 t0=cyc;rd_burst(256,128);
 repeat(60)@(negedge mc);
 $display("read latency=%0d cycles, returns=%0d bad=%0d",first_ret-t0,rets,bad);
 // Sustained back-to-back 128-word bursts across refresh intervals.
 for(f=0;f<64;f=f+1) wr_burst(4096+f*128,128);
 repeat(60)@(negedge mc);
 bad=0;rets=0;qt=qh;t0=cyc;
 for(f=0;f<64;f=f+1) rd_burst(4096+f*128,128);
 repeat(60)@(negedge mc);
 $display("sustained 64 bursts back-to-back (no gating): returns=%0d bad=%0d refresh period=%0d cycles",rets,bad,refgap);
 $finish;
end
initial begin #40000000;$display("timeout");$finish;end
endmodule

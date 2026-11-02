`timescale 1ns/1ps
// Count AUTO REFRESH commands issued by the real sdr_as_ram netlist when idle.
module tb_refresh_probe;
reg mc=0,rst=1;always #12 mc=~mc;
wire cinit,cbusy,cref,crv;wire [31:0] crd;wire sclk,ras,cas,swe;wire [10:0] sa;wire [1:0] ba;wire [3:0] dm;tri [31:0] dq;
sdr_as_ram controller(.Sdr_clk(mc),.Sdr_clk_sft(~mc),.Rst(rst),.App_ref_req(1'b0),
 .Sdr_init_done(cinit),.Sdr_init_ref_vld(cref),.Sdr_busy(cbusy),
 .App_rd_en(1'b0),.App_rd_addr(21'd0),.Sdr_rd_en(crv),.Sdr_rd_dout(crd),
 .App_wr_en(1'b0),.App_wr_addr(21'd0),.App_wr_din(32'd0),.App_wr_dm(4'd0),
 .SDRAM_CLK(sclk),.SDR_RAS(ras),.SDR_CAS(cas),.SDR_WE(swe),.SDR_ADDR(sa),.SDR_BA(ba),.SDR_DM(dm),.SDR_DQ(dq));
integer cyc=0,refs=0,first=0,last=0,refhi=0,refhi_max=0,run=0;
always @(posedge mc) begin
 cyc<=cyc+1;
 if(cinit && {ras,cas,swe}==3'b001) begin refs=refs+1;if(refs==1) first=cyc;last=cyc; end
 if(cinit) begin if(cref) begin run=run+1;if(run>refhi_max) refhi_max=run;end else run=0; end
end
initial begin
 repeat(10)@(negedge mc);rst=0;wait(cinit);
 repeat(200000)@(negedge mc);
 $display("AUTO REFRESH commands=%0d over %0d cycles -> mean interval %0d cycles (%0d ns); longest Sdr_init_ref_vld run=%0d cycles",
   refs,last-first,(refs>1)?(last-first)/(refs-1):0,(refs>1)?(last-first)/(refs-1)*24:0,refhi_max);
 $finish;
end
endmodule

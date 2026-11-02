`timescale 1ns/1ps
// Exercise the controller interface contract that the ideal RAM tests omitted:
// writes remain pending after App_wr_en drops, and refresh can delay retirement.
module tb_write_handoff;
reg clk=0,rst=1,req=0,reader=0,cbusy=0,refresh=0;
always #12 clk=~clk;
wire busy,we,ack,done,clear;wire [20:0] addr;
reg [9:0] used=511;
frame_fifo_write #(.FRAME_WIDTH(128),.FRAME_HEIGHT(2)) dut(
 .rst(rst),.mem_clk(clk),.Sdr_init_done(!rst),.Sdr_init_ref_vld(refresh),.Sdr_busy(cbusy),
 .App_rd_busy(reader),.O_wr_busy(busy),.App_wr_en(we),.App_wr_addr(addr),
 .write_req(req),.write_req_ack(ack),.write_finish(done),
 .write_addr_0(21'd0),.write_addr_1(21'd256),.write_addr_2(21'd512),.write_addr_3(21'd768),
 .write_addr_index(2'd0),.write_len(21'd256),.fifo_aclr(clear),.rdusedw(used));
integer count=0,bursts=0,tail=0;reg prev_we=0,prev_busy=0;
always @(negedge clk)if(!rst)begin
 if(we)begin
  if(!busy)$fatal(1,"write without ownership");
  if(!prev_we && (cbusy || refresh || reader))$fatal(1,"burst starts while controller unavailable");
  if(addr!==(count<128 ? 128+count:count-128))$fatal(1,"write flip/address");
  count=count+1;
 end
 if(prev_we && !we)begin tail=16;bursts=bursts+1;end
 if(tail!=0)begin
  if(!busy)$fatal(1,"write ownership released before controller pipeline drained");
  tail=tail-1;
 end
 prev_we=we;prev_busy=busy;
end
initial begin
 repeat(6)@(negedge clk);rst=0;cbusy=!$test$plusargs("drain_only");req=1;
 wait(ack);@(negedge clk);req=0;wait(!ack);
 if(!$test$plusargs("drain_only"))begin
 repeat(12)@(negedge clk);if(we || count)$fatal(1,"busy start blocked");
 cbusy=0;refresh=1;repeat(12)@(negedge clk);if(we || count)$fatal(1,"refresh start blocked");
 end
 refresh=0;
 wait(count==30);@(posedge clk);cbusy=1;refresh=1;
 wait(bursts==1);repeat(25)@(posedge clk);
 if(!busy || count!=128 || done)$fatal(1,"must drain before next transaction");
 @(posedge clk);cbusy=0;refresh=0;
 wait(done);repeat(4)@(posedge clk);
 if(count!=256 || bursts!=2)$fatal(1,"lost write data");
 $display("PASS write handoff: busy/refresh start gating, uninterrupted 128-word bursts, pipeline ownership and vertical flip");$finish;
end
initial begin #100000;$fatal(1,"handoff timeout");end
endmodule

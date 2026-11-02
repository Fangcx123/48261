`timescale 1ns/1ps
// Boundary models expose the vendor FIFO's full occupancy value (512).
// This tests the real frame wrapper/controllers, not the encrypted FIFO IP.
module tb_frame_fifo;
reg clk=0, rst=1, read_req=0, write_req=0;
always #5 clk=~clk;
wire rack, wack, rd_en, wr_en;
integer reads=0, writes=0;
frame_read_write dut(
 .rst(rst),.mem_clk(clk),.Sdr_init_done(1'b1),.Sdr_init_ref_vld(1'b0),.Sdr_busy(1'b0),
 .App_rd_en(rd_en),.Sdr_rd_en(1'b0),.Sdr_rd_dout(32'd0),
 .read_clk(clk),.read_req(read_req),.read_req_ack(rack),
 .read_addr_0(21'd0),.read_addr_1(21'd0),.read_addr_2(21'd0),.read_addr_3(21'd0),
 .read_addr_index(2'd0),.read_len(21'd256),.read_en(1'b0),
 .App_wr_en(wr_en),.write_clk(clk),.write_req(write_req),.write_req_ack(wack),
 .write_addr_0(21'd0),.write_addr_1(21'd0),.write_addr_2(21'd0),.write_addr_3(21'd0),
 .write_addr_index(2'd0),.write_len(21'd256),.write_en(1'b0),.write_data(32'd0));
always @(posedge clk) begin
 if(rd_en) reads=reads+1;
 if(wr_en) writes=writes+1;
end
task tick(input integer n); repeat(n) @(negedge clk); endtask
initial begin
 tick(3);rst=0;dut.read_buf.occupancy=10'd512;
 read_req=1;wait(rack);tick(2);read_req=0;tick(30);
 if(reads!=0) $fatal(1,"read burst issued into full 512-word FIFO");
 dut.read_buf.occupancy=10'd0;
 tick(350);if(reads!=256) $fatal(1,"empty read FIFO should accept one burst, got %d",reads);
 dut.write_buf.occupancy=10'd512;
 write_req=1;wait(wack);tick(2);write_req=0;
 tick(350);if(writes!=256) $fatal(1,"full write FIFO did not drain, got %d",writes);
 $display("PASS frame FIFO: full=512 blocks read refill and permits write drain; burst=256");
 $finish;
end
initial begin #30000;$fatal(1,"frame FIFO test timeout");end
endmodule

module rfifo_32_32_512(input clkr,clkw,rst,we,re,input [31:0] di,
 output empty_flag,full_flag,output [9:0] wrusedw,rdusedw,output [31:0] dout);
reg [9:0] occupancy=0;
assign wrusedw=occupancy;
assign rdusedw=occupancy;
assign empty_flag=occupancy==0;
assign full_flag=occupancy==512;
assign dout=0;
endmodule

module wfifo_32_32_512(input clkr,clkw,rst,we,re,input [31:0] di,
 output empty_flag,full_flag,output [9:0] wrusedw,rdusedw,output [31:0] dout);
reg [9:0] occupancy=0;
assign wrusedw=occupancy;
assign rdusedw=occupancy;
assign empty_flag=occupancy==0;
assign full_flag=occupancy==512;
assign dout=0;
endmodule

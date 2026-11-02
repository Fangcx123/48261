`timescale 1ns/1ps
// Scheduler-level fault injection. SD physical/protocol and BMP parser are
// outside this harness; only their boundary events are substituted.
module tb_scheduler;
reg clk=0, rst=1, mem_ready=0, finish=0, commit_ack=0;
reg key1=1, key2=1;
always #5 clk=~clk;
wire commit, display_valid;
wire [3:0] code, image;
reg scan_done=0, found=0, source_done=0, bad=0, pixel=0, wr_req=0;
reg [31:0] sector=0;
reg [3:0] resources=4'hf;
reg [7:0] fs_status=0;
sd_card_bmp #(.CLK_FREQ_HZ(1000)) dut(
 .clk(clk),.rst(rst),.memory_ready(mem_ready),.frame_commit_ack(commit_ack),
 .frame_commit_toggle(commit),.error_code(code),.key_next(key1),.key_auto(key2),
 .state_code(image),.bmp_width(16'd4),.bmp_height(16'd2),.display_valid(display_valid),
 .write_finish_toggle(finish),.write_req_ack(1'b0),.SD_MISO(1'b1));
task tick(input integer n); repeat(n) @(negedge clk); endtask
task reset_all;
begin rst=1;key1=1;key2=1;tick(3);finish=0;commit_ack=0;mem_ready=0;scan_done=0;found=0;resources=4'hf;fs_status=0;
 source_done=0;bad=0;pixel=0;wr_req=0;rst=0;tick(5);end
endtask
task scan_two;
begin
 mem_ready=1;wait(dut.scan_start_pulse);tick(2);
 sector=32'd10;found=1;tick(1);found=0;tick(1);
 sector=32'd20;found=1;tick(1);found=0;scan_done=1;tick(1);scan_done=0;
 wait(dut.load_start_pulse);tick(2);
end endtask
task scan_four;
integer j;
begin
 mem_ready=1;wait(dut.scan_start_pulse);tick(2);
 for(j=0;j<4;j=j+1)begin sector=j;found=1;tick(1);found=0;tick(1);end
 scan_done=1;tick(1);scan_done=0;
 wait(dut.load_start_pulse);tick(2);
end endtask

task pixels;
begin wr_req=1;tick(1);wr_req=0;pixel=1;tick(8);pixel=0;tick(2);end
endtask
task complete_source; begin source_done=1;tick(1);source_done=0;tick(3);end endtask
task complete_memory; begin finish=~finish;tick(6);end endtask
reg old_commit;
integer next_count=0, prev_count=0;
always @(posedge clk) begin
 if(rst) begin next_count<=0;prev_count<=0;end
 else begin
  if(dut.next_request) next_count<=next_count+1;
  if(dut.prev_request) prev_count<=prev_count+1;
 end
end
initial begin
 force dut.resource_mask=resources;
 force dut.scan_error=fs_status;
 force dut.bmp_ready=1;
 force dut.scan_done=scan_done;
 force dut.scan_found_valid=found;
 force dut.scan_found_sector=sector;
 force dut.bmp_load_done=source_done;
 force dut.bmp_load_error=bad;
 force dut.bmp_error=4'd3;
 force dut.bmp_data_wr_en=pixel;
 force dut.write_req=wr_req;
 reset_all;
 tick(10);if(dut.scan_kicked) $fatal(1,"scan before SDRAM ready");
 scan_two;pixels;complete_memory;
 if(commit || display_valid) $fatal(1,"committed without source completion");
 complete_source;
 if(!commit || !display_valid || image!=1) $fatal(1,"memory-first completion failed");
 tick(30);if(!dut.load_busy || !dut.commit_wait) $fatal(1,"released bank before display ACK");
 commit_ack=commit;tick(7);
 if(dut.load_busy) $fatal(1,"display ACK did not release scheduler");
 // Scheduler boundary injection; physical button behavior is tested below.
 force dut.key_next_short_release=1;tick(1);release dut.key_next_short_release;
 wait(dut.load_start_pulse);tick(2);pixels;old_commit=commit;complete_source;
 if(commit!=old_commit) $fatal(1,"committed without memory completion");
 complete_memory;
 if(commit==old_commit || image!=2) $fatal(1,"source-first completion failed");
 commit_ack=commit;tick(7);
 // Bad image 0 must leave image 1 visible and retry only image 1.
 force dut.key_next_short_release=1;tick(1);release dut.key_next_short_release;
 wait(dut.load_start_pulse);tick(2);old_commit=commit;bad=1;tick(1);bad=0;tick(2);
 if(commit!=old_commit || image!=2 || !display_valid || code!=3)
   $fatal(1,"bad BMP damaged displayed frame");
 wait(dut.load_start_pulse);tick(2);
 if(dut.load_idx!=1 || !dut.bad_mask[0]) $fatal(1,"bad image was not skipped");
 // No source/memory progress: timeout then both images marked bad, no loop.
 tick(2050);
 if(code!=7 || dut.bad_mask!=4'b0011 || !display_valid || commit!=old_commit)
   $fatal(1,"stall/all-bad recovery failed");
 tick(100);if(dut.load_start_pulse || dut.load_busy) $fatal(1,"all-bad retry loop");
 $display("PASS scheduler: SDRAM gate, both completion orders, display ACK, bad BMP, stall, bounded skip/all-bad");
 reset_all;mem_ready=1;wait(dut.scan_start_pulse);tick(2005);
 if(code!=6 || !dut.recovery_active) $fatal(1,"scan watchdog failed");
 $display("PASS scan watchdog: no progress triggers IO reset/rescan");
 reset_all;dut.sd_card_top_m0.hold_init=1;tick(10005);
 if(code!=6 || !dut.recovery_active) $fatal(1,"init watchdog failed");
 if(dut.diagnostic_stage!=1 || dut.diagnostic_memory_ready!=0 || dut.diagnostic_r1!=8'hff)
   $fatal(1,"initialization diagnostic snapshot failed");
 $display("PASS initialization watchdog: absent card triggers retry");
 // Missing slots retain the filename-derived image and melody IDs.
 dut.sd_card_top_m0.hold_init=0;
 reset_all;resources=4'h4;scan_four;
 if(dut.load_idx!=2 || dut.load_sector!=2 || dut.bad_mask!=4'hb)
  $fatal(1,"missing PIC1 selected wrong initial slot");
 pixels;complete_source;complete_memory;commit_ack=commit;tick(7);
 if(image!=3) $fatal(1,"PIC3 was renumbered after missing PIC1");
 reset_all;resources=4'h5;scan_four;
 if(dut.load_idx!=0) $fatal(1,"first available PIC selection");
 pixels;complete_source;complete_memory;commit_ack=commit;tick(7);
 force dut.key_next_short_release=1;tick(1);release dut.key_next_short_release;
 wait(dut.load_start_pulse);tick(2);
 if(dut.load_idx!=2) $fatal(1,"next did not skip missing PIC2");
 pixels;complete_source;complete_memory;commit_ack=commit;tick(7);
 force dut.key_next_long=1;tick(1);release dut.key_next_long;
 wait(dut.load_start_pulse);tick(2);
 if(dut.load_idx!=0) $fatal(1,"previous did not skip missing PIC2");
 // All pixels have arrived, then FAT reports failure. Keep the old frame.
 pixels;old_commit=commit;force dut.bmp_error=4'ha;bad=1;source_done=1;
 tick(1);bad=0;source_done=0;tick(3);release dut.bmp_error;
 if(commit!=old_commit || image!=3 || !display_valid)
  $fatal(1,"late FAT error committed an invalid frame");
 $display("PASS FAT32 scheduler: missing-slot IDs, first available, next/previous skip, late FAT error preserves frame");
 reset_all;mem_ready=1;wait(dut.scan_start_pulse);tick(2);
 resources=0;fs_status=8'h21;scan_done=1;tick(1);scan_done=0;tick(8);
 if(code!=9 || dut.load_busy) $fatal(1,"mount failure diagnostic/stop");
 $display("PASS FAT32 mount failure: error 9, no load");
 // Exercise real pins through synchronizers, debounce and long-press logic.
 dut.sd_card_top_m0.hold_init=0;
 reset_all;scan_two;pixels;complete_source;complete_memory;
 commit_ack=commit;tick(7);
 // Keep the loader idle without suppressing controls/request generation.
 force dut.bmp_ready=0;
 key1=0;tick(5);key1=1;tick(5);key1=0;tick(40);
 if(next_count!=0 || prev_count!=0) $fatal(1,"KEY1 acted before short release");
 key1=1;tick(40);
 if(next_count!=1 || prev_count!=0 || dut.auto_play_en)
  $fatal(1,"KEY1 short/debounce mapping failed");
 key1=0;tick(1200);
 if(next_count!=1 || prev_count!=1) $fatal(1,"KEY1 long mapping failed");
 tick(1200);key1=1;tick(40);
 if(next_count!=1 || prev_count!=1 || dut.auto_play_en)
  $fatal(1,"KEY1 long repeated or release triggered next/auto");
 key1=0;tick(1200);key1=1;tick(40);
 if(next_count!=1 || prev_count!=2) $fatal(1,"KEY1 second long failed");
 key2=0;tick(40);
 if(dut.auto_play_en) $fatal(1,"KEY2 toggled before release");
 key2=1;tick(40);
 if(!dut.auto_play_en) $fatal(1,"KEY2 short did not start autoplay");
 key2=0;tick(1200);
 if(!dut.auto_play_en || next_count!=1 || prev_count!=2)
  $fatal(1,"KEY2 hold triggered navigation or early toggle");
 key2=1;tick(40);
 if(dut.auto_play_en || next_count!=1 || prev_count!=2)
  $fatal(1,"KEY2 release did not stop autoplay cleanly");
 force dut.controls_ready=0;key1=0;tick(40);
 release dut.controls_ready;tick(1200);key1=1;tick(40);
 if(next_count!=1 || prev_count!=2)
  $fatal(1,"KEY1 held before readiness triggered navigation");
 $display("PASS key mapping: KEY1 short next, long previous once, release suppression, KEY2 autoplay, readiness gate");
 $finish;
end
initial begin #2000000;$fatal(1,"scheduler harness timed out");end
endmodule

module sd_card_top(input clk,rst,input sd_sec_read,input [31:0] sd_sec_read_addr,
 input SD_MISO,input sd_sec_write,input [31:0] sd_sec_write_addr,input [7:0] sd_sec_write_data,
 output SD_nCS,SD_DCLK,SD_MOSI,output sd_init_done,output [3:0] init_stage,output [7:0] response_r1,
 output [7:0] sd_sec_read_data,output sd_sec_read_data_valid,sd_sec_read_end,
 output sd_sec_write_data_req,sd_sec_write_end);
reg hold_init=0;
assign sd_init_done=!rst && !hold_init;
assign init_stage=hold_init ? 4'd1 : 4'd6;
assign response_r1=hold_init ? 8'hff : 8'h00;
assign sd_sec_read_data=0;
assign sd_sec_read_data_valid=0;
assign sd_sec_read_end=0;
endmodule

`timescale 1ns/1ps
// Scheduler-level fault injection. SD physical/protocol and BMP parser are
// outside this harness; only their boundary events are substituted.
module tb_fourbank_scheduler;
reg clk=0, rst=1, mem_ready=0, finish=0, commit_ack=0;
reg key1=1, key2=1;
always #5 clk=~clk;
wire commit, display_valid;
wire [3:0] code, image;
reg scan_done=0, found=0, source_done=0, bad=0, pixel=0, wr_req=0;
reg [31:0] sector=0;
reg [3:0] resources=4'hf;
reg [7:0] fs_status=0;
wire [3:0] complete; wire preload; reg mem_error=0;
media_player_control #(.CLK_FREQ_HZ(1000)) dut(
 .clk(clk),.rst(rst),.memory_ready(mem_ready),.frame_commit_ack(commit_ack),
 .load_memory_error(mem_error),.image_complete(complete),.preload_done(preload),
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
integer j, loads=0;
always @(posedge clk) if(rst) loads<=0; else if(dut.load_start_pulse) loads<=loads+1;
task ack; begin commit_ack=commit;tick(8);end endtask
task next; begin key1=0;tick(40);key1=1;tick(40);end endtask
task finish_good(input integer idx);
begin
 if(dut.load_idx!=idx || dut.write_buf_idx!=idx) $fatal(1,"wrong fixed bank %d expected %d",dut.load_idx,idx);
 pixels;
 if(idx%2==0) begin complete_memory;if(complete[idx]) $fatal(1,"memory-only completed");complete_source;end
 else begin complete_source;if(complete[idx]) $fatal(1,"source-only completed");complete_memory;end
end endtask
initial begin
 force dut.resource_mask=resources;force dut.scan_error=fs_status;force dut.bmp_ready=1;
 force dut.scan_done=scan_done;force dut.scan_found_valid=found;force dut.scan_found_sector=sector;
 force dut.bmp_load_done=source_done;force dut.bmp_load_error=bad;force dut.bmp_error=4'd3;
 force dut.bmp_data_wr_en=pixel;force dut.write_req=wr_req;
 reset_all;tick(10);if(dut.scan_kicked) $fatal(1,"scan before memory ready");scan_four;
 for(j=0;j<4;j=j+1) begin
   finish_good(j);
   if(j<3) begin
     if(display_valid || commit) $fatal(1,"display before preload ended");
     wait(dut.load_start_pulse);tick(2);
   end
 end
 tick(12);
 if(complete!=15 || !preload || !display_valid || image!=1 || loads!=4) $fatal(1,"preload not completed");
 ack;next;old_commit=commit;next;
 if(commit!=old_commit || image!=2) $fatal(1,"mailbox changed before ACK");
 ack;tick(5);
 if(image!=3 || commit==old_commit) $fatal(1,"pending next missing");ack;
 // Loading frontend can be unavailable: all subsequent navigation uses cache.
 force dut.bmp_ready=0;
 next;if(image!=4 || dut.commit_is_auto) $fatal(1,"cached manual next/kind failed");ack;
 key1=0;tick(1200);
 if(image!=3) $fatal(1,"long previous failed");ack;
 tick(1200);key1=1;tick(40);
 if(image!=3) $fatal(1,"long hold/release repeated");
 next;if(image!=4) $fatal(1,"short after long failed");ack;
 key2=0;tick(40);if(dut.auto_play_en) $fatal(1,"auto before release");key2=1;tick(40);
 tick(3010);if(image!=1 || !dut.commit_is_auto) $fatal(1,"autoplay cached navigation/kind");ack;
 key2=0;tick(40);key2=1;tick(40);if(dut.auto_play_en) $fatal(1,"auto did not stop");
 if(loads!=4 || code!=0) $fatal(1,"cache navigation reloaded TF or error");
 release dut.bmp_ready;
 $display("PASS fourbank scheduler: fixed banks, completion orders, preload barrier, ACK pending, cached keys and autoplay");
 reset_all;resources=4'hd;scan_four;finish_good(0);wait(dut.load_start_pulse);tick(2);
 if(dut.load_idx!=2) $fatal(1,"missing PIC2 not skipped");
 // late source failure even after all pixel and memory data must not complete.
 pixels;complete_memory;bad=1;source_done=1;tick(1);bad=0;source_done=0;tick(3);
 if(complete[2] || display_valid) $fatal(1,"late FAT failure marked bank valid");
 wait(dut.load_start_pulse);tick(2);finish_good(3);tick(12);ack;
 if(complete!=9 || image!=1) $fatal(1,"partial preload result");
 next;if(image!=4) $fatal(1,"bad/missing next skip");ack;
 key1=0;tick(1200);key1=1;tick(40);if(image!=1) $fatal(1,"bad previous skip");ack;
 $display("PASS fourbank faults: missing/bad banks skipped, late FAT cannot complete");
 reset_all;resources=4'h4;scan_four;finish_good(2);tick(12);ack;
 if(image!=3 || complete!=4 || !preload) $fatal(1,"missing first renamed image");
 old_commit=commit;next;key1=0;tick(1200);key1=1;tick(40);
 key2=0;tick(40);key2=1;tick(40);tick(3010);
 if(commit!=old_commit || dut.auto_play_en || image!=3) $fatal(1,"single complete bank must not request effects");
 $display("PASS effects scheduler: manual/auto kind, one usable bank suppresses next/previous/autoplay");
 reset_all;resources=4'h1;scan_four;mem_error=1;tick(1);mem_error=0;tick(60);
 if(complete!=0 || !preload || code!=7 || display_valid) $fatal(1,"overflow/allbad stop");
 reset_all;mem_ready=1;wait(dut.scan_start_pulse);tick(2005);
 if(code!=6 || !dut.recovery_active) $fatal(1,"scan watchdog");
 reset_all;dut.sd_card_top_m0.hold_init=1;tick(10005);
 if(code!=6 || !dut.recovery_active) $fatal(1,"init watchdog");dut.sd_card_top_m0.hold_init=0;
 reset_all;mem_ready=1;wait(dut.scan_start_pulse);tick(2);resources=0;fs_status=8'h22;scan_done=1;tick(1);scan_done=0;tick(8);
 if(code!=8 || dut.load_busy) $fatal(1,"no files stop");
 reset_all;mem_ready=1;wait(dut.scan_start_pulse);tick(2);resources=0;fs_status=8'h21;scan_done=1;tick(1);scan_done=0;tick(8);
 if(code!=9 || dut.load_busy) $fatal(1,"mount failure stop");
 $display("PASS fourbank recovery: missing first keeps ID, overflow/allbad, init/scan watchdog, no files, mount failure");
 $finish;
end
initial begin #2000000;$fatal(1,"fourbank scheduler timeout loads=%d idx=%d complete=%h",loads,dut.load_idx,complete);end
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

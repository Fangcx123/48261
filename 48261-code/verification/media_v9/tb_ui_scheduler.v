`timescale 1ns/1ps
module tb_ui_scheduler;
reg clk=0,rst=1,k1=1,k2=1,ack=0,mem=0,fin=0;always #5 clk=~clk;
reg scan=0,found=0,srcdone=0,pix=0,wr=0;reg [31:0] slot=0;reg [3:0] resources=15;
wire commit,view,preload,valid,auto_on;wire [3:0] image,complete;wire [39:0] settings;
media_player_control #(.CLK_FREQ_HZ(1000),.ENABLE_UI(1)) dut(
.clk(clk),.rst(rst),.key_next(k1),.key_auto(k2),.memory_ready(mem),.frame_commit_ack(ack),
.load_memory_error(1'b0),.write_finish_toggle(fin),.write_req_ack(1'b0),.SD_MISO(1'b1),
.bmp_width(16'd4),.bmp_height(16'd2),.frame_commit_toggle(commit),.commit_view(view),
.ui_settings(settings),.image_complete(complete),.preload_done(preload),.display_valid(valid),.state_code(image),.auto_enabled(auto_on));
task tick(input integer n);repeat(n)@(negedge clk);endtask
task accept;begin ack=commit;tick(8);end endtask
task short1;begin k1=0;tick(50);k1=1;tick(50);end endtask
task short2;begin k2=0;tick(50);k2=1;tick(50);end endtask
task long2;begin k2=0;tick(1100);k2=1;tick(50);end endtask
task boot(input [3:0] mask);
integer j;
begin
 rst=1;mem=0;k1=1;k2=1;fin=0;ack=0;tick(4);rst=0;resources=mask;tick(8);mem=1;
 wait(dut.scan_start_pulse);tick(2);
 for(j=0;j<4;j=j+1)begin slot=j;found=1;tick(1);found=0;tick(1);end
 scan=1;tick(1);scan=0;
 for(j=0;j<4;j=j+1)if(mask[j])begin
 wait(dut.load_start_pulse);tick(2);if(dut.load_idx!=j)$fatal(1,"load order got=%d expected=%d complete=%h mask=%h",dut.load_idx,j,complete,resources);
 wr=1;tick(1);wr=0;pix=1;tick(8);pix=0;tick(2);srcdone=1;tick(1);srcdone=0;
 fin=~fin;tick(4);
 end
 wait(preload && valid);tick(5);accept;
end endtask
reg saved;
initial begin
 force dut.bmp_ready=1;force dut.resource_mask=resources;force dut.scan_error=0;
 force dut.scan_done=scan;force dut.scan_found_valid=found;force dut.scan_found_sector=slot;
 force dut.bmp_load_done=srcdone;force dut.bmp_load_error=0;force dut.bmp_data_wr_en=pix;force dut.write_req=wr;
 boot(15);short1;if(image!=2)$fatal(1,"manual next");accept;short2;if(!auto_on)$fatal(1,"auto enable");
 saved=commit;k2=0;tick(1100);if(commit!=saved||dut.ui_mode!=0)$fatal(1,"long2 before release");
 k2=1;tick(50);if(dut.ui_mode!=1||!view||!auto_on||dut.ui_focus!=1)$fatal(1,"enter preview mode=%d view=%d auto=%d focus=%d ready=%d busy=%d",dut.ui_mode,view,auto_on,dut.ui_focus,dut.ui_ready,dut.commit_wait);
 // Mode/target must stay held until ACK; UI input during this interval is ignored.
 saved=commit;short1;if(commit!=saved||dut.ui_focus!=1)$fatal(1,"busy input");accept;
 tick(3500);if(commit!=saved||dut.auto_cnt!=0)$fatal(1,"auto not paused");
 short1;if(dut.ui_focus!=2)$fatal(1,"preview focus");short2;
 if(image!=3||view||dut.ui_mode!=0)$fatal(1,"preview confirm");accept;
 long2;accept;long2;if(dut.ui_mode!=2)$fatal(1,"menu enter");
 k1=0;tick(1100);k1=1;tick(50);if(dut.ui_brightness!=192)$fatal(1,"menu decrease");
 short2;short2;short2;short1;if(dut.ui_period!=5)$fatal(1,"period menu");
 long2;if(dut.ui_mode!=0||view||image!=3)$fatal(1,"menu exit");accept;
 tick(5010);if(image!=4||!dut.commit_is_auto)$fatal(1,"runtime period");accept;
 boot(4);if(image!=3)$fatal(1,"single identity");long2;
 if(dut.ui_mode!=1||dut.ui_focus!=2||!view)$fatal(1,"single preview unavailable");accept;
 short1;short2;if(dut.ui_mode!=1||!view)$fatal(1,"selected missing");
 k1=0;tick(1100);k1=1;tick(50);short2;
 if(dut.ui_mode!=0||view||image!=3)$fatal(1,"single confirm");accept;
 $display("PASS UI scheduler: real debouncing, long-release, commit hold, current ID, auto pause/runtime period, single/missing, menu");$finish;
end
initial begin #2000000;$fatal(1,"UI scheduler timeout");end
endmodule

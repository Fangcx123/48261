`timescale 1ns/1ps
module tb_ui_scheduler;
reg clk=0,rst=1,k1=1,k2=1,ack=0,mem=0,fin=0;always #5 clk=~clk;
reg preview=0;reg sw=0,finished=0,spt=0;reg [1:0] spi=0;
reg [11:0] iw=320,ih=240;
reg scan=0,found=0,srcdone=0,pix=0,wr=0;reg [31:0] slot=0;reg [3:0] resources=15;
wire commit,view,preload,valid,auto_on;wire [3:0] image,complete;wire [40:0] settings;
media_player_control #(.CLK_FREQ_HZ(1000),.ENABLE_UI(1),.EARLY_DISPLAY(1),.ENABLE_PREVIEW_BUILD(1)) dut(
.settings_switch(sw),.speech_done_toggle(finished),.speech_req_toggle(spt),.speech_req_index(spi),.audio_busy(1'b0),.audio_available(1'b1),.preview_ready(preview),.clk(clk),.rst(rst),.key_next(k1),.key_auto(k2),.memory_ready(mem),.frame_commit_ack(ack),
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
 rst=1;preview=0;finished=0;spt=0;mem=0;k1=1;k2=1;fin=0;ack=0;tick(4);rst=0;resources=mask;tick(8);mem=1;
 wait(dut.scan_start_pulse);tick(2);
 for(j=0;j<4;j=j+1)begin slot=j;found=1;tick(1);found=0;tick(1);end
 scan=1;tick(1);scan=0;
 for(j=0;j<4;j=j+1)if(mask[j])begin
 wait(dut.load_busy);tick(2);if(dut.load_idx!=j)$fatal(1,"load order got=%d expected=%d complete=%h mask=%h",dut.load_idx,j,complete,resources);
 iw=320+j*100;ih=240+j*100;wr=1;tick(1);wr=0;pix=1;tick(8);pix=0;tick(2);srcdone=1;tick(1);srcdone=0;
 fin=~fin;tick(12);
 if(!valid || preview || (j<3 && mask==15 && preload))$fatal(1,"first picture waits for preload/preview");
 if(dut.image_dimensions[j*24 +:24]!={iw,ih})$fatal(1,"per-image dimensions lost");
 if(j==0 || mask==4) accept;
 end
 wait(preload && valid);tick(5);accept;preview=1;tick(5);
end endtask
reg saved;
initial begin
 force dut.source_width=iw;force dut.source_height=ih;
 force dut.bmp_ready=1;force dut.resource_mask=resources;force dut.scan_error=0;
 force dut.scan_done=scan;force dut.scan_found_valid=found;force dut.scan_found_sector=slot;
 force dut.bmp_load_done=srcdone;force dut.bmp_load_error=0;force dut.bmp_data_wr_en=pix;force dut.write_req=wr;
 boot(15);short1;if(image!=2)$fatal(1,"manual next");accept;short2;if(!auto_on)$fatal(1,"auto enable");
 saved=commit;k2=0;tick(1100);if(commit!=saved||dut.ui_mode!=0)$fatal(1,"long2 before release");
 k2=1;tick(50);if(dut.ui_mode!=1||!view||auto_on||dut.ui_focus!=1)$fatal(1,"enter preview mode=%d view=%d auto=%d focus=%d ready=%d busy=%d",dut.ui_mode,view,auto_on,dut.ui_focus,dut.ui_ready,dut.commit_wait);
 // Mode/target must stay held until ACK; UI input during this interval is ignored.
 saved=commit;short1;if(commit!=saved||dut.ui_focus!=1)$fatal(1,"busy input");accept;
 tick(3500);if(commit!=saved||dut.auto_cnt!=0)$fatal(1,"auto not paused");
 short1;if(dut.ui_focus!=2)$fatal(1,"preview focus");short2;
 if(image!=3||view||dut.ui_mode!=0)$fatal(1,"preview confirm");accept;
 sw=1;tick(30);long2;if(dut.ui_mode!=2)$fatal(1,"menu enter");
 k1=0;tick(1100);k1=1;tick(50);if(dut.ui_brightness!=192)$fatal(1,"menu decrease");
 short2;short2;short2;short1;if(dut.ui_period!=5)$fatal(1,"period menu");
 long2;if(dut.ui_mode!=0||view||image!=3)$fatal(1,"menu exit");accept;
 tick(5010);if(auto_on || image!=3)$fatal(1,"auto resumed after settings");short2;tick(5010);if(image!=4||!dut.commit_is_auto)$fatal(1,"runtime period");accept;
 long2;short2;short2;short2;short2;
 if(dut.ui_field!=4)$fatal(1,"R selection through real keys");
 short1;if(auto_on || view || dut.ui_mode!=0 || !dut.replay_toggle || image!=1)$fatal(1,"R must return first image");accept;
 tick(6000);if(image!=1)$fatal(1,"auto restarted after replay");
 // Same-page speech events must not restart a transition.
 saved=commit;spi=0;spt=~spt;tick(30);if(commit!=saved)$fatal(1,"duplicate page transition");
 spi=2;spt=~spt;tick(30);if(image!=3)$fatal(1,"speech page");accept;
 sw=0;tick(30);long2;accept;finished=~finished;tick(30);
 if(image!=1 || view || dut.ui_mode!=0 || auto_on)$fatal(1,"normal completion home");accept;
 boot(4);if(image!=3)$fatal(1,"single identity");long2;
 if(dut.ui_mode!=1||dut.ui_focus!=2||!view)$fatal(1,"single preview unavailable");accept;
 short1;short2;if(dut.ui_mode!=1||!view)$fatal(1,"selected missing");
 k1=0;tick(1100);k1=1;tick(50);short2;
 if(dut.ui_mode!=0||view||image!=3)$fatal(1,"single confirm");accept;
 $display("PASS UI scheduler: real debouncing, long-release, commit hold, current ID, auto pause/runtime period, single/missing, menu");$finish;
end
initial begin #2000000;$fatal(1,"UI scheduler timeout");end
endmodule

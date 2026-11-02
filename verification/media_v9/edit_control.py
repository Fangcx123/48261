from pathlib import Path
root=Path(r'D:\FPGA\lab_ex5_i2s\src\user_source\hdl_source')
p=root/'SD/media_player_control.v';s=p.read_text()
s=s.replace('parameter integer ENABLE_WAV         = 0','parameter integer ENABLE_WAV         = 0,\n    parameter integer ENABLE_UI = 0, ENABLE_SCALING = 0')
s=s.replace('input                       clk,','''output reg commit_view,
    output [39:0] ui_settings,
    input                       clk,''',1)
s=s.replace('wire next_request;', '''wire [1:0] ui_mode,ui_focus,ui_field,ui_index;
wire [7:0] ui_brightness,ui_contrast,ui_volume;wire [5:0] ui_period;
wire ui_select,ui_view;
wire ui_ready=preload_done && display_valid && first_image_committed && !recovery_active;
wire input_ready=ENABLE_UI ? ui_ready : controls_ready;
wire full_mode=!ENABLE_UI || ui_mode==0;
reg [31:0] auto_long_count;
wire auto_release=key_auto_armed && !key_auto_stable_d && key_auto_stable;
wire auto_long_release=ENABLE_UI && auto_release && auto_long_count>=LONG_PRESS_CYCLES;
assign ui_settings={ui_mode,ui_focus,ui_field,image_complete,ui_brightness,ui_contrast,ui_volume,ui_period};
generate if(ENABLE_UI) begin: ui
 media_ui_controller u_ui(.clk(clk),.rst(rst),.ready(ui_ready),.busy(commit_wait || ui_select),
 .next_short(key_next_short_release),.next_long(key_next_long),
 .mode_short(key_auto_short_release),.mode_long(auto_long_release),
 .current(img_idx),.complete(image_complete),.select_req(ui_select),.select_index(ui_index),.select_view(ui_view),
 .mode(ui_mode),.focus(ui_focus),.field(ui_field),.brightness(ui_brightness),.contrast(ui_contrast),.volume(ui_volume),.period_s(ui_period));
end else begin: no_ui
 assign ui_mode=0;assign ui_focus=0;assign ui_field=0;assign ui_index=0;assign ui_select=0;assign ui_view=0;
 assign ui_brightness=255;assign ui_contrast=128;assign ui_volume=96;assign ui_period=3;
end endgenerate
wire next_request;''')
s=s.replace('assign auto_tick = (auto_cnt == (AUTO_PLAY_CYCLES - 1));','wire [31:0] auto_limit=ENABLE_UI ? ui_period*(CLK_FREQ_HZ/1) : AUTO_PLAY_CYCLES;\nassign auto_tick = (auto_cnt >= (auto_limit - 1));')
s=s.replace('assign key_auto_short_release = key_auto_armed &&\n                                !key_auto_stable_d && key_auto_stable;', 'assign key_auto_short_release = auto_release && !auto_long_release;')
s=s.replace('controls_ready && key_next_short_release','controls_ready && full_mode && !ui_select && key_next_short_release')
s=s.replace('controls_ready && key_next_long','controls_ready && full_mode && !ui_select && key_next_long')
s=s.replace('if (!controls_ready || key_next_stable)', 'if (!input_ready || key_next_stable)')
s=s.replace("key_auto_stable_d <= 1'b1;", "key_auto_stable_d <= 1'b1;auto_long_count<=0;")
s=s.replace('if (!controls_ready || key_auto_stable)\n            key_auto_armed <= 1\'b0;\n        else if (key_auto_press)\n            key_auto_armed <= 1\'b1;', '''if (!input_ready || key_auto_stable) begin key_auto_armed<=0;auto_long_count<=0;end
        else if(key_auto_press) begin key_auto_armed<=1;auto_long_count<=1;end
        else if(key_auto_armed && auto_long_count<LONG_PRESS_CYCLES) auto_long_count<=auto_long_count+1'b1;''')
s=s.replace('image_complete<=0; preload_done<=0;', 'image_complete<=0; preload_done<=0;commit_view<=0;')
s=s.replace('end else if(controls_ready && (prev_req_pending || prev_request)) begin', '''end else if(ENABLE_UI && ui_select) begin
                        disp_buf_idx<=ui_index;img_idx<=ui_index;state_code<={2'd0,ui_index}+4'd1;
                        commit_view<=ui_view;commit_is_auto<=0;frame_commit_toggle<=~frame_commit_toggle;
                        commit_wait<=1;next_req_pending<=0;prev_req_pending<=0;auto_cnt<=0;
                    end else if(controls_ready && full_mode && (prev_req_pending || prev_request)) begin''')
s=s.replace('end else if(controls_ready && (next_req_pending', 'end else if(controls_ready && full_mode && (next_req_pending')
s=s.replace('if(controls_ready && key_auto_short_release)', 'if(controls_ready && full_mode && key_auto_short_release)')
s=s.replace('if(controls_ready && auto_play_en', 'if(controls_ready && full_mode && auto_play_en')
s=s.replace('fat32_bmp_reader #(.CLK_FREQ_HZ(CLK_FREQ_HZ))','fat32_bmp_reader #(.CLK_FREQ_HZ(CLK_FREQ_HZ),.ENABLE_SCALING(ENABLE_SCALING))')
p.write_text(s)
p=root/'frame_commit_cdc.v';s=p.read_text();s=s.replace('module frame_commit_cdc(', 'module frame_commit_cdc #(parameter ENABLE_VIEW=0)(')
s=s.replace('input clk,', 'input commit_view,output reg display_thumbnail,\n input clk,') if 'input clk,' in s else s
# actual spacing handled explicitly below
if 'output reg display_thumbnail' not in s:s=s.replace('    input ', '    input commit_view,output reg display_thumbnail,\n    input ',1)
s=s.replace('reg pending_valid;', 'reg pending_valid;reg pending_view;')
s=s.replace('pending_valid <= 0;', 'pending_valid <= 0;pending_view<=0;display_thumbnail<=0;')
s=s.replace('pending_valid<=0;', 'pending_valid<=0;pending_view<=0;display_thumbnail<=0;')
s=s.replace('pending_valid<=commit_valid;', 'pending_valid<=commit_valid;pending_view<=ENABLE_VIEW ? commit_view : 1\'b0;')
s=s.replace('display_valid<=pending_valid;', 'display_valid<=pending_valid;display_thumbnail<=pending_view;')
p.write_text(s)
p=root/'display/video_effects_pipeline.v';s=p.read_text().replace('parameter integer ENABLE_OSD=1,','parameter integer ENABLE_OSD=1, USE_RUNTIME_SETTINGS=0,')
s=s.replace('input clk,rst_n,vsync,de,','input [7:0] brightness,volume,input [31:0] period_ms,\n    input clk,rst_n,vsync,de,')
s=s.replace(".brightness(8'd255),.volume(8'd96),.period_ms(32'd3000)", ".brightness(USE_RUNTIME_SETTINGS ? brightness : 8'd255),.volume(USE_RUNTIME_SETTINGS ? volume : 8'd96),.period_ms(USE_RUNTIME_SETTINGS ? period_ms : 32'd3000)")
p.write_text(s)
p=root/'audio/pcm_fade_output.v';s=p.read_text().replace('module pcm_fade_output(', 'module pcm_fade_output #(parameter USE_RUNTIME_VOLUME=0)(').replace('input clk,rst_n,', 'input [7:0] user_volume,input clk,rst_n,')
s=s.replace("wav_active ? 10'sd96 : 10'sd256", "wav_active ? (USE_RUNTIME_VOLUME ? (user_volume==255 ? 10'sd256 : $signed({2'b0,user_volume})) : 10'sd96) : 10'sd256")
p.write_text(s)

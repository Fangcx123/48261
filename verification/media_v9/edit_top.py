from pathlib import Path
p=Path(r'D:\FPGA\lab_ex5_i2s\src\user_source\hdl_source\top_tf_hdmi_audio.v');s=p.read_text()
s=s.replace('wire frame_commit_toggle, frame_commit_ack;', '''wire frame_commit_toggle, frame_commit_ack;
wire commit_view,video_thumbnail;wire [39:0] ui_settings,pix_settings;
wire [1:0] ui_mode=pix_settings[39:38],ui_focus=pix_settings[37:36],ui_field=pix_settings[35:34];
wire [3:0] ui_complete=pix_settings[33:30];
wire [7:0] ui_brightness=pix_settings[29:22],ui_contrast=pix_settings[21:14],ui_volume=pix_settings[13:6];
wire [5:0] ui_period=pix_settings[5:0];
media_settings_cdc u_settings(.src_clk(sd_card_clk),.src_rst(rst_sd),.settings(ui_settings),
 .pix_clk(video_clk),.pix_rst(rst_video),.frame_start(effect_frame_start),.snapshot(pix_settings));''')
s=s.replace('frame_commit_cdc u_frame_commit(', 'frame_commit_cdc #(.ENABLE_VIEW(1)) u_frame_commit(\n    .commit_view(commit_view),.display_thumbnail(video_thumbnail),')
s=s.replace('.CLK_FREQ_HZ       (100_000_000),.ENABLE_WAV(ENABLE_WAV)', '.CLK_FREQ_HZ       (100_000_000),.ENABLE_WAV(ENABLE_WAV),.ENABLE_UI(1),.ENABLE_SCALING(1)')
s=s.replace(') sd_card_bmp_m0(', ') sd_card_bmp_m0(\n    .commit_view(commit_view),.ui_settings(ui_settings),')
s=s.replace('// 首图提交前黑屏；提交后一直显示当前显示缓冲区内容', '''wire preview_vs,preview_de,adjust_vs,adjust_de;wire [23:0] preview_rgb,adjust_rgb;
thumbnail_cache u_thumbnails(
 .wr_clk(sd_card_clk),.wr_rst(rst_sd),.write_req(sd_card_write_req),.pixel_valid(sd_card_write_en),
 .bank(write_buf_idx),.pixel(sd_card_write_data[31:8]),.clk(video_clk),.rst(rst_video),
 .vs(vs),.de(de),.rgb(vout_data_raw),.view(video_thumbnail),.focus(ui_focus),.complete(ui_complete),
 .vs_out(preview_vs),.de_out(preview_de),.rgb_out(preview_rgb));
brightness_contrast_adjust u_adjust(.clk(video_clk),.rst(rst_video),.vs(preview_vs),.de(preview_de),.rgb(preview_rgb),
 .brightness(ui_brightness),.contrast(ui_contrast),.vs_out(adjust_vs),.de_out(adjust_de),.rgb_out(adjust_rgb));
// 首图提交前黑屏；提交后一直显示当前显示缓冲区内容''')
s=s.replace('#(.ENABLE_OSD(ENABLE_OSD),.SUBTITLE_TEXT', '#(.ENABLE_OSD(ENABLE_OSD),.USE_RUNTIME_SETTINGS(1),.SUBTITLE_TEXT')
s=s.replace('.clk(video_clk),.rst_n(video_reset_n),.vsync(vs),.de(de),.rgb_in(vout_data_raw),', '.brightness(ui_brightness),.volume(ui_volume),.period_ms(ui_period*32\'d1000),\n    .clk(video_clk),.rst_n(video_reset_n),.vsync(adjust_vs),.de(adjust_de),.rgb_in(adjust_rgb),')
s=s.replace(".volume(8'd96)", '.volume(ui_volume)')
s=s.replace('pcm_fade_output u_audio_output(', 'pcm_fade_output #(.USE_RUNTIME_VOLUME(1)) u_audio_output(\n    .user_volume(ui_volume),')
s=s.replace('audio_visualizer #(.ENABLE(ENABLE_WAVEFORM))', '''wire menu_vs,menu_de;wire [23:0] menu_rgb;
media_menu_overlay u_menu(.clk(video_clk),.rst(rst_video),.vs(output_vs),.de(output_de),.rgb(vout_data),
 .mode(ui_mode),.field(ui_field),.brightness(ui_brightness),.contrast(ui_contrast),.volume(ui_volume),.period_s(ui_period),
 .vs_out(menu_vs),.de_out(menu_de),.rgb_out(menu_rgb));
audio_visualizer #(.ENABLE(ENABLE_WAVEFORM))''')
s=s.replace('.vsync(output_vs),.de(output_de),.rgb_in(vout_data)', '.vsync(menu_vs),.de(menu_de),.rgb_in(menu_rgb)')
p.write_text(s)
# Register each new source in the dedicated project without rewriting TD's non-XML format.
root=p.parents[3];vp=root.parent/'verification/media_v9'
new=['SD/bmp_nearest_scaler.v','SD/media_ui_controller.v','display/media_settings_cdc.v','display/brightness_contrast_adjust.v','display/thumbnail_cache.v','display/media_menu_overlay.v']
al=root/'td_project_media_v9/HDMI1.4b_Transmitter_v1.0.al'
a=al.read_text();pos=a.index('<File Path=');end=a.index('</File>',pos)+len('</File>');template=a[pos:end]
print(template)
import re
for f in new:
 if f not in a:
  a=a[:end]+'\n'+re.sub(r'Path="[^"]+"','Path="../user_source/hdl_source/'+f+'"',template)+a[end:]
al.write_text(a)
tcl=(vp.parent/'wav_v8/build_v8.tcl').read_text().replace('td_project_wav_v8','td_project_media_v9')
start=tcl.index('add_files ');stop=tcl.index('reset_runs',start)
tcl=tcl[:start]+''.join('add_files '+str(p.parent/f).replace('\\','/')+'\n' for f in new)+tcl[stop:]
(vp/'build_v9.tcl').write_text(tcl)

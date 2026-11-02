from pathlib import Path
p=Path('src/user_source/hdl_source/top_tf_hdmi_audio.v')
s=p.read_text(encoding='utf-8-sig')
s=s.replace('parameter ENABLE_WAVEFORM = 1;','parameter ENABLE_WAVEFORM = 1;\nparameter AUDIO_STARTUP_DELAY_MS = 2000;')
s=s.replace('wire commit_view,video_thumbnail;wire [39:0] ui_settings,pix_settings;', '''wire commit_view,video_thumbnail,read_thumbnail;wire [40:0] ui_settings,pix_settings;
wire audio_busy,audio_available,replay_toggle,speech_busy,play_enable,page_success;
wire [31:0] played_samples;
wire preview_busy,preview_done,preview_error;
(* async_reg="true" *) reg [2:0] preview_done_sync;
always @(posedge sd_card_clk or posedge rst_sd)
 if(rst_sd) preview_done_sync<=0;else preview_done_sync<={preview_done_sync[1:0],preview_done};
(* async_reg="true" *) reg [1:0] audio_busy_sync,audio_available_sync;
always @(posedge video_clk or posedge rst_video)
 if(rst_video) begin audio_busy_sync<=3;audio_available_sync<=0;end
 else begin audio_busy_sync<={audio_busy_sync[0],audio_busy};audio_available_sync<={audio_available_sync[0],audio_available};end''')
s=s.replace('wire [1:0] ui_mode=pix_settings[39:38],ui_focus=pix_settings[37:36],ui_field=pix_settings[35:34];',
'''wire [1:0] ui_mode=pix_settings[40:39],ui_focus=pix_settings[38:37];
wire [2:0] ui_field=pix_settings[36:34];''')
s=s.replace('reader_error_s2!=0 ? reader_error_s2 : underflow_sync[1]', 'preview_error ? 4\'he : reader_error_s2!=0 ? reader_error_s2 : underflow_sync[1]')
s=s.replace('.commit_view(commit_view),.display_thumbnail(video_thumbnail),','.commit_view(commit_view),.display_thumbnail(video_thumbnail),.read_thumbnail(read_thumbnail),')
s=s.replace('.ENABLE_UI(1),.ENABLE_SCALING(1)', '.ENABLE_UI(1),.ENABLE_SCALING(1),.ENABLE_PREVIEW_BUILD(1)')
s=s.replace('.commit_view(commit_view),.ui_settings(ui_settings),', '''.commit_view(commit_view),.ui_settings(ui_settings),
    .preview_ready(preview_done_sync[2]),.audio_busy(ENABLE_WAV ? audio_busy : 1'b0),
    .audio_available(ENABLE_WAV ? audio_available : 1'b0),.replay_toggle(replay_toggle),''')
s=s.replace('.brightness(ui_brightness),.volume(ui_volume),.period_ms(ui_period*32\'d1000),',
 '.brightness(ui_brightness),.volume(ui_volume),.period_ms(ui_period*32\'d1000),.hide_osd(video_thumbnail),')
s=s.replace('// Lesson 8: independent loader', '''wire loader_wr_en,reader_rd_en,preview_rd_en,preview_wr_en;
wire [ADDR_BITS-1:0] loader_wr_addr,reader_rd_addr,preview_rd_addr,preview_wr_addr;
wire [31:0] loader_wr_data,preview_wr_data;wire [3:0] loader_wr_mask;
assign App_rd_en=preview_busy ? preview_rd_en : reader_rd_en;
assign App_rd_addr=preview_busy ? preview_rd_addr : reader_rd_addr;
assign App_wr_en=preview_busy ? preview_wr_en : loader_wr_en;
assign App_wr_addr=preview_busy ? preview_wr_addr : loader_wr_addr;
assign App_wr_din=preview_busy ? preview_wr_data : loader_wr_data;
assign App_wr_dm=preview_busy ? 4'd0 : loader_wr_mask;
media_preview_builder #(.ADDR_BITS(ADDR_BITS)) u_preview_builder(
 .clk(ext_mem_clk),.rst(rst_mem),.preload_done(preload_done),.complete(image_complete),
 .controller_ready(Sdr_init_done),.controller_busy(Sdr_busy),.refresh_active(Sdr_init_ref_vld),
 .loader_busy(loader_busy),.reader_busy(reader_busy),.rd_valid(Sdr_rd_en),.rd_data(Sdr_rd_dout),
 .busy(preview_busy),.done(preview_done),.error(preview_error),
 .rd_en(preview_rd_en),.rd_addr(preview_rd_addr),.wr_en(preview_wr_en),.wr_addr(preview_wr_addr),.wr_data(preview_wr_data));
// Lesson 8: independent loader''')
s=s.replace('.refresh_active(Sdr_init_ref_vld), .read_busy(reader_busy),','.refresh_active(Sdr_init_ref_vld), .read_busy(reader_busy || preview_busy),')
s=s.replace('.app_wr_en(App_wr_en), .app_wr_addr(App_wr_addr),\n    .app_wr_data(App_wr_din), .app_wr_mask(App_wr_dm)', '.app_wr_en(loader_wr_en), .app_wr_addr(loader_wr_addr),\n    .app_wr_data(loader_wr_data), .app_wr_mask(loader_wr_mask)')
s=s.replace('.ADDR_BITS(ADDR_BITS),.IMAGE_WORDS(307200)', '.ADDR_BITS(ADDR_BITS),.IMAGE_WORDS(307200),.ENABLE_PREVIEW(1)')
s=s.replace('.controller_init_done(Sdr_init_done), .write_busy(loader_busy),', '.controller_init_done(Sdr_init_done), .write_busy(loader_busy || preview_busy),')
s=s.replace('.read_req(read_request_delay[3]), .active_index(video_bank),', '.read_req(read_request_delay[3]), .active_index(video_bank),.active_thumbnail(read_thumbnail),')
s=s.replace('.app_rd_en(App_rd_en), .app_rd_addr(App_rd_addr),', '.app_rd_en(reader_rd_en), .app_rd_addr(reader_rd_addr),')
a=s.index('pcm_media_tone #(');b=s.index('fat32_wav_player u_wav(',a)
s=s[:a]+'''media_audio_events #(.CLOCK_HZ(25000000),.STARTUP_MS(AUDIO_STARTUP_DELAY_MS)) u_audio_events(
 .clk(video_clk),.rst(rst_video),.commit_ack(frame_commit_ack),.display_valid(video_display_valid),
 .thumbnail(video_thumbnail),.media_id(video_media_id),.play_enable(play_enable),.page_success(page_success));
media_page_cue u_page_cue(.clk(video_clk),.rst_n(video_reset_n),.page_success(page_success),
 .speech_busy(ENABLE_WAV && speech_busy),.sample_tick(tone_valid),.sample_left(pcm_left),.sample_right(pcm_right),.cue_active());
'''+s[b:]
s=s.replace('fat32_wav_player u_wav(', '''fat32_wav_player u_wav(
    .play_enable(play_enable),.replay_toggle(replay_toggle),.audio_busy(audio_busy),.audio_available(audio_available),
    .speech_busy(speech_busy),.played_samples(played_samples),''')
# All sources now use the same volume stage; cue is no longer pre-scaled.
s=s.replace('.wav_active(source_is_wav),', '.wav_active(1\'b1),')
s=s.replace('.mode(ui_mode),.field(ui_field),', '.mode(ui_mode),.field(ui_field),.audio_busy(ENABLE_WAV && audio_busy_sync[1]),.audio_available(ENABLE_WAV && audio_available_sync[1]),')
s=s.replace('.clk(video_clk),.rst_n(video_reset_n),.vsync(menu_vs)', '.hide_overlay(video_thumbnail),.clk(video_clk),.rst_n(video_reset_n),.vsync(menu_vs)')
s=s.replace('audio_arc_calculate #(', '''wire caption_vs,caption_de;wire [23:0] caption_rgb;
speech_caption_overlay u_captions(.clk(video_clk),.rst(rst_video),.vs(wave_vs),.de(wave_de),.rgb(wave_rgb),
 .enabled(!video_thumbnail && ENABLE_WAV),.wav_active(wav_active),.played_samples(played_samples),
 .vs_out(caption_vs),.de_out(caption_de),.rgb_out(caption_rgb));
audio_arc_calculate #(''')
s=s.replace('(wave_vs)', '(caption_vs)').replace('(wave_de)', '(caption_de)').replace('(wave_rgb)', '(caption_rgb)')
# Above broad replacement must not change the producer / caption input links.
s=s.replace('.rgb_out(caption_rgb),.vs_out(caption_vs),.de_out(caption_de));\n\nwire caption_vs', '.rgb_out(wave_rgb),.vs_out(wave_vs),.de_out(wave_de));\n\nwire caption_vs')
s=s.replace('.vs(caption_vs),.de(caption_de),.rgb(caption_rgb),', '.vs(wave_vs),.de(wave_de),.rgb(wave_rgb),')
p.write_text(s,encoding='utf-8')

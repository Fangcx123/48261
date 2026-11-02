
module top(
    input                       clk,
    input                       rst_n,
    input                       key1,           // 短按下一张，长按上一张
    input                       sw3,            // board SW3 C6: up=settings, down=preview
    input                       key2,           // 自动播放 开/关

    output [5:0]                seg_sel,
    output [7:0]                seg_data,

    // HDMI TMDS
    output                      HDMI_CLK_P,
    output                      HDMI_D2_P,
    output                      HDMI_D1_P,
    output                      HDMI_D0_P,

    // HDMI DDC
    output                      HDMI_DDC_SCL,
    inout                       HDMI_DDC_SDA,

    // TF card SPI
    output                      sd_ncs,
    output                      sd_dclk,
    output                      sd_mosi,
    input                       sd_miso
);

parameter MEM_DATA_BITS = 32;
parameter ADDR_BITS     = 21;
parameter BUSRT_BITS    = 10;
parameter FRAME_PIXELS  = 24'd307200;   // 640*480
parameter BUF0_ADDR     = 24'd0;
parameter BUF1_ADDR     = FRAME_PIXELS;
parameter BUF2_ADDR     = FRAME_PIXELS*2;
parameter BUF3_ADDR     = FRAME_PIXELS*3;
parameter FADE_FRAMES   = 16; // 0 bypass; supported effects: 4, 8, 16, 32
parameter ENABLE_OSD    = 1;
parameter ENABLE_WAV    = 1;
parameter ENABLE_WAVEFORM = 1;
parameter AUDIO_STARTUP_DELAY_MS = 3000;
parameter [95:0] SUBTITLE_TEXT = "FPGA PLAYER "; // 12 ASCII slots, normal order
parameter SUBTITLE_LENGTH = 11;

wire Sdr_init_done;
wire Sdr_init_ref_vld;
wire Sdr_busy;

wire sd_card_clk;
wire audio_sd_read,audio_sd_grant,audio_sd_valid,audio_sd_end;
wire [31:0] audio_sd_addr;
wire [7:0] audio_sd_data;
wire ext_mem_clk;
wire ext_mem_clk_sft;
wire video_clk;
wire hdmi_5x_clk;

wire hs;
wire vs;
wire de;

wire [23:0] vout_data_raw;
wire [23:0] vout_data;
wire        display_valid;

wire [3:0]  state_code;
wire [6:0]  seg_data_0;

wire        video_read_req;
wire        video_read_req_ack;
wire        video_read_en;
wire [31:0] video_read_data;

wire        sd_card_write_en;
wire [31:0] sd_card_write_data;
wire        sd_card_write_req;
wire        sd_card_write_req_ack;
wire        frame_write_finish;
reg         frame_write_toggle_mem;

wire [1:0]  write_buf_idx;
wire [1:0]  disp_buf_idx;

wire App_rd_en;
wire [ADDR_BITS-1:0] App_rd_addr;
wire Sdr_rd_en;
wire [MEM_DATA_BITS-1:0] Sdr_rd_dout;
wire App_wr_en;
wire [ADDR_BITS-1:0] App_wr_addr;
wire [MEM_DATA_BITS-1:0] App_wr_din;
wire [3:0] App_wr_dm;

wire hs_0;
wire vs_0;
wire de_0;

// HDMI 1.4b 音频发射相关
wire        audio_valid;
wire [23:0] audio_left_data;
wire [23:0] audio_right_data;
wire        acr_valid;
wire [19:0] acr_cts;
wire [19:0] acr_n;

wire        axis_s_user;
wire        axis_s_valid;
wire        axis_s_last;
wire [23:0] axis_s_data;
wire        axis_s_ready;

wire        edid_trig;
wire        edid_valid;
wire [7:0]  edid_data;

wire [9:0]  tmds_ch0_data;
wire [9:0]  tmds_ch1_data;
wire [9:0]  tmds_ch2_data;
wire [9:0]  tmds_clk_data;

// PLLs get a deterministic 1 ms startup reset from the board reference clock.
// Logic stays reset for 500 ms after lock; lock-derived resets never feed back.
wire sys_locked, video_locked;
wire pll_reset_n, reset_source_n;
board_startup_reset u_startup_reset(
    .clk(clk), .ext_rst_n(rst_n), .plls_locked(sys_locked && video_locked),
    .pll_reset_n(pll_reset_n), .logic_reset_n(reset_source_n)
);
wire sd_reset_n, mem_reset_n, video_reset_n, serial_reset_n;
wire rst_sd = !sd_reset_n;
wire rst_mem = !mem_reset_n;
wire rst_video = !video_reset_n;
wire rst_serial = !serial_reset_n;
reset_sync u_reset_sd(sd_card_clk, reset_source_n, sd_reset_n);
reset_sync u_reset_mem(ext_mem_clk, reset_source_n, mem_reset_n);
reset_sync u_reset_video(video_clk, reset_source_n, video_reset_n);
reset_sync u_reset_serial(hdmi_5x_clk, reset_source_n, serial_reset_n);
sys_pll sys_pll_m0(
    .refclk(clk), .reset(!pll_reset_n), .locked(sys_locked),
    .clk0_out(sd_card_clk), .clk1_out(ext_mem_clk), .clk2_out(ext_mem_clk_sft)
);
video_pll video_pll_m0(
    .refclk(clk), .reset(!pll_reset_n), .locked(video_locked),
    .clk0_out(video_clk), .clk1_out(hdmi_5x_clk)
);
(* async_reg="true" *) reg [2:0] mem_ready_sync;
always @(posedge sd_card_clk or posedge rst_sd)
    if(rst_sd) mem_ready_sync<=0;
    else mem_ready_sync<={mem_ready_sync[1:0],Sdr_init_done};

wire frame_commit_toggle, frame_commit_ack;
wire effect_frame_start;
wire commit_view,video_thumbnail,read_thumbnail;wire [40:0] ui_settings,pix_settings;
wire audio_busy,audio_available,replay_toggle,speech_busy,play_enable,page_success;
wire wav_play_enable;
wire [31:0] played_samples;
wire speech_done_toggle;
wire [95:0] image_dimensions;
wire [23:0] active_dimensions;
wire speech_page_req_toggle;
wire [1:0] speech_page_req_index;
wire preview_busy,preview_done,preview_error;
(* async_reg="true" *) reg [1:0] preview_error_sync;
always @(posedge sd_card_clk or posedge rst_sd)
 if(rst_sd) preview_error_sync<=0;else preview_error_sync<={preview_error_sync[0],preview_error};
(* async_reg="true" *) reg [2:0] preview_done_sync;
always @(posedge sd_card_clk or posedge rst_sd)
 if(rst_sd) preview_done_sync<=0;else preview_done_sync<={preview_done_sync[1:0],preview_done};
(* async_reg="true" *) reg [1:0] audio_busy_sync,audio_available_sync;
always @(posedge video_clk or posedge rst_video)
 if(rst_video) begin audio_busy_sync<=3;audio_available_sync<=0;end
 else begin audio_busy_sync<={audio_busy_sync[0],audio_busy};audio_available_sync<={audio_available_sync[0],audio_available};end
wire [1:0] ui_mode=pix_settings[40:39],ui_focus=pix_settings[38:37];
wire [2:0] ui_field=pix_settings[36:34];
wire [3:0] ui_complete=pix_settings[33:30];
wire [7:0] ui_brightness=pix_settings[29:22],ui_contrast=pix_settings[21:14],ui_volume=pix_settings[13:6];
wire [5:0] ui_period=pix_settings[5:0];
media_settings_cdc u_settings(.src_clk(sd_card_clk),.src_rst(rst_sd),.settings(ui_settings),
 .pix_clk(video_clk),.pix_rst(rst_video),.frame_start(effect_frame_start),.snapshot(pix_settings));
wire commit_is_auto, auto_enabled;
wire effect_bank_token, effect_bank_ack;
wire [7:0] effect_alpha;
wire effect_wipe,effect_busy;
wire [9:0] effect_boundary;
wire output_vs,output_de;
wire [1:0] video_bank, video_media_id;
wire video_display_valid;
wire [3:0] error_code, storage_error_code;
wire [3:0] image_complete;
wire loader_pixel_ready;
wire preload_done, loader_error, loader_busy, reader_busy, reader_underflow;
wire [3:0] reader_error;
wire reader_pixel_valid;
(* async_reg="true" *) reg [3:0] reader_error_s1,reader_error_s2;
(* async_reg="true" *) reg [1:0] underflow_sync;
always @(posedge sd_card_clk or posedge rst_sd)
    if(rst_sd) begin reader_error_s1<=0;reader_error_s2<=0;underflow_sync<=0;end
    else begin
        reader_error_s1<=reader_error;reader_error_s2<=reader_error_s1;
        underflow_sync<={underflow_sync[0],reader_underflow};
    end
assign error_code=storage_error_code!=0 ? storage_error_code :
                  preview_error_sync[1] ? 4'he : reader_error_s2!=0 ? reader_error_s2 : underflow_sync[1] ? 4'hf : 4'h0;
wire [6:0] error_segments;
wire [3:0] diagnostic_stage;
wire diagnostic_memory_ready;
wire [7:0] diagnostic_r1;
wire [6:0] r1_high_segments, r1_low_segments;
seg_decoder u_r1_high_decoder(.bin_data(diagnostic_r1[7:4]),.seg_data(r1_high_segments));
seg_decoder u_r1_low_decoder(.bin_data(diagnostic_r1[3:0]),.seg_data(r1_low_segments));
wire [6:0] diagnostic_segments;
seg_decoder u_diagnostic_decoder(.bin_data(diagnostic_stage),.seg_data(diagnostic_segments));
// Allow the bank mailbox four pixel clocks to settle before the memory request.
reg [3:0] read_request_delay;
always @(posedge video_clk or posedge rst_video)
    if(rst_video) read_request_delay<=0;
    else read_request_delay<={read_request_delay[2:0],video_read_req};
(* async_reg="true" *) reg [1:0] read_ack_sync;
always @(posedge video_clk or posedge rst_video)
    if(rst_video) read_ack_sync<=0;
    else read_ack_sync<={read_ack_sync[0],video_read_req_ack};
frame_commit_cdc #(.ENABLE_VIEW(1),.ENABLE_DIMENSIONS(1)) u_frame_commit(
    .commit_dimensions(image_dimensions[disp_buf_idx*24 +: 24]),.display_dimensions(active_dimensions),
    .commit_view(commit_view),.display_thumbnail(video_thumbnail),.read_thumbnail(read_thumbnail),
    .clk(video_clk), .rst(rst_video),
    .commit_toggle(effect_bank_token), .commit_bank(disp_buf_idx),
    .commit_id(state_code[1:0]-2'd1), .commit_valid(display_valid),
    .frame_read_req(video_read_req), .frame_read_ack(read_ack_sync[1]),
    .commit_ack(effect_bank_ack), .read_bank(video_bank),
    .media_id(video_media_id), .display_valid(video_display_valid)
);
video_transition_commit #(.FADE_FRAMES(FADE_FRAMES)) u_transition(
    .clk(video_clk),.rst(rst_video),.frame_start(effect_frame_start),
    .source_token(frame_commit_toggle),.source_auto(commit_is_auto),
    .display_valid(video_display_valid),.bank_ack(effect_bank_ack),
    .bank_token(effect_bank_token),.source_ack(frame_commit_ack),
    .alpha(effect_alpha),.wipe_active(effect_wipe),.wipe_boundary(effect_boundary),.busy(effect_busy));
seg_decoder u_error_decoder(.bin_data(error_code),.seg_data(error_segments));

// mem_clk 域把 write_finish 单拍转成 toggle，供 sd_card_clk 域可靠同步
always @(posedge ext_mem_clk or posedge rst_mem) begin
    if (rst_mem)
        frame_write_toggle_mem <= 1'b0;
    else if (frame_write_finish)
        frame_write_toggle_mem <= ~frame_write_toggle_mem;
end

// ===================== FAT32 preload: one file per fixed bank =====================
media_player_control #(
    .CLK_FREQ_HZ       (100_000_000),.ENABLE_WAV(ENABLE_WAV),.ENABLE_UI(1),.ENABLE_SCALING(1),.ENABLE_PREVIEW_BUILD(1),.EARLY_DISPLAY(1)
) sd_card_bmp_m0(
    .commit_view(commit_view),.ui_settings(ui_settings),
    .loader_pixel_ready(loader_pixel_ready),.settings_switch(sw3),.speech_done_toggle(speech_done_toggle),.image_dimensions(image_dimensions),
    .speech_req_toggle(speech_page_req_toggle),.speech_req_index(speech_page_req_index),
    .preview_ready(preview_done_sync[2]),.audio_busy(ENABLE_WAV ? audio_busy : 1'b0),
    .audio_available(ENABLE_WAV ? audio_available : 1'b0),.replay_toggle(replay_toggle),
    .clk               (sd_card_clk),
    .audio_sd_read(audio_sd_read),.audio_sd_addr(audio_sd_addr),.audio_sd_grant(audio_sd_grant),
    .audio_sd_data(audio_sd_data),.audio_sd_valid(audio_sd_valid),.audio_sd_end(audio_sd_end),
    .rst               (rst_sd),
    .memory_ready(mem_ready_sync[2]),
    .frame_commit_ack(frame_commit_ack), .frame_commit_toggle(frame_commit_toggle),
    .commit_is_auto(commit_is_auto),.auto_enabled(auto_enabled),
    .error_code(storage_error_code),
    .image_complete(image_complete), .preload_done(preload_done), .load_memory_error(loader_error),
    .diagnostic_stage(diagnostic_stage), .diagnostic_memory_ready(diagnostic_memory_ready),
    .diagnostic_r1(diagnostic_r1),
    .key_next          (key1),
    .key_auto          (key2),
    .state_code        (state_code),
    .bmp_width         (16'd640),
    .bmp_height        (16'd480),
    .display_valid     (display_valid),

    .write_finish_toggle(frame_write_toggle_mem),
    .write_buf_idx     (write_buf_idx),
    .disp_buf_idx      (disp_buf_idx),

    .write_req         (sd_card_write_req),
    .write_req_ack     (sd_card_write_req_ack),
    .write_en          (sd_card_write_en),
    .write_data        (sd_card_write_data),
    .SD_nCS            (sd_ncs),
    .SD_DCLK           (sd_dclk),
    .SD_MOSI           (sd_mosi),
    .SD_MISO           (sd_miso)
);

seg_decoder seg_decoder_m0(
    .bin_data          (state_code),
    .seg_data          (seg_data_0)
);

seg_scan seg_scan_m0(
    .clk               (clk),
    .rst_n             (pll_reset_n),
    .seg_sel           (seg_sel),
    .seg_data          (seg_data),
    .seg_data_0        ({1'b1,(error_code==6 ? r1_high_segments : 7'b1111111)}),
    .seg_data_1        ({1'b1,(error_code==6 ? r1_low_segments : 7'b1111111)}),
    // On timeout, show SDRAM-ready + SD init stage beside the original error/image.
    .seg_data_2        ({1'b1,(error_code==6 ? (diagnostic_memory_ready ? 7'b1111001 : 7'b1000000) : 7'b1111111)}),
    .seg_data_3        ({1'b1,(error_code==6 ? diagnostic_segments : 7'b1111111)}),
    .seg_data_4        ({1'b1,error_segments}),
    .seg_data_5        ({1'b1,seg_data_0})
);

// ===================== 原图像时序与帧缓存 =====================
video_timing_data video_timing_data_m0(
    .video_clk         (video_clk),
    .rst               (rst_video),
    .read_req          (video_read_req),
    .read_req_ack      (read_ack_sync[1]),
    .hs                (hs_0),
    .vs                (vs_0),
    .de                (de_0)
);

video_delay video_delay_m0(
    .video_clk         (video_clk),
    .rst               (rst_video),
    .read_en           (video_read_en),
    .read_data         (reader_pixel_valid ? video_read_data[31:8] : 24'd0),
    .hs                (hs_0),
    .vs                (vs_0),
    .de                (de_0),
    .hs_r              (hs),
    .vs_r              (vs),
    .de_r              (de),
    .vout_data         (vout_data_raw)
);

wire preview_vs,preview_de,adjust_vs,adjust_de;wire [23:0] preview_rgb,adjust_rgb;
thumbnail_cache u_thumbnails(
 .wr_clk(sd_card_clk),.wr_rst(rst_sd),.write_req(sd_card_write_req),.pixel_valid(sd_card_write_en),
 .bank(write_buf_idx),.pixel(sd_card_write_data[31:8]),.clk(video_clk),.rst(rst_video),
 .vs(vs),.de(de),.rgb(vout_data_raw),.view(video_thumbnail),.focus(ui_focus),.complete(ui_complete),
 .vs_out(preview_vs),.de_out(preview_de),.rgb_out(preview_rgb));
brightness_contrast_adjust u_adjust(.clk(video_clk),.rst(rst_video),.vs(preview_vs),.de(preview_de),.rgb(preview_rgb),
 .brightness(ui_brightness),.contrast(ui_contrast),.vs_out(adjust_vs),.de_out(adjust_de),.rgb_out(adjust_rgb));
// 首图提交前黑屏；提交后一直显示当前显示缓冲区内容
video_effects_pipeline #(.ENABLE_OSD(ENABLE_OSD),.USE_RUNTIME_SETTINGS(1),.RUNTIME_HIDE(1),.SUBTITLE_TEXT(SUBTITLE_TEXT),
    .SUBTITLE_LENGTH(SUBTITLE_LENGTH)) u_video_effects(
    .brightness(ui_brightness),.volume(ui_volume),.period_ms(ui_period*32'd1000),.hide_osd(video_thumbnail || ui_mode==2),
    .clk(video_clk),.rst_n(video_reset_n),.vsync(adjust_vs),.de(adjust_de),.rgb_in(adjust_rgb),
    .source_width(active_dimensions[23:12]),.source_height(active_dimensions[11:0]),
    .status_clk(sd_card_clk),.status_rst_n(sd_reset_n),
    .display_valid(video_display_valid),.active_index(video_media_id),
    .auto_enabled(auto_enabled),.error_code(error_code),.alpha(effect_alpha),
    .wipe_active(effect_wipe),.wipe_boundary(effect_boundary),.frame_start(effect_frame_start),
    .vs_out(output_vs),.de_out(output_de),.rgb_out(vout_data));

// The vendor controller raises Sdr_rd_en a fixed number of controller cycles
// after App_rd_en. With the 180-degree SDRAM clock and CL=3 at 41.667 MHz,
// Sdr_rd_dout leads Sdr_rd_en by one cycle (measured on the controller gate
// netlist, verification/workstation_v11): each read returned the next word
// and the last word of every burst was bus garbage (fixed lines at
// x=127+128k). Board IO delays are far below the 24 ns period, so the lead
// holds on hardware. Realign the data here.
reg [MEM_DATA_BITS-1:0] sdr_rd_data;
always @(posedge ext_mem_clk) sdr_rd_data<=Sdr_rd_dout;
wire loader_wr_en,reader_rd_en,preview_rd_en,preview_wr_en,reader_urgent;
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
 .loader_busy(loader_busy),.reader_busy(reader_busy || reader_urgent),.rd_valid(Sdr_rd_en),.rd_data(sdr_rd_data),
 .busy(preview_busy),.done(preview_done),.error(preview_error),
 .rd_en(preview_rd_en),.rd_addr(preview_rd_addr),.wr_en(preview_wr_en),.wr_addr(preview_wr_addr),.wr_data(preview_wr_data));
// Lesson 8: independent loader and reader, 512-word asynchronous FIFOs,
// 128-word bursts and four permanent banks. The legacy bridge is not used.
media_frame_loader #(.ADDR_BITS(ADDR_BITS),.FRAME_WIDTH(640),.FRAME_HEIGHT(480)) u_frame_loader(
    .mem_clk(ext_mem_clk), .rst(rst_mem), .source_clk(sd_card_clk), .source_rst(rst_sd),
    .controller_init_done(Sdr_init_done), .controller_busy(Sdr_busy),
    .refresh_active(Sdr_init_ref_vld), .read_busy(reader_busy || preview_busy || reader_urgent),
    .write_req(sd_card_write_req), .image_index(write_buf_idx),
    .pixel_valid(sd_card_write_en), .pixel_data(sd_card_write_data),
    .write_req_ack(sd_card_write_req_ack), .load_done(frame_write_finish),
    .write_busy(loader_busy), .memory_error(loader_error),.pixel_ready(loader_pixel_ready),
    .app_wr_en(loader_wr_en), .app_wr_addr(loader_wr_addr),
    .app_wr_data(loader_wr_data), .app_wr_mask(loader_wr_mask)
);
media_frame_reader #(.ADDR_BITS(ADDR_BITS),.IMAGE_WORDS(307200),.ENABLE_PREVIEW(1)) u_frame_reader(
    .mem_clk(ext_mem_clk), .rst(rst_mem), .pix_clk(video_clk), .pix_rst(rst_video),
    .controller_init_done(Sdr_init_done), .write_busy(loader_busy || preview_busy || Sdr_busy || Sdr_init_ref_vld),
    .read_req(read_request_delay[3]), .active_index(video_bank),.active_thumbnail(read_thumbnail),
    .read_req_ack(video_read_req_ack), .frame_read_done(), .read_busy(reader_busy),.read_urgent(reader_urgent),
    .app_rd_en(reader_rd_en), .app_rd_addr(reader_rd_addr),
    .sdram_rd_valid(Sdr_rd_en), .sdram_rd_data(sdr_rd_data),
    .pixel_consume(video_read_en), .display_valid(video_display_valid),
    .pixel_data(video_read_data), .pixel_valid(reader_pixel_valid),
    .underflow(reader_underflow), .reader_error(reader_error)
);

sdram U3(
    .Clk               (ext_mem_clk),
    .Clk_sft           (ext_mem_clk_sft),
    .Rst               (rst_mem),
    .Sdr_init_done     (Sdr_init_done),
    .Sdr_init_ref_vld  (Sdr_init_ref_vld),
    .Sdr_busy          (Sdr_busy),
    .App_wr_en         (App_wr_en),
    .App_wr_addr       (App_wr_addr),
    .App_wr_dm         (App_wr_dm),
    .App_wr_din        (App_wr_din),
    .App_rd_en         (App_rd_en),
    .App_rd_addr       (App_rd_addr),
    .Sdr_rd_en         (Sdr_rd_en),
    .Sdr_rd_dout       (Sdr_rd_dout)
);

// Lesson 4: 48 kHz stereo PCM in the pixel domain; retain vendor HDMI IP.
// The IP accepts a one-cycle valid pulse, so the PCM FIFO is always consumed.
wire signed [15:0] pcm_left, pcm_right;
wire tone_valid,source_valid,source_is_wav;
wire [15:0] source_left,source_right,final_left,final_right;
wire wav_active,audio_underflow,wav_preparing;
wire speech_home_ready=video_display_valid && !video_thumbnail && ui_mode==0 && (!ui_complete[0] || video_media_id==0) && !effect_busy;
wire [7:0] audio_error;
media_audio_events #(.CLOCK_HZ(25000000),.STARTUP_MS(AUDIO_STARTUP_DELAY_MS)) u_audio_events(
 .clk(video_clk),.rst(rst_video),.commit_ack(frame_commit_ack),.display_valid(video_display_valid),
 .thumbnail(video_thumbnail),.media_id(video_media_id),.play_enable(play_enable),.page_success(page_success),
 .replay_toggle(replay_toggle),.wav_play_enable(wav_play_enable));
media_page_cue u_page_cue(.clk(video_clk),.rst_n(video_reset_n),.page_success(page_success),
 .speech_busy(ENABLE_WAV && speech_busy),.sample_tick(tone_valid),.sample_left(pcm_left),.sample_right(pcm_right),.cue_active());
fat32_wav_player u_wav(
    .preparing(wav_preparing),.play_enable(wav_play_enable && (wav_active || speech_home_ready)),.replay_toggle(replay_toggle),.audio_busy(audio_busy),.audio_available(audio_available),
    .speech_busy(speech_busy),.played_samples(played_samples),.play_done_toggle(speech_done_toggle),
    .wr_clk(sd_card_clk),.wr_rst_n(sd_reset_n),.sd_grant(audio_sd_grant),
    .sd_read(audio_sd_read),.sd_addr(audio_sd_addr),.sd_data(audio_sd_data),
    .sd_valid(audio_sd_valid),.sd_end(audio_sd_end),
    .rd_clk(video_clk),.rd_rst_n(video_reset_n),.sample_tick(tone_valid),
    .tone_left(pcm_left),.tone_right(pcm_right),.sample_valid(source_valid),
    .sample_left(source_left),.sample_right(source_right),.sample_is_wav(source_is_wav),.wav_active(wav_active),
    .underflow(audio_underflow),.audio_error(audio_error));
speech_page_events u_speech_page_events(
    .preparing(wav_preparing),.clk(video_clk),.rst(rst_video),.wav_active(wav_active),.played_samples(played_samples),
    .req_toggle(speech_page_req_toggle),.req_index(speech_page_req_index));
pcm_fade_output #(.USE_RUNTIME_VOLUME(1)) u_audio_output(
    .user_volume(ui_volume),
    .clk(video_clk),.rst_n(video_reset_n),.sample_valid(source_valid),
    .sample_left(source_left),.sample_right(source_right),.wav_active(1'b1),
    .display_valid(video_display_valid),.alpha(8'd255),.out_valid(audio_valid),
    .out_left(final_left),.out_right(final_right));
// 16-bit signed PCM is left justified in the HDMI core's 24-bit sample word.
assign audio_left_data = {final_left,8'd0};
assign audio_right_data = {final_right,8'd0};

// Waveform uses the samples actually submitted to HDMI, after volume/fade.
// Add one aligned RGB/VS/DE register stage; preserve the existing OSD chain.
wire [23:0] wave_rgb;
wire wave_vs,wave_de;
wire menu_vs,menu_de;wire [23:0] menu_rgb;
media_menu_overlay u_menu(.clk(video_clk),.rst(rst_video),.vs(output_vs),.de(output_de),.rgb(vout_data),
 .mode(ui_mode),.field(ui_field),.audio_busy(ENABLE_WAV && audio_busy_sync[1]),.audio_available(ENABLE_WAV && audio_available_sync[1]),.brightness(ui_brightness),.contrast(ui_contrast),.volume(ui_volume),.period_s(ui_period),
 .vs_out(menu_vs),.de_out(menu_de),.rgb_out(menu_rgb));
audio_visualizer #(.ENABLE(ENABLE_WAVEFORM),.RUNTIME_HIDE(1)) u_audio_visualizer(
    .hide_overlay(video_thumbnail || ui_mode==2),.clk(video_clk),.rst_n(video_reset_n),.vsync(menu_vs),.de(menu_de),.rgb_in(menu_rgb),
    .pcm_valid(audio_valid),.pcm_left(final_left),.wav_active(wav_active),
    .underflow(audio_underflow),.audio_failed(audio_error!=0),
    .rgb_out(wave_rgb),.vs_out(wave_vs),.de_out(wave_de));

wire caption_vs,caption_de;wire [23:0] caption_rgb;
speech_caption_overlay u_captions(.clk(video_clk),.rst(rst_video),.vs(wave_vs),.de(wave_de),.rgb(wave_rgb),
 .enabled(!video_thumbnail && ui_mode!=2 && ENABLE_WAV),.wav_active(wav_active),.played_samples(played_samples),
 .vs_out(caption_vs),.de_out(caption_de),.rgb_out(caption_rgb));
audio_arc_calculate #(
    .ACR_N         (6144)
) u_audio_arc_calculate (
    .I_clk         (video_clk),
    .I_rst         (rst_video),
    .I_audio_valid (audio_valid),
    .O_acr_valid   (acr_valid),
    .O_acr_cts     (acr_cts),
    .O_acr_n       (acr_n)
);

// ===================== RGB/DE 转 AXIS 视频 =====================
video_rgb_to_axis_640x480 u_video_rgb_to_axis_640x480(
    .I_clk         (video_clk),
    .I_rst         (rst_video),
    .I_vs          (caption_vs),
    .I_de          (caption_de),
    .I_rgb         (caption_rgb),
    .O_video_user  (axis_s_user),
    .O_video_valid (axis_s_valid),
    .O_video_last  (axis_s_last),
    .O_video_data  (axis_s_data)
);

// 上电后自动打一拍，触发一次 EDID 读取
startup_pulse #(
    .CNT_MAX(20'd100000)
) u_startup_pulse (
    .I_clk   (video_clk),
    .I_rst   (rst_video),
    .O_pulse (edid_trig)
);

// ===================== 带音频的 HDMI 1.4b 发射 =====================
hdmi_1_4b_transmitter_core_wrapper #(
    .DEVICE                 ( "EG"       ),
    .HTOTAL                 ( 800        ),
    .HSA                    ( 96         ),
    .HFP                    ( 16         ),
    .HBP                    ( 48         ),
    .HACTIVE                ( 640        ),
    .VTOTAL                 ( 525        ),
    .VSA                    ( 2          ),
    .VFP                    ( 10         ),
    .VBP                    ( 33         ),
    .VACTIVE                ( 480        ),
    .VIDEO_VIC              ( 1          ),
    .VIDEO_TPG              ( "Disable"  ),
    .VIDEO_FORMAT           ( "RGB"      ),
    .AUDIO_SAMPLE_RATE      ( "48K"      ),
    .IIC_SCL_DIV            ( 250        )
) u_hdmi_1_4b_transmitter_core_wrapper(
    .I_pixel_clk        (video_clk),
    .I_rst              (rst_video),
    .I_edid_read_trig   (edid_trig),
    .O_edid_read_valid  (edid_valid),
    .O_edid_read_data   (edid_data),

    .I_axis_s_user      (axis_s_user),
    .I_axis_s_valid     (axis_s_valid),
    .I_axis_s_last      (axis_s_last),
    .I_axis_s_data      (axis_s_data),
    .O_axis_s_ready     (axis_s_ready),

    .I_audio_valid      (audio_valid),
    .I_audio_left_data  (audio_left_data),
    .I_audio_right_data (audio_right_data),
    .I_acr_valid        (acr_valid),
    .I_acr_cts          (acr_cts),
    .I_acr_n            (acr_n),

    .O_video_locked     (),
    .O_ddc_scl          (HDMI_DDC_SCL),
    .IO_ddc_sda         (HDMI_DDC_SDA),

    .O_ch0_tmds_data    (tmds_ch0_data),
    .O_ch1_tmds_data    (tmds_ch1_data),
    .O_ch2_tmds_data    (tmds_ch2_data),
    .O_clk_tmds_data    (tmds_clk_data)
);

hdmi_phy_wrapper #(
    .DEVICE ( "EG" )
) u_hdmi2phy_wrapper(
    .I_pixel_clk        (video_clk),
    .I_serial_clk       (hdmi_5x_clk),
    .I_rst              (rst_video | rst_serial),
    .I_tmds_channel_0   (tmds_ch0_data),
    .I_tmds_channel_1   (tmds_ch1_data),
    .I_tmds_channel_2   (tmds_ch2_data),
    .I_tmds_channel_clk (tmds_clk_data),
    .O_tmds_ch0_p       (HDMI_D0_P),
    .O_tmds_ch1_p       (HDMI_D1_P),
    .O_tmds_ch2_p       (HDMI_D2_P),
    .O_tmds_clk_p       (HDMI_CLK_P)
);

endmodule

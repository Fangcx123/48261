// Adapted from the lesson 8 preload/cache architecture and working v5 controls.

module media_player_control #(
    parameter integer CLK_FREQ_HZ       = 100_000_000,
    parameter integer LONG_PRESS_MS      = 1000,
    parameter integer AUTO_PLAY_MS       = 3000,
    parameter integer ENABLE_WAV         = 0,
    parameter integer ENABLE_UI = 0, ENABLE_SCALING = 0, ENABLE_PREVIEW_BUILD=0, EARLY_DISPLAY=0
)(
    output reg commit_view,
    output [40:0] ui_settings,
    input preview_ready,audio_busy,audio_available,output replay_toggle,
    input speech_req_toggle,input [1:0] speech_req_index,
    input settings_switch, speech_done_toggle,loader_pixel_ready,
    output reg [95:0] image_dimensions,
    input                       clk,
    input                       rst,
    input                       memory_ready,
    input                       load_memory_error,
    output reg [3:0]            image_complete,
    output reg                  preload_done,
    input                       frame_commit_ack,
    output reg                  frame_commit_toggle,
    output reg                  commit_is_auto,
    output                      auto_enabled,
    output reg [3:0]            error_code,
    output reg [3:0]            diagnostic_stage,
    output reg                  diagnostic_memory_ready,
    output reg [7:0]            diagnostic_r1,
    input                       key_next,
    input                       key_auto,
    output reg [3:0]            state_code,
    input  [15:0]               bmp_width,
    input  [15:0]               bmp_height,
    output reg                  display_valid,

    input                       write_finish_toggle,
    output reg [1:0]            write_buf_idx,
    output reg [1:0]            disp_buf_idx,

    output                      write_req,
    input                       write_req_ack,
    output                      write_en,
    output [31:0]               write_data,
    output                      SD_nCS,
    output                      SD_DCLK,
    output                      SD_MOSI,
    input                       SD_MISO,
    input                       audio_sd_read,
    input [31:0]                audio_sd_addr,
    output                      audio_sd_grant,
    output [7:0]                audio_sd_data,
    output                      audio_sd_valid,audio_sd_end
);

wire key_next_press;
wire key_auto_press;
wire key_auto_short_release;
wire key_next_short_release;
wire key_next_long;
wire controls_ready;
(* async_reg="true" *) reg [2:0] done_sync;
reg done_seen,home_pending;
wire done_event=done_sync[2]!=done_seen;
wire [11:0] source_width,source_height;
(* async_reg="true" *) reg [1:0] sw_sync;reg sw_stable;reg [31:0] sw_count;
always @(posedge clk or posedge rst) begin
 if(rst) begin sw_sync<=0;sw_stable<=0;sw_count<=0;done_sync<=0;end
 else begin
  sw_sync<={sw_sync[0],settings_switch};done_sync<={done_sync[1:0],speech_done_toggle};
  if(sw_sync[1]==sw_stable) sw_count<=0;
  else if(sw_count>=(CLK_FREQ_HZ/1000)*20-1) begin sw_stable<=sw_sync[1];sw_count<=0;end
  else sw_count<=sw_count+1'b1;
 end
end
reg [1:0] img_idx;
reg commit_wait;
(* async_reg="true" *) reg [2:0] speech_toggle_sync;
(* async_reg="true" *) reg [1:0] speech_index_sync;
reg speech_toggle_seen,speech_pending;
reg [1:0] speech_pending_index;
wire speech_event = speech_toggle_sync[2] != speech_toggle_seen;
wire [1:0] ui_mode,ui_focus,ui_index;wire [2:0] ui_field;
wire [7:0] ui_brightness,ui_contrast,ui_volume;wire [5:0] ui_period;
wire ui_select,ui_view;
reg ui_replay_seen;
always @(posedge clk or posedge rst)
 if(rst) ui_replay_seen<=0;else ui_replay_seen<=replay_toggle;
always @(posedge clk or posedge rst) begin
 if(rst) begin speech_toggle_sync<=0;speech_index_sync<=0;end
 else begin speech_toggle_sync<={speech_toggle_sync[1:0],speech_req_toggle};speech_index_sync<=speech_req_index;end
end
wire ui_ready=preload_done && display_valid && first_image_committed && !recovery_active;
wire input_ready=ENABLE_UI ? ui_ready : controls_ready;
wire full_mode=!ENABLE_UI || ui_mode==0;
reg [31:0] auto_long_count;
wire auto_release=key_auto_armed && !key_auto_stable_d && key_auto_stable;
wire auto_long_release=ENABLE_UI && auto_release && auto_long_count>=LONG_PRESS_CYCLES;
assign ui_settings={ui_mode,ui_focus,ui_field,image_complete,ui_brightness,ui_contrast,ui_volume,ui_period};
generate if(ENABLE_UI) begin: ui
 media_ui_controller u_ui(.clk(clk),.rst(rst),.ready(ui_ready),.busy(commit_wait || ui_select),
 .audio_busy(audio_busy),.audio_available(audio_available),.replay_toggle(replay_toggle),
 .settings_switch(sw_stable),.preview_ready(!ENABLE_PREVIEW_BUILD || preview_ready),.return_home(done_event),
 .next_short(key_next_short_release),.next_long(key_next_long),
 .mode_short(key_auto_short_release),.mode_long(auto_long_release),
 .current(img_idx),.complete(image_complete),.select_req(ui_select),.select_index(ui_index),.select_view(ui_view),
 .mode(ui_mode),.focus(ui_focus),.field(ui_field),.brightness(ui_brightness),.contrast(ui_contrast),.volume(ui_volume),.period_s(ui_period));
end else begin: no_ui
 assign replay_toggle=0;
 assign ui_mode=0;assign ui_focus=0;assign ui_field=0;assign ui_index=0;assign ui_select=0;assign ui_view=0;
 assign ui_brightness=255;assign ui_contrast=128;assign ui_volume=96;assign ui_period=3;
end endgenerate
wire next_request;
wire prev_request;

localparam integer LONG_PRESS_CYCLES = (CLK_FREQ_HZ / 1000) * LONG_PRESS_MS;
localparam integer AUTO_PLAY_CYCLES  = (CLK_FREQ_HZ / 1000) * AUTO_PLAY_MS;
// 两秒没有读扇区/写像素/写完成进展才判定超时，不限制整张图片加载时长。
localparam integer LOAD_STALL_CYCLES = (CLK_FREQ_HZ / 1000) * 2000;
localparam integer IO_RESET_CYCLES   = (CLK_FREQ_HZ / 1000) * 20;
wire             sd_sec_read;
wire [31:0]      sd_sec_read_addr;
wire [7:0]       sd_sec_read_data;
wire             sd_sec_read_data_valid;
wire             sd_sec_read_end;
// Images permanently reside in SDRAM after preload. Transfer SPI ownership
// only while the BMP frontend and its level request are idle. Keep ownership
// until reset; no runtime image reads compete with streaming audio.
reg audio_owner;
always @(posedge clk or posedge rst)
    if(rst) audio_owner<=0;
    else if(ENABLE_WAV && preload_done && display_valid && bmp_ready &&
            !sd_sec_read && !recovery_active && !io_reset && sd_init_done)
        audio_owner<=1;
assign audio_sd_grant=audio_owner && !pipeline_rst && sd_init_done;
assign audio_sd_data=sd_sec_read_data;
assign audio_sd_valid=audio_sd_grant && sd_sec_read_data_valid;
assign audio_sd_end=audio_sd_grant && sd_sec_read_end;
wire             bmp_data_wr_en;
wire [23:0]      bmp_data;
wire             sd_init_done;
wire [3:0]       sd_init_stage;
wire [7:0]       sd_response_r1;
wire             bmp_ready;
wire bmp_load_done, bmp_load_error;
wire [3:0] bmp_error;
reg [2:0] commit_ack_sync;
reg [3:0] bad_mask;
reg retry_pending;
reg [31:0] pipeline_stall;
reg [31:0] init_wait;
wire scan_timeout = scan_kicked && !scan_complete_latched && pipeline_stall >= LOAD_STALL_CYCLES-1;
wire init_timeout = !sd_init_done && init_wait >= CLK_FREQ_HZ*10-1;
wire all_bad = preload_done && image_complete==0 && img_found_count!=0;
wire recovery_request = load_abort || scan_timeout || init_timeout;
wire [3:0] resource_mask;
wire [7:0] scan_error;
reg [1:0] scan_settle;
wire             scan_done;
wire             scan_found_valid;
wire [31:0]      scan_found_sector;
wire [2:0]       scan_found_total;
wire             key_auto_stable;
wire             key_next_stable;

reg              scan_start_pulse;
reg              load_start_pulse;
reg [31:0]       load_sector;
reg              scan_kicked;
reg              first_image_committed;
reg              auto_play_en;
assign auto_enabled = auto_play_en;
reg [31:0]       auto_cnt;
reg [2:0]        img_found_count;
// img_idx declared before the UI instance to prevent an implicit scalar net.
reg [1:0]        load_idx;             // 当前正在写入的图片编号
reg [1:0]        pending_buf_idx;      // 当前正在写入的目标缓冲区
reg [31:0]       img_sector0;
reg [31:0]       img_sector1;
reg [31:0]       img_sector2;
reg [31:0]       img_sector3;
reg              next_req_pending;
reg              load_busy;
reg [31:0]       long_press_cnt;
reg              long_press_marked;
reg              prev_req_pending;
reg              key_auto_armed;
reg              key_auto_stable_d;
reg              key_next_armed;
reg              key_next_stable_d;

// Explicit BMP completion and SDRAM write completion may arrive in either order.
reg              source_done_seen;
reg              write_done_seen;
reg              write_req_seen;
reg [31:0]       load_pixel_count;
reg [31:0]       load_stall_cnt;
reg              scan_complete_latched;
reg [2:0]        write_ack_sync;
reg              write_ack_d;
reg              recovery_active;
reg              io_reset;
reg [31:0]       io_reset_cnt;
wire             pipeline_rst;
wire             load_abort;
wire [31:0]      frame_pixel_count;

// 同步 mem_clk 域的 write_finish_toggle
reg [2:0]        wrfin_tgl_sync;
wire             write_finish_pulse;

wire auto_tick;
wire [1:0] next_from_current;
reg [1:0] next_candidate, prev_candidate, retry_candidate;

assign write_en   = bmp_data_wr_en;
assign write_data = {bmp_data[23:16], bmp_data[15:8], bmp_data[7:0], 8'b0};

// Predecode the five supported periods. Keep a runtime multiply/subtract
// out of the 100 MHz counter/commit decision path.
reg [31:0] auto_threshold;
always @(posedge clk or posedge rst) begin
 if(rst) auto_threshold<=AUTO_PLAY_CYCLES-1;
 else if(ENABLE_UI) case(ui_period)
  2:auto_threshold<=CLK_FREQ_HZ*2-1;
  5:auto_threshold<=CLK_FREQ_HZ*5-1;
  10:auto_threshold<=CLK_FREQ_HZ*10-1;
  30:auto_threshold<=CLK_FREQ_HZ*30-1;
  default:auto_threshold<=CLK_FREQ_HZ*3-1;
 endcase
end
assign auto_tick = (auto_cnt >= auto_threshold);
assign controls_ready = sd_init_done && memory_ready && scan_complete_latched && (scan_settle==0) && !recovery_active && !all_bad && display_valid &&
                        first_image_committed && preload_done &&
                        ((image_complete & (image_complete-4'd1)) != 0);
assign pipeline_rst = rst || io_reset;
assign frame_pixel_count = {16'd0, bmp_width} * {16'd0, bmp_height};
// ready 只代表 BMP 状态机回到空闲；坏文件也可能 ready，不能当作成功。
assign load_abort = load_busy && !commit_wait && !load_start_pulse &&
                    (bmp_load_error || load_memory_error ||
                    ((load_stall_cnt >= LOAD_STALL_CYCLES - 1) ||
                     ((source_done_seen || bmp_load_done) &&
                      (!write_req_seen || (load_pixel_count != frame_pixel_count)))));

// 短按必须等消抖后的松开沿确认；长按已触发时，松开不再算短按。
assign key_auto_short_release = auto_release && !auto_long_release;
assign key_next_short_release = key_next_armed && !long_press_marked &&
                                !key_next_stable_d && key_next_stable;
assign key_next_long = key_next_armed && !key_next_stable && !long_press_marked &&
                       (long_press_cnt >= LONG_PRESS_CYCLES - 1);
assign next_request = controls_ready && full_mode && !ui_select && key_next_short_release;
assign prev_request = controls_ready && full_mode && !ui_select && key_next_long;

assign next_from_current = next_candidate;
// Selection can traverse four bad entries. Compute it before a user request,
// so the scan-count -> selection -> 32-bit sector mux is not one long path.
always @(posedge clk or posedge rst) begin
    if (rst) begin
        next_candidate <= 0;
        prev_candidate <= 0;
        retry_candidate <= 0;
    end else begin
        next_candidate <= next_usable(img_idx, img_found_count, bad_mask | ~image_complete);
        prev_candidate <= prev_index_limited(img_idx, img_found_count);
        retry_candidate <= next_usable(2'd3, img_found_count, bad_mask | image_complete);
    end
end
assign write_finish_pulse = wrfin_tgl_sync[2] ^ wrfin_tgl_sync[1];

// write_req_ack 来自 SDRAM 时钟域，先同步后交给 BMP 状态机。
always @(posedge clk or posedge pipeline_rst) begin
    if (pipeline_rst) begin
        write_ack_sync <= 3'b000;
        write_ack_d    <= 1'b0;
    end else begin
        write_ack_sync <= {write_ack_sync[1:0], write_req_ack};
        write_ack_d    <= write_ack_sync[2];
    end
end

// 只复位读卡与 BMP 管线，保留当前显示帧和已经扫描的图片地址。
// 下次 write_req 会让现有 SDRAM 写控制器重新清 FIFO、开始新帧。
always @(posedge clk or posedge rst) begin
    if (rst) begin
        recovery_active <= 1'b0;
        io_reset        <= 1'b0;
        io_reset_cnt    <= 32'd0;
    end else if (recovery_request && !recovery_active) begin
        recovery_active <= 1'b1;
        io_reset        <= 1'b1;
        io_reset_cnt    <= 32'd0;
    end else if (recovery_active) begin
        if (io_reset) begin
            if (io_reset_cnt >= IO_RESET_CYCLES - 1) begin
                io_reset     <= 1'b0;
                io_reset_cnt <= 32'd0;
            end else begin
                io_reset_cnt <= io_reset_cnt + 32'd1;
            end
        end else if (sd_init_done) begin
            recovery_active <= 1'b0;
        end else if (init_timeout) begin
            io_reset <= 1'b1;
            io_reset_cnt <= 0;
        end
    end
end

key_press_debounce #(
    .CLK_FREQ_HZ (CLK_FREQ_HZ),
    .DEBOUNCE_MS (20)
) u_key_next (
    .clk        (clk),
    .rst        (rst),
    .button_in  (key_next),
    .press_pulse(key_next_press),
    .button_stable_out(key_next_stable)
);

key_press_debounce #(
    .CLK_FREQ_HZ (CLK_FREQ_HZ),
    .DEBOUNCE_MS (20)
) u_key_auto (
    .clk        (clk),
    .rst        (rst),
    .button_in  (key_auto),
    .press_pulse(key_auto_press),
    .button_stable_out(key_auto_stable)
);

function [1:0] next_index_limited;
    input [1:0] cur;
    input [2:0] count;
    begin
        case (count)
            3'd0: next_index_limited = 2'd0;
            3'd1: next_index_limited = 2'd0;
            3'd2: next_index_limited = (cur == 2'd1) ? 2'd0 : (cur + 2'd1);
            3'd3: next_index_limited = (cur == 2'd2) ? 2'd0 : (cur + 2'd1);
            default: next_index_limited = (cur == 2'd3) ? 2'd0 : (cur + 2'd1);
        endcase
    end
endfunction

// Search at most four entries; never repeatedly retry a known bad image.
function [1:0] next_usable;
    input [1:0] cur;
    input [2:0] count;
    input [3:0] mask;
    integer k;
    reg [1:0] candidate;
    reg found;
    begin
        candidate=cur; found=0; next_usable=cur;
        for(k=0;k<4;k=k+1) begin
            candidate=next_index_limited(candidate,count);
            if(!found && !mask[candidate]) begin
                next_usable=candidate; found=1;
            end
        end
    end
endfunction

function [31:0] sector_lut;
    input [1:0] idx;
    begin
        case (idx)
            2'd0: sector_lut = img_sector0;
            2'd1: sector_lut = img_sector1;
            2'd2: sector_lut = img_sector2;
            2'd3: sector_lut = img_sector3;
            default: sector_lut = img_sector0;
        endcase
    end
endfunction

function [1:0] next_buf_lut;
    input [1:0] cur_disp_buf;
    input       valid_now;
    begin
        if (!valid_now)
            next_buf_lut = 2'd0;                 // 首图固定写 buffer0
        else if (cur_disp_buf == 2'd0)
            next_buf_lut = 2'd1;
        else
            next_buf_lut = 2'd0;
    end
endfunction

function [1:0] prev_index_raw;
    input [1:0] cur;
    input [2:0] count; 
    begin
        case (count)
            3'd0: prev_index_raw = 2'd0;
            3'd1: prev_index_raw = 2'd0;
            3'd2: prev_index_raw = (cur == 2'd0) ? 2'd1 : (cur - 2'd1);
            3'd3: prev_index_raw = (cur == 2'd0) ? 2'd2 : (cur - 2'd1);
            default: prev_index_raw = (cur == 2'd0) ? 2'd3 : (cur - 2'd1);
        endcase
    end
endfunction

always @(posedge clk or posedge rst) begin
    if(rst) begin
        pipeline_stall<=0; init_wait<=0; commit_ack_sync<=0;
    end else begin
        commit_ack_sync <= {commit_ack_sync[1:0],frame_commit_ack};
        if(io_reset || sd_init_done) init_wait<=0;
        else if(!init_timeout) init_wait<=init_wait+1'b1;
        if(io_reset || !sd_init_done || !scan_kicked || scan_complete_latched ||
           sd_sec_read_data_valid || sd_sec_read_end) pipeline_stall<=0;
        else if(!scan_timeout) pipeline_stall<=pipeline_stall+1'b1;
    end
end

function [1:0] prev_index_limited;
    input [1:0] cur; input [2:0] count;
    integer k; reg [1:0] candidate; reg found;
    begin
        candidate=cur; found=0; prev_index_limited=cur;
        for(k=0;k<4;k=k+1) begin
            candidate=prev_index_raw(candidate,count);
            if(!found && !bad_mask[candidate] && image_complete[candidate]) begin
                prev_index_limited=candidate; found=1;
            end
        end
    end
endfunction

// KEY1：短按松开下一张；长按上一张仅触发一次，松开不再触发下一张。
always @(posedge clk or posedge rst) begin
    if (rst) begin
        long_press_cnt    <= 32'd0;
        long_press_marked <= 1'b0;
        key_next_armed    <= 1'b0;
        key_next_stable_d <= 1'b1;
    end else begin
        key_next_stable_d <= key_next_stable;
        if (!input_ready || key_next_stable) begin
            long_press_cnt    <= 32'd0;
            long_press_marked <= 1'b0;
            key_next_armed    <= 1'b0;
        end else if (key_next_press) begin
            long_press_cnt    <= 32'd1;
            long_press_marked <= 1'b0;
            key_next_armed    <= 1'b1;
        end else if (key_next_armed && !long_press_marked) begin
            if (key_next_long)
                long_press_marked <= 1'b1;
            else
                long_press_cnt <= long_press_cnt + 32'd1;
        end
    end
end

// KEY2：消抖后松开时切换轮播，按住不触发上一张。
always @(posedge clk or posedge rst) begin
    if (rst) begin
        key_auto_armed <= 1'b0;
        key_auto_stable_d <= 1'b1;auto_long_count<=0;
    end else begin
        key_auto_stable_d <= key_auto_stable;
        if (!input_ready || key_auto_stable) begin key_auto_armed<=0;auto_long_count<=0;end
        else if(key_auto_press) begin key_auto_armed<=1;auto_long_count<=1;end
        else if(key_auto_armed && auto_long_count<LONG_PRESS_CYCLES) auto_long_count<=auto_long_count+1'b1;
    end
end

// Four fixed banks: preload each usable file once, then switch only the mailbox.
// image_complete is set only after both FAT/BMP success and SDRAM drain.
always @(posedge clk or posedge rst) begin
    if (rst) begin
        wrfin_tgl_sync<=0; frame_commit_toggle<=0; commit_wait<=0;commit_is_auto<=0;
        speech_toggle_seen<=0;speech_pending<=0;speech_pending_index<=0;
        done_seen<=0;home_pending<=0;image_dimensions<=0;
        image_complete<=0; preload_done<=0;commit_view<=0;
        error_code<=0; bad_mask<=0; retry_pending<=0;
        diagnostic_stage<=0; diagnostic_memory_ready<=0; diagnostic_r1<=8'hff;
        scan_settle<=0; scan_start_pulse<=0; load_start_pulse<=0;
        load_sector<=0; scan_kicked<=0; first_image_committed<=0;
        auto_play_en<=0; auto_cnt<=0; img_found_count<=0;
        img_idx<=0; load_idx<=0; pending_buf_idx<=0; write_buf_idx<=0; disp_buf_idx<=0;
        img_sector0<=0; img_sector1<=0; img_sector2<=0; img_sector3<=0;
        next_req_pending<=0; prev_req_pending<=0; load_busy<=0;
        source_done_seen<=0; write_done_seen<=0; write_req_seen<=0;
        load_pixel_count<=0; load_stall_cnt<=0; scan_complete_latched<=0;
        display_valid<=0; state_code<=0;
    end else begin
        wrfin_tgl_sync<={wrfin_tgl_sync[1:0],write_finish_toggle};
        scan_start_pulse<=0; load_start_pulse<=0;
        if(scan_settle!=0) scan_settle<=scan_settle-1'b1;
        if(recovery_active || recovery_request) begin
            if(recovery_request && !recovery_active) begin
                error_code<=bmp_load_error ? bmp_error : load_memory_error ? 4'hc : 4'd6;
                diagnostic_stage<=sd_init_stage;
                diagnostic_memory_ready<=memory_ready; diagnostic_r1<=sd_response_r1;
                if(load_abort) bad_mask[load_idx]<=1;
                else if(scan_timeout) begin
                    scan_kicked<=0; scan_complete_latched<=0; img_found_count<=0;
                end
            end
            load_busy<=0; source_done_seen<=0; write_done_seen<=0;
            write_req_seen<=0; load_pixel_count<=0; load_stall_cnt<=0;
            scan_settle<=3; auto_cnt<=0;
        end else if(sd_init_done) begin
            if(scan_done) begin
                scan_complete_latched<=1; scan_settle<=3; bad_mask<=~resource_mask;
                if(scan_error!=0) error_code<=(scan_error==8'h22) ? 4'd8 : 4'd9;
                else if(img_found_count==0 && !scan_found_valid) error_code<=8;
            end
            if(scan_found_valid) begin
                case(img_found_count)
                  0:img_sector0<=scan_found_sector; 1:img_sector1<=scan_found_sector;
                  2:img_sector2<=scan_found_sector; 3:img_sector3<=scan_found_sector;
                endcase
                if(img_found_count<4) img_found_count<=img_found_count+1'b1;
            end
            if(!load_busy || load_start_pulse) begin
                write_req_seen<=0; load_pixel_count<=0; load_stall_cnt<=0;
            end else begin
                if(write_req) write_req_seen<=1;
                if(bmp_data_wr_en) load_pixel_count<=load_pixel_count+1'b1;
                if(sd_sec_read_data_valid || sd_sec_read_end || bmp_data_wr_en ||
                   write_finish_pulse || (write_ack_sync[2] && !write_ack_d)) load_stall_cnt<=0;
                else load_stall_cnt<=load_stall_cnt+1'b1;
                if(bmp_load_done) source_done_seen<=1;
                if(write_finish_pulse) write_done_seen<=1;
            end
            if(load_busy && (source_done_seen || bmp_load_done) &&
               (write_done_seen || write_finish_pulse)) begin
                image_complete[load_idx]<=1;
                image_dimensions[load_idx*24 +: 24]<={source_width,source_height};
                load_busy<=0; source_done_seen<=0; write_done_seen<=0; scan_settle<=3;
            end
            if(commit_wait && commit_ack_sync[2]==frame_commit_toggle) begin
                commit_wait<=0; first_image_committed<=1; auto_cnt<=0;
            end
            if(speech_event) begin
                speech_toggle_seen<=speech_toggle_sync[2];
                speech_pending<=1; speech_pending_index<=speech_index_sync;
            end
            if(done_event) begin done_seen<=done_sync[2];home_pending<=1;speech_pending<=0;auto_play_en<=0;end
            if(all_bad) error_code<=7;
            if(!scan_kicked && bmp_ready && memory_ready) begin
                scan_start_pulse<=1; scan_kicked<=1; img_found_count<=0;
            end else if(scan_complete_latched && scan_settle==0 && img_found_count!=0 && scan_error==0) begin
                if(!preload_done && !load_busy && bmp_ready) begin
                    if((bad_mask | image_complete)==4'hf) begin
                        preload_done<=1; scan_settle<=3;
                    end else begin
                        load_idx<=retry_candidate; load_sector<=sector_lut(retry_candidate);
                        write_buf_idx<=retry_candidate; pending_buf_idx<=retry_candidate;
                        load_start_pulse<=1; load_busy<=1;
                        source_done_seen<=0; write_done_seen<=0;
                    end
                end
                if(image_complete!=0 && !commit_wait && (EARLY_DISPLAY || (preload_done && (!ENABLE_PREVIEW_BUILD || preview_ready)))) begin
                    if(!display_valid) begin
                        // Lowest completed filename slot; missing files keep their IDs.
                        if(image_complete[0]) begin disp_buf_idx<=0;img_idx<=0;state_code<=1;end
                        else if(image_complete[1]) begin disp_buf_idx<=1;img_idx<=1;state_code<=2;end
                        else if(image_complete[2]) begin disp_buf_idx<=2;img_idx<=2;state_code<=3;end
                        else begin disp_buf_idx<=3;img_idx<=3;state_code<=4;end
                        display_valid<=1; frame_commit_toggle<=~frame_commit_toggle;commit_is_auto<=0;
                        commit_wait<=1;
                    end else if(home_pending && preload_done && !ui_select) begin
                        home_pending<=0;speech_pending<=0;auto_play_en<=0;
                        next_req_pending<=0;prev_req_pending<=0;auto_cnt<=0;
                        if(img_idx!=0 || commit_view) begin
                         if(image_complete[0]) begin disp_buf_idx<=0;img_idx<=0;state_code<=1;end
                         commit_view<=0;commit_is_auto<=0;frame_commit_toggle<=~frame_commit_toggle;commit_wait<=1;
                        end
                    end else if(speech_pending && controls_ready && full_mode && !done_event) begin
                      speech_pending<=0;auto_play_en<=0;
                      if(image_complete[speech_pending_index] && (img_idx!=speech_pending_index || commit_view)) begin
                        disp_buf_idx<=speech_pending_index;img_idx<=speech_pending_index;
                        state_code<={2'd0,speech_pending_index}+4'd1;
                        commit_view<=0;commit_is_auto<=0;frame_commit_toggle<=~frame_commit_toggle;
                        commit_wait<=1;speech_pending<=0;next_req_pending<=0;prev_req_pending<=0;auto_cnt<=0;
                    end
                    end else if(ENABLE_UI && ui_select && preload_done) begin
                        disp_buf_idx<=ui_index;img_idx<=ui_index;state_code<={2'd0,ui_index}+4'd1;
                        commit_view<=ui_view;commit_is_auto<=0;frame_commit_toggle<=~frame_commit_toggle;
                        commit_wait<=1;next_req_pending<=0;prev_req_pending<=0;auto_cnt<=0;
                    end else if(controls_ready && full_mode && (prev_req_pending || prev_request)) begin
                        disp_buf_idx<=prev_candidate; img_idx<=prev_candidate;
                        state_code<={2'b0,prev_candidate}+4'd1;
                        frame_commit_toggle<=~frame_commit_toggle; commit_wait<=1;
                        prev_req_pending<=0; auto_cnt<=0;commit_is_auto<=0;
                    end else if(controls_ready && full_mode && (next_req_pending || next_request || (auto_play_en && auto_tick))) begin
                        disp_buf_idx<=next_candidate; img_idx<=next_candidate;
                        state_code<={2'b0,next_candidate}+4'd1;
                        frame_commit_toggle<=~frame_commit_toggle; commit_wait<=1;
                        next_req_pending<=0; auto_cnt<=0;
                        commit_is_auto<=!(next_req_pending || next_request);
                    end
                end
                // One pending event per direction while a frame-boundary ACK is in flight.
                if(commit_wait && next_request) next_req_pending<=1;
                if(commit_wait && prev_request) prev_req_pending<=1;
                if(done_event || home_pending || speech_pending || (ENABLE_UI && (ui_replay_seen!=replay_toggle || ui_mode!=0 || auto_long_release))) auto_play_en<=0;
                else if(controls_ready && full_mode && key_auto_short_release) auto_play_en<=~auto_play_en;
                if(controls_ready && full_mode && auto_play_en && !commit_wait && key_auto_stable &&
                   !key_auto_short_release && !next_request && !prev_request &&
                   !next_req_pending && !prev_req_pending) begin
                    if(auto_tick) auto_cnt<=0; else auto_cnt<=auto_cnt+1'b1;
                end else auto_cnt<=0;
            end
        end
    end
end

fat32_bmp_reader #(.CLK_FREQ_HZ(CLK_FREQ_HZ),.ENABLE_SCALING(ENABLE_SCALING),.ENABLE_BACKPRESSURE(EARLY_DISPLAY)) bmp_read_m0(
    .pixel_ready(loader_pixel_ready),
    .clk                    (clk),
    .rst                    (rst),
    .io_reset               (io_reset),
    .resource_mask          (resource_mask),
    .scan_error             (scan_error),
    .ready                  (bmp_ready),
    .load_done (bmp_load_done), .load_error(bmp_load_error), .bmp_error(bmp_error),

    .scan_start             (scan_start_pulse),
    .scan_done              (scan_done),
    .scan_found_valid       (scan_found_valid),
    .scan_found_sector      (scan_found_sector),
    .scan_found_total       (scan_found_total),

    .load_start             (load_start_pulse),
    .load_sector            (load_sector),

    .sd_init_done           (sd_init_done),
    .source_width(source_width),.source_height(source_height),
    .bmp_width              (bmp_width),
    .bmp_height             (bmp_height),
    .write_req              (write_req),
    .write_req_ack          (write_ack_sync[2]),
    .sd_sec_read            (sd_sec_read),
    .sd_sec_read_addr       (sd_sec_read_addr),
    .sd_sec_read_data       (sd_sec_read_data),
    .sd_sec_read_data_valid (sd_sec_read_data_valid),
    .sd_sec_read_end        (sd_sec_read_end),
    .bmp_data_wr_en         (bmp_data_wr_en),
    .bmp_data               (bmp_data)
);

sd_card_top sd_card_top_m0(
    .init_stage(sd_init_stage),
    .response_r1(sd_response_r1),
    .clk                    (clk),
    .rst                    (pipeline_rst),
    .SD_nCS                 (SD_nCS),
    .SD_DCLK                (SD_DCLK),
    .SD_MOSI                (SD_MOSI),
    .SD_MISO                (SD_MISO),
    .sd_init_done           (sd_init_done),
    .sd_sec_read            (audio_owner ? audio_sd_read : sd_sec_read),
    .sd_sec_read_addr       (audio_owner ? audio_sd_addr : sd_sec_read_addr),
    .sd_sec_read_data       (sd_sec_read_data),
    .sd_sec_read_data_valid (sd_sec_read_data_valid),
    .sd_sec_read_end        (sd_sec_read_end),
    .sd_sec_write           (1'b0),
    .sd_sec_write_addr      (32'd0),
    .sd_sec_write_data      (),
    .sd_sec_write_data_req  (),
    .sd_sec_write_end       ()
);

endmodule

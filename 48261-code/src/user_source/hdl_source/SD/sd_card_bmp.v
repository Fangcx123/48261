
module sd_card_bmp #(
    parameter integer CLK_FREQ_HZ       = 100_000_000,
    parameter integer LONG_PRESS_MS      = 1000,
    parameter integer AUTO_PLAY_MS       = 3000
)(
    input                       clk,
    input                       rst,
    input                       memory_ready,
    input                       frame_commit_ack,
    output reg                  frame_commit_toggle,
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
    input                       SD_MISO
);

wire key_next_press;
wire key_auto_press;
wire key_auto_short_release;
wire key_next_short_release;
wire key_next_long;
wire controls_ready;
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
wire             bmp_data_wr_en;
wire [23:0]      bmp_data;
wire             sd_init_done;
wire [3:0]       sd_init_stage;
wire [7:0]       sd_response_r1;
wire             bmp_ready;
wire bmp_load_done, bmp_load_error;
wire [3:0] bmp_error;
reg commit_wait;
reg [2:0] commit_ack_sync;
reg [3:0] bad_mask;
reg retry_pending;
reg [31:0] pipeline_stall;
reg [31:0] init_wait;
wire scan_timeout = scan_kicked && !scan_complete_latched && pipeline_stall >= LOAD_STALL_CYCLES-1;
wire init_timeout = !sd_init_done && init_wait >= CLK_FREQ_HZ*10-1;
wire all_bad = (img_found_count != 0) && ((bad_mask | (4'b1111 << img_found_count)) == 4'b1111);
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
reg [31:0]       auto_cnt;
reg [2:0]        img_found_count;
reg [1:0]        img_idx;              // 当前真正显示中的图片编号
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

assign auto_tick = (auto_cnt == (AUTO_PLAY_CYCLES - 1));
assign controls_ready = sd_init_done && memory_ready && scan_complete_latched && (scan_settle==0) && !recovery_active && !all_bad && display_valid &&
                        first_image_committed && (img_found_count > 3'd1);
assign pipeline_rst = rst || io_reset;
assign frame_pixel_count = {16'd0, bmp_width} * {16'd0, bmp_height};
// ready 只代表 BMP 状态机回到空闲；坏文件也可能 ready，不能当作成功。
assign load_abort = load_busy && !commit_wait && !load_start_pulse &&
                    (bmp_load_error ||
                    ((load_stall_cnt >= LOAD_STALL_CYCLES - 1) ||
                     ((source_done_seen || bmp_load_done) &&
                      (!write_req_seen || (load_pixel_count != frame_pixel_count)))));

// 短按必须等消抖后的松开沿确认；长按已触发时，松开不再算短按。
assign key_auto_short_release = key_auto_armed &&
                                !key_auto_stable_d && key_auto_stable;
assign key_next_short_release = key_next_armed && !long_press_marked &&
                                !key_next_stable_d && key_next_stable;
assign key_next_long = key_next_armed && !key_next_stable && !long_press_marked &&
                       (long_press_cnt >= LONG_PRESS_CYCLES - 1);
assign next_request = controls_ready && key_next_short_release;
assign prev_request = controls_ready && key_next_long;

assign next_from_current = next_candidate;
// Selection can traverse four bad entries. Compute it before a user request,
// so the scan-count -> selection -> 32-bit sector mux is not one long path.
always @(posedge clk or posedge rst) begin
    if (rst) begin
        next_candidate <= 0;
        prev_candidate <= 0;
        retry_candidate <= 0;
    end else begin
        next_candidate <= next_usable(img_idx, img_found_count, bad_mask);
        prev_candidate <= prev_index_limited(img_idx, img_found_count);
        retry_candidate <= next_usable(2'd3, img_found_count, bad_mask);
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
            if(!found && !bad_mask[candidate]) begin
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
        if (!controls_ready || key_next_stable) begin
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
        key_auto_stable_d <= 1'b1;
    end else begin
        key_auto_stable_d <= key_auto_stable;
        if (!controls_ready || key_auto_stable)
            key_auto_armed <= 1'b0;
        else if (key_auto_press)
            key_auto_armed <= 1'b1;
    end
end

always @(posedge clk or posedge rst) begin
    if (rst) begin
        wrfin_tgl_sync        <= 3'b000;
        frame_commit_toggle <= 0; commit_wait <= 0;
        error_code <= 0; bad_mask <= 0; retry_pending <= 0;
        diagnostic_stage <= 0; diagnostic_memory_ready <= 0;
        diagnostic_r1 <= 8'hff;
        scan_settle <= 0;
        scan_start_pulse      <= 1'b0;
        load_start_pulse      <= 1'b0;
        load_sector           <= 32'd0;
        scan_kicked           <= 1'b0;
        first_image_committed <= 1'b0;
        auto_play_en          <= 1'b0;
        auto_cnt              <= 32'd0;
        img_found_count       <= 3'd0;
        img_idx               <= 2'd0;
        load_idx              <= 2'd0;
        pending_buf_idx       <= 2'd0;
        write_buf_idx         <= 2'd0;
        disp_buf_idx          <= 2'd0;
        img_sector0           <= 32'd0;
        img_sector1           <= 32'd0;
        img_sector2           <= 32'd0;
        img_sector3           <= 32'd0;
        next_req_pending      <= 1'b0;
        prev_req_pending      <= 1'b0;
        load_busy             <= 1'b0;
        source_done_seen      <= 1'b0;
        write_done_seen       <= 1'b0;
        write_req_seen        <= 1'b0;
        load_pixel_count      <= 32'd0;
        load_stall_cnt        <= 32'd0;
        scan_complete_latched <= 1'b0;
        display_valid         <= 1'b0;
        state_code            <= 4'd0;
    end else begin
        wrfin_tgl_sync   <= {wrfin_tgl_sync[1:0], write_finish_toggle};
        scan_start_pulse <= 1'b0;
        load_start_pulse <= 1'b0;
        if(scan_settle!=0) scan_settle<=scan_settle-1'b1;

        if (recovery_active || recovery_request) begin
            if(recovery_request && !recovery_active) begin
                error_code <= bmp_load_error ? bmp_error : 4'd6;
                diagnostic_stage <= sd_init_stage;
                diagnostic_memory_ready <= memory_ready;
                diagnostic_r1 <= sd_response_r1;
                if(load_abort) begin
                    bad_mask[load_idx] <= 1'b1; retry_pending <= 1'b1;
                end else if(scan_timeout) begin
                    scan_kicked <= 0; scan_complete_latched <= 0; img_found_count <= 0;
                end
            end
            // 异常图不提交，编号/显示缓冲区保持原值；已有手动请求保留。
            load_busy        <= 1'b0;
            source_done_seen <= 1'b0;
            write_done_seen  <= 1'b0;
            write_req_seen   <= 1'b0;
            load_pixel_count <= 32'd0;
            load_stall_cnt   <= 32'd0;
            auto_cnt         <= 32'd0;
        end else if (!sd_init_done) begin
            commit_wait <= 1'b0;
            frame_commit_toggle <= 1'b0;
            bad_mask <= 0;
            retry_pending <= 0;
            scan_kicked           <= 1'b0;
            first_image_committed <= 1'b0;
            auto_play_en          <= 1'b0;
            auto_cnt              <= 32'd0;
            img_found_count       <= 3'd0;
            img_idx               <= 2'd0;
            load_idx              <= 2'd0;
            pending_buf_idx       <= 2'd0;
            write_buf_idx         <= 2'd0;
            disp_buf_idx          <= 2'd0;
            img_sector0           <= 32'd0;
            img_sector1           <= 32'd0;
            img_sector2           <= 32'd0;
            img_sector3           <= 32'd0;
            next_req_pending      <= 1'b0;
            prev_req_pending      <= 1'b0;
            load_busy             <= 1'b0;
            source_done_seen      <= 1'b0;
            write_done_seen       <= 1'b0;
            write_req_seen        <= 1'b0;
            load_pixel_count      <= 32'd0;
            load_stall_cnt        <= 32'd0;
            scan_complete_latched <= 1'b0;
            display_valid         <= 1'b0;
            state_code            <= 4'd0;
        end else begin
            if (scan_done) begin
                scan_complete_latched <= 1'b1;
                scan_settle <= 3;
                bad_mask <= ~resource_mask;
                if(scan_error!=0) error_code <= (scan_error==8'h22) ? 4'd8:4'd9;
                else if (img_found_count == 0 && !scan_found_valid) error_code <= 4'd8;
            end

            if (!load_busy || load_start_pulse) begin
                write_req_seen   <= 1'b0;
                load_pixel_count <= 32'd0;
                load_stall_cnt   <= 32'd0;
            end else begin
                if (write_req)
                    write_req_seen <= 1'b1;
                if (bmp_data_wr_en)
                    load_pixel_count <= load_pixel_count + 32'd1;
                if (sd_sec_read_data_valid || sd_sec_read_end || bmp_data_wr_en ||
                    write_finish_pulse || (write_ack_sync[2] && !write_ack_d))
                    load_stall_cnt <= 32'd0;
                else
                    load_stall_cnt <= load_stall_cnt + 32'd1;
            end
            // 扫描阶段缓存PIC1..PIC4 的逻辑槽号（不再是物理扇区）
            if (scan_found_valid) begin
                case (img_found_count)
                    3'd0: img_sector0 <= scan_found_sector;
                    3'd1: img_sector1 <= scan_found_sector;
                    3'd2: img_sector2 <= scan_found_sector;
                    3'd3: img_sector3 <= scan_found_sector;
                    default: ;
                endcase

                if (img_found_count < 3'd4)
                    img_found_count <= img_found_count + 3'd1;
            end

            // A bad header also returns ready: only load_done means success.
            if (load_busy && bmp_load_done)
                source_done_seen <= 1'b1;

            // SDRAM 完成脉冲先到也要记住，避免等待源数据完成期间丢失。
            if (load_busy && write_finish_pulse)
                write_done_seen <= 1'b1;

            // 只有真正收到 write_finish_toggle 脉冲，才提交新图并切换显示缓冲区
            if (load_busy && !commit_wait && (source_done_seen || bmp_load_done) &&
                (write_done_seen || write_finish_pulse)) begin
                commit_wait <= 1'b1;
                frame_commit_toggle <= ~frame_commit_toggle;
                source_done_seen      <= 1'b0;
                write_done_seen       <= 1'b0;
                disp_buf_idx          <= pending_buf_idx;
                img_idx               <= load_idx;
                state_code            <= {2'b0, load_idx} + 4'd1;
                display_valid         <= 1'b1;
                first_image_committed <= 1'b1;
            end

            if(commit_wait && commit_ack_sync[2] == frame_commit_toggle) begin
                commit_wait <= 1'b0; load_busy <= 1'b0;
            end
            if(all_bad) error_code <= 4'd7;

            // 上电后自动发起一次“扫描 FAT32 根目录 PIC1..PIC4”
            if (!scan_kicked && bmp_ready && memory_ready) begin
                scan_start_pulse      <= 1'b1;
                scan_kicked           <= 1'b1;
                first_image_committed <= 1'b0;
                auto_play_en          <= 1'b0;
                auto_cnt              <= 32'd0;
                img_found_count       <= 3'd0;
                img_idx               <= 2'd0;
                load_idx              <= 2'd0;
                pending_buf_idx       <= 2'd0;
                write_buf_idx         <= 2'd0;
                disp_buf_idx          <= 2'd0;
                next_req_pending      <= 1'b0;
                prev_req_pending      <= 1'b0;
                display_valid         <= 1'b0;
                load_busy             <= 1'b0;
                source_done_seen      <= 1'b0;
                write_done_seen       <= 1'b0;
                state_code            <= 4'd0;
            end else begin
                // 忙的时候也只记 1 次“下一张”请求，不会累积成连跳两张
                if (next_request)
                    next_req_pending <= 1'b1;

                if (prev_request)
                    prev_req_pending <= 1'b1;

                // KEY2 在消抖后的松开沿切换一次轮播，按住期间不切换。
                if (controls_ready && key_auto_short_release) begin
                    auto_play_en <= ~auto_play_en;
                end

                // 每次图片提交后等待配置时间；按住 KEY2 时暂停，避免长按测试中自动切图。
                if (controls_ready && auto_play_en && !load_busy && key_auto_stable &&
                    !key_auto_short_release && !next_request && !prev_request &&
                    !next_req_pending && !prev_req_pending) begin
                    if (auto_tick)
                        auto_cnt <= 32'd0;
                    else
                        auto_cnt <= auto_cnt + 32'd1;
                end else begin
                    auto_cnt <= 32'd0;
                end

                // 首图自动加载到 buffer0
                if (memory_ready && scan_complete_latched && (scan_settle==0) && !all_bad && (!first_image_committed || retry_pending) && bmp_ready && !load_busy && (img_found_count != 3'd0)) begin
                    load_idx <= retry_candidate;
                    load_sector <= sector_lut(retry_candidate);
                    pending_buf_idx <= next_buf_lut(disp_buf_idx,display_valid);
                    write_buf_idx <= next_buf_lut(disp_buf_idx,display_valid);
                    retry_pending <= 0;
                    load_start_pulse <= 1'b1;
                    load_busy        <= 1'b1;
                    source_done_seen <= 1'b0;
                    write_done_seen  <= 1'b0;
                    next_req_pending <= 1'b0;
                    prev_req_pending <= 1'b0;
                    auto_cnt         <= 32'd0;
                end
                // 手动下一张优先：写到“非当前显示”的另一块 buffer
                else if (controls_ready && bmp_ready && !load_busy && (next_req_pending || next_request)) begin
                    load_idx         <= next_from_current;
                    load_sector      <= sector_lut(next_from_current);
                    pending_buf_idx  <= next_buf_lut(disp_buf_idx, display_valid);
                    write_buf_idx    <= next_buf_lut(disp_buf_idx, display_valid);
                    load_start_pulse <= 1'b1;
                    load_busy        <= 1'b1;
                    source_done_seen <= 1'b0;
                    write_done_seen  <= 1'b0;
                    next_req_pending <= 1'b0;
                    auto_cnt         <= 32'd0;
                end
                // 手动上一张：与首图、手动下一张、自动轮播共用一条优先级链。
                else if (controls_ready && bmp_ready && !load_busy && (prev_req_pending || prev_request)) begin
                    load_idx         <= prev_candidate;
                    load_sector      <= sector_lut(prev_candidate);
                    pending_buf_idx  <= next_buf_lut(disp_buf_idx, display_valid);
                    write_buf_idx    <= next_buf_lut(disp_buf_idx, display_valid);
                    load_start_pulse <= 1'b1;
                    load_busy        <= 1'b1;
                    source_done_seen <= 1'b0;
                    write_done_seen  <= 1'b0;
                    prev_req_pending <= 1'b0;
                    auto_cnt         <= 32'd0;
                end
                // 自动播放下一张：同样写到“非当前显示”的另一块 buffer
                else if (controls_ready && bmp_ready && !load_busy && auto_play_en && auto_tick &&
                         key_auto_stable && !key_auto_short_release) begin
                    load_idx         <= next_from_current;
                    load_sector      <= sector_lut(next_from_current);
                    pending_buf_idx  <= next_buf_lut(disp_buf_idx, display_valid);
                    write_buf_idx    <= next_buf_lut(disp_buf_idx, display_valid);
                    load_start_pulse <= 1'b1;
                    load_busy        <= 1'b1;
                    source_done_seen <= 1'b0;
                    write_done_seen  <= 1'b0;
                    auto_cnt         <= 32'd0;
                end

            end
        end
    end
end

fat32_bmp_reader #(.CLK_FREQ_HZ(CLK_FREQ_HZ)) bmp_read_m0(
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
    .sd_sec_read            (sd_sec_read),
    .sd_sec_read_addr       (sd_sec_read_addr),
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

module key_press_debounce #(
    parameter integer CLK_FREQ_HZ = 100_000_000,
    parameter integer DEBOUNCE_MS = 20
)(
    input  wire clk,
    input  wire rst,
    input  wire button_in,    // 默认：松开=1，按下=0
    output reg  press_pulse,
    output reg  button_stable_out
);



localparam integer DEBOUNCE_CYCLES = (CLK_FREQ_HZ / 1000) * DEBOUNCE_MS;

reg button_sync0;
reg button_sync1;
reg button_stable;
reg [31:0] cnt;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        button_sync0  <= 1'b1;
        button_sync1  <= 1'b1;
        button_stable <= 1'b1;
        button_stable_out <= 1'b1;
        cnt           <= 32'd0;
        press_pulse   <= 1'b0;
    end else begin
        button_sync0 <= button_in;
        button_sync1 <= button_sync0;
        press_pulse  <= 1'b0;

        if (button_sync1 == button_stable) begin
            cnt <= 32'd0;
        end else begin
            if (cnt >= DEBOUNCE_CYCLES - 1) begin
                if (button_stable && !button_sync1)
                    press_pulse <= 1'b1;
                button_stable <= button_sync1;
                button_stable_out <= button_sync1;
                cnt           <= 32'd0;
            end else begin
                cnt <= cnt + 32'd1;
            end
        end
    end
end

endmodule

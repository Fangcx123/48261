// Lesson 9/10 video path: RGB fade/wipe -> status -> scrolling text -> timer.
// Two registered stages; RGB, VS and DE travel together to the HDMI adapter.
module video_effects_pipeline #(
    parameter integer CLOCK_HZ=25000000,
    parameter integer ENABLE_OSD=1, USE_RUNTIME_SETTINGS=0, RUNTIME_HIDE=0,
    parameter [95:0] SUBTITLE_TEXT="FPGA PLAYER ",
    parameter integer SUBTITLE_LENGTH=11
)(
    input [11:0] source_width,source_height,
    input [7:0] brightness,volume,input [31:0] period_ms,input hide_osd,
    input clk,rst_n,vsync,de,
    input status_clk,status_rst_n,
    input [23:0] rgb_in,
    input display_valid,
    input [1:0] active_index,
    input auto_enabled,
    input [3:0] error_code,
    input [7:0] alpha,
    input wipe_active,
    input [9:0] wipe_boundary,
    output frame_start,
    output reg vs_out,de_out,
    output reg [23:0] rgb_out
);
    reg vs_q;
    reg [9:0] x;
    assign frame_start=vs_q && !vsync;
    wire [4:0] status_snapshot;
    osd_status_cdc u_status_cdc(.src_clk(status_clk),.src_rst_n(status_rst_n),
        .src_status({auto_enabled,error_code}),.dst_clk(clk),.dst_rst_n(rst_n),
        .dst_status(status_snapshot));
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin vs_q<=1;x<=0;end
        else begin
            vs_q<=vsync;
            if(!de) x<=0; else x<=x+1'b1;
        end
    end
    // Full brightness bypass is bit-exact, including RGB channel LSBs.
    wire [15:0] r_product=rgb_in[23:16]*alpha;
    wire [15:0] g_product=rgb_in[15:8]*alpha;
    wire [15:0] b_product=rgb_in[7:0]*alpha;
    reg [23:0] effect_rgb;
    reg effect_vs,effect_de;
    reg [9:0] effect_x;
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin effect_rgb<=0;effect_vs<=1;effect_de<=0;effect_x<=0;end
        else begin
            effect_vs<=vsync;effect_de<=de;effect_x<=x;
            if(!display_valid || !de || (wipe_active && x>=wipe_boundary)) effect_rgb<=0;
            else if(alpha==255) effect_rgb<=rgb_in;
            else effect_rgb<={r_product[15:8],g_product[15:8],b_product[15:8]};
        end
    end
    wire [23:0] status_rgb,text_rgb,timer_rgb;
    // First active line captures status after the bank ACK; status ID is
    // the image actually being scanned, never the queued target image.
    osd_overlay_24 u_status(.clk(clk),.rst_n(rst_n),.vsync(effect_vs),.de(effect_de),
        .rgb_in(effect_rgb),.pixel_x(effect_x),.active_index(active_index),
        .auto_enabled(status_snapshot[4]),.error_code({4'd0,status_snapshot[3:0]}),
        .rgb_out(status_rgb),.de_out(),.osd_active());
    // Reference renderer reads byte 0 first; convert a normal-order string.
    wire [95:0] subtitle_bytes;
    genvar c;
    generate for(c=0;c<12;c=c+1) begin: text_bytes
        assign subtitle_bytes[c*8 +: 8]=SUBTITLE_TEXT[(11-c)*8 +: 8];
    end endgenerate
    promax_text_overlay #(.SUBTITLE_Y(448)) u_text(
        .clk(clk),.rst_n(rst_n),.vsync(effect_vs),.de(effect_de),.rgb_in(status_rgb),
        .pixel_x(effect_x),.enable(1'b1),.subtitle_enable(1'b0),
        .subtitle_text(subtitle_bytes),.subtitle_length(SUBTITLE_LENGTH[5:0]),
        .brightness(USE_RUNTIME_SETTINGS ? brightness : 8'd255),.volume(USE_RUNTIME_SETTINGS ? volume : 8'd96),.period_ms(USE_RUNTIME_SETTINGS ? period_ms : 32'd3000),
        .auto_enabled(status_snapshot[4]),.source_scale_2x(1'b0),.source_width(source_width),.source_height(source_height),.rgb_out(text_rgb),.overlay_active());
    reg [11:0] line_y;
    reg effect_de_q;
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin line_y<=0;effect_de_q<=0;end
        else begin
            effect_de_q<=effect_de;
            if(!effect_vs) line_y<=0;
            else if(effect_de_q && !effect_de) line_y<=line_y+1'b1;
        end
    end
    timestamp_osd #(.CLOCK_HZ(CLOCK_HZ)) u_timer(
        .pix_clk(clk),.pix_rst_n(rst_n),.enable(1'b1),.vsync(effect_vs),.de(effect_de),
        .pixel_x(effect_x),.pixel_y(line_y),.rgb_in(text_rgb),.rgb_out(timer_rgb),
        .ts_active(),.sys_rst_n(rst_n));
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin vs_out<=1;de_out<=0;rgb_out<=0;end
        else begin
            vs_out<=effect_vs;de_out<=effect_de;
            rgb_out<=effect_de ? (ENABLE_OSD && !(RUNTIME_HIDE && hide_osd) ? timer_rgb : effect_rgb) : 24'd0;
        end
    end
endmodule

// Bundled-data status transfer: hold the entire error/mode word until ACK.
// If status changes while busy, the latest value is sent on the next transfer.
module osd_status_cdc(
    input src_clk,src_rst_n,input [4:0] src_status,
    input dst_clk,dst_rst_n,output reg [4:0] dst_status
);
    reg [4:0] held;
    reg request,ack;
    (* async_reg="true" *) reg [2:0] request_sync,ack_sync;
    always @(posedge src_clk or negedge src_rst_n) begin
        if(!src_rst_n) begin held<=0;request<=0;ack_sync<=0;end
        else begin
            ack_sync<={ack_sync[1:0],ack};
            if(request==ack_sync[2] && held!=src_status) begin held<=src_status;request<=~request;end
        end
    end
    always @(posedge dst_clk or negedge dst_rst_n) begin
        if(!dst_rst_n) begin request_sync<=0;ack<=0;dst_status<=0;end
        else begin
            request_sync<={request_sync[1:0],request};
            if(request_sync[2]!=ack) begin dst_status<=held;ack<=request_sync[2];end
        end
    end
endmodule

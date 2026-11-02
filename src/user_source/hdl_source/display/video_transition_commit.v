// Lesson 10: single-reader fade-out / black commit / fade-in and auto wipe.
// Source holds token, bank, ID and kind until source_ack. The inner mailbox
// ACK only confirms a bank swap; the source ACK waits until the effect ends.
module video_transition_commit #(
    parameter integer FADE_FRAMES=16
)(
    input clk, rst, frame_start,
    input source_token, source_auto,
    input display_valid, bank_ack,
    output reg bank_token,
    output reg source_ack,
    output wire [7:0] alpha,
    output wire wipe_active,
    output wire [9:0] wipe_boundary,
    output wire busy
);
generate if(FADE_FRAMES==0) begin: bypass
    always @* begin bank_token=source_token;source_ack=bank_ack;end
    assign alpha=255; assign wipe_active=0; assign wipe_boundary=640;assign busy=0;
end else begin: effect
    localparam IDLE=0, FADE_OUT=1, WAIT_BANK=2, FADE_IN=3;
    localparam CW=$clog2(FADE_FRAMES+1);
    (* async_reg="true" *) reg [2:0] token_sync;
    reg [1:0] state;
    reg [CW-1:0] ramp;
    reg request_token, auto_mode, initial_frame;
    wire [15:0] scaled_alpha=ramp*(256/FADE_FRAMES);
    assign busy=(state!=IDLE);
    assign alpha=(state==IDLE || (auto_mode && state!=FADE_OUT) || initial_frame) ? 8'd255 :
                 (state==WAIT_BANK) ? 8'd0 :
                 (ramp==FADE_FRAMES) ? 8'd255 : scaled_alpha[7:0];
    assign wipe_active=auto_mode && state==FADE_IN;
    assign wipe_boundary=ramp*(640/FADE_FRAMES);
    always @(posedge clk or posedge rst) begin
        if(rst) begin
            token_sync<=0;state<=IDLE;ramp<=0;request_token<=0;
            auto_mode<=0;initial_frame<=0;bank_token<=0;source_ack<=0;
        end else begin
            token_sync<={token_sync[1:0],source_token};
            case(state)
            IDLE: if(token_sync[2]!=source_ack) begin
                request_token<=token_sync[2];auto_mode<=source_auto;
                initial_frame<=!display_valid;ramp<=FADE_FRAMES;
                if(!display_valid || source_auto) begin
                    bank_token<=token_sync[2];state<=WAIT_BANK;
                end else state<=FADE_OUT;
            end
            FADE_OUT: if(frame_start) begin
                if(ramp==1) begin
                    ramp<=0;bank_token<=request_token;state<=WAIT_BANK;
                end else ramp<=ramp-1'b1;
            end
            WAIT_BANK: if(bank_ack==request_token) begin
                if(initial_frame) begin state<=IDLE;source_ack<=request_token;initial_frame<=0;end
                else begin state<=FADE_IN;ramp<=0;end
            end
            FADE_IN: if(frame_start) begin
                if(ramp==FADE_FRAMES-1) begin
                    ramp<=FADE_FRAMES;state<=IDLE;source_ack<=request_token;
                end else ramp<=ramp+1'b1;
            end
            default: state<=IDLE;
            endcase
        end
    end
end endgenerate
endmodule

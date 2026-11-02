// Bundled-data mailbox. Source holds bank/id/valid until returned toggle ACK.
// A bank changes only at a video read request; ACK follows SDRAM read ACK.
module frame_commit_cdc #(parameter ENABLE_VIEW=0,ENABLE_DIMENSIONS=0)(
    input commit_view,output reg display_thumbnail,output reg read_thumbnail,
 input clk, input rst,
    input commit_toggle, input [1:0] commit_bank,
    input [1:0] commit_id, input commit_valid,
    input frame_read_req, input frame_read_ack,
    output reg commit_ack,
    output reg [1:0] read_bank, output reg [1:0] media_id,
    output reg display_valid,
    input [23:0] commit_dimensions,output reg [23:0] display_dimensions
);
    (* async_reg="true" *) reg [2:0] token_sync;
    reg req_d, applying, applying_token;
    reg [1:0] pending_id;
    reg pending_valid;reg pending_view;reg [23:0] pending_dimensions;
    always @(posedge clk or posedge rst) begin
        if(rst) begin
            token_sync<=0; req_d<=0; applying<=0; applying_token<=0;
            commit_ack<=0; read_bank<=0; media_id<=0; display_valid<=0;
            pending_dimensions<=0;display_dimensions<=0;pending_id<=0; pending_valid<=0;pending_view<=0;display_thumbnail<=0;read_thumbnail<=0;
        end else begin
            token_sync <= {token_sync[1:0],commit_toggle};
            req_d <= frame_read_req;
            if(frame_read_req && !req_d && token_sync[2]!=commit_ack && !applying) begin
                read_bank<=commit_bank;
                read_thumbnail<=ENABLE_VIEW ? commit_view : 1'b0;
                pending_dimensions<=ENABLE_DIMENSIONS ? commit_dimensions : 24'd0;
                pending_id<=commit_id; pending_valid<=commit_valid;pending_view<=ENABLE_VIEW ? commit_view : 1'b0;
                applying<=1; applying_token<=token_sync[2];
            end
            if(applying && frame_read_ack) begin
                commit_ack<=applying_token; applying<=0;
                display_dimensions<=pending_dimensions;media_id<=pending_id; display_valid<=pending_valid;display_thumbnail<=pending_view;
            end
        end
    end
endmodule

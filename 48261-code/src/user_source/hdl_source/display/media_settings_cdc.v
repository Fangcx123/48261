// Stable bundled bus, acknowledged only when captured at the frame boundary.
module media_settings_cdc #(parameter WIDTH=41, parameter [WIDTH-1:0] RESET_VALUE={2'd0,2'd0,3'd0,4'd0,8'd255,8'd128,8'd96,6'd3})(
 input src_clk,src_rst,input [WIDTH-1:0] settings,
 input pix_clk,pix_rst,frame_start,output reg [WIDTH-1:0] snapshot
);
 localparam [WIDTH-1:0] DEFAULT=RESET_VALUE;
 reg [WIDTH-1:0] held;reg req,ack;
 (* async_reg="true" *) reg [2:0] req_sync,ack_sync;
 always @(posedge src_clk or posedge src_rst)
  if(src_rst) begin held<=DEFAULT;req<=0;ack_sync<=0;end
  else begin
   ack_sync<={ack_sync[1:0],ack};
   if(req==ack_sync[2] && held!=settings) begin held<=settings;req<=~req;end
  end
 always @(posedge pix_clk or posedge pix_rst)
  if(pix_rst) begin req_sync<=0;ack<=0;snapshot<=DEFAULT;end
  else begin
   req_sync<={req_sync[1:0],req};
   if(frame_start && req_sync[2]!=ack) begin snapshot<=held;ack<=req_sync[2];end
  end
endmodule

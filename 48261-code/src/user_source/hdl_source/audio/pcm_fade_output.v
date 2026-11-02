// Pixel-domain PCM volume and video-alpha envelope, no new audio clock/PLL.
// Preserve the existing tone amplitude; only WAV gets the 96/256 user gain.
// Alpha=255 bypasses attenuation exactly; alpha=0 is digital silence.
module pcm_fade_output #(parameter USE_RUNTIME_VOLUME=0)(
 input [7:0] user_volume,input clk,rst_n,sample_valid,input [15:0] sample_left,sample_right,
 input wav_active,display_valid,input [7:0] alpha,
 output reg out_valid,output reg [15:0] out_left,out_right
);
 reg valid1;reg [8:0] gain1;
 reg signed [24:0] volume_l,volume_r;
 wire signed [9:0] volume=wav_active ? (USE_RUNTIME_VOLUME ? (user_volume==255 ? 10'sd256 : $signed({2'b0,user_volume})) : 10'sd96) : 10'sd256;
 wire signed [15:0] vol_l=volume_l>>>8,vol_r=volume_r>>>8;
 wire signed [25:0] fade_l=vol_l*$signed({1'b0,gain1});
 wire signed [25:0] fade_r=vol_r*$signed({1'b0,gain1});
 always @(posedge clk or negedge rst_n) begin
  if(!rst_n) begin valid1<=0;out_valid<=0;gain1<=0;volume_l<=0;volume_r<=0;out_left<=0;out_right<=0;end
  else begin
   valid1<=sample_valid;out_valid<=valid1;
   if(sample_valid) begin
    volume_l<=$signed(sample_left)*volume;volume_r<=$signed(sample_right)*volume;
    gain1<=!display_valid ? 9'd0 : alpha==255 ? 9'd256 : {1'b0,alpha};
   end
   if(valid1) begin out_left<=fade_l>>>8;out_right<=fade_r>>>8;end
  end
 end
endmodule

// Pixel-domain events: only a completed change to a different full image
// produces a cue. First commit also starts the one-time HDMI settling timer.
module media_audio_events #(parameter CLOCK_HZ=25000000,STARTUP_MS=2000)(
 input clk,rst,commit_ack,display_valid,thumbnail,input [1:0] media_id,
 output reg play_enable,output reg page_success,
 input replay_toggle,output wav_play_enable
);
 localparam DELAY_CYCLES=(CLOCK_HZ/1000)*STARTUP_MS;
 reg ack_seen,first_seen,full_seen;reg [1:0] last_full;
 reg [31:0] stable_count;
 (* async_reg="true" *) reg [2:0] replay_sync;
 reg replay_seen,replay_hold;
 assign wav_play_enable=play_enable && !replay_hold && replay_seen==replay_sync[2];
 always @(posedge clk or posedge rst) begin
  if(rst) begin ack_seen<=0;first_seen<=0;full_seen<=0;last_full<=0;stable_count<=0;play_enable<=0;page_success<=0;replay_sync<=0;replay_seen<=0;replay_hold<=0;end
  else begin
   replay_sync<={replay_sync[1:0],replay_toggle};
   if(replay_seen!=replay_sync[2]) begin replay_seen<=replay_sync[2];replay_hold<=1;end
   page_success<=0;
   if(commit_ack!=ack_seen) begin
    ack_seen<=commit_ack;
    if(display_valid) begin
     first_seen<=1;
     if(!thumbnail) begin
      replay_hold<=0;
      if(full_seen && last_full!=media_id) page_success<=1;
      full_seen<=1;last_full<=media_id;
     end
    end
   end
   if(first_seen && !play_enable) begin
    if(stable_count>=DELAY_CYCLES-1 || DELAY_CYCLES==0) play_enable<=1;
    else stable_count<=stable_count+1'b1;
   end
  end
 end
endmodule

module speech_page_events #(
 parameter integer OPERATE_SAMPLE = 32'd272160,
 parameter integer CHECK_SAMPLE   = 32'd316800,
 parameter integer FINISH_SAMPLE  = 32'd355200
)(
 input clk,input rst,input wav_active,input [31:0] played_samples,
 output reg req_toggle,output reg [1:0] req_index,input preparing
);
 reg active_seen,prepare_seen;
 reg [3:0] sent;
 always @(posedge clk or posedge rst) begin
  if(rst) begin active_seen<=0;prepare_seen<=0;sent<=0;req_toggle<=0;req_index<=0;end
  else if(preparing && !prepare_seen) begin
   prepare_seen<=1;active_seen<=0;sent<=0;req_index<=0;req_toggle<=~req_toggle;
  end
  else if(!wav_active) begin active_seen<=0;sent<=0;if(!preparing) prepare_seen<=0;end
  else begin
   if(!active_seen) begin active_seen<=1;sent<=4'b0001;end
   else if(!sent[1] && played_samples>=OPERATE_SAMPLE) begin sent[1]<=1;req_index<=1;req_toggle<=~req_toggle;end
   else if(!sent[2] && played_samples>=CHECK_SAMPLE) begin sent[2]<=1;req_index<=2;req_toggle<=~req_toggle;end
   else if(!sent[3] && played_samples>=FINISH_SAMPLE) begin sent[3]<=1;req_index<=3;req_toggle<=~req_toggle;end
  end
 end
endmodule

// No background melody. A 100ms square-wave cue shares the 48kHz sample tick.
// Speech cancels an existing cue and drops new requests without deferring them.
module media_page_cue #(parameter CLOCK_HZ=25000000,SAMPLE_HZ=48000)(
 input clk,rst_n,page_success,speech_busy,
 output reg sample_tick,output signed [15:0] sample_left,sample_right,
 output cue_active
);
 reg [31:0] accumulator;
 reg [12:0] remaining;reg [5:0] phase;
 assign cue_active=remaining!=0;
 assign sample_left=remaining==0 || speech_busy ? 16'sd0 : phase<24 ? 16'sd6000 : -16'sd6000;
 assign sample_right=sample_left;
 always @(posedge clk or negedge rst_n) begin
  if(!rst_n) begin accumulator<=0;sample_tick<=0;remaining<=0;phase<=0;end
  else begin
   sample_tick<=0;
   if(accumulator>=CLOCK_HZ-SAMPLE_HZ) begin accumulator<=accumulator+SAMPLE_HZ-CLOCK_HZ;sample_tick<=1;end
   else accumulator<=accumulator+SAMPLE_HZ;
   if(speech_busy) begin remaining<=0;phase<=0;end
   else if(page_success) begin remaining<=SAMPLE_HZ/10;phase<=0;end
   else if(sample_tick && remaining!=0) begin
    remaining<=remaining-1'b1;phase<=phase==47 ? 0 : phase+1'b1;
   end
  end
 end
endmodule

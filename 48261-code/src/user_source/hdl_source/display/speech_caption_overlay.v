// Captions follow consumed WAV frames, so SD underflow never advances text.
// 16x16 Chinese glyphs at 2x scale, two synchronous ROM stages/RGB stages.
module speech_caption_overlay(
 input clk,rst,vs,de,input [23:0] rgb,input enabled,wav_active,
 input [31:0] played_samples,
 output vs_out,de_out,output [23:0] rgb_out
);
 reg [4:0] cue;reg [31:0] previous_samples;
 wire [31:0] cue_start,cue_end;wire [5:0] cue_length;
 speech_caption_timing u_timing(cue,cue_start,cue_end,cue_length);
 reg [9:0] x,y;reg dq;
 wire [10:0] caption_left=(11'd640-({5'd0,cue_length}<<5))>>1;
 wire [10:0] caption_x={1'b0,x}-caption_left;
 wire [4:0] slot=caption_x>>5;
 wire area=enabled && wav_active && played_samples>=cue_start && played_samples<cue_end &&
           {1'b0,x}>=caption_left && {1'b0,x}<caption_left+({5'd0,cue_length}<<5) && y>=440 && y<472;
 wire [15:0] glyph_bits;
 wire [3:0] glyph_row=(y-440)>>1;
 speech_caption_rom u_rom(.clk(clk),.text_addr({cue,slot}),.glyph_row(glyph_row),.row_bits(glyph_bits));
 reg [23:0] rgb1,rgb2;reg [1:0] vq,deq,aq;reg [3:0] col1,col2;
 assign vs_out=vq[1];assign de_out=deq[1];
 assign rgb_out=!deq[1] ? 24'd0 : aq[1] ? (glyph_bits[col2] ? 24'hffffff : 24'h101018) : rgb2;
 always @(posedge clk or posedge rst) begin
  if(rst) begin
   cue<=0;previous_samples<=0;x<=0;y<=0;dq<=0;rgb1<=0;rgb2<=0;vq<=3;deq<=0;aq<=0;col1<=0;col2<=0;
  end else begin
   previous_samples<=played_samples;
   if(played_samples<previous_samples || !wav_active) cue<=0;
   else if(played_samples>=cue_end && cue<21) cue<=cue+1'b1;
   dq<=de;if(!vs) begin x<=0;y<=0;end
   else begin if(!de) x<=0;else x<=x+1'b1;if(dq && !de) y<=y+1'b1;end
   rgb1<=rgb;rgb2<=rgb1;vq<={vq[0],vs};deq<={deq[0],de};aq<={aq[0],area};
   col1<=15-((caption_x>>1)&4'hf);col2<=col1;
  end
 end
endmodule

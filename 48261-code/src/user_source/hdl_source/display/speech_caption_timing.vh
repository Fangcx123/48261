// Generated caption sample boundaries, 48kHz.
 always @* begin
  cue_start=0;cue_end=0;cue_length=0;
  case(cue)
   0:begin cue_start=32'd0;cue_end=32'd120000;cue_length=6'd10;end
   1:begin cue_start=32'd142560;cue_end=32'd272160;cue_length=6'd11;end
   2:begin cue_start=32'd272160;cue_end=32'd316800;cue_length=6'd3;end
   3:begin cue_start=32'd316800;cue_end=32'd355200;cue_length=6'd3;end
   4:begin cue_start=32'd355200;cue_end=32'd393600;cue_length=6'd4;end
   5:begin cue_start=32'd393600;cue_end=32'd477120;cue_length=6'd6;end
   6:begin cue_start=32'd477120;cue_end=32'd581760;cue_length=6'd8;end
   7:begin cue_start=32'd581760;cue_end=32'd696216;cue_length=6'd8;end
   default:;
  endcase
 end

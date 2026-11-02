// Two-key adaptation of lessons 13..15. Inputs are debounced events.
module media_ui_controller(
 input clk,rst,ready,busy,next_short,next_long,mode_short,mode_long,
 input [1:0] current,input [3:0] complete,
 output reg select_req,output reg [1:0] select_index,output reg select_view,
 output reg [1:0] mode,focus,output reg [2:0] field,
 output reg [7:0] brightness,contrast,volume,output reg [5:0] period_s,
 input audio_busy,audio_available,output reg replay_toggle,
 input settings_switch,preview_ready,return_home
);
 function [7:0] level;
 input [7:0] value;input down;
 begin
  if(down) begin
   if(value==255) level=192;else if(value>=192) level=128;
   else if(value>64) level=64;else level=0;
  end else begin
   if(value==0) level=64;else if(value<128) level=128;
   else if(value<192) level=192;else level=255;
  end
 end endfunction
 function [5:0] period_level;
 input [5:0] value;input down;
 begin
  if(down) case(value) 30:period_level=10;10:period_level=5;5:period_level=3;default:period_level=2;endcase
  else case(value) 2:period_level=3;3:period_level=5;5:period_level=10;default:period_level=30;endcase
 end endfunction
 always @(posedge clk or posedge rst) begin
  if(rst) begin
   mode<=0;focus<=0;field<=0;brightness<=255;contrast<=128;volume<=96;period_s<=3;
   select_req<=0;select_index<=0;select_view<=0;replay_toggle<=0;
  end else begin
   select_req<=0;
   if(return_home) begin
    mode<=0;select_req<=0;
   end else if(ready && !busy) begin
    case(mode)
     0:if(mode_long) begin
      if(settings_switch) begin mode<=2;field<=0;end
      else if(preview_ready) begin
       mode<=1;focus<=current;select_index<=current;select_view<=1;select_req<=1;
      end
     end
     1:begin
      if(next_short) focus<=focus+1'b1;
      else if(next_long) focus<=focus-1'b1;
      if(mode_short && complete[focus]) begin
       select_index<=focus;select_view<=0;select_req<=1;mode<=0;
      end else if(mode_long) begin mode<=0;select_index<=current;select_view<=0;select_req<=1;end
     end
     2:begin
      if(next_short || next_long) case(field)
       0:brightness<=level(brightness,next_long);
       1:contrast<=level(contrast,next_long);
       2:volume<=level(volume,next_long);
       3:period_s<=period_level(period_s,next_long);
       4:if(next_short && !audio_busy && audio_available) begin
        replay_toggle<=~replay_toggle;mode<=0;
        select_index<=complete[0] ? 0 : current;select_view<=0;select_req<=1;
       end
      endcase
      if(mode_short) field<=field==4 ? 0 : field+1'b1;
      if(mode_long) begin
       mode<=0;select_index<=current;select_view<=0;select_req<=1;
      end
     end
     default:mode<=0;
    endcase
   end
  end
 end
endmodule

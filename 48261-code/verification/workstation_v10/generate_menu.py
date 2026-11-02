from pathlib import Path
from PIL import Image,ImageFont,ImageDraw
ROOT=Path(__file__).resolve().parents[2]
lines=['系统参数设置','亮度','对比度','音量','轮播间隔','语音重播','可播放','播放中','不可用','短按KEY4：下一项  长按：退出','短按KEY2：增加    长按：减少','短按KEY2：重播指导语音','静音','秒','%','低','标准','高','增强','最高']
chars=[' ']+list('0123456789')+sorted(set(''.join(lines))-set(' 0123456789'))
ids={c:i for i,c in enumerate(chars)}
font=ImageFont.truetype('C:/Windows/Fonts/simhei.ttf',16)
init=['integer i;','reg [6:0] text_mem[0:671];\n(* rom_style="bram" *) reg [15:0] glyph_mem[0:%d];'%1023,'initial begin','for(i=0;i<672;i=i+1) text_mem[i]=0;','for(i=0;i<1024;i=i+1) glyph_mem[i]=0;']
for n,t in enumerate(lines):
 for j,c in enumerate(t):init.append(f"text_mem[{n*32+j}]=7'd{ids[c]};")
for n,c in enumerate(chars[:11]):init.append(f"text_mem[{640+n}]=7'd{n};")
for n,c in enumerate(chars):
 im=Image.new('1',(16,16));ImageDraw.Draw(im).text((0,-1),c,font=font,fill=1)
 for y in range(16):
  bits=sum(1<<(15-x) for x in range(16) if im.getpixel((x,y)))
  init.append(f"glyph_mem[{n*16+y}]=16'h{bits:04x};")
init.append('end')
code='''// Centered 512x400 settings panel. Two registered font stages.
module media_menu_overlay(
 input clk,rst,vs,de,input [23:0] rgb,input [1:0] mode,input [2:0] field,
 input audio_busy,audio_available,input [7:0] brightness,contrast,volume,input [5:0] period_s,
 output vs_out,de_out,output [23:0] rgb_out
);
reg [9:0] x,y;reg dq;
reg [1:0] vq,deq;
reg [23:0] bg1,bg2,fg1,fg2;
reg [3:0] col1,col2,row1;
reg [6:0] char_id;reg [15:0] bits;
reg [9:0] text_addr;reg [3:0] gx,gy;
// Every character (including blank and digits) uses one synchronous ROM path.
reg [23:0] bg,fg;
reg [2:0] row,slot;reg [7:0] value,bar;reg [5:0] row_y;reg [9:0] footer_left;
function [7:0] percentage(input [7:0] v);
 case(v) 0:percentage=0;64:percentage=25;96:percentage=38;128:percentage=50;192:percentage=75;default:percentage=100;endcase
endfunction
function [7:0] bar_width(input [7:0] v);
 case(v) 0:bar_width=0;64:bar_width=48;96:bar_width=72;128:bar_width=96;192:bar_width=144;default:bar_width=192;endcase
endfunction
// Decimal digits need only the menu's finite percentages and a 0..63 period.
// Avoid a general 8-bit divide/modulo network in this nearly full device.
function [9:0] percent_char(input [7:0] v,input [2:0] pos);
 begin
  percent_char=640;
  case(pos)
   0:if(v!=0 && v!=64 && v!=96 && v!=128 && v!=192)percent_char=642;
   1:case(v) 0:percent_char=640;64:percent_char=643;96:percent_char=644;
      128:percent_char=646;192:percent_char=648;default:percent_char=641;endcase
   2:case(v) 64,192:percent_char=646;96:percent_char=649;default:percent_char=641;endcase
   default:;
  endcase
 end
endfunction
function [2:0] period_tens(input [5:0] v);
 begin
  if(v>=60)period_tens=6;else if(v>=50)period_tens=5;else if(v>=40)period_tens=4;
  else if(v>=30)period_tens=3;else if(v>=20)period_tens=2;else if(v>=10)period_tens=1;else period_tens=0;
 end
endfunction
wire [2:0] tens=period_tens(period_s);
wire [5:0] ones=period_s-({tens,3'b000}+{tens,1'b0});
wire panel=mode==2 && x>=64 && x<576 && y>=40 && y<440;
'''+ '\n'.join(init)+'''
always @* begin
 bg=rgb;fg=24'he8f1fa;text_addr=640;gx=0;gy=0;
 row=0;slot=0;value=0;bar=0;row_y=0;footer_left=field==4 ? 192:168;
 if(panel) begin
  bg=24'h142637;
  if(x<66 || x>=574 || y<42 || y>=438) bg=24'h408eaa;
  if(y>=100 && y<102 && x>=88 && x<552) bg=24'h36566c;
  if(y>=64 && y<96 && x>=224 && x<416) begin
   text_addr=(x-224)/32;gx=((x-224)/2)%16;gy=(y-64)/2;
  end
  if(y>=112 && y<352) begin
   if(y<160)begin row=0;row_y=y-112;end
   else if(y<208)begin row=1;row_y=y-160;end
   else if(y<256)begin row=2;row_y=y-208;end
   else if(y<304)begin row=3;row_y=y-256;end
   else begin row=4;row_y=y-304;end
   if(x>=88 && x<552 && row_y<40) begin
    bg=row==field ? 24'h205d80 : 24'h1a3043;
    if(row==field && x<92) bg=24'h40e0c0;
   end
   if(x>=104 && x<232 && row_y>=4 && row_y<20) begin
    text_addr=(row+1)*32+(x-104)/16;gx=(x-104)%16;gy=row_y-4;
   end
   case(row)
    0:begin value=percentage(brightness);bar=bar_width(brightness);end
    1:begin value=contrast;bar=bar_width(contrast);end
    2:begin value=percentage(volume);bar=bar_width(volume);end
    3:value=period_s;
    default:value=0;
   endcase
   if(row<3 && x>=256 && x<448 && row_y>=13 && row_y<23)
    bg=x-256<bar ? 24'h40d0b0 : 24'h365063;
   if(x>=464 && x<544 && row_y>=4 && row_y<20) begin
    slot=(x-464)/16;gx=(x-464)%16;gy=row_y-4;
    if(row==0 || row==2) begin
     text_addr=percent_char(row==0 ? brightness:volume,slot);
     if(slot==3) begin text_addr=14*32;end
     if(row==2 && volume==0) begin text_addr=12*32+slot;end
    end else if(row==1) begin
     text_addr=(contrast<128 ? 15 : contrast==128 ? 16 : contrast<=192 ? 17 : 19)*32+slot;
    end else if(row==3) begin
     if(slot==0 && tens!=0) text_addr=10'd641+{7'd0,tens};
     if(slot==1) text_addr=10'd641+{4'd0,ones};
     if(slot==2) begin text_addr=13*32;end
    end else begin
     text_addr=(audio_busy ? 7 : audio_available ? 6 : 8)*32+slot;
     fg=audio_busy || !audio_available ? 24'h9cabb8 : 24'h40e0c0;
    end
   end
  end
  if(y>=360 && y<362 && x>=88 && x<552) bg=24'h36566c;
  if(y>=376 && y<392 && x>=168 && x<472) begin
   text_addr=9*32+(x-168)/16;gx=(x-168)%16;gy=y-376;fg=24'hc4d8e8;
  end
  if(y>=408 && y<424 && x>=footer_left && x<640-footer_left) begin
   text_addr=(field==4 ? 11 : 10)*32+(x-footer_left)/16;gx=(x-footer_left)%16;gy=y-408;fg=24'hc4d8e8;
  end
 end
end
always @(posedge clk or posedge rst) begin
 if(rst) begin x<=0;y<=0;dq<=0;vq<=3;deq<=0;bg1<=0;bg2<=0;fg1<=0;fg2<=0;col1<=0;col2<=0;row1<=0;char_id<=0;end
 else begin
  dq<=de;if(!vs) begin x<=0;y<=0;end
  else begin if(!de) x<=0;else x<=x+1'b1;if(dq && !de)y<=y+1'b1;end
  vq<={vq[0],vs};deq<={deq[0],de};bg1<=bg;bg2<=bg1;fg1<=fg;fg2<=fg1;
  col1<=15-gx;col2<=col1;row1<=gy;
  char_id<=text_mem[text_addr];
 end
end
// DE is held low by reset; the glyph ROM needs no reset on its data port.
always @(posedge clk) bits<=glyph_mem[{char_id[5:0],row1}];
assign vs_out=vq[1];assign de_out=deq[1];
assign rgb_out=!deq[1] ? 24'd0 : bits[col2] ? fg2 : bg2;
endmodule
'''
# Center each help line by its actual character-cell width.
left9=(640-len(lines[9])*16)//2
left10=(640-len(lines[10])*16)//2
left11=(640-len(lines[11])*16)//2
code=code.replace('footer_left=field==4 ? 192:168;',f'footer_left=field==4 ? {left11}:{left10};')
code=code.replace('x>=168 && x<472',f'x>={left9} && x<{640-left9}').replace('(x-168)',f'(x-{left9})')
(ROOT/'src/user_source/hdl_source/display/media_menu_overlay.v').write_text(code,encoding='utf-8')
print('Generated centered menu:',len(chars),'glyphs')

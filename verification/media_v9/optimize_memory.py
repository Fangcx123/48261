from pathlib import Path
r=Path(r'D:\FPGA\lab_ex5_i2s');h=r/'src/user_source/hdl_source'
p=h/'SD/bmp_nearest_scaler.v';s=p.read_text().replace('reg [7:0] fifo[0:1023];', 'reg [7:0] fifo[0:1023]; /* fehdl force_ram=1, ram_style="bram" */\n reg [7:0] fifo_q;')
s=s.replace('reg [23:0] line[0:2047];','reg [23:0] line[0:2047]; /* fehdl force_ram=1, ram_style="bram" */')
s=s.replace('EMIT=4,FIN=5;', 'EMIT=4,FIN=5,BYTE=6;').replace('wire pop=(state==LOAD && used!=0);', 'wire pop=(state==BYTE && used!=0);')
s=s.replace('always @(posedge clk) if(state==READ) line_q<=line[sx];', '''always @(posedge clk) begin
  line_q<=line[sx[10:0]];fifo_q<=fifo[rp];
  if(byte_valid) fifo[wp]<=byte_data;
 end''')
s=s.replace('line[col]<={fifo[rp],bgr[15:0]};','line[col[10:0]]<={fifo_q,bgr[15:0]};')
s=s.replace('if(byte_valid) begin fifo[wp]<=byte_data;wp<=wp+1\'b1;', "if(byte_valid) begin wp<=wp+1'b1;")
s=s.replace('LOAD:if(pop) begin', 'LOAD:if(used!=0) state<=BYTE;\n     BYTE:if(pop) begin\n      state<=LOAD;')
s=s.replace('bgr[7:0]<=fifo[rp]', 'bgr[7:0]<=fifo_q').replace('bgr[15:8]<=fifo[rp]', 'bgr[15:8]<=fifo_q')
p.write_text(s)
p=h/'display/thumbnail_cache.v';s=p.read_text().replace('80x60','80x40').replace('cache[0:19199]', 'cache[0:12799]')
s=s.replace('reg [9:0] wx,wy;', 'reg [9:0] wx,wy;reg [3:0] row_phase;reg [5:0] cache_row;')
s=s.replace("wire [14:0] wa=bank*15'd4800+(15'd59-{9'd0,wy[8:3]})*15'd80+{8'd0,wx[9:3]};", "wire [13:0] wa=bank*14'd3200+cache_row*14'd80+{7'd0,wx[9:3]};")
s=s.replace('wx<=0;wy<=0;', 'wx<=0;wy<=0;row_phase<=0;cache_row<=39;')
s=s.replace("if(wx==639) begin wx<=0;wy<=wy+1'b1;end", "if(wx==639) begin wx<=0;wy<=wy+1'b1;\n    if(row_phase==11) begin row_phase<=0;cache_row<=cache_row-1'b1;end else row_phase<=row_phase+1'b1;end")
s=s.replace('wy[2:0]==7','row_phase==11')
s=s.replace("wire [14:0] ra=tile*15'd4800+{9'd0,ly[6:1]}*15'd80+{8'd0,lx[7:1]};", "wire [6:0] cache_y=ly[6:0]/7'd3;\n wire [13:0] ra=tile*14'd3200+cache_y*14'd80+{7'd0,lx[7:1]};")
p.write_text(s)
p=h/'SD/media_player_control.v';s=p.read_text().replace('wire [1:0] ui_mode,', 'reg [1:0] img_idx;\nwire [1:0] ui_mode,').replace('reg [1:0]        img_idx;              // 当前真正显示中的图片编号','// img_idx declared before the UI instance to prevent an implicit scalar net.');p.write_text(s)
p=h/'top_tf_hdmi_audio.v';s=p.read_text().replace('wire commit_view,video_thumbnail;', 'wire effect_frame_start;\nwire commit_view,video_thumbnail;').replace('wire effect_bank_token, effect_bank_ack, effect_frame_start;', 'wire effect_bank_token, effect_bank_ack;');p.write_text(s)
p=r/'verification/media_v9/tb_preview_chain.v';s=p.read_text().replace('(ly/2)*8','(ly/3)*12');p.write_text(s)
# Dedicated syntax set: encrypted vendor cores and generated IP need TD.
p=r/'verification/media_v9/syntax.sh';p.write_text('''#!/bin/sh
set -eu
cd /mnt/d/FPGA/lab_ex5_i2s
h=src/user_source/hdl_source
iverilog -g2012 -s top -i -I "$h/include" -I "$h/SD" -o verification/media_v9/syntax.vvp "$h/top_tf_hdmi_audio.v" "$h/reset_sync.v" "$h/frame_commit_cdc.v" "$h/pcm_media_tone.v" "$h/audio_arc_calculate.v" "$h/seg_decoder.v" "$h/seg_scan.v" "$h/startup_pulse.v" "$h/video_rgb_to_axis_640x480.v" "$h"/display/*.v "$h"/audio/*.v "$h"/SD/*.v
''',newline='\n')
(v:=r/'verification/media_v9')
(v/'run_video_tests.sh').write_text('''#!/bin/sh
set -eu
cd "$(dirname "$0")/../.."
h=src/user_source/hdl_source
v=verification/media_v9
iverilog -g2012 -s tb_settings -o "$v/settings.vvp" "$v/tb_settings.v" "$h/display/media_settings_cdc.v"
vvp "$v/settings.vvp"
iverilog -g2012 -s tb_preview_chain -o "$v/preview.vvp" "$v/tb_preview_chain.v" "$h"/display/*.v
vvp "$v/preview.vvp"
''',newline='\n')

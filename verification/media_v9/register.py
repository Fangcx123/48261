from pathlib import Path
import re
r=Path(r'D:\FPGA\lab_ex5_i2s');v=r/'verification/media_v9'
new=['SD/bmp_nearest_scaler.v','SD/media_ui_controller.v','display/media_settings_cdc.v','display/brightness_contrast_adjust.v','display/thumbnail_cache.v','display/media_menu_overlay.v']
al=r/'src/td_project_media_v9/HDMI1.4b_Transmitter_v1.0.al';a=al.read_text();pos=a.index('<File Path=');end=a.index('</File>',pos)+7;template=a[pos:end];print(template)
for f in new:
 if f not in a:a=a[:end]+'\n'+re.sub(r'Path="[^"]+"','Path="../user_source/hdl_source/'+f+'"',template)+a[end:]
al.write_text(a)
tcl=(v.parent/'wav_v8/build_v8.tcl').read_text().replace('td_project_wav_v8','td_project_media_v9');start=tcl.index('add_files ');stop=tcl.index('reset_runs',start)
tcl=tcl[:start]+''.join('add_files '+str(r/'src/user_source/hdl_source'/f).replace('\\','/')+'\n' for f in new)+tcl[stop:];(v/'build_v9.tcl').write_text(tcl)
p=r/'src/user_source/hdl_source/display/thumbnail_cache.v';s=p.read_text().replace('wire inside=', 'wire in_tiles=').replace('insideq<=inside;', 'insideq<=in_tiles;');p.write_text(s)
(v/'syntax.sh').write_text('''#!/bin/sh
set -eu
cd /mnt/d/FPGA/lab_ex5_i2s
iverilog -g2012 -Wall -s top -i -o verification/media_v9/syntax.vvp $(find src/user_source/hdl_source -name '*.v')
''')

from pathlib import Path
old=Path('verification/media_v9');new=Path('verification/workstation_v10')
s=(old/'tb_ui.v').read_text().replace('idx,mode,focus,field;', 'idx,mode,focus;wire [2:0] field;reg ab=1,av=1;wire replay;')
s=s.replace('b,c,v,p);','b,c,v,p,ab,av,replay);')
needle='  event_key(1);if(mode!=0 || !req || view || idx!=cur)'
a=s.index(needle)
s=s[:a]+'''  event_key(2);if(field!=4)$fatal(1,"R menu missing");
  event_key(8);if(replay || mode!=2 || req)$fatal(1,"busy replay accepted");
  ab=0;av=0;event_key(8);if(replay || mode!=2)$fatal(1,"unavailable replay accepted");
  av=1;event_key(4);if(replay)$fatal(1,"long press replay");
  event_key(8);if(!replay || mode!=0 || !req || view || idx!=cur)$fatal(1,"R return/replay");
  event_key(1);event_key(1);
'''+s[a:]
(new/'tb_ui.v').write_text(s)
s=(old/'tb_settings.v').read_text().replace('[39:0]','[40:0]').replace("source={i[19:0],~i[19:0]}","source={1'b1,i[19:0],~i[19:0]}")
(new/'tb_settings.v').write_text(s)
s=(old/'tb_ui_scheduler.v').read_text().replace('[39:0] settings','[40:0] settings')
s=s.replace('.clk(clk),.rst(rst),', ".audio_busy(1'b0),.audio_available(1'b1),.preview_ready(1'b1),.clk(clk),.rst(rst),")
# After verifying the old auto behavior, exercise R through real debouncing.
point=' boot(4);if(image!=3)'
s=s.replace(point,''' long2;accept;long2;short2;short2;short2;short2;
 if(dut.ui_field!=4)$fatal(1,"R selection through real keys");
 short1;if(auto_on || view || dut.ui_mode!=0 || !dut.replay_toggle || image!=4)$fatal(1,"R must stop auto and return same full image");accept;
 tick(6000);if(image!=4)$fatal(1,"auto restarted after replay");
 boot(4);if(image!=3)''')
(new/'tb_ui_scheduler.v').write_text(s)
s=(old/'tb_view_commit.v').read_text().replace('wire ret,outview,on;', 'wire ret,outview,on,readview;')
s=s.replace('.display_thumbnail(outview)', '.display_thumbnail(outview),.read_thumbnail(readview)')
s=s.replace('if(rb!=bank||ret==token)', 'if(rb!=bank||readview!=view||ret==token)')
(new/'tb_view_commit.v').write_text(s)

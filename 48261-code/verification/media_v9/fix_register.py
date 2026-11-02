from pathlib import Path
r=Path(__file__).resolve().parents[1];v=r/'verification/media_v9'
p=v/'syntax.sh';p.write_text(p.read_text(),newline='\n')
p=r/'src/td_project_media_v9/HDMI1.4b_Transmitter_v1.0.al';s=p.read_text();import re
s=re.sub(r'(<File Path="[^"]+(?:bmp_nearest_scaler|media_ui_controller|media_settings_cdc|brightness_contrast_adjust|thumbnail_cache|media_menu_overlay)\.v">.*?AutoExcluded" Val=")true',r'\1false',s,flags=re.S);p.write_text(s)

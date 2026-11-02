from pathlib import Path
import shutil
root=Path(__file__).resolve().parents[2]
old=root/'src/td_project_media_v9';new=root/'src/td_project_workstation_v10'
new.mkdir(exist_ok=True)
if not (new/'al_ip').exists():shutil.copytree(old/'al_ip',new/'al_ip')
project='HDMI1.4b_Transmitter_v1.0.al'
s=(old/project).read_text(encoding='utf-8-sig').replace(old.as_posix(),new.as_posix())
added=['audio/media_audio_events.v','SD/media_preview_builder.v','display/speech_caption_overlay.v','display/speech_caption_rom.v']
entries=''
for name in added:
 entries+=f'''            <File Path="../user_source/hdl_source/{name}">
                <FileInfo>
                    <Attr Name="UsedInSyn" Val="true"/>
                    <Attr Name="UsedInP&R" Val="true"/>
                    <Attr Name="BelongTo" Val="design_1"/>
                </FileInfo>
            </File>
'''
# Let TD register source files; its project reader is stricter than XML tools.
(new/project).write_text(s,encoding='utf-8')
print(new/project)

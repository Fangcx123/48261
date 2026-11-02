"""Fail closed on build, tests, timing, source registration, artifact age and history."""
from pathlib import Path
import re,json,hashlib
from datetime import datetime
ROOT=Path(__file__).resolve().parents[2]
V=ROOT/'verification/media_v9';P=ROOT/'src/td_project_media_v9'
RUN=P/'HDMI1.4b_Transmitter_v1.0_Runs'
BASE=Path(r'D:\FPGA\backup_working_v8_before_lessons13to15_20261023')
NEW=['SD/bmp_nearest_scaler.v','SD/media_ui_controller.v','display/media_settings_cdc.v',
     'display/brightness_contrast_adjust.v','display/thumbnail_cache.v','display/media_menu_overlay.v']
AUDIO=['audio/pcm_async_fifo.v','audio/wav_pcm_decoder.v','audio/fat32_wav_player.v',
       'audio/pcm_fade_output.v','display/promax_audio_waveform.v','display/audio_visualizer.v']
def digest(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def read(p):return p.read_text(encoding='utf-8-sig',errors='replace')
def audit(attempt):
    tests={'legacy':'legacy_regression','audio':'audio_tests','output':'output_tests',
           'new':'new_tests','scaled_fat':'scaled_fat','control':'control_tests','video':'video_tests'}
    for key,log in tests.items():
        assert read(V/f'{key}_exit.txt').strip()=='0',key
        s=read(V/f'{log}.log')
        assert 'PASS' in s and not re.search(r'FATAL:|^FAIL\b|Traceback|\berror:',s,re.M),log
    assert read(V/f'td_exit_attempt{attempt}.txt').strip()=='0'
    assert read(V/'audit_routed_exit.txt').strip()=='0'
    batch=read(V/f'td_build_attempt{attempt}.log')
    assert 'Run syn_1 success.' in batch and 'Run phy_1 success.' in batch
    for name,s in [('batch',batch),('syn',read(RUN/'syn_1/run.log')),('phy',read(RUN/'phy_1/run.log'))]:
        assert not re.search(r'\bERROR\s*:|HDL-7144|unknown module|black.?box',s,re.I),(name,'build error')
        for line in s.splitlines():
            if 'CRITICAL-WARNING' in line:
                assert name=='phy' and (line.startswith('PHY-7002 ') and 'Instance U3/sdram location' in line or line.startswith('PHY-5079 ') and 'Marked 1 clock net(s)' in line),('new critical warning',line)
            if 'undeclared symbol' in line and any(x.rsplit('/',1)[-1] in line for x in NEW+['SD/media_player_control.v','SD/fat32_bmp_reader.v','top_tf_hdmi_audio.v']):
                raise AssertionError(('implicit net in modified RTL',line))
    phy=read(RUN/'phy_1/run.log')
    baseline_phy=read(BASE/'src/td_project_wav_v8/HDMI1.4b_Transmitter_v1.0_Runs/phy_1/run.log')
    for line in phy.splitlines():
        if 'AL_PHY_PLL' in line and 'U3/u2_ram/SDRAM_CLK' in line:assert line in baseline_phy,'changed local clock route identity'
    timing=read(RUN/'phy_1/HDMI1.4b_Transmitter_v1.0_pr.timing')
    assert 'Confidence          : Routed' in timing and 'Both (Slow and Fast)' in timing
    metrics={x:float(re.search(r'\b'+x+r':\s*([-\d.]+)ns',timing)[1]) for x in ['SWNS','STNS','HWNS','HTNS']}
    assert metrics['SWNS']>=0 and metrics['HWNS']>=0 and metrics['STNS']==0 and metrics['HTNS']==0,metrics
    sources={}
    for project in [P/'HDMI1.4b_Transmitter_v1.0.al',RUN/'syn_1/HDMI1.4b_Transmitter_v1.0.prj',RUN/'phy_1/HDMI1.4b_Transmitter_v1.0.prj']:
        paths=re.findall(r'<File Path="([^"]+)"',read(project))
        for name in NEW+AUDIO:assert sum(x.lower().endswith('/'+name.lower()) for x in paths)==1,(project,name)
        for f in paths:
            p=(project.parent/f).resolve();assert p.is_file(),p
            sources[str(p.relative_to(ROOT))]=digest(p)
        sources[str(project.relative_to(ROOT))]=digest(project)
    assert read(V/'audio_tests.log').count('PASS WAV ')>=22
    assert 'PASS effects video' in read(V/'legacy_regression.log')
    assert 'PASS scaled FAT latefat' in read(V/'scaled_fat.log')
    assert '917504' in read(V/'control_tests.log')
    assert 'PASS menu:' in read(V/'video_tests.log')
    assert 'PASS reset constraints' in read(V/'reset_constraints_check.log')
    assert 'PASS u_settings/req_sync' in read(V/'cdc_audit.log')
    bit=RUN/'phy_1/HDMI1.4b_Transmitter_v1.0.bit'
    # v9 contains additional configured BRAM; do not impose v8's file length.
    assert 'Generate bits file HDMI1.4b_Transmitter_v1.0.bit.' in phy
    assert 512*1024 < bit.stat().st_size < 2*1024*1024
    assert bit.stat().st_mtime>(V/f'td_build_attempt{attempt}.log').stat().st_ctime-10
    for f in (ROOT/'src/user_source').rglob('*'):
        if f.is_file() and f.suffix.lower() in ['.v','.sdc','.adc']:assert f.stat().st_mtime<=bit.stat().st_mtime,('source newer than bit',f)
    assert (V/'routed_netlist.v').stat().st_mtime>=bit.stat().st_mtime,'stale physical audit'
    for f in (BASE/'release').rglob('*'):
        if f.is_file():assert digest(f)==digest(ROOT/f.relative_to(BASE)),('historical release changed',f)
    for name in ['pin.adc','timing.sdc']:
        f=Path('src/user_source/constraints_source')/name
        assert digest(BASE/f)==digest(ROOT/f),('constraint changed',name)
    changes=[]
    for f in (ROOT/'src').rglob('*'):
        if f.is_file() and f.suffix.lower() in ['.v','.adc','.sdc'] and '_Runs' not in str(f):
            rel=f.relative_to(ROOT);old=BASE/rel
            if not old.exists() or digest(f)!=digest(old):changes.append({'path':str(rel),'old_sha256':digest(old) if old.exists() else None,'new_sha256':digest(f)})
    (V/'source_changes.json').write_text(json.dumps(changes,ensure_ascii=False,indent=2),encoding='utf-8')
    (V/'compile_list_audit.log').write_text('PASS all 12 lesson 11..15 modules registered exactly once in project and actual syn/phy lists; all source paths resolve\n',encoding='utf-8')
    result={'attempt':attempt,'metrics_ns':metrics,'bit':str(bit),'bit_bytes':bit.stat().st_size,'bit_sha256':digest(bit),
      'bit_time_local':datetime.fromtimestamp(bit.stat().st_mtime).isoformat(),'sources':sources,
      'historical_release_unchanged':True,'pins_and_timing_unchanged':True,'board_tested':False}
    (V/'build_audit.json').write_text(json.dumps(result,ensure_ascii=False,indent=2),encoding='utf-8')
    print('PASS build/source/compile-list/timing/artifact/history audit',json.dumps({k:v for k,v in result.items() if k!='sources'},ensure_ascii=False))
    return result
if __name__=='__main__':
    import sys
    audit(int(sys.argv[1]))

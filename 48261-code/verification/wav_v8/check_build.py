"""Fail closed: exit code alone is insufficient for TD. No release copying here."""
from pathlib import Path
import re,json,hashlib
from datetime import datetime
ROOT=Path(__file__).resolve().parents[2]
V=ROOT/'verification/wav_v8'
P=ROOT/'src/td_project_wav_v8'
RUN=P/'HDMI1.4b_Transmitter_v1.0_Runs'
NEW=['audio/pcm_async_fifo.v','audio/wav_pcm_decoder.v','audio/fat32_wav_player.v',
     'audio/pcm_fade_output.v','display/promax_audio_waveform.v','display/audio_visualizer.v']
def digest(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def audit(attempt):
    for x in [f'td_exit_attempt{attempt}.txt','audio_exit.txt','output_exit.txt','legacy_exit.txt','fat_final_exit.txt','audit_routed_exit.txt']:
        assert (V/x).read_text(encoding='utf-8-sig').strip()=='0',x
    batch=(V/f'td_build_attempt{attempt}.log').read_text(encoding='utf-8-sig')
    assert 'Run syn_1 success.' in batch and 'Run phy_1 success.' in batch
    logs={name:(RUN/sub/'run.log').read_text(errors='replace') for name,sub in [('synthesis','syn_1'),('implementation','phy_1')]}
    for name,s in dict(batch=batch,**logs).items():
        assert not re.search(r'\bERROR\s*:|HDL-7144|unknown module|black.?box',s,re.I),(name,'build error/unknown module')
    timing=(RUN/'phy_1/HDMI1.4b_Transmitter_v1.0_pr.timing').read_text()
    assert 'Confidence          : Routed' in timing and 'Both (Slow and Fast)' in timing
    metrics={x:float(re.search(r'\b'+x+r':\s*([-\d.]+)ns',timing)[1]) for x in ['SWNS','STNS','HWNS','HTNS']}
    assert metrics['SWNS']>=0 and metrics['HWNS']>=0 and metrics['STNS']==0 and metrics['HTNS']==0,metrics
    sources={}
    # TD XML uses literal '&' in UsedInP&R, so parse its File attributes directly.
    for project in [P/'HDMI1.4b_Transmitter_v1.0.al',RUN/'syn_1/HDMI1.4b_Transmitter_v1.0.prj',RUN/'phy_1/HDMI1.4b_Transmitter_v1.0.prj']:
        text=project.read_text(encoding='utf-8-sig')
        paths=re.findall(r'<File Path="([^"]+)"',text)
        for name in NEW:
            assert sum(x.endswith('/'+name) for x in paths)==1,(project,name)
        for f in paths:
            resolved=(project.parent/f).resolve();assert resolved.is_file(),resolved
            sources[str(resolved.relative_to(ROOT))]=digest(resolved)
        sources[str(project.relative_to(ROOT))]=digest(project)
    for log in ['audio_tests.log','output_tests.log','legacy_regression.log','fat_final.log']:
        s=(V/log).read_text(encoding='utf-8-sig')
        assert 'PASS' in s and not re.search(r'FATAL:|^FAIL\b|Traceback',s,re.M),log
    assert (V/'audio_tests.log').read_text().count('PASS WAV ')>=22
    assert 'PASS effects video' in (V/'legacy_regression.log').read_text()
    assert 'PASS reset constraints' in (V/'reset_constraints_check.log').read_text()
    assert 'PASS no new false path' in (V/'cdc_audit.log').read_text()
    bit=RUN/'phy_1/HDMI1.4b_Transmitter_v1.0.bit'
    assert bit.stat().st_size==629624
    for f in (ROOT/'src/user_source').rglob('*'):
        if f.is_file() and f.suffix.lower() in ['.v','.sdc','.adc']:
            assert f.stat().st_mtime<=bit.stat().st_mtime,('source newer than bit',f)
    baseline=Path(r'D:\FPGA\backup_working_v7_before_wav_waveform_20261023')
    for f in (baseline/'release').rglob('*'):
        if f.is_file():assert digest(f)==digest(ROOT/f.relative_to(baseline)),('historical release changed',f)
    assert digest(baseline/'src/user_source/constraints_source/pin.adc')==digest(ROOT/'src/user_source/constraints_source/pin.adc')
    result={'attempt':attempt,'metrics_ns':metrics,'bit':str(bit),'bit_bytes':bit.stat().st_size,
            'bit_sha256':digest(bit),'bit_time_local':datetime.fromtimestamp(bit.stat().st_mtime).isoformat(),
            'sources':sources,'historical_release_unchanged':True,'pins_unchanged':True,'board_tested':False}
    (V/'build_audit.json').write_text(json.dumps(result,ensure_ascii=False,indent=2),encoding='utf-8')
    print('PASS build/source/compile-list/timing/artifact/history audit',json.dumps({k:v for k,v in result.items() if k!='sources'},ensure_ascii=False))
    return result
if __name__=='__main__':
    import sys
    audit(int(sys.argv[1]))

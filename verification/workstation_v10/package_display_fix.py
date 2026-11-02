"""Verify and publish the timing-closed v10 build without touching RTL."""
from pathlib import Path
import hashlib
import json
import re
import shutil

VERIFY = Path(__file__).resolve().parent
ROOT = VERIFY.parent.parent
RUNS = ROOT / 'src/td_project_workstation_v10/HDMI1.4b_Transmitter_v1.0_Runs'
RELEASE = ROOT / 'release/workstation_v10_display_fix_20261028'
NAME = 'HDMI1.4b_Transmitter_v1.0'
BIT = VERIFY / 'workstation_v10_display_fix_20261028.bit'

def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()

snapshot = json.loads((VERIFY / 'display_fix_source_hashes.json').read_text(encoding='utf-8'))
assert all(sha(ROOT / name) == digest for name, digest in snapshot.items()), 'Source changed since verified build'
timing = (VERIFY / 'display_fix_timing.rpt').read_text()
for metric in ('SWNS', 'HWNS'):
    match = re.search(r'\b' + metric + r':\s*([-\d.]+)ns', timing)
    assert match and float(match[1]) >= 0, f'{metric} not met'
assert BIT.stat().st_size > 100000
assert 'Generate bits file' in (VERIFY / 'bitgen_display_fix.log').read_text()
physical_log = (RUNS / 'phy_1/run.log').read_text()
assert not re.search(r'\b(?:ERROR|FATAL)\b', physical_log), 'Physical build has errors'
assert 'Generate bits file' in physical_log, 'Physical build did not reach bitgen'
for build_log in ('fix_hold_display_fix.log', 'bitgen_display_fix.log'):
    assert not re.search(r'\b(?:ERROR|FATAL)\b', (VERIFY / build_log).read_text()), f'Build errors: {build_log}'
required_logs = ('menu_after_compare.log', 'write_handoff_fix.log', 'background_integrity_fix.log',
                 'fourbank_fix.log', 'video_fix.log', 'control_fix.log', 'scaler_fix.log',
                 'menu_decoder_equivalence.log', 'menu_digits_fix.log')
for name in required_logs:
    log = (VERIFY / name).read_text()
    assert 'PASS' in log and not re.search(r'\b(?:FAIL|FATAL|ERROR)\b', log), f'Failed/incomplete verification: {name}'
assert 'PASS scaler 1920x1080' in (VERIFY / 'scaler_fix.log').read_text()
assert 'PASS fourbank video:' in (VERIFY / 'fourbank_fix.log').read_text()
assert 'PASS fourbank write overflow:' in (VERIFY / 'fourbank_fix.log').read_text()
assert 'PASS background loader + full preview' in (VERIFY / 'background_integrity_fix.log').read_text()
assert 'PASS menu synthesized netlist equals RTL' in (VERIFY / 'menu_after_compare.log').read_text()
assert (VERIFY / 'syntax_fix.log').read_text().strip() == '', 'Top syntax diagnostics require review'
RELEASE.mkdir(parents=True, exist_ok=True)
backup = VERIFY / 'before_display_fix_artifacts'
for relative in (f'phy_1/{NAME}_pr.db', f'phy_1/{NAME}.bit', 'phy_1/final_timing.rpt',
                 f'phy_1/{NAME}_inst.bid', f'best_result/{NAME}.bit', f'best_result/{NAME}_inst.bid'):
    original = RUNS / relative
    saved = backup / relative
    if original.exists() and not saved.exists():
        saved.parent.mkdir(parents=True, exist_ok=True)
        shutil.copy2(original, saved)
shutil.copy2(VERIFY / 'display_fix_hold_eco.db', RUNS / f'phy_1/{NAME}_pr.db')
shutil.copy2(VERIFY / 'display_fix_timing.rpt', RUNS / 'phy_1/final_timing.rpt')
for subdir in ('phy_1', 'best_result'):
    shutil.copy2(BIT, RUNS / subdir / f'{NAME}.bit')
    shutil.copy2(RUNS / 'phy_1/top_inst.bid', RUNS / subdir / f'{NAME}_inst.bid')
shutil.copy2(BIT, RELEASE / BIT.name)
for name in ('display_fix_timing.rpt', 'display_fix_source_hashes.json', 'verification_index.md'):
    shutil.copy2(VERIFY / name, RELEASE / name)
doc = ROOT / 'doc/工位四步通_v10_七项改进与验证_20261028.md'
shutil.copy2(doc, RELEASE / doc.name)
fix_doc = ROOT / 'doc/工位四步通_v10_菜单与白线修复_20261028.md'
shutil.copy2(fix_doc, RELEASE / fix_doc.name)
for name in required_logs + ('syntax_fix.log',):
    shutil.copy2(VERIFY / name, RELEASE / name)
for name in ('fix_hold_display_fix.log', 'bitgen_display_fix.log'):
    shutil.copy2(VERIFY / name, RELEASE / name)
shutil.copy2(RUNS / 'phy_1/run.log', RELEASE / 'physical_build.log')
manifest = {
    'project': 'src/td_project_workstation_v10/HDMI1.4b_Transmitter_v1.0.al',
    'tool': 'Tang Dynasty 6.2.168116',
    'bitstream': BIT.name,
    'bitstream_sha256': sha(BIT),
    'routed_database_sha256': sha(VERIFY / 'display_fix_hold_eco.db'),
    'source_files_verified': len(snapshot),
    'setup_wns_ns': float(re.search(r'SWNS:\s*([-\d.]+)ns', timing)[1]),
    'hold_wns_ns': float(re.search(r'HWNS:\s*([-\d.]+)ns', timing)[1]),
    'hardware_tested': False,
    'placement_seed': 1,
    'project_file_sha256': sha(ROOT / 'src/td_project_workstation_v10/HDMI1.4b_Transmitter_v1.0.al'),
    'build_steps': ['build_display_fix.tcl', 'fix_hold_display_fix.tcl', 'bitgen_display_fix.tcl', 'package_display_fix.py'],
}
(RELEASE / 'manifest.json').write_text(json.dumps(manifest, ensure_ascii=False, indent=2) + '\n', encoding='utf-8')
assert all(sha(RUNS / subdir / f'{NAME}.bit') == sha(BIT) for subdir in ('phy_1', 'best_result'))
print(json.dumps(manifest, ensure_ascii=False, indent=2))
print('Release:', RELEASE)

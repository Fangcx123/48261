"""Verify and publish the timing-closed v11 read-path fix build."""
from pathlib import Path
import hashlib
import json
import re
import shutil

VERIFY = Path(__file__).resolve().parent
ROOT = VERIFY.parent.parent
RUNS = ROOT / 'src/td_project_workstation_v10/HDMI1.4b_Transmitter_v1.0_Runs'
RELEASE = ROOT / 'release/workstation_v11_read_fix_20261029'
NAME = 'HDMI1.4b_Transmitter_v1.0'
BIT = VERIFY / 'workstation_v11_read_fix_20261029.bit'
DOC = ROOT / 'doc/工位四步通_v11_读图乱码修复_20261029.md'

def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()

def no_errors(path):
    return not re.search(r'\b(?:ERROR|FATAL)\b', path.read_text(errors='replace'))

# Same 80 HDL/constraint files as the v10 snapshot, re-hashed after the fix.
v10 = json.loads((ROOT / 'verification/workstation_v10/display_fix_source_hashes.json').read_text(encoding='utf-8'))
snapshot = {name: sha(ROOT / name) for name in v10}
changed = sorted(name for name in v10 if snapshot[name] != v10[name])
assert changed == ['src/user_source/hdl_source/SD/media_frame_reader.v',
                   'src/user_source/hdl_source/top_tf_hdmi_audio.v'], changed

timing = (VERIFY / 'v11_timing.rpt').read_text()
metrics = {m: float(re.search(r'\b' + m + r':\s*([-\d.]+)ns', timing)[1]) for m in ('SWNS', 'STNS', 'HWNS', 'HTNS')}
assert metrics['SWNS'] >= 0 and metrics['HWNS'] >= 0 and metrics['STNS'] == 0 and metrics['HTNS'] == 0, metrics
assert BIT.stat().st_size > 100000
for log in ('fix_hold_v11.log', 'bitgen_v11.log', 'phy_seed5_final.log'):
    assert no_errors(VERIFY / log), log
assert 'Generate bits file' in (VERIFY / 'bitgen_v11.log').read_text()
assert no_errors(RUNS / 'syn_1/run.log') and no_errors(RUNS / 'phy_1/run.log')
assert '<seed>5</seed>' in (ROOT / 'src/td_project_workstation_v10/HDMI1.4b_Transmitter_v1.0.al').read_text()

system = (VERIFY / 'system_ctrl_fix.log').read_text()
assert 'PASS real-controller system' in system and 'FAIL' not in system
assert 'FAIL real-controller system' in (VERIFY / 'system_ctrl_noalign.log').read_text()
reset = (VERIFY / 'reset_constraints_check_v11.log').read_text()
assert reset.count('PASS') == 3
regression = VERIFY / 'regression'
expect = {'run_fourbank_fix.log': 5, 'run_background_integrity.log': 1, 'run_write_handoff.log': 2,
          'run_video_tests.log': 3, 'run_control_tests.log': 5, 'run_seven_fast.log': 4}
for name, passes in expect.items():
    text = (regression / name).read_text()
    assert text.count('PASS') >= passes and not re.search(r'\b(?:FAIL|FATAL|ERROR)\b', text), name
assert (regression / 'syntax.log').read_text().strip() == ''
assert (regression / 'scaler_four_resolutions.log').read_text().count('PASS') == 4

(VERIFY / 'v11_source_hashes.json').write_text(json.dumps(snapshot, ensure_ascii=False, indent=2) + '\n', encoding='utf-8')
RELEASE.mkdir(parents=True, exist_ok=True)
shutil.copy2(BIT, RELEASE / BIT.name)
for name in ('v11_timing.rpt', 'v11_source_hashes.json', 'system_ctrl_fix.log', 'system_ctrl_noalign.log',
             'controller_probe.log', 'refresh_probe.log', 'reset_constraints_check_v11.log', 'seed_summary.txt',
             'fix_hold_v11.log', 'bitgen_v11.log'):
    shutil.copy2(VERIFY / name, RELEASE / name)
for name in list(expect) + ['syntax.log', 'scaler_four_resolutions.log']:
    shutil.copy2(regression / name, RELEASE / ('regression_' + name))
shutil.copy2(RUNS / 'phy_1/run.log', RELEASE / 'physical_build.log')
shutil.copy2(DOC, RELEASE / DOC.name)
for subdir in ('phy_1', 'best_result'):
    assert sha(RUNS / subdir / f'{NAME}.bit') == sha(BIT), subdir
manifest = {
    'project': 'src/td_project_workstation_v10/HDMI1.4b_Transmitter_v1.0.al',
    'tool': 'Tang Dynasty 6.2.168116',
    'bitstream': BIT.name,
    'bitstream_sha256': sha(BIT),
    'routed_database_sha256': sha(VERIFY / 'v11_hold_eco.db'),
    'source_files_verified': len(snapshot),
    'source_files_changed_from_v10': changed,
    'setup_wns_ns': metrics['SWNS'],
    'hold_wns_ns': metrics['HWNS'],
    'placement_seed': 5,
    'hardware_tested': False,
    'project_file_sha256': sha(ROOT / 'src/td_project_workstation_v10/HDMI1.4b_Transmitter_v1.0.al'),
    'build_steps': ['build_v11.tcl', 'fix_hold_v11.tcl', 'bitgen_v11.tcl', 'package_v11.py'],
}
(RELEASE / 'manifest.json').write_text(json.dumps(manifest, ensure_ascii=False, indent=2) + '\n', encoding='utf-8')
print(json.dumps(manifest, ensure_ascii=False, indent=2))
print('Release:', RELEASE)

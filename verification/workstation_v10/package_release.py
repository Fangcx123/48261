"""Verify and publish the timing-closed v10 build without touching RTL."""
from pathlib import Path
import hashlib
import json
import re
import shutil

VERIFY = Path(__file__).resolve().parent
ROOT = VERIFY.parent.parent
RUNS = ROOT / 'src/td_project_workstation_v10/HDMI1.4b_Transmitter_v1.0_Runs'
RELEASE = ROOT / 'release/workstation_v10_seven_changes_20261028'
NAME = 'HDMI1.4b_Transmitter_v1.0'
BIT = VERIFY / 'workstation_v10_seven_changes_20261028.bit'

def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()

snapshot = json.loads((VERIFY / 'seven_source_hashes.json').read_text(encoding='utf-8'))
assert all(sha(ROOT / name) == digest for name, digest in snapshot.items()), 'Source changed since verified build'
timing = (VERIFY / 'final_delivery_timing.rpt').read_text()
for metric in ('SWNS', 'HWNS'):
    match = re.search(r'\b' + metric + r':\s*([-\d.]+)ns', timing)
    assert match and float(match[1]) >= 0, f'{metric} not met'
assert BIT.stat().st_size > 100000
assert 'Generate bits file' in (VERIFY / 'bitgen_hold_eco.log').read_text()
RELEASE.mkdir(parents=True, exist_ok=True)
backup = VERIFY / 'before_hold_eco_artifacts'
for relative in (f'phy_1/{NAME}_pr.db', f'phy_1/{NAME}.bit', 'phy_1/final_timing.rpt',
                 f'phy_1/{NAME}_inst.bid', f'best_result/{NAME}.bit', f'best_result/{NAME}_inst.bid'):
    original = RUNS / relative
    saved = backup / relative
    if original.exists() and not saved.exists():
        saved.parent.mkdir(parents=True, exist_ok=True)
        shutil.copy2(original, saved)
shutil.copy2(VERIFY / 'hold_eco.db', RUNS / f'phy_1/{NAME}_pr.db')
shutil.copy2(VERIFY / 'final_delivery_timing.rpt', RUNS / 'phy_1/final_timing.rpt')
for subdir in ('phy_1', 'best_result'):
    shutil.copy2(BIT, RUNS / subdir / f'{NAME}.bit')
    shutil.copy2(RUNS / 'phy_1/top_inst.bid', RUNS / subdir / f'{NAME}_inst.bid')
shutil.copy2(BIT, RELEASE / BIT.name)
for name in ('final_delivery_timing.rpt', 'seven_source_hashes.json', 'verification_index.md'):
    shutil.copy2(VERIFY / name, RELEASE / name)
doc = ROOT / 'doc/工位四步通_v10_七项改进与验证_20261028.md'
shutil.copy2(doc, RELEASE / doc.name)
manifest = {
    'project': 'src/td_project_workstation_v10/HDMI1.4b_Transmitter_v1.0.al',
    'tool': 'Tang Dynasty 6.2.168116',
    'bitstream': BIT.name,
    'bitstream_sha256': sha(BIT),
    'routed_database_sha256': sha(VERIFY / 'hold_eco.db'),
    'source_files_verified': len(snapshot),
    'setup_wns_ns': float(re.search(r'SWNS:\s*([-\d.]+)ns', timing)[1]),
    'hold_wns_ns': float(re.search(r'HWNS:\s*([-\d.]+)ns', timing)[1]),
    'hardware_tested': False,
    'build_steps': ['build_v10.tcl', 'fix_hold_v10.tcl', 'bitgen_hold_eco.tcl', 'package_release.py'],
}
(RELEASE / 'manifest.json').write_text(json.dumps(manifest, ensure_ascii=False, indent=2) + '\n', encoding='utf-8')
assert all(sha(RUNS / subdir / f'{NAME}.bit') == sha(BIT) for subdir in ('phy_1', 'best_result'))
print(json.dumps(manifest, ensure_ascii=False, indent=2))
print('Release:', RELEASE)

"""Audit retained physical synchronizer stages and absence of blanket exceptions.

Timing remains enabled on source-to-stage1, stage1-to-stage2 and RAM paths;
the normal routed STA report checks the related PLL clocks. This is a targeted
structural audit, not a replacement for a commercial CDC/metastability signoff.
"""
from pathlib import Path
import re
V=Path(__file__).resolve().parent
ROOT=V.parents[1]
net=(V/'routed_netlist.v').read_text()
sdc=(ROOT/'src/user_source/constraints_source/timing.sdc').read_text()
assert 'set_clock_groups' not in sdc
exceptions=[s for s in sdc.splitlines() if s.startswith('set_false_path')]
assert len(exceptions)==3 and all('reset_source_n' in s or 'fifo_rst' in s or 'clear_fifo' in s for s in exceptions)
report=[]
for name in ['wgray','rgray','wgray_s1','wgray_s2','rgray_s1','rgray_s2']:
    signal='u_wav/u_fifo/'+name
    declared=re.search(r'wire \[12:0\] \\'+re.escape(signal)+r'\s',net)
    assert declared,signal
    if '_s' in name:
        assert 'async_reg=true' in net[declared.start():net.index(';',declared.start())],signal
    found=set()
    for q in re.findall(r'\.q\((.*?)\)\)',net,re.S):
        for a,b in re.findall(r'\\'+re.escape(signal)+r' \[(\d+)(?::(\d+))?\]',q):
            if b:found.update(range(int(b),int(a)+1))
            else:found.add(int(a))
    assert found==set(range(13)),(signal,found)
    report.append(f'PASS {signal}: 13 physical register outputs retained')
report.append('PASS no new false path/clock group exceptions; original three reset-only exclusions unchanged')
report.append('Related-clock cross-domain paths stay timed; this audit does not simulate analog metastability.')
(V/'cdc_audit.log').write_text('\n'.join(report)+'\n')
print('\n'.join(report))

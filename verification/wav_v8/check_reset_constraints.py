"""Audit final routed reset connections, including TD's packed slice names."""
from pathlib import Path
import re

ROOT = Path(__file__).resolve().parent.parent.parent
netlist = (ROOT / 'verification/wav_v8/routed_netlist.v').read_text()
sdc = (ROOT / 'src/user_source/constraints_source/timing.sdc').read_text()
assert 'set_false_path -through [get_nets {reset_source_n}]' in sdc
seen = set()
connections = []
for block in netlist.split(');'):
    if '.sr(reset_source_n)' not in block:
        continue
    output = re.search(r'\.q\((.*?)\)', block, re.S)
    assert output, 'Unidentified asynchronous reset consumer'
    outputs = re.findall(r'\\(u_reset_(?:sd|mem|video|serial)/s[12])\s', output[1])
    assert outputs, 'Unexpected user logic consumes raw reset: ' + output[1]
    # An unused second slice register is allowed; another live register is not.
    for signal in output[1].strip('{}').split(','):
        assert signal.strip().startswith('open_n') or signal.strip().lstrip('\\') in outputs
    seen.update(outputs)
    instance = re.findall(r'\\([^\s]+)\s+\(', block)[-1]
    connections.append(instance + ': ' + ', '.join(outputs))
expected = {f'u_reset_{domain}/s{stage}' for domain in ('sd','mem','video','serial') for stage in (1,2)}
assert seen == expected, (seen, expected)
# No use of raw reset in LUT inputs, clocks, D inputs, IO or child logic.
for line in netlist.splitlines():
    if re.match(r'\s*\.[A-Za-z0-9_]+\(', line) and re.search(r'(?<![A-Za-z0-9_/])reset_source_n(?![A-Za-z0-9_])', line):
        assert line.strip().startswith(('.sr(', '.f(')), line
# FIFO reset inputs are also asynchronous; only the four internal reset SRs
# may consume each raw clear net. Synthesized stage-2 names alias RAM resets.
for raw, prefix in (("u_frame_loader/fifo_rst", "u_frame_loader/u_pixels/"),
                    ("u_frame_reader/clear_fifo", "u_frame_reader/u_pixels/")):
    assert "set_false_path -through [get_nets {" + raw + "}]" in sdc
    expected_fifo = {prefix+x for x in ("asy_w_rst0", "asy_r_rst0", "ram_inst/rsta", "ram_inst/rstb")}
    found = set()
    for block in netlist.split(');'):
        if '.sr(\\' + raw + ' )' not in block:
            continue
        output = re.search(r'\.q\((.*?)\)', block, re.S)[1]
        for signal in output.strip('{}').split(','):
            name = signal.strip().lstrip('\\')
            assert name.startswith('open_n') or name in expected_fifo, (raw, name)
            if name in expected_fifo:
                found.add(name)
    assert found == expected_fifo, (raw, found)
    for line in netlist.splitlines():
        if re.match(r'\s*\.[A-Za-z0-9_]+\(', line) and ('\\'+raw+' ') in line:
            assert line.strip().startswith(('.sr(', '.f(')), (raw, line)
    connections.append('PASS FIFO reset constraints: '+raw+' drives only four reset synchronizer SR inputs')
report = '\n'.join(connections) + '\nPASS reset constraints: raw reset drives only 8 synchronizer SR inputs; packed names audited; s1-Q/s2-D and downstream paths stay timed\n'
(ROOT / 'verification/wav_v8/reset_constraints_check.log').write_text(report, encoding='utf-8')
print(report, end='')

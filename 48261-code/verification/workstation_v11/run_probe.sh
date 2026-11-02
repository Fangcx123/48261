#!/bin/sh
# Real sdr_as_ram gate netlist + public cell models + BL-aware SDRAM model.
set -eu
cd "$(dirname "$0")/../.."
v=verification/workstation_v11
iverilog -g2005 -s tb_ctrl_probe -o "$v/probe_gate.vvp" "$v/tb_ctrl_probe.v" "$v/sdram_bl4_model.v" verification/workstation_v10/sdram_gate.v "$v/eg_public_models.v" 2>&1 | grep -v -i 'warning\|implicit\|sorry' || true
vvp "$v/probe_gate.vvp"

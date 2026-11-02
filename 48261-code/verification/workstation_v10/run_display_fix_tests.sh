#!/bin/sh
set -eu
cd "$(dirname "$0")/../.."
v=verification/workstation_v10
h=src/user_source/hdl_source
# Export menu_after_rtl.v with diagnose_menu_after.tcl before running this suite.
python3 "$v/prepare_menu_netlist.py"
sh "$v/run_menu_gate.sh" > "$v/menu_after_compare.log" 2>&1
iverilog -g2012 -s tb_menu_digits -o "$v/menu_digits.vvp" "$v/tb_menu_digits.v" "$h/display/media_menu_overlay.v"
vvp "$v/menu_digits.vvp" > "$v/menu_digits_fix.log" 2>&1
iverilog -g2012 -s tb_menu_gate -o "$v/menu_reference.vvp" "$v/tb_menu_gate.v" "$v/menu_reference_before.v" "$h/display/media_menu_overlay.v"
vvp "$v/menu_reference.vvp" > "$v/menu_decoder_equivalence.log" 2>&1
sh "$v/run_write_handoff.sh" > "$v/write_handoff_fix.log" 2>&1
sh "$v/run_background_integrity.sh" > "$v/background_integrity_fix.log" 2>&1
sh "$v/run_fourbank_fix.sh" > "$v/fourbank_fix.log" 2>&1
sh "$v/run_video_tests.sh" > "$v/video_fix.log" 2>&1
sh "$v/run_control_tests.sh" > "$v/control_fix.log" 2>&1
sh "$v/run_seven_fast.sh" > "$v/scaler_fix.log" 2>&1
sh "$v/syntax.sh" > "$v/syntax_fix.log" 2>&1

#!/bin/sh
# Usage: run_system_ctrl.sh [extra iverilog defines/params...]
set -eu
cd "$(dirname "$0")/../.."
h=src/user_source/hdl_source
v=verification/workstation_v11
out="$v/system_ctrl_$$.vvp"
iverilog -g2005 -I "$h/SD" -s tb_system_ctrl "$@" -o "$out" "$v/tb_system_ctrl.v" "$v/sdram_bl4_model.v" \
 verification/workstation_v10/sdram_gate.v "$v/eg_public_models.v" \
 "$h/SD/media_frame_reader.v" "$h/SD/media_frame_loader.v" "$h/SD/frame_fifo_write.v" "$h/SD/media_preview_builder.v" \
 "$h/frame_commit_cdc.v" "$h/SD/video_timing_data.v" "$h/SD/video_delay.v" "$h/SD/color_bar.v" \
 "$h/IP/afifo_32_16_256.v" "$h/IP/afifo_16_32_256.v" 2>&1 | grep -v -i 'warning\|implicit\|sorry\|outside the scope' || true
vvp "$out"; rm -f "$out"

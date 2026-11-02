#!/bin/sh
set -eu
cd "$(dirname "$0")/../.."
h=src/user_source/hdl_source
v=verification/workstation_v10
iverilog -g2012 -I "$h/SD" -s tb_background_display -o "$v/background.vvp" "$v/tb_background_display.v" "$h/SD/media_frame_reader.v" "$h/SD/media_frame_loader.v" "$h/SD/frame_fifo_write.v" "$h/SD/media_preview_builder.v" "$h/frame_commit_cdc.v" "$h/SD/video_timing_data.v" "$h/SD/video_delay.v" "$h/SD/color_bar.v" "$h/IP/afifo_32_16_256.v" "$h/IP/afifo_16_32_256.v"
vvp "$v/background.vvp"

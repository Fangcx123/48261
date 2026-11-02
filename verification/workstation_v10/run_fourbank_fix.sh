#!/bin/sh
set -eu
cd "$(dirname "$0")/../.."
hdl=src/user_source/hdl_source
iverilog -g2012 -s tb_fourbank_datapath -o verification/fourbank_datapath.vvp \
 verification/tb_fourbank_datapath.v "$hdl/SD/media_frame_loader.v" "$hdl/SD/media_frame_reader.v" \
 "$hdl/SD/frame_fifo_write.v" "$hdl/SD/video_delay.v" "$hdl/IP/afifo_16_32_256.v" "$hdl/IP/afifo_32_16_256.v"
vvp verification/fourbank_datapath.vvp

iverilog -g2012 -I "$hdl/SD" -s tb_fourbank_video -o verification/fourbank_video.vvp \
 verification/tb_fourbank_video.v "$hdl/SD/media_frame_reader.v" "$hdl/frame_commit_cdc.v" \
 "$hdl/SD/video_timing_data.v" "$hdl/SD/video_delay.v" "$hdl/SD/color_bar.v" "$hdl/IP/afifo_32_16_256.v"
vvp verification/fourbank_video.vvp


#!/bin/sh
set -eu
cd "$(dirname "$0")/.."
hdl=src/user_source/hdl_source
iverilog -g2012 -s tb_transition -o verification/transition.vvp \
 verification/tb_transition.v "$hdl/display/video_transition_commit.v"
vvp verification/transition.vvp
iverilog -g2012 -s tb_osd -o verification/osd.vvp \
 verification/tb_osd.v "$hdl"/display/*.v "$hdl/video_rgb_to_axis_640x480.v"
vvp verification/osd.vvp
iverilog -g2012 -s tb_osd_timer -o verification/osd_timer.vvp \
 verification/tb_osd.v "$hdl/display/timestamp_osd.v"
vvp verification/osd_timer.vvp
iverilog -g2012 -I "$hdl/SD" -s tb_effects_video -o verification/effects_video.vvp \
 verification/tb_effects_video.v "$hdl"/display/*.v \
 "$hdl/SD/media_frame_reader.v" "$hdl/frame_commit_cdc.v" \
 "$hdl/SD/video_timing_data.v" "$hdl/SD/video_delay.v" "$hdl/SD/color_bar.v" \
 "$hdl/IP/afifo_32_16_256.v"
vvp verification/effects_video.vvp
echo 'ALL OSD TRANSITION TESTS PASSED'

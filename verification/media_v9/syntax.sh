#!/bin/sh
set -eu
cd /mnt/d/FPGA/lab_ex5_i2s/src/td_project_media_v9
h=../user_source/hdl_source
# -i permits vendor encrypted IP black boxes: RTL syntax only, not IP simulation.
iverilog -g2012 -s top -i -I "$h/include" -I "$h/SD" -o ../../verification/media_v9/syntax.vvp "$h/top_tf_hdmi_audio.v" "$h/reset_sync.v" "$h/frame_commit_cdc.v" "$h/pcm_media_tone.v" "$h/audio_arc_calculate.v" "$h/startup_pulse.v" "$h/video_rgb_to_axis_640x480.v" "$h"/display/*.v "$h"/audio/*.v "$h"/SD/*.v

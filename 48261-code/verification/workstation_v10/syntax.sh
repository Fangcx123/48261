#!/bin/sh
set -eu
cd "$(dirname "$0")/../../src/td_project_workstation_v10"
h=../user_source/hdl_source
iverilog -g2012 -s top -i -I "$h/include" -I "$h/SD" -I "$h/display" -o ../../verification/workstation_v10/syntax.vvp "$h/top_tf_hdmi_audio.v" "$h/reset_sync.v" "$h/frame_commit_cdc.v" "$h/pcm_media_tone.v" "$h/audio_arc_calculate.v" "$h/startup_pulse.v" "$h/video_rgb_to_axis_640x480.v" "$h"/display/*.v "$h"/audio/*.v "$h"/SD/*.v

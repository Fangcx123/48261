#!/bin/sh
set -eu
cd "$(dirname "$0")/../.."
h=src/user_source/hdl_source
v=verification/wav_v8
iverilog -g2012 -s tb_audio_output -o "$v/output.vvp" "$v/tb_audio_output.v" "$h/audio/pcm_fade_output.v"
vvp "$v/output.vvp"
iverilog -g2012 -s tb_visualizer -o "$v/visual.vvp" "$v/tb_visualizer.v" "$h/display/audio_visualizer.v" "$h/display/promax_audio_waveform.v"
vvp "$v/visual.vvp"
iverilog -g2012 -s tb_audio_owner -o "$v/owner.vvp" "$v/tb_audio_owner.v" \
 "$h/SD/media_player_control.v" "$h/SD/sd_card_bmp.v" "$h/SD/fat32_bmp_reader.v" \
 "$h/SD/fat32_volume_scanner.v" "$h/SD/fat32_file_streamer.v" "$h/SD/sd_sector_adapter.v"
vvp "$v/owner.vvp"

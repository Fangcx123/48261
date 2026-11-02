#!/bin/sh
set -eu
cd "$(dirname "$0")/../.."
h=src/user_source/hdl_source
v=verification/workstation_v10
iverilog -g2012 -s tb_preview_builder -o "$v/preview.vvp" "$v/tb_preview_builder.v" "$h/SD/media_preview_builder.v"
vvp "$v/preview.vvp"
iverilog -g2012 -s tb_wav_player -o "$v/wav.vvp" "$v/tb_wav_player.v" "$h"/audio/*.v "$h/SD/fat32_volume_scanner.v" "$h/SD/fat32_file_streamer.v" "$h/SD/sd_sector_adapter.v"
for c in mono stereo tailfat underflow timeout bad_rate bad_bits bad_align bad_magic bad_riff truncated no_data odd_data bad_fat loop_fat short_sector missing; do
 vvp "$v/wav.vvp" +case="$c"
done

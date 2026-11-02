#!/bin/sh
set -eu
cd "$(dirname "$0")/../.."
h=src/user_source/hdl_source/SD
v=verification/media_v9
python3 "$v/make_scaled_fixtures.py"
iverilog -g2012 -s tb_scaled_fat -o "$v/scaled_fat.vvp" "$v/tb_scaled_fat.v" "$h/fat32_bmp_reader.v" "$h/bmp_nearest_scaler.v" "$h/fat32_volume_scanner.v" "$h/fat32_file_streamer.v" "$h/sd_sector_adapter.v"
for c in tiny odd latefat negative compressed;do vvp "$v/scaled_fat.vvp" +case="$c";done

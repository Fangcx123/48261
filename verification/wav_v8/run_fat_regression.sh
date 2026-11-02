#!/bin/sh
set -eu
cd "$(dirname "$0")/../.."
h=src/user_source/hdl_source
v=verification/wav_v8
python3 verification/make_fat32_fixtures.py > "$v/fat_fixtures.log"
iverilog -g2012 -s tb_fat32 -o "$v/fat32_final.vvp" verification/tb_fat32.v \
 "$h/SD/fat32_bmp_reader.v" "$h/SD/fat32_volume_scanner.v" "$h/SD/fat32_file_streamer.v" "$h/SD/sd_sector_adapter.v"
for c in mbr_fragmented superfloppy spc8_root_sector2 root_cluster2 partition2_activefat1 high_lba missing_pic1 bad_bpb bad_signature no_files early_eof range loop bad_bmp short_sector timeout fat_last_error root_loop extended_header ordinary_header full_640x480 overrun; do
 vvp "$v/fat32_final.vvp" +case="$c"
done

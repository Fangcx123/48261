#!/bin/sh
set -eu
cd "$(dirname "$0")/.."
hdl=src/user_source/hdl_source
iverilog -g2012 -s tb_lessons456 -o verification/unit.vvp \
 verification/tb_lessons456.v "$hdl/SD/bmp_read.v" "$hdl/frame_commit_cdc.v" \
 "$hdl/reset_sync.v" "$hdl/pcm_media_tone.v" "$hdl/audio_arc_calculate.v"
vvp verification/unit.vvp
iverilog -g2012 -s tb_scheduler -o verification/scheduler.vvp \
 verification/tb_scheduler.v "$hdl/SD/sd_card_bmp.v" "$hdl/SD/fat32_bmp_reader.v" \
 "$hdl/SD/fat32_volume_scanner.v" "$hdl/SD/fat32_file_streamer.v" "$hdl/SD/sd_sector_adapter.v"
vvp verification/scheduler.vvp
iverilog -g2012 -s tb_frame_fifo -o verification/frame_fifo.vvp \
 verification/tb_frame_fifo.v "$hdl/SD/frame_read_write.v" \
 "$hdl/SD/frame_fifo_read.v" "$hdl/SD/frame_fifo_write.v"
vvp verification/frame_fifo.vvp
iverilog -g2012 -s tb_sd_startup -o verification/sd_startup.vvp \
 verification/tb_sd_startup.v "$hdl/SD/sd_card_top.v" \
 "$hdl/SD/sd_card_sec_read_write.v" "$hdl/SD/sd_card_cmd.v" "$hdl/SD/spi_master.v"
vvp verification/sd_startup.vvp
vvp verification/sd_startup.vvp +corrupt_ready
vvp verification/sd_startup.vvp +drop_ready
vvp verification/sd_startup.vvp +reject_cmd55
vvp verification/sd_startup.vvp +drop_ready +reject_cmd55 +late_r1
iverilog -g2012 -s tb_board_startup -o verification/board_startup.vvp \
 verification/tb_board_startup.v "$hdl/reset_sync.v"
vvp verification/board_startup.vvp

python3 verification/make_fat32_fixtures.py > verification/fat32_fixtures.log
iverilog -g2012 -s tb_fat32 -o verification/fat32.vvp \
 verification/tb_fat32.v "$hdl/SD/fat32_bmp_reader.v" "$hdl/SD/fat32_volume_scanner.v" \
 "$hdl/SD/fat32_file_streamer.v" "$hdl/SD/sd_sector_adapter.v"
for c in mbr_fragmented superfloppy spc8_root_sector2 root_cluster2 partition2_activefat1 high_lba missing_pic1 bad_bpb bad_signature no_files early_eof range loop bad_bmp short_sector timeout fat_last_error root_loop extended_header ordinary_header full_640x480 overrun; do
 vvp verification/fat32.vvp +case="$c"
done
python3 verification/test_inspect_fat32.py

iverilog -g2012 -s tb_fourbank_scheduler -o verification/fourbank_scheduler.vvp \
 verification/tb_fourbank_scheduler.v "$hdl/SD/media_player_control.v" "$hdl/SD/sd_card_bmp.v" \
 "$hdl/SD/fat32_bmp_reader.v" "$hdl/SD/fat32_volume_scanner.v" "$hdl/SD/fat32_file_streamer.v" "$hdl/SD/sd_sector_adapter.v"
vvp verification/fourbank_scheduler.vvp
iverilog -g2012 -s tb_fourbank_datapath -o verification/fourbank_datapath.vvp \
 verification/tb_fourbank_datapath.v "$hdl/SD/media_frame_loader.v" "$hdl/SD/media_frame_reader.v" \
 "$hdl/SD/frame_fifo_write.v" "$hdl/SD/video_delay.v" "$hdl/IP/afifo_16_32_256.v" "$hdl/IP/afifo_32_16_256.v"
vvp verification/fourbank_datapath.vvp

iverilog -g2012 -I "$hdl/SD" -s tb_fourbank_video -o verification/fourbank_video.vvp \
 verification/tb_fourbank_video.v "$hdl/SD/media_frame_reader.v" "$hdl/frame_commit_cdc.v" \
 "$hdl/SD/video_timing_data.v" "$hdl/SD/video_delay.v" "$hdl/SD/color_bar.v" "$hdl/IP/afifo_32_16_256.v"
vvp verification/fourbank_video.vvp

sh verification/run_osd_transition_tests.sh

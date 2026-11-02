#!/bin/sh
set -eu
cd "$(dirname "$0")/../.."
h=src/user_source/hdl_source
v=verification/media_v9
iverilog -g2012 -s tb_ui -o "$v/ui.vvp" "$v/tb_ui.v" "$h/SD/media_ui_controller.v"
vvp "$v/ui.vvp"
iverilog -g2012 -s tb_ui_scheduler -o "$v/ui_scheduler.vvp" "$v/tb_ui_scheduler.v" verification/tb_fourbank_scheduler.v "$h/SD/sd_card_bmp.v" "$h/SD/media_player_control.v" "$h/SD/media_ui_controller.v" "$h/SD/fat32_bmp_reader.v" "$h/SD/fat32_volume_scanner.v" "$h/SD/fat32_file_streamer.v" "$h/SD/sd_sector_adapter.v"
vvp "$v/ui_scheduler.vvp"
iverilog -g2012 -s tb_view_commit -o "$v/view_commit.vvp" "$v/tb_view_commit.v" "$h/frame_commit_cdc.v"
vvp "$v/view_commit.vvp"
iverilog -g2012 -s tb_runtime_audio -o "$v/runtime_audio.vvp" "$v/tb_runtime_audio.v" "$h/audio/pcm_fade_output.v"
vvp "$v/runtime_audio.vvp"

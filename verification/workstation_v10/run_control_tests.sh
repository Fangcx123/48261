#!/bin/sh
set -eu
cd "$(dirname "$0")/../.."
h=src/user_source/hdl_source
v=verification/workstation_v10
iverilog -g2012 -s tb_audio_events -o "$v/events.vvp" "$v/tb_audio_events.v" "$h/audio/media_audio_events.v"
vvp "$v/events.vvp"
iverilog -g2012 -s tb_ui -o "$v/ui.vvp" "$v/tb_ui.v" "$h/SD/media_ui_controller.v"
vvp "$v/ui.vvp"
iverilog -g2012 -s tb_settings -o "$v/settings.vvp" "$v/tb_settings.v" "$h/display/media_settings_cdc.v"
vvp "$v/settings.vvp"
iverilog -g2012 -s tb_view_commit -o "$v/view.vvp" "$v/tb_view_commit.v" "$h/frame_commit_cdc.v"
vvp "$v/view.vvp"
iverilog -g2012 -s tb_ui_scheduler -o "$v/scheduler.vvp" "$v/tb_ui_scheduler.v" verification/tb_fourbank_scheduler.v "$h/SD/sd_card_bmp.v" "$h/SD/media_player_control.v" "$h/SD/media_ui_controller.v" "$h/SD/fat32_bmp_reader.v" "$h/SD/fat32_volume_scanner.v" "$h/SD/fat32_file_streamer.v" "$h/SD/sd_sector_adapter.v"
vvp "$v/scheduler.vvp"

#!/bin/sh
set -eu
cd "$(dirname "$0")/../.."
h=src/user_source/hdl_source
v=verification/workstation_v10
iverilog -g2012 -s tb_wave_gain -o "$v/wave_gain.vvp" "$v/tb_wave_gain.v" "$h/display/promax_audio_waveform.v"
vvp "$v/wave_gain.vvp"
iverilog -g2012 -s tb_speech_page_events -o "$v/speech_page_events.vvp" "$v/tb_speech_page_events.v" "$h/audio/media_audio_events.v"
vvp "$v/speech_page_events.vvp"
iverilog -g2012 -s tb_scaler_backpressure -o "$v/scaler_bp.vvp" "$v/tb_scaler_backpressure.v" "$h/SD/bmp_nearest_scaler.v"
vvp "$v/scaler_bp.vvp" +w=320 +h=240
vvp "$v/scaler_bp.vvp" +w=1920 +h=1080
iverilog -g2012 -I "$h/SD" -s tb_background_display -o "$v/background.vvp" "$v/tb_background_display.v" "$h/SD/media_frame_reader.v" "$h/SD/media_frame_loader.v" "$h/SD/frame_fifo_write.v" "$h/SD/media_preview_builder.v" "$h/frame_commit_cdc.v" "$h/SD/video_timing_data.v" "$h/SD/video_delay.v" "$h/SD/color_bar.v" "$h/IP/afifo_32_16_256.v" "$h/IP/afifo_16_32_256.v"
vvp "$v/background.vvp"

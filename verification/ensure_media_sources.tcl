# Batch-build helper; source from TD command-line build scripts, after cd to the TD project directory.
# TD 6.2.1 GUI Tcl Console rejects add_files in sourced scripts.
# In an open GUI project use Source > Add Source > Design files instead.
# TD persists its own source compile order.
# Re-adding an existing source is harmless; TD keeps its compile order.
# Keep the complete media source list explicit for batch builds.
add_files ../user_source/hdl_source/SD/sd_sector_adapter.v
add_files ../user_source/hdl_source/SD/fat32_volume_scanner.v
add_files ../user_source/hdl_source/SD/fat32_file_streamer.v
add_files ../user_source/hdl_source/SD/fat32_bmp_reader.v
add_files ../user_source/hdl_source/SD/media_frame_loader.v
add_files ../user_source/hdl_source/SD/media_frame_reader.v
add_files ../user_source/hdl_source/SD/media_player_control.v
add_files ../user_source/hdl_source/display/video_transition_commit.v
add_files ../user_source/hdl_source/display/video_effects_pipeline.v
add_files ../user_source/hdl_source/display/osd_overlay_24.v
add_files ../user_source/hdl_source/display/status_osd_overlay.v
add_files ../user_source/hdl_source/display/promax_text_overlay.v
add_files ../user_source/hdl_source/display/timestamp_osd.v
add_files ../user_source/hdl_source/audio/pcm_async_fifo.v
add_files ../user_source/hdl_source/audio/wav_pcm_decoder.v
add_files ../user_source/hdl_source/audio/fat32_wav_player.v
add_files ../user_source/hdl_source/audio/pcm_fade_output.v
add_files ../user_source/hdl_source/display/promax_audio_waveform.v
add_files ../user_source/hdl_source/display/audio_visualizer.v
top_module top

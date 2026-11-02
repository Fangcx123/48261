# Command-line only. Dedicated project directory prevents GUI/CLI collisions.
set project_dir [file normalize [file join [file dirname [info script]] ../../src/td_project_wav_v8]]
cd $project_dir
import_device eagle_s20.db -package EG4S20BG256
open_project HDMI1.4b_Transmitter_v1.0.al
add_files D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/audio/pcm_async_fifo.v
add_files D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/audio/wav_pcm_decoder.v
add_files D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/audio/fat32_wav_player.v
add_files D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/audio/pcm_fade_output.v
add_files D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/promax_audio_waveform.v
add_files D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/audio_visualizer.v
reset_runs syn_1
launch_runs syn_1 -step gate
wait_run syn_1 -quiet
launch_runs phy_1 -step bitgen
wait_run phy_1 -quiet
close_project

exit

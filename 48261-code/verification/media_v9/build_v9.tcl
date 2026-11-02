set package_root [file normalize [file join [file dirname [info script]] .. ..]]
# Command-line only. Dedicated project directory prevents GUI/CLI collisions.
set project_dir [file normalize [file join [file dirname [info script]] ../../src/td_project_media_v9]]
cd $project_dir
import_device eagle_s20.db -package EG4S20BG256
open_project HDMI1.4b_Transmitter_v1.0.al
add_files ${package_root}/src/user_source/hdl_source/SD/bmp_nearest_scaler.v
add_files ${package_root}/src/user_source/hdl_source/SD/media_ui_controller.v
add_files ${package_root}/src/user_source/hdl_source/display/media_settings_cdc.v
add_files ${package_root}/src/user_source/hdl_source/display/brightness_contrast_adjust.v
add_files ${package_root}/src/user_source/hdl_source/display/thumbnail_cache.v
add_files ${package_root}/src/user_source/hdl_source/display/media_menu_overlay.v
reset_runs syn_1
launch_runs syn_1 -step gate
wait_run syn_1 -quiet
launch_runs phy_1 -step bitgen
wait_run phy_1 -quiet
close_project

exit

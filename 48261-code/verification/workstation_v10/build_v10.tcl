set package_root [file normalize [file join [file dirname [info script]] .. ..]]
# Dedicated build directory; original v9 results remain available.
cd ${package_root}/src/td_project_workstation_v10
import_device eagle_s20.db -package EG4S20BG256
open_project HDMI1.4b_Transmitter_v1.0.al
reset_runs syn_1
launch_runs syn_1 -step gate
wait_run syn_1 -quiet
launch_runs phy_1 -step bitgen
wait_run phy_1 -quiet
close_project
exit

# v11 read-path fix build. Same flow as v10; placement seed 5 (seed sweep: 1-4,6 fail setup).
cd D:/FPGA/lab_ex5_i2s/src/td_project_workstation_v10
import_device eagle_s20.db -package EG4S20BG256
open_project HDMI1.4b_Transmitter_v1.0.al
reset_runs syn_1
launch_runs syn_1 -step gate
wait_run syn_1 -quiet
set_param place seed 5 -run phy_1
launch_runs phy_1 -step bitgen
wait_run phy_1 -quiet
close_project
exit

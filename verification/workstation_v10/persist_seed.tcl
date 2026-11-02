cd D:/FPGA/lab_ex5_i2s/src/td_project_workstation_v10
import_device eagle_s20.db -package EG4S20BG256
open_project HDMI1.4b_Transmitter_v1.0.al
set_param place seed 1 -run phy_1
get_param place seed -run phy_1
close_project
exit

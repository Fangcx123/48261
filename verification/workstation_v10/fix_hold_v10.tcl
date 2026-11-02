set target_dir D:/FPGA/lab_ex5_i2s/src/td_project_workstation_v10/HDMI1.4b_Transmitter_v1.0_Runs/phy_1
cd $target_dir
import_device eagle_s20.db -package EG4S20BG256
import_db HDMI1.4b_Transmitter_v1.0_pr.db
fix_hold -eco
update_timing -mode final
report_timing_summary -file D:/FPGA/lab_ex5_i2s/verification/workstation_v10/hold_eco_timing.rpt
export_db D:/FPGA/lab_ex5_i2s/verification/workstation_v10/hold_eco.db
exit

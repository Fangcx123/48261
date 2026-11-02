# Generate the delivery bitstream from the timing-closed routed database.
cd D:/FPGA/lab_ex5_i2s/src/td_project_workstation_v10/HDMI1.4b_Transmitter_v1.0_Runs/phy_1
import_device eagle_s20.db -package EG4S20BG256
import_db D:/FPGA/lab_ex5_i2s/verification/workstation_v10/hold_eco.db
update_timing -mode final
report_timing_summary -file D:/FPGA/lab_ex5_i2s/verification/workstation_v10/final_delivery_timing.rpt
bitgen -bit D:/FPGA/lab_ex5_i2s/verification/workstation_v10/workstation_v10_seven_changes_20261028.bit
exit

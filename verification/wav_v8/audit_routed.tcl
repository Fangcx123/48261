cd D:/FPGA/lab_ex5_i2s/src/td_project_wav_v8
import_device eagle_s20.db -package EG4S20BG256
open_project HDMI1.4b_Transmitter_v1.0.al -noanalyze
import_db HDMI1.4b_Transmitter_v1.0_Runs/phy_1/HDMI1.4b_Transmitter_v1.0_pr.db
write_verilog ../../verification/wav_v8/routed_netlist.v
close_project
exit

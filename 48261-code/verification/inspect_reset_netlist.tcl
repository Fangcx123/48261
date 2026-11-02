cd [file normalize [file join [file dirname [info script]] ../src/td_project]]
import_device eagle_s20.db -package EG4S20BG256
open_project HDMI1.4b_Transmitter_v1.0.al -noanalyze
import_db HDMI1.4b_Transmitter_v1.0_Runs/phy_1/HDMI1.4b_Transmitter_v1.0_pr.db
write_verilog ../../verification/routed_reset_debug.v
close_project

cd [file normalize [file join [file dirname [info script]] ..]]
import_device eagle_s20.db -package EG4S20BG256
import_db src/td_project/HDMI1.4b_Transmitter_v1.0_Runs/phy_1/HDMI1.4b_Transmitter_v1.0_pr.db
puts "PIN_SR [get_pins {u_reset_serial/s1_reg*.sr u_reset_serial/s2_reg*.sr u_reset_mem/s1_reg*.sr u_reset_mem/s2_reg*.sr u_reset_video/s1_reg*.sr u_reset_video/s2_reg*.sr u_reset_sd/s1_reg*.sr u_reset_sd/s2_reg*.sr}]"
puts "RESET_CELLS [get_cells {u_reset_*/*reg*}]"
report_cells [get_cells {u_reset_mem/*reg*}] -connection

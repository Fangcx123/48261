set package_root [file normalize [file join [file dirname [info script]] .. ..]]
# Generate the delivery bitstream from the timing-closed routed database.
cd ${package_root}/src/td_project_workstation_v10/HDMI1.4b_Transmitter_v1.0_Runs/phy_1
import_device eagle_s20.db -package EG4S20BG256
import_db ${package_root}/verification/workstation_v10/display_fix_hold_eco.db
update_timing -mode final
report_timing_summary -file ${package_root}/verification/workstation_v10/display_fix_timing.rpt
bitgen -bit ${package_root}/verification/workstation_v10/workstation_v10_display_fix_20261028.bit
exit

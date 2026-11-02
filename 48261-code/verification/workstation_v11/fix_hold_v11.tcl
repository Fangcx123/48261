set package_root [file normalize [file join [file dirname [info script]] .. ..]]
set target_dir ${package_root}/src/td_project_workstation_v10/HDMI1.4b_Transmitter_v1.0_Runs/phy_1
cd $target_dir
import_device eagle_s20.db -package EG4S20BG256
import_db HDMI1.4b_Transmitter_v1.0_pr.db
fix_hold -eco
update_timing -mode final
report_timing_summary -file ${package_root}/verification/workstation_v11/v11_hold_timing.rpt
export_db ${package_root}/verification/workstation_v11/v11_hold_eco.db
exit

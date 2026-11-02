set package_root [file normalize [file join [file dirname [info script]] .. ..]]
cd ${package_root}/src/td_project_workstation_v10
import_device eagle_s20.db -package EG4S20BG256
import_db ${package_root}/src/td_project_workstation_v10/HDMI1.4b_Transmitter_v1.0_Runs/syn_1/HDMI1.4b_Transmitter_v1.0_gate.db
write_verilog ${package_root}/verification/workstation_v11/v11_syn_gate.v
exit

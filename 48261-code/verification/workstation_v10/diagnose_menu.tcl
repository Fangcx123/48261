set package_root [file normalize [file join [file dirname [info script]] .. ..]]
import_device eagle_s20.db -package EG4S20BG256
read_verilog -file ${package_root}/src/user_source/hdl_source/display/media_menu_overlay.v
optimize_rtl
optimize_gate -ip
write_verilog ${package_root}/verification/workstation_v10/menu_before_gate.v
exit

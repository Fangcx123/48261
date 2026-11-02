set package_root [file normalize [file join [file dirname [info script]] .. ..]]
cd ${package_root}/src/td_project_workstation_v10
import_device eagle_s20.db -package EG4S20BG256
read_verilog -dir ${package_root}/src/user_source/hdl_source/include -include_dir ${package_root}/src/user_source/hdl_source/include -top sdr_as_ram
optimize_rtl
write_verilog ${package_root}/verification/workstation_v10/sdram_rtl.v
exit


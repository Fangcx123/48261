import_device eagle_s20.db -package EG4S20BG256
read_verilog -file D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v
optimize_rtl

write_verilog D:/FPGA/lab_ex5_i2s/verification/workstation_v10/menu_after_rtl.v
exit

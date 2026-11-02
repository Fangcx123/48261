cd D:/FPGA/lab_ex5_i2s/src/td_project_workstation_v10
import_device eagle_s20.db -package EG4S20BG256
read_verilog -dir D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include -include_dir D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include -top sdr_as_ram
optimize_rtl
write_verilog D:/FPGA/lab_ex5_i2s/verification/workstation_v10/sdram_rtl.v
exit


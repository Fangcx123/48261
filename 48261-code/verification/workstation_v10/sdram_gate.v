// Verilog netlist created by Tang Dynasty v6.2.168116
// Wed Oct 28 17:09:18 2026

`timescale 1ns / 1ps
module sdr_as_ram  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(12)
  (
  App_rd_addr,
  App_rd_en,
  App_ref_req,
  App_wr_addr,
  App_wr_din,
  App_wr_dm,
  App_wr_en,
  Rst,
  Sdr_clk,
  Sdr_clk_sft,
  SDRAM_CLK,
  SDR_ADDR,
  SDR_BA,
  SDR_CAS,
  SDR_DM,
  SDR_RAS,
  SDR_WE,
  Sdr_busy,
  Sdr_init_done,
  Sdr_init_ref_vld,
  Sdr_rd_dout,
  Sdr_rd_en,
  SDR_DQ
  );

  input [20:0] App_rd_addr;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(30)
  input App_rd_en;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(29)
  input App_ref_req;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(22)
  input [20:0] App_wr_addr;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(25)
  input [31:0] App_wr_din;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(27)
  input [3:0] App_wr_dm;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(26)
  input App_wr_en;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(24)
  input Rst;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(16)
  input Sdr_clk;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(14)
  input Sdr_clk_sft;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(15)
  output SDRAM_CLK /* synthesis keep=true */ ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(35)
  output [10:0] SDR_ADDR;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(40)
  output [1:0] SDR_BA;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(39)
  output SDR_CAS;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(37)
  output [3:0] SDR_DM;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(41)
  output SDR_RAS;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(36)
  output SDR_WE;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(38)
  output Sdr_busy;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(20)
  output Sdr_init_done;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(18)
  output Sdr_init_ref_vld;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(19)
  output [31:0] Sdr_rd_dout /* synthesis keep=true */ ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  output Sdr_rd_en;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(31)
  inout [31:0] SDR_DQ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(42)

  // parameter self_refresh_open = 1;
  wire [11:0] \u1_init_ref/Sdr_init_ref_addr ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(35)
  wire [13:0] \u1_init_ref/init_cnt ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(45)
  wire [13:0] \u1_init_ref/mux4_syn_2 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(99)
  wire [17:0] \u1_init_ref/pwr_200ms_cnt ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(39)
  wire [17:0] \u1_init_ref/pwr_200ms_cnt_b1 ;
  wire [17:0] \u1_init_ref/pwr_200ms_cnt_b3 ;
  wire [31:0] \u1_init_ref/sdr_init_cnt ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(43)
  wire [19:0] \u1_init_ref/sdr_ref_ack_sft ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(46)
  wire [10:0] \u2_wrrd/SDR_ADDR_b ;
  wire [31:0] \u2_wrrd/Sdr_rd_dout  /* synthesis keep=true */ ;
  wire [1:0] \u2_wrrd/active_ba ;
  wire [1:0] \u2_wrrd/active_ba_b1 ;
  wire [7:0] \u2_wrrd/active_col ;
  wire [7:0] \u2_wrrd/active_col_b1 ;
  wire [10:0] \u2_wrrd/active_row ;
  wire [10:0] \u2_wrrd/active_row_b1 ;
  wire [10:0] \u2_wrrd/addr ;
  wire [10:0] \u2_wrrd/addr_b ;
  wire [20:0] \u2_wrrd/app_rd_addr_1d ;
  wire [20:0] \u2_wrrd/app_rd_addr_2d ;
  wire [20:0] \u2_wrrd/app_rd_addr_3d ;
  wire [20:0] \u2_wrrd/app_rd_addr_4d ;
  wire [10:0] \u2_wrrd/app_rd_en_sft ;
  wire [20:0] \u2_wrrd/app_wr_addr_1d ;
  wire [20:0] \u2_wrrd/app_wr_addr_2d ;
  wire [20:0] \u2_wrrd/app_wr_addr_3d ;
  wire [20:0] \u2_wrrd/app_wr_addr_4d ;
  wire [31:0] \u2_wrrd/app_wr_din_1d ;
  wire [31:0] \u2_wrrd/app_wr_din_2d ;
  wire [31:0] \u2_wrrd/app_wr_din_3d ;
  wire [31:0] \u2_wrrd/app_wr_din_4d ;
  wire [31:0] \u2_wrrd/app_wr_din_5d ;
  wire [31:0] \u2_wrrd/app_wr_din_6d ;
  wire [3:0] \u2_wrrd/app_wr_dm_1d ;
  wire [3:0] \u2_wrrd/app_wr_dm_2d ;
  wire [3:0] \u2_wrrd/app_wr_dm_3d ;
  wire [3:0] \u2_wrrd/app_wr_dm_4d ;
  wire [3:0] \u2_wrrd/app_wr_dm_5d ;
  wire [3:0] \u2_wrrd/app_wr_dm_6d ;
  wire [7:0] \u2_wrrd/app_wr_en_sft ;
  wire [1:0] \u2_wrrd/ba ;
  wire [1:0] \u2_wrrd/cnt4 ;
  wire [7:0] \u2_wrrd/mux1_syn_2 ;
  wire [1:0] \u2_wrrd/mux21_syn_2 ;
  wire [10:0] \u2_wrrd/mux4_syn_2 ;
  wire [2:0] \u2_wrrd/mux9_syn_1 ;
  wire [2:0] \u2_wrrd/sel2_syn_1 ;
  wire [2:0] \u2_wrrd/state_reg_syn_1 ;
  wire App_rd_en_dup_5;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(29)
  wire App_ref_req_dup_1;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(22)
  wire App_wr_en_dup_5;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(24)
  wire Rst_dup_177;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(16)
  wire SDRAM_CLK_dup_3 /* synthesis keep=true */ ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(35)
  wire \SDR_DQ[31]_dup_1 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(42)
  wire \SDR_DQ[30]_dup_1 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(42)
  wire \SDR_DQ[29]_dup_1 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(42)
  wire \SDR_DQ[28]_dup_1 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(42)
  wire \SDR_DQ[27]_dup_1 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(42)
  wire \SDR_DQ[26]_dup_1 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(42)
  wire \SDR_DQ[25]_dup_1 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(42)
  wire \SDR_DQ[24]_dup_1 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(42)
  wire \SDR_DQ[23]_dup_1 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(42)
  wire \SDR_DQ[22]_dup_1 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(42)
  wire \SDR_DQ[21]_dup_1 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(42)
  wire \SDR_DQ[20]_dup_1 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(42)
  wire \SDR_DQ[19]_dup_1 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(42)
  wire \SDR_DQ[18]_dup_1 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(42)
  wire \SDR_DQ[17]_dup_1 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(42)
  wire \SDR_DQ[16]_dup_1 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(42)
  wire \SDR_DQ[15]_dup_1 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(42)
  wire \SDR_DQ[14]_dup_1 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(42)
  wire \SDR_DQ[13]_dup_1 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(42)
  wire \SDR_DQ[12]_dup_1 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(42)
  wire \SDR_DQ[11]_dup_1 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(42)
  wire \SDR_DQ[10]_dup_1 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(42)
  wire \SDR_DQ[9]_dup_1 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(42)
  wire \SDR_DQ[8]_dup_1 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(42)
  wire \SDR_DQ[7]_dup_1 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(42)
  wire \SDR_DQ[6]_dup_1 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(42)
  wire \SDR_DQ[5]_dup_1 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(42)
  wire \SDR_DQ[4]_dup_1 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(42)
  wire \SDR_DQ[3]_dup_1 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(42)
  wire \SDR_DQ[2]_dup_1 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(42)
  wire \SDR_DQ[1]_dup_1 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(42)
  wire \SDR_DQ[0]_dup_1 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(42)
  wire Sdr_clk_dup_1;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(14)
  wire Sdr_clk_sft_dup_1;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(15)
  wire Sdr_init_done_dup_5;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(18)
  wire Sdr_init_ref_vld_dup_1;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(19)
  wire \Sdr_rd_dout[31]_dup_3  /* synthesis keep=true */ ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  wire \Sdr_rd_dout[30]_dup_3  /* synthesis keep=true */ ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  wire \Sdr_rd_dout[29]_dup_3  /* synthesis keep=true */ ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  wire \Sdr_rd_dout[28]_dup_3  /* synthesis keep=true */ ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  wire \Sdr_rd_dout[27]_dup_3  /* synthesis keep=true */ ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  wire \Sdr_rd_dout[26]_dup_3  /* synthesis keep=true */ ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  wire \Sdr_rd_dout[25]_dup_3  /* synthesis keep=true */ ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  wire \Sdr_rd_dout[24]_dup_3  /* synthesis keep=true */ ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  wire \Sdr_rd_dout[23]_dup_3  /* synthesis keep=true */ ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  wire \Sdr_rd_dout[22]_dup_3  /* synthesis keep=true */ ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  wire \Sdr_rd_dout[21]_dup_3  /* synthesis keep=true */ ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  wire \Sdr_rd_dout[20]_dup_3  /* synthesis keep=true */ ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  wire \Sdr_rd_dout[19]_dup_3  /* synthesis keep=true */ ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  wire \Sdr_rd_dout[18]_dup_3  /* synthesis keep=true */ ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  wire \Sdr_rd_dout[17]_dup_3  /* synthesis keep=true */ ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  wire \Sdr_rd_dout[16]_dup_3  /* synthesis keep=true */ ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  wire \Sdr_rd_dout[15]_dup_3  /* synthesis keep=true */ ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  wire \Sdr_rd_dout[14]_dup_3  /* synthesis keep=true */ ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  wire \Sdr_rd_dout[13]_dup_3  /* synthesis keep=true */ ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  wire \Sdr_rd_dout[12]_dup_3  /* synthesis keep=true */ ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  wire \Sdr_rd_dout[11]_dup_3  /* synthesis keep=true */ ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  wire \Sdr_rd_dout[10]_dup_3  /* synthesis keep=true */ ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  wire \Sdr_rd_dout[9]_dup_3  /* synthesis keep=true */ ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  wire \Sdr_rd_dout[8]_dup_3  /* synthesis keep=true */ ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  wire \Sdr_rd_dout[7]_dup_3  /* synthesis keep=true */ ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  wire \Sdr_rd_dout[6]_dup_3  /* synthesis keep=true */ ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  wire \Sdr_rd_dout[5]_dup_3  /* synthesis keep=true */ ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  wire \Sdr_rd_dout[4]_dup_3  /* synthesis keep=true */ ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  wire \Sdr_rd_dout[3]_dup_3  /* synthesis keep=true */ ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  wire \Sdr_rd_dout[2]_dup_3  /* synthesis keep=true */ ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  wire \Sdr_rd_dout[1]_dup_3  /* synthesis keep=true */ ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  wire \Sdr_rd_dout[0]_dup_3  /* synthesis keep=true */ ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  wire \u1_init_ref/add0_syn_72 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(105)
  wire \u1_init_ref/add0_syn_74 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(105)
  wire \u1_init_ref/add0_syn_76 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(105)
  wire \u1_init_ref/add0_syn_78 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(105)
  wire \u1_init_ref/add0_syn_80 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(105)
  wire \u1_init_ref/add0_syn_82 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(105)
  wire \u1_init_ref/add0_syn_84 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(105)
  wire \u1_init_ref/add1_syn_94 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(62)
  wire \u1_init_ref/add1_syn_98 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(62)
  wire \u1_init_ref/add1_syn_102 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(62)
  wire \u1_init_ref/add1_syn_106 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(62)
  wire \u1_init_ref/cas_reg_syn_3 ;
  wire \u1_init_ref/init_done_reg_syn_5 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(85)
  wire \u1_init_ref/init_vld_reg_syn_5 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(78)
  wire \u1_init_ref/mux4_syn_36 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(99)
  wire \u1_init_ref/mux4_syn_38 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(99)
  wire \u1_init_ref/ras_reg_syn_3 ;
  wire \u1_init_ref/ras_reg_syn_5 ;
  wire \u1_init_ref/ras_reg_syn_7 ;
  wire \u1_init_ref/ras_reg_syn_10 ;
  wire \u1_init_ref/ref_vld_reg_syn_5 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(122)
  wire \u1_init_ref/ref_vld_reg_syn_7 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(122)
  wire \u1_init_ref/we_reg_syn_3 ;
  wire \u1_init_ref/init_cnt[0]_syn_2 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(45)
  wire \u1_init_ref/pwr_200ms_cnt[0]_syn_2 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(39)
  wire \u1_init_ref/Sdr_init_ref_cas ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(32)
  wire \u1_init_ref/Sdr_init_ref_ras ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(31)
  wire \u1_init_ref/Sdr_init_ref_we ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(33)
  wire \u1_init_ref/Sdr_ref_ack ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(27)
  wire \u1_init_ref/Sdr_ref_req ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(26)
  wire \u1_init_ref/init_done_n2 ;
  wire \u1_init_ref/init_vld ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(44)
  wire \u1_init_ref/power_up_200ms_1d ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(40)
  wire \u1_init_ref/power_up_200ms_2d ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(40)
  wire \u1_init_ref/power_up_en ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(40)
  wire \u1_init_ref/power_up_en_n ;
  wire \u1_init_ref/ref_req ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(47)
  wire \u1_init_ref/ref_req_n2 ;
  wire \u1_init_ref/ref_req_n2_syn_2 ;
  wire \u1_init_ref/ref_req_n2_syn_4 ;
  wire \u1_init_ref/ref_req_n2_syn_6 ;
  wire \u1_init_ref/ref_req_n2_syn_8 ;
  wire \u1_init_ref/ref_vld ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(47)
  wire \u1_init_ref/sdr_init_en ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(42)
  wire \u2_wrrd/active_en_reg_syn_3 ;
  wire \u2_wrrd/cas_reg_syn_3 ;
  wire \u2_wrrd/col_en_reg_syn_3 ;
  wire \u2_wrrd/ref_ack_reg_syn_3 ;
  wire \u2_wrrd/ref_vld_reg_syn_5 ;
  wire \u2_wrrd/rw_vld_reg_syn_5 ;
  wire \u2_wrrd/rw_vld_reg_syn_7 ;
  wire \u2_wrrd/sdr_t_reg_syn_5 ;
  wire \u2_wrrd/sel2_syn_93 ;
  wire \u2_wrrd/sel2_syn_96 ;
  wire \u2_wrrd/sel2_syn_98 ;
  wire \u2_wrrd/we_reg_syn_3 ;
  wire \u2_wrrd/Sdr_rd_dout[31]_syn_3 ;
  wire \u2_wrrd/Sdr_rd_dout[31]_syn_4 ;
  wire \u2_wrrd/Sdr_rd_dout[30]_syn_3 ;
  wire \u2_wrrd/Sdr_rd_dout[30]_syn_4 ;
  wire \u2_wrrd/Sdr_rd_dout[29]_syn_3 ;
  wire \u2_wrrd/Sdr_rd_dout[29]_syn_4 ;
  wire \u2_wrrd/Sdr_rd_dout[28]_syn_3 ;
  wire \u2_wrrd/Sdr_rd_dout[28]_syn_4 ;
  wire \u2_wrrd/Sdr_rd_dout[27]_syn_3 ;
  wire \u2_wrrd/Sdr_rd_dout[27]_syn_4 ;
  wire \u2_wrrd/Sdr_rd_dout[26]_syn_3 ;
  wire \u2_wrrd/Sdr_rd_dout[26]_syn_4 ;
  wire \u2_wrrd/Sdr_rd_dout[25]_syn_3 ;
  wire \u2_wrrd/Sdr_rd_dout[25]_syn_4 ;
  wire \u2_wrrd/Sdr_rd_dout[24]_syn_3 ;
  wire \u2_wrrd/Sdr_rd_dout[24]_syn_4 ;
  wire \u2_wrrd/Sdr_rd_dout[23]_syn_3 ;
  wire \u2_wrrd/Sdr_rd_dout[23]_syn_4 ;
  wire \u2_wrrd/Sdr_rd_dout[22]_syn_3 ;
  wire \u2_wrrd/Sdr_rd_dout[22]_syn_4 ;
  wire \u2_wrrd/Sdr_rd_dout[21]_syn_3 ;
  wire \u2_wrrd/Sdr_rd_dout[21]_syn_4 ;
  wire \u2_wrrd/Sdr_rd_dout[20]_syn_3 ;
  wire \u2_wrrd/Sdr_rd_dout[20]_syn_4 ;
  wire \u2_wrrd/Sdr_rd_dout[19]_syn_3 ;
  wire \u2_wrrd/Sdr_rd_dout[19]_syn_4 ;
  wire \u2_wrrd/Sdr_rd_dout[18]_syn_3 ;
  wire \u2_wrrd/Sdr_rd_dout[18]_syn_4 ;
  wire \u2_wrrd/Sdr_rd_dout[17]_syn_3 ;
  wire \u2_wrrd/Sdr_rd_dout[17]_syn_4 ;
  wire \u2_wrrd/Sdr_rd_dout[16]_syn_3 ;
  wire \u2_wrrd/Sdr_rd_dout[16]_syn_4 ;
  wire \u2_wrrd/Sdr_rd_dout[15]_syn_3 ;
  wire \u2_wrrd/Sdr_rd_dout[15]_syn_4 ;
  wire \u2_wrrd/Sdr_rd_dout[14]_syn_3 ;
  wire \u2_wrrd/Sdr_rd_dout[14]_syn_4 ;
  wire \u2_wrrd/Sdr_rd_dout[13]_syn_3 ;
  wire \u2_wrrd/Sdr_rd_dout[13]_syn_4 ;
  wire \u2_wrrd/Sdr_rd_dout[12]_syn_3 ;
  wire \u2_wrrd/Sdr_rd_dout[12]_syn_4 ;
  wire \u2_wrrd/Sdr_rd_dout[11]_syn_3 ;
  wire \u2_wrrd/Sdr_rd_dout[11]_syn_4 ;
  wire \u2_wrrd/Sdr_rd_dout[10]_syn_3 ;
  wire \u2_wrrd/Sdr_rd_dout[10]_syn_4 ;
  wire \u2_wrrd/Sdr_rd_dout[9]_syn_3 ;
  wire \u2_wrrd/Sdr_rd_dout[9]_syn_4 ;
  wire \u2_wrrd/Sdr_rd_dout[8]_syn_3 ;
  wire \u2_wrrd/Sdr_rd_dout[8]_syn_4 ;
  wire \u2_wrrd/Sdr_rd_dout[7]_syn_3 ;
  wire \u2_wrrd/Sdr_rd_dout[7]_syn_4 ;
  wire \u2_wrrd/Sdr_rd_dout[6]_syn_3 ;
  wire \u2_wrrd/Sdr_rd_dout[6]_syn_4 ;
  wire \u2_wrrd/Sdr_rd_dout[5]_syn_3 ;
  wire \u2_wrrd/Sdr_rd_dout[5]_syn_4 ;
  wire \u2_wrrd/Sdr_rd_dout[4]_syn_3 ;
  wire \u2_wrrd/Sdr_rd_dout[4]_syn_4 ;
  wire \u2_wrrd/Sdr_rd_dout[3]_syn_3 ;
  wire \u2_wrrd/Sdr_rd_dout[3]_syn_4 ;
  wire \u2_wrrd/Sdr_rd_dout[2]_syn_3 ;
  wire \u2_wrrd/Sdr_rd_dout[2]_syn_4 ;
  wire \u2_wrrd/Sdr_rd_dout[1]_syn_3 ;
  wire \u2_wrrd/Sdr_rd_dout[1]_syn_4 ;
  wire \u2_wrrd/Sdr_rd_dout[0]_syn_3 ;
  wire \u2_wrrd/Sdr_rd_dout[0]_syn_4 ;
  wire \u2_wrrd/Sdr_ref_req  /* synthesis keep=true */ ;
  wire \u2_wrrd/Sdr_ref_req_syn_4 ;
  wire \u2_wrrd/active_col_b1[6]_syn_2 ;
  wire \u2_wrrd/active_row_b1[9]_syn_2 ;
  wire \u2_wrrd/SDR_CAS_n ;
  wire \u2_wrrd/SDR_RAS_n ;
  wire \u2_wrrd/SDR_WE_n ;
  wire \u2_wrrd/Sdr_busy_n4 ;
  wire \u2_wrrd/Sdr_ref_ack_n ;
  wire \u2_wrrd/active_en ;
  wire \u2_wrrd/active_en_syn_2 ;
  wire \u2_wrrd/cas ;
  wire \u2_wrrd/col_en ;
  wire \u2_wrrd/init_ref_vld_1d ;
  wire \u2_wrrd/ras ;
  wire \u2_wrrd/ref_ack ;
  wire \u2_wrrd/ref_over ;
  wire \u2_wrrd/ref_over_n ;
  wire \u2_wrrd/ref_vld ;
  wire \u2_wrrd/rw_vld ;
  wire \u2_wrrd/rw_vld_1d ;
  wire \u2_wrrd/rw_vld_n4 ;
  wire \u2_wrrd/sdr_op_over ;
  wire \u2_wrrd/sdr_op_over_n ;
  wire \u2_wrrd/sdr_t ;
  wire \u2_wrrd/we ;
  wire \u2_wrrd/wrrd_ref_ack ;
  wire \u1_init_ref/ad_reg[1]_syn_4 ;
  wire \u1_init_ref/ad_reg[10]_syn_4 ;
  wire \u2_wrrd/addr_reg[8]_syn_2 ;
  wire \u2_wrrd/addr_reg[9]_syn_2 ;
  wire \u2_wrrd/ba_reg[0]_syn_2 ;
  wire \u2_wrrd/ba_reg[1]_syn_2 ;
  wire \u2_wrrd/cnt4_reg[0]_syn_2 ;
  wire \u2_wrrd/cnt4_reg[0]_syn_4 ;
  wire \u2_wrrd/cnt4_reg[1]_syn_2 ;

  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .SRMODE("ASYNC"),
    .TSMUX("1"))
    \App_rd_addr[0]_syn_6  (
    .ce(open_n0),
    .do({open_n1,open_n2,open_n3,open_n4}),
    .ipad(App_rd_addr[0]),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n5),
    .opclk(open_n6),
    .osclk(open_n7),
    .rst(open_n8),
    .ts(open_n9),
    .di(open_n10),
    .diq({open_n11,open_n12,open_n13,\u2_wrrd/app_rd_addr_1d [0]}),
    .opad(open_n14),
    .bpad(open_n15));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(30)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .SRMODE("ASYNC"),
    .TSMUX("1"))
    \App_rd_addr[10]_syn_6  (
    .ce(open_n16),
    .do({open_n17,open_n18,open_n19,open_n20}),
    .ipad(App_rd_addr[10]),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n21),
    .opclk(open_n22),
    .osclk(open_n23),
    .rst(open_n24),
    .ts(open_n25),
    .di(open_n26),
    .diq({open_n27,open_n28,open_n29,\u2_wrrd/app_rd_addr_1d [10]}),
    .opad(open_n30),
    .bpad(open_n31));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(30)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .SRMODE("ASYNC"),
    .TSMUX("1"))
    \App_rd_addr[11]_syn_6  (
    .ce(open_n32),
    .do({open_n33,open_n34,open_n35,open_n36}),
    .ipad(App_rd_addr[11]),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n37),
    .opclk(open_n38),
    .osclk(open_n39),
    .rst(open_n40),
    .ts(open_n41),
    .di(open_n42),
    .diq({open_n43,open_n44,open_n45,\u2_wrrd/app_rd_addr_1d [11]}),
    .opad(open_n46),
    .bpad(open_n47));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(30)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .SRMODE("ASYNC"),
    .TSMUX("1"))
    \App_rd_addr[12]_syn_6  (
    .ce(open_n48),
    .do({open_n49,open_n50,open_n51,open_n52}),
    .ipad(App_rd_addr[12]),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n53),
    .opclk(open_n54),
    .osclk(open_n55),
    .rst(open_n56),
    .ts(open_n57),
    .di(open_n58),
    .diq({open_n59,open_n60,open_n61,\u2_wrrd/app_rd_addr_1d [12]}),
    .opad(open_n62),
    .bpad(open_n63));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(30)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .SRMODE("ASYNC"),
    .TSMUX("1"))
    \App_rd_addr[13]_syn_6  (
    .ce(open_n64),
    .do({open_n65,open_n66,open_n67,open_n68}),
    .ipad(App_rd_addr[13]),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n69),
    .opclk(open_n70),
    .osclk(open_n71),
    .rst(open_n72),
    .ts(open_n73),
    .di(open_n74),
    .diq({open_n75,open_n76,open_n77,\u2_wrrd/app_rd_addr_1d [13]}),
    .opad(open_n78),
    .bpad(open_n79));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(30)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .SRMODE("ASYNC"),
    .TSMUX("1"))
    \App_rd_addr[14]_syn_6  (
    .ce(open_n80),
    .do({open_n81,open_n82,open_n83,open_n84}),
    .ipad(App_rd_addr[14]),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n85),
    .opclk(open_n86),
    .osclk(open_n87),
    .rst(open_n88),
    .ts(open_n89),
    .di(open_n90),
    .diq({open_n91,open_n92,open_n93,\u2_wrrd/app_rd_addr_1d [14]}),
    .opad(open_n94),
    .bpad(open_n95));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(30)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .SRMODE("ASYNC"),
    .TSMUX("1"))
    \App_rd_addr[15]_syn_6  (
    .ce(open_n96),
    .do({open_n97,open_n98,open_n99,open_n100}),
    .ipad(App_rd_addr[15]),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n101),
    .opclk(open_n102),
    .osclk(open_n103),
    .rst(open_n104),
    .ts(open_n105),
    .di(open_n106),
    .diq({open_n107,open_n108,open_n109,\u2_wrrd/app_rd_addr_1d [15]}),
    .opad(open_n110),
    .bpad(open_n111));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(30)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .SRMODE("ASYNC"),
    .TSMUX("1"))
    \App_rd_addr[16]_syn_6  (
    .ce(open_n112),
    .do({open_n113,open_n114,open_n115,open_n116}),
    .ipad(App_rd_addr[16]),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n117),
    .opclk(open_n118),
    .osclk(open_n119),
    .rst(open_n120),
    .ts(open_n121),
    .di(open_n122),
    .diq({open_n123,open_n124,open_n125,\u2_wrrd/app_rd_addr_1d [16]}),
    .opad(open_n126),
    .bpad(open_n127));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(30)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .SRMODE("ASYNC"),
    .TSMUX("1"))
    \App_rd_addr[17]_syn_6  (
    .ce(open_n128),
    .do({open_n129,open_n130,open_n131,open_n132}),
    .ipad(App_rd_addr[17]),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n133),
    .opclk(open_n134),
    .osclk(open_n135),
    .rst(open_n136),
    .ts(open_n137),
    .di(open_n138),
    .diq({open_n139,open_n140,open_n141,\u2_wrrd/app_rd_addr_1d [17]}),
    .opad(open_n142),
    .bpad(open_n143));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(30)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .SRMODE("ASYNC"),
    .TSMUX("1"))
    \App_rd_addr[18]_syn_6  (
    .ce(open_n144),
    .do({open_n145,open_n146,open_n147,open_n148}),
    .ipad(App_rd_addr[18]),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n149),
    .opclk(open_n150),
    .osclk(open_n151),
    .rst(open_n152),
    .ts(open_n153),
    .di(open_n154),
    .diq({open_n155,open_n156,open_n157,\u2_wrrd/app_rd_addr_1d [18]}),
    .opad(open_n158),
    .bpad(open_n159));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(30)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .SRMODE("ASYNC"),
    .TSMUX("1"))
    \App_rd_addr[19]_syn_6  (
    .ce(open_n160),
    .do({open_n161,open_n162,open_n163,open_n164}),
    .ipad(App_rd_addr[19]),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n165),
    .opclk(open_n166),
    .osclk(open_n167),
    .rst(open_n168),
    .ts(open_n169),
    .di(open_n170),
    .diq({open_n171,open_n172,open_n173,\u2_wrrd/app_rd_addr_1d [19]}),
    .opad(open_n174),
    .bpad(open_n175));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(30)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .SRMODE("ASYNC"),
    .TSMUX("1"))
    \App_rd_addr[1]_syn_6  (
    .ce(open_n176),
    .do({open_n177,open_n178,open_n179,open_n180}),
    .ipad(App_rd_addr[1]),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n181),
    .opclk(open_n182),
    .osclk(open_n183),
    .rst(open_n184),
    .ts(open_n185),
    .di(open_n186),
    .diq({open_n187,open_n188,open_n189,\u2_wrrd/app_rd_addr_1d [1]}),
    .opad(open_n190),
    .bpad(open_n191));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(30)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .SRMODE("ASYNC"),
    .TSMUX("1"))
    \App_rd_addr[20]_syn_6  (
    .ce(open_n192),
    .do({open_n193,open_n194,open_n195,open_n196}),
    .ipad(App_rd_addr[20]),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n197),
    .opclk(open_n198),
    .osclk(open_n199),
    .rst(open_n200),
    .ts(open_n201),
    .di(open_n202),
    .diq({open_n203,open_n204,open_n205,\u2_wrrd/app_rd_addr_1d [20]}),
    .opad(open_n206),
    .bpad(open_n207));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(30)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .SRMODE("ASYNC"),
    .TSMUX("1"))
    \App_rd_addr[2]_syn_6  (
    .ce(open_n208),
    .do({open_n209,open_n210,open_n211,open_n212}),
    .ipad(App_rd_addr[2]),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n213),
    .opclk(open_n214),
    .osclk(open_n215),
    .rst(open_n216),
    .ts(open_n217),
    .di(open_n218),
    .diq({open_n219,open_n220,open_n221,\u2_wrrd/app_rd_addr_1d [2]}),
    .opad(open_n222),
    .bpad(open_n223));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(30)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .SRMODE("ASYNC"),
    .TSMUX("1"))
    \App_rd_addr[3]_syn_6  (
    .ce(open_n224),
    .do({open_n225,open_n226,open_n227,open_n228}),
    .ipad(App_rd_addr[3]),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n229),
    .opclk(open_n230),
    .osclk(open_n231),
    .rst(open_n232),
    .ts(open_n233),
    .di(open_n234),
    .diq({open_n235,open_n236,open_n237,\u2_wrrd/app_rd_addr_1d [3]}),
    .opad(open_n238),
    .bpad(open_n239));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(30)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .SRMODE("ASYNC"),
    .TSMUX("1"))
    \App_rd_addr[4]_syn_6  (
    .ce(open_n240),
    .do({open_n241,open_n242,open_n243,open_n244}),
    .ipad(App_rd_addr[4]),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n245),
    .opclk(open_n246),
    .osclk(open_n247),
    .rst(open_n248),
    .ts(open_n249),
    .di(open_n250),
    .diq({open_n251,open_n252,open_n253,\u2_wrrd/app_rd_addr_1d [4]}),
    .opad(open_n254),
    .bpad(open_n255));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(30)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .SRMODE("ASYNC"),
    .TSMUX("1"))
    \App_rd_addr[5]_syn_6  (
    .ce(open_n256),
    .do({open_n257,open_n258,open_n259,open_n260}),
    .ipad(App_rd_addr[5]),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n261),
    .opclk(open_n262),
    .osclk(open_n263),
    .rst(open_n264),
    .ts(open_n265),
    .di(open_n266),
    .diq({open_n267,open_n268,open_n269,\u2_wrrd/app_rd_addr_1d [5]}),
    .opad(open_n270),
    .bpad(open_n271));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(30)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .SRMODE("ASYNC"),
    .TSMUX("1"))
    \App_rd_addr[6]_syn_6  (
    .ce(open_n272),
    .do({open_n273,open_n274,open_n275,open_n276}),
    .ipad(App_rd_addr[6]),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n277),
    .opclk(open_n278),
    .osclk(open_n279),
    .rst(open_n280),
    .ts(open_n281),
    .di(open_n282),
    .diq({open_n283,open_n284,open_n285,\u2_wrrd/app_rd_addr_1d [6]}),
    .opad(open_n286),
    .bpad(open_n287));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(30)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .SRMODE("ASYNC"),
    .TSMUX("1"))
    \App_rd_addr[7]_syn_6  (
    .ce(open_n288),
    .do({open_n289,open_n290,open_n291,open_n292}),
    .ipad(App_rd_addr[7]),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n293),
    .opclk(open_n294),
    .osclk(open_n295),
    .rst(open_n296),
    .ts(open_n297),
    .di(open_n298),
    .diq({open_n299,open_n300,open_n301,\u2_wrrd/app_rd_addr_1d [7]}),
    .opad(open_n302),
    .bpad(open_n303));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(30)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .SRMODE("ASYNC"),
    .TSMUX("1"))
    \App_rd_addr[8]_syn_6  (
    .ce(open_n304),
    .do({open_n305,open_n306,open_n307,open_n308}),
    .ipad(App_rd_addr[8]),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n309),
    .opclk(open_n310),
    .osclk(open_n311),
    .rst(open_n312),
    .ts(open_n313),
    .di(open_n314),
    .diq({open_n315,open_n316,open_n317,\u2_wrrd/app_rd_addr_1d [8]}),
    .opad(open_n318),
    .bpad(open_n319));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(30)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .SRMODE("ASYNC"),
    .TSMUX("1"))
    \App_rd_addr[9]_syn_6  (
    .ce(open_n320),
    .do({open_n321,open_n322,open_n323,open_n324}),
    .ipad(App_rd_addr[9]),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n325),
    .opclk(open_n326),
    .osclk(open_n327),
    .rst(open_n328),
    .ts(open_n329),
    .di(open_n330),
    .diq({open_n331,open_n332,open_n333,\u2_wrrd/app_rd_addr_1d [9]}),
    .opad(open_n334),
    .bpad(open_n335));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(30)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("RST"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .SRMODE("SYNC"),
    .TSMUX("1"))
    App_rd_en_syn_6 (
    .ce(open_n336),
    .do({open_n337,open_n338,open_n339,open_n340}),
    .ipad(App_rd_en),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n341),
    .opclk(open_n342),
    .osclk(open_n343),
    .rst(Rst_dup_177),
    .ts(open_n344),
    .di(App_rd_en_dup_5),
    .diq({open_n345,open_n346,open_n347,\u2_wrrd/app_rd_en_sft [0]}),
    .opad(open_n348),
    .bpad(open_n349));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(29)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    App_ref_req_syn_2 (
    .ce(open_n350),
    .do({open_n351,open_n352,open_n353,open_n354}),
    .ipad(App_ref_req),
    .ipclk(open_n355),
    .isclk(open_n356),
    .opclk(open_n357),
    .osclk(open_n358),
    .rst(open_n359),
    .ts(open_n360),
    .di(App_ref_req_dup_1),
    .diq({open_n361,open_n362,open_n363,open_n364}),
    .opad(open_n365),
    .bpad(open_n366));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(22)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .SRMODE("ASYNC"),
    .TSMUX("1"))
    \App_wr_addr[0]_syn_6  (
    .ce(open_n367),
    .do({open_n368,open_n369,open_n370,open_n371}),
    .ipad(App_wr_addr[0]),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n372),
    .opclk(open_n373),
    .osclk(open_n374),
    .rst(open_n375),
    .ts(open_n376),
    .di(open_n377),
    .diq({open_n378,open_n379,open_n380,\u2_wrrd/app_wr_addr_1d [0]}),
    .opad(open_n381),
    .bpad(open_n382));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(25)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .SRMODE("ASYNC"),
    .TSMUX("1"))
    \App_wr_addr[10]_syn_6  (
    .ce(open_n383),
    .do({open_n384,open_n385,open_n386,open_n387}),
    .ipad(App_wr_addr[10]),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n388),
    .opclk(open_n389),
    .osclk(open_n390),
    .rst(open_n391),
    .ts(open_n392),
    .di(open_n393),
    .diq({open_n394,open_n395,open_n396,\u2_wrrd/app_wr_addr_1d [10]}),
    .opad(open_n397),
    .bpad(open_n398));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(25)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .SRMODE("ASYNC"),
    .TSMUX("1"))
    \App_wr_addr[11]_syn_6  (
    .ce(open_n399),
    .do({open_n400,open_n401,open_n402,open_n403}),
    .ipad(App_wr_addr[11]),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n404),
    .opclk(open_n405),
    .osclk(open_n406),
    .rst(open_n407),
    .ts(open_n408),
    .di(open_n409),
    .diq({open_n410,open_n411,open_n412,\u2_wrrd/app_wr_addr_1d [11]}),
    .opad(open_n413),
    .bpad(open_n414));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(25)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .SRMODE("ASYNC"),
    .TSMUX("1"))
    \App_wr_addr[12]_syn_6  (
    .ce(open_n415),
    .do({open_n416,open_n417,open_n418,open_n419}),
    .ipad(App_wr_addr[12]),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n420),
    .opclk(open_n421),
    .osclk(open_n422),
    .rst(open_n423),
    .ts(open_n424),
    .di(open_n425),
    .diq({open_n426,open_n427,open_n428,\u2_wrrd/app_wr_addr_1d [12]}),
    .opad(open_n429),
    .bpad(open_n430));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(25)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .SRMODE("ASYNC"),
    .TSMUX("1"))
    \App_wr_addr[13]_syn_6  (
    .ce(open_n431),
    .do({open_n432,open_n433,open_n434,open_n435}),
    .ipad(App_wr_addr[13]),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n436),
    .opclk(open_n437),
    .osclk(open_n438),
    .rst(open_n439),
    .ts(open_n440),
    .di(open_n441),
    .diq({open_n442,open_n443,open_n444,\u2_wrrd/app_wr_addr_1d [13]}),
    .opad(open_n445),
    .bpad(open_n446));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(25)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .SRMODE("ASYNC"),
    .TSMUX("1"))
    \App_wr_addr[14]_syn_6  (
    .ce(open_n447),
    .do({open_n448,open_n449,open_n450,open_n451}),
    .ipad(App_wr_addr[14]),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n452),
    .opclk(open_n453),
    .osclk(open_n454),
    .rst(open_n455),
    .ts(open_n456),
    .di(open_n457),
    .diq({open_n458,open_n459,open_n460,\u2_wrrd/app_wr_addr_1d [14]}),
    .opad(open_n461),
    .bpad(open_n462));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(25)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .SRMODE("ASYNC"),
    .TSMUX("1"))
    \App_wr_addr[15]_syn_6  (
    .ce(open_n463),
    .do({open_n464,open_n465,open_n466,open_n467}),
    .ipad(App_wr_addr[15]),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n468),
    .opclk(open_n469),
    .osclk(open_n470),
    .rst(open_n471),
    .ts(open_n472),
    .di(open_n473),
    .diq({open_n474,open_n475,open_n476,\u2_wrrd/app_wr_addr_1d [15]}),
    .opad(open_n477),
    .bpad(open_n478));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(25)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .SRMODE("ASYNC"),
    .TSMUX("1"))
    \App_wr_addr[16]_syn_6  (
    .ce(open_n479),
    .do({open_n480,open_n481,open_n482,open_n483}),
    .ipad(App_wr_addr[16]),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n484),
    .opclk(open_n485),
    .osclk(open_n486),
    .rst(open_n487),
    .ts(open_n488),
    .di(open_n489),
    .diq({open_n490,open_n491,open_n492,\u2_wrrd/app_wr_addr_1d [16]}),
    .opad(open_n493),
    .bpad(open_n494));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(25)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .SRMODE("ASYNC"),
    .TSMUX("1"))
    \App_wr_addr[17]_syn_6  (
    .ce(open_n495),
    .do({open_n496,open_n497,open_n498,open_n499}),
    .ipad(App_wr_addr[17]),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n500),
    .opclk(open_n501),
    .osclk(open_n502),
    .rst(open_n503),
    .ts(open_n504),
    .di(open_n505),
    .diq({open_n506,open_n507,open_n508,\u2_wrrd/app_wr_addr_1d [17]}),
    .opad(open_n509),
    .bpad(open_n510));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(25)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .SRMODE("ASYNC"),
    .TSMUX("1"))
    \App_wr_addr[18]_syn_6  (
    .ce(open_n511),
    .do({open_n512,open_n513,open_n514,open_n515}),
    .ipad(App_wr_addr[18]),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n516),
    .opclk(open_n517),
    .osclk(open_n518),
    .rst(open_n519),
    .ts(open_n520),
    .di(open_n521),
    .diq({open_n522,open_n523,open_n524,\u2_wrrd/app_wr_addr_1d [18]}),
    .opad(open_n525),
    .bpad(open_n526));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(25)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .SRMODE("ASYNC"),
    .TSMUX("1"))
    \App_wr_addr[19]_syn_6  (
    .ce(open_n527),
    .do({open_n528,open_n529,open_n530,open_n531}),
    .ipad(App_wr_addr[19]),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n532),
    .opclk(open_n533),
    .osclk(open_n534),
    .rst(open_n535),
    .ts(open_n536),
    .di(open_n537),
    .diq({open_n538,open_n539,open_n540,\u2_wrrd/app_wr_addr_1d [19]}),
    .opad(open_n541),
    .bpad(open_n542));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(25)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .SRMODE("ASYNC"),
    .TSMUX("1"))
    \App_wr_addr[1]_syn_6  (
    .ce(open_n543),
    .do({open_n544,open_n545,open_n546,open_n547}),
    .ipad(App_wr_addr[1]),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n548),
    .opclk(open_n549),
    .osclk(open_n550),
    .rst(open_n551),
    .ts(open_n552),
    .di(open_n553),
    .diq({open_n554,open_n555,open_n556,\u2_wrrd/app_wr_addr_1d [1]}),
    .opad(open_n557),
    .bpad(open_n558));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(25)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .SRMODE("ASYNC"),
    .TSMUX("1"))
    \App_wr_addr[20]_syn_6  (
    .ce(open_n559),
    .do({open_n560,open_n561,open_n562,open_n563}),
    .ipad(App_wr_addr[20]),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n564),
    .opclk(open_n565),
    .osclk(open_n566),
    .rst(open_n567),
    .ts(open_n568),
    .di(open_n569),
    .diq({open_n570,open_n571,open_n572,\u2_wrrd/app_wr_addr_1d [20]}),
    .opad(open_n573),
    .bpad(open_n574));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(25)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .SRMODE("ASYNC"),
    .TSMUX("1"))
    \App_wr_addr[2]_syn_6  (
    .ce(open_n575),
    .do({open_n576,open_n577,open_n578,open_n579}),
    .ipad(App_wr_addr[2]),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n580),
    .opclk(open_n581),
    .osclk(open_n582),
    .rst(open_n583),
    .ts(open_n584),
    .di(open_n585),
    .diq({open_n586,open_n587,open_n588,\u2_wrrd/app_wr_addr_1d [2]}),
    .opad(open_n589),
    .bpad(open_n590));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(25)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .SRMODE("ASYNC"),
    .TSMUX("1"))
    \App_wr_addr[3]_syn_6  (
    .ce(open_n591),
    .do({open_n592,open_n593,open_n594,open_n595}),
    .ipad(App_wr_addr[3]),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n596),
    .opclk(open_n597),
    .osclk(open_n598),
    .rst(open_n599),
    .ts(open_n600),
    .di(open_n601),
    .diq({open_n602,open_n603,open_n604,\u2_wrrd/app_wr_addr_1d [3]}),
    .opad(open_n605),
    .bpad(open_n606));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(25)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .SRMODE("ASYNC"),
    .TSMUX("1"))
    \App_wr_addr[4]_syn_6  (
    .ce(open_n607),
    .do({open_n608,open_n609,open_n610,open_n611}),
    .ipad(App_wr_addr[4]),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n612),
    .opclk(open_n613),
    .osclk(open_n614),
    .rst(open_n615),
    .ts(open_n616),
    .di(open_n617),
    .diq({open_n618,open_n619,open_n620,\u2_wrrd/app_wr_addr_1d [4]}),
    .opad(open_n621),
    .bpad(open_n622));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(25)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .SRMODE("ASYNC"),
    .TSMUX("1"))
    \App_wr_addr[5]_syn_6  (
    .ce(open_n623),
    .do({open_n624,open_n625,open_n626,open_n627}),
    .ipad(App_wr_addr[5]),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n628),
    .opclk(open_n629),
    .osclk(open_n630),
    .rst(open_n631),
    .ts(open_n632),
    .di(open_n633),
    .diq({open_n634,open_n635,open_n636,\u2_wrrd/app_wr_addr_1d [5]}),
    .opad(open_n637),
    .bpad(open_n638));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(25)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .SRMODE("ASYNC"),
    .TSMUX("1"))
    \App_wr_addr[6]_syn_6  (
    .ce(open_n639),
    .do({open_n640,open_n641,open_n642,open_n643}),
    .ipad(App_wr_addr[6]),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n644),
    .opclk(open_n645),
    .osclk(open_n646),
    .rst(open_n647),
    .ts(open_n648),
    .di(open_n649),
    .diq({open_n650,open_n651,open_n652,\u2_wrrd/app_wr_addr_1d [6]}),
    .opad(open_n653),
    .bpad(open_n654));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(25)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .SRMODE("ASYNC"),
    .TSMUX("1"))
    \App_wr_addr[7]_syn_6  (
    .ce(open_n655),
    .do({open_n656,open_n657,open_n658,open_n659}),
    .ipad(App_wr_addr[7]),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n660),
    .opclk(open_n661),
    .osclk(open_n662),
    .rst(open_n663),
    .ts(open_n664),
    .di(open_n665),
    .diq({open_n666,open_n667,open_n668,\u2_wrrd/app_wr_addr_1d [7]}),
    .opad(open_n669),
    .bpad(open_n670));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(25)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .SRMODE("ASYNC"),
    .TSMUX("1"))
    \App_wr_addr[8]_syn_6  (
    .ce(open_n671),
    .do({open_n672,open_n673,open_n674,open_n675}),
    .ipad(App_wr_addr[8]),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n676),
    .opclk(open_n677),
    .osclk(open_n678),
    .rst(open_n679),
    .ts(open_n680),
    .di(open_n681),
    .diq({open_n682,open_n683,open_n684,\u2_wrrd/app_wr_addr_1d [8]}),
    .opad(open_n685),
    .bpad(open_n686));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(25)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .SRMODE("ASYNC"),
    .TSMUX("1"))
    \App_wr_addr[9]_syn_6  (
    .ce(open_n687),
    .do({open_n688,open_n689,open_n690,open_n691}),
    .ipad(App_wr_addr[9]),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n692),
    .opclk(open_n693),
    .osclk(open_n694),
    .rst(open_n695),
    .ts(open_n696),
    .di(open_n697),
    .diq({open_n698,open_n699,open_n700,\u2_wrrd/app_wr_addr_1d [9]}),
    .opad(open_n701),
    .bpad(open_n702));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(25)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .SRMODE("ASYNC"),
    .TSMUX("1"))
    \App_wr_din[0]_syn_6  (
    .ce(open_n703),
    .do({open_n704,open_n705,open_n706,open_n707}),
    .ipad(App_wr_din[0]),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n708),
    .opclk(open_n709),
    .osclk(open_n710),
    .rst(open_n711),
    .ts(open_n712),
    .di(open_n713),
    .diq({open_n714,open_n715,open_n716,\u2_wrrd/app_wr_din_1d [0]}),
    .opad(open_n717),
    .bpad(open_n718));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(27)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .SRMODE("ASYNC"),
    .TSMUX("1"))
    \App_wr_din[10]_syn_6  (
    .ce(open_n719),
    .do({open_n720,open_n721,open_n722,open_n723}),
    .ipad(App_wr_din[10]),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n724),
    .opclk(open_n725),
    .osclk(open_n726),
    .rst(open_n727),
    .ts(open_n728),
    .di(open_n729),
    .diq({open_n730,open_n731,open_n732,\u2_wrrd/app_wr_din_1d [10]}),
    .opad(open_n733),
    .bpad(open_n734));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(27)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .SRMODE("ASYNC"),
    .TSMUX("1"))
    \App_wr_din[11]_syn_6  (
    .ce(open_n735),
    .do({open_n736,open_n737,open_n738,open_n739}),
    .ipad(App_wr_din[11]),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n740),
    .opclk(open_n741),
    .osclk(open_n742),
    .rst(open_n743),
    .ts(open_n744),
    .di(open_n745),
    .diq({open_n746,open_n747,open_n748,\u2_wrrd/app_wr_din_1d [11]}),
    .opad(open_n749),
    .bpad(open_n750));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(27)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .SRMODE("ASYNC"),
    .TSMUX("1"))
    \App_wr_din[12]_syn_6  (
    .ce(open_n751),
    .do({open_n752,open_n753,open_n754,open_n755}),
    .ipad(App_wr_din[12]),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n756),
    .opclk(open_n757),
    .osclk(open_n758),
    .rst(open_n759),
    .ts(open_n760),
    .di(open_n761),
    .diq({open_n762,open_n763,open_n764,\u2_wrrd/app_wr_din_1d [12]}),
    .opad(open_n765),
    .bpad(open_n766));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(27)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .SRMODE("ASYNC"),
    .TSMUX("1"))
    \App_wr_din[13]_syn_6  (
    .ce(open_n767),
    .do({open_n768,open_n769,open_n770,open_n771}),
    .ipad(App_wr_din[13]),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n772),
    .opclk(open_n773),
    .osclk(open_n774),
    .rst(open_n775),
    .ts(open_n776),
    .di(open_n777),
    .diq({open_n778,open_n779,open_n780,\u2_wrrd/app_wr_din_1d [13]}),
    .opad(open_n781),
    .bpad(open_n782));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(27)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .SRMODE("ASYNC"),
    .TSMUX("1"))
    \App_wr_din[14]_syn_6  (
    .ce(open_n783),
    .do({open_n784,open_n785,open_n786,open_n787}),
    .ipad(App_wr_din[14]),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n788),
    .opclk(open_n789),
    .osclk(open_n790),
    .rst(open_n791),
    .ts(open_n792),
    .di(open_n793),
    .diq({open_n794,open_n795,open_n796,\u2_wrrd/app_wr_din_1d [14]}),
    .opad(open_n797),
    .bpad(open_n798));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(27)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .SRMODE("ASYNC"),
    .TSMUX("1"))
    \App_wr_din[15]_syn_6  (
    .ce(open_n799),
    .do({open_n800,open_n801,open_n802,open_n803}),
    .ipad(App_wr_din[15]),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n804),
    .opclk(open_n805),
    .osclk(open_n806),
    .rst(open_n807),
    .ts(open_n808),
    .di(open_n809),
    .diq({open_n810,open_n811,open_n812,\u2_wrrd/app_wr_din_1d [15]}),
    .opad(open_n813),
    .bpad(open_n814));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(27)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .SRMODE("ASYNC"),
    .TSMUX("1"))
    \App_wr_din[16]_syn_6  (
    .ce(open_n815),
    .do({open_n816,open_n817,open_n818,open_n819}),
    .ipad(App_wr_din[16]),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n820),
    .opclk(open_n821),
    .osclk(open_n822),
    .rst(open_n823),
    .ts(open_n824),
    .di(open_n825),
    .diq({open_n826,open_n827,open_n828,\u2_wrrd/app_wr_din_1d [16]}),
    .opad(open_n829),
    .bpad(open_n830));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(27)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .SRMODE("ASYNC"),
    .TSMUX("1"))
    \App_wr_din[17]_syn_6  (
    .ce(open_n831),
    .do({open_n832,open_n833,open_n834,open_n835}),
    .ipad(App_wr_din[17]),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n836),
    .opclk(open_n837),
    .osclk(open_n838),
    .rst(open_n839),
    .ts(open_n840),
    .di(open_n841),
    .diq({open_n842,open_n843,open_n844,\u2_wrrd/app_wr_din_1d [17]}),
    .opad(open_n845),
    .bpad(open_n846));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(27)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .SRMODE("ASYNC"),
    .TSMUX("1"))
    \App_wr_din[18]_syn_6  (
    .ce(open_n847),
    .do({open_n848,open_n849,open_n850,open_n851}),
    .ipad(App_wr_din[18]),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n852),
    .opclk(open_n853),
    .osclk(open_n854),
    .rst(open_n855),
    .ts(open_n856),
    .di(open_n857),
    .diq({open_n858,open_n859,open_n860,\u2_wrrd/app_wr_din_1d [18]}),
    .opad(open_n861),
    .bpad(open_n862));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(27)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .SRMODE("ASYNC"),
    .TSMUX("1"))
    \App_wr_din[19]_syn_6  (
    .ce(open_n863),
    .do({open_n864,open_n865,open_n866,open_n867}),
    .ipad(App_wr_din[19]),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n868),
    .opclk(open_n869),
    .osclk(open_n870),
    .rst(open_n871),
    .ts(open_n872),
    .di(open_n873),
    .diq({open_n874,open_n875,open_n876,\u2_wrrd/app_wr_din_1d [19]}),
    .opad(open_n877),
    .bpad(open_n878));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(27)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .SRMODE("ASYNC"),
    .TSMUX("1"))
    \App_wr_din[1]_syn_6  (
    .ce(open_n879),
    .do({open_n880,open_n881,open_n882,open_n883}),
    .ipad(App_wr_din[1]),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n884),
    .opclk(open_n885),
    .osclk(open_n886),
    .rst(open_n887),
    .ts(open_n888),
    .di(open_n889),
    .diq({open_n890,open_n891,open_n892,\u2_wrrd/app_wr_din_1d [1]}),
    .opad(open_n893),
    .bpad(open_n894));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(27)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .SRMODE("ASYNC"),
    .TSMUX("1"))
    \App_wr_din[20]_syn_6  (
    .ce(open_n895),
    .do({open_n896,open_n897,open_n898,open_n899}),
    .ipad(App_wr_din[20]),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n900),
    .opclk(open_n901),
    .osclk(open_n902),
    .rst(open_n903),
    .ts(open_n904),
    .di(open_n905),
    .diq({open_n906,open_n907,open_n908,\u2_wrrd/app_wr_din_1d [20]}),
    .opad(open_n909),
    .bpad(open_n910));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(27)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .SRMODE("ASYNC"),
    .TSMUX("1"))
    \App_wr_din[21]_syn_6  (
    .ce(open_n911),
    .do({open_n912,open_n913,open_n914,open_n915}),
    .ipad(App_wr_din[21]),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n916),
    .opclk(open_n917),
    .osclk(open_n918),
    .rst(open_n919),
    .ts(open_n920),
    .di(open_n921),
    .diq({open_n922,open_n923,open_n924,\u2_wrrd/app_wr_din_1d [21]}),
    .opad(open_n925),
    .bpad(open_n926));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(27)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .SRMODE("ASYNC"),
    .TSMUX("1"))
    \App_wr_din[22]_syn_6  (
    .ce(open_n927),
    .do({open_n928,open_n929,open_n930,open_n931}),
    .ipad(App_wr_din[22]),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n932),
    .opclk(open_n933),
    .osclk(open_n934),
    .rst(open_n935),
    .ts(open_n936),
    .di(open_n937),
    .diq({open_n938,open_n939,open_n940,\u2_wrrd/app_wr_din_1d [22]}),
    .opad(open_n941),
    .bpad(open_n942));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(27)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .SRMODE("ASYNC"),
    .TSMUX("1"))
    \App_wr_din[23]_syn_6  (
    .ce(open_n943),
    .do({open_n944,open_n945,open_n946,open_n947}),
    .ipad(App_wr_din[23]),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n948),
    .opclk(open_n949),
    .osclk(open_n950),
    .rst(open_n951),
    .ts(open_n952),
    .di(open_n953),
    .diq({open_n954,open_n955,open_n956,\u2_wrrd/app_wr_din_1d [23]}),
    .opad(open_n957),
    .bpad(open_n958));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(27)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .SRMODE("ASYNC"),
    .TSMUX("1"))
    \App_wr_din[24]_syn_6  (
    .ce(open_n959),
    .do({open_n960,open_n961,open_n962,open_n963}),
    .ipad(App_wr_din[24]),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n964),
    .opclk(open_n965),
    .osclk(open_n966),
    .rst(open_n967),
    .ts(open_n968),
    .di(open_n969),
    .diq({open_n970,open_n971,open_n972,\u2_wrrd/app_wr_din_1d [24]}),
    .opad(open_n973),
    .bpad(open_n974));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(27)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .SRMODE("ASYNC"),
    .TSMUX("1"))
    \App_wr_din[25]_syn_6  (
    .ce(open_n975),
    .do({open_n976,open_n977,open_n978,open_n979}),
    .ipad(App_wr_din[25]),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n980),
    .opclk(open_n981),
    .osclk(open_n982),
    .rst(open_n983),
    .ts(open_n984),
    .di(open_n985),
    .diq({open_n986,open_n987,open_n988,\u2_wrrd/app_wr_din_1d [25]}),
    .opad(open_n989),
    .bpad(open_n990));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(27)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .SRMODE("ASYNC"),
    .TSMUX("1"))
    \App_wr_din[26]_syn_6  (
    .ce(open_n991),
    .do({open_n992,open_n993,open_n994,open_n995}),
    .ipad(App_wr_din[26]),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n996),
    .opclk(open_n997),
    .osclk(open_n998),
    .rst(open_n999),
    .ts(open_n1000),
    .di(open_n1001),
    .diq({open_n1002,open_n1003,open_n1004,\u2_wrrd/app_wr_din_1d [26]}),
    .opad(open_n1005),
    .bpad(open_n1006));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(27)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .SRMODE("ASYNC"),
    .TSMUX("1"))
    \App_wr_din[27]_syn_6  (
    .ce(open_n1007),
    .do({open_n1008,open_n1009,open_n1010,open_n1011}),
    .ipad(App_wr_din[27]),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n1012),
    .opclk(open_n1013),
    .osclk(open_n1014),
    .rst(open_n1015),
    .ts(open_n1016),
    .di(open_n1017),
    .diq({open_n1018,open_n1019,open_n1020,\u2_wrrd/app_wr_din_1d [27]}),
    .opad(open_n1021),
    .bpad(open_n1022));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(27)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .SRMODE("ASYNC"),
    .TSMUX("1"))
    \App_wr_din[28]_syn_6  (
    .ce(open_n1023),
    .do({open_n1024,open_n1025,open_n1026,open_n1027}),
    .ipad(App_wr_din[28]),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n1028),
    .opclk(open_n1029),
    .osclk(open_n1030),
    .rst(open_n1031),
    .ts(open_n1032),
    .di(open_n1033),
    .diq({open_n1034,open_n1035,open_n1036,\u2_wrrd/app_wr_din_1d [28]}),
    .opad(open_n1037),
    .bpad(open_n1038));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(27)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .SRMODE("ASYNC"),
    .TSMUX("1"))
    \App_wr_din[29]_syn_6  (
    .ce(open_n1039),
    .do({open_n1040,open_n1041,open_n1042,open_n1043}),
    .ipad(App_wr_din[29]),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n1044),
    .opclk(open_n1045),
    .osclk(open_n1046),
    .rst(open_n1047),
    .ts(open_n1048),
    .di(open_n1049),
    .diq({open_n1050,open_n1051,open_n1052,\u2_wrrd/app_wr_din_1d [29]}),
    .opad(open_n1053),
    .bpad(open_n1054));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(27)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .SRMODE("ASYNC"),
    .TSMUX("1"))
    \App_wr_din[2]_syn_6  (
    .ce(open_n1055),
    .do({open_n1056,open_n1057,open_n1058,open_n1059}),
    .ipad(App_wr_din[2]),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n1060),
    .opclk(open_n1061),
    .osclk(open_n1062),
    .rst(open_n1063),
    .ts(open_n1064),
    .di(open_n1065),
    .diq({open_n1066,open_n1067,open_n1068,\u2_wrrd/app_wr_din_1d [2]}),
    .opad(open_n1069),
    .bpad(open_n1070));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(27)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .SRMODE("ASYNC"),
    .TSMUX("1"))
    \App_wr_din[30]_syn_6  (
    .ce(open_n1071),
    .do({open_n1072,open_n1073,open_n1074,open_n1075}),
    .ipad(App_wr_din[30]),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n1076),
    .opclk(open_n1077),
    .osclk(open_n1078),
    .rst(open_n1079),
    .ts(open_n1080),
    .di(open_n1081),
    .diq({open_n1082,open_n1083,open_n1084,\u2_wrrd/app_wr_din_1d [30]}),
    .opad(open_n1085),
    .bpad(open_n1086));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(27)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .SRMODE("ASYNC"),
    .TSMUX("1"))
    \App_wr_din[31]_syn_6  (
    .ce(open_n1087),
    .do({open_n1088,open_n1089,open_n1090,open_n1091}),
    .ipad(App_wr_din[31]),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n1092),
    .opclk(open_n1093),
    .osclk(open_n1094),
    .rst(open_n1095),
    .ts(open_n1096),
    .di(open_n1097),
    .diq({open_n1098,open_n1099,open_n1100,\u2_wrrd/app_wr_din_1d [31]}),
    .opad(open_n1101),
    .bpad(open_n1102));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(27)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .SRMODE("ASYNC"),
    .TSMUX("1"))
    \App_wr_din[3]_syn_6  (
    .ce(open_n1103),
    .do({open_n1104,open_n1105,open_n1106,open_n1107}),
    .ipad(App_wr_din[3]),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n1108),
    .opclk(open_n1109),
    .osclk(open_n1110),
    .rst(open_n1111),
    .ts(open_n1112),
    .di(open_n1113),
    .diq({open_n1114,open_n1115,open_n1116,\u2_wrrd/app_wr_din_1d [3]}),
    .opad(open_n1117),
    .bpad(open_n1118));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(27)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .SRMODE("ASYNC"),
    .TSMUX("1"))
    \App_wr_din[4]_syn_6  (
    .ce(open_n1119),
    .do({open_n1120,open_n1121,open_n1122,open_n1123}),
    .ipad(App_wr_din[4]),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n1124),
    .opclk(open_n1125),
    .osclk(open_n1126),
    .rst(open_n1127),
    .ts(open_n1128),
    .di(open_n1129),
    .diq({open_n1130,open_n1131,open_n1132,\u2_wrrd/app_wr_din_1d [4]}),
    .opad(open_n1133),
    .bpad(open_n1134));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(27)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .SRMODE("ASYNC"),
    .TSMUX("1"))
    \App_wr_din[5]_syn_6  (
    .ce(open_n1135),
    .do({open_n1136,open_n1137,open_n1138,open_n1139}),
    .ipad(App_wr_din[5]),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n1140),
    .opclk(open_n1141),
    .osclk(open_n1142),
    .rst(open_n1143),
    .ts(open_n1144),
    .di(open_n1145),
    .diq({open_n1146,open_n1147,open_n1148,\u2_wrrd/app_wr_din_1d [5]}),
    .opad(open_n1149),
    .bpad(open_n1150));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(27)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .SRMODE("ASYNC"),
    .TSMUX("1"))
    \App_wr_din[6]_syn_6  (
    .ce(open_n1151),
    .do({open_n1152,open_n1153,open_n1154,open_n1155}),
    .ipad(App_wr_din[6]),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n1156),
    .opclk(open_n1157),
    .osclk(open_n1158),
    .rst(open_n1159),
    .ts(open_n1160),
    .di(open_n1161),
    .diq({open_n1162,open_n1163,open_n1164,\u2_wrrd/app_wr_din_1d [6]}),
    .opad(open_n1165),
    .bpad(open_n1166));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(27)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .SRMODE("ASYNC"),
    .TSMUX("1"))
    \App_wr_din[7]_syn_6  (
    .ce(open_n1167),
    .do({open_n1168,open_n1169,open_n1170,open_n1171}),
    .ipad(App_wr_din[7]),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n1172),
    .opclk(open_n1173),
    .osclk(open_n1174),
    .rst(open_n1175),
    .ts(open_n1176),
    .di(open_n1177),
    .diq({open_n1178,open_n1179,open_n1180,\u2_wrrd/app_wr_din_1d [7]}),
    .opad(open_n1181),
    .bpad(open_n1182));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(27)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .SRMODE("ASYNC"),
    .TSMUX("1"))
    \App_wr_din[8]_syn_6  (
    .ce(open_n1183),
    .do({open_n1184,open_n1185,open_n1186,open_n1187}),
    .ipad(App_wr_din[8]),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n1188),
    .opclk(open_n1189),
    .osclk(open_n1190),
    .rst(open_n1191),
    .ts(open_n1192),
    .di(open_n1193),
    .diq({open_n1194,open_n1195,open_n1196,\u2_wrrd/app_wr_din_1d [8]}),
    .opad(open_n1197),
    .bpad(open_n1198));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(27)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .SRMODE("ASYNC"),
    .TSMUX("1"))
    \App_wr_din[9]_syn_6  (
    .ce(open_n1199),
    .do({open_n1200,open_n1201,open_n1202,open_n1203}),
    .ipad(App_wr_din[9]),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n1204),
    .opclk(open_n1205),
    .osclk(open_n1206),
    .rst(open_n1207),
    .ts(open_n1208),
    .di(open_n1209),
    .diq({open_n1210,open_n1211,open_n1212,\u2_wrrd/app_wr_din_1d [9]}),
    .opad(open_n1213),
    .bpad(open_n1214));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(27)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .SRMODE("ASYNC"),
    .TSMUX("1"))
    \App_wr_dm[0]_syn_6  (
    .ce(open_n1215),
    .do({open_n1216,open_n1217,open_n1218,open_n1219}),
    .ipad(App_wr_dm[0]),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n1220),
    .opclk(open_n1221),
    .osclk(open_n1222),
    .rst(open_n1223),
    .ts(open_n1224),
    .di(open_n1225),
    .diq({open_n1226,open_n1227,open_n1228,\u2_wrrd/app_wr_dm_1d [0]}),
    .opad(open_n1229),
    .bpad(open_n1230));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(26)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .SRMODE("ASYNC"),
    .TSMUX("1"))
    \App_wr_dm[1]_syn_6  (
    .ce(open_n1231),
    .do({open_n1232,open_n1233,open_n1234,open_n1235}),
    .ipad(App_wr_dm[1]),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n1236),
    .opclk(open_n1237),
    .osclk(open_n1238),
    .rst(open_n1239),
    .ts(open_n1240),
    .di(open_n1241),
    .diq({open_n1242,open_n1243,open_n1244,\u2_wrrd/app_wr_dm_1d [1]}),
    .opad(open_n1245),
    .bpad(open_n1246));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(26)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .SRMODE("ASYNC"),
    .TSMUX("1"))
    \App_wr_dm[2]_syn_6  (
    .ce(open_n1247),
    .do({open_n1248,open_n1249,open_n1250,open_n1251}),
    .ipad(App_wr_dm[2]),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n1252),
    .opclk(open_n1253),
    .osclk(open_n1254),
    .rst(open_n1255),
    .ts(open_n1256),
    .di(open_n1257),
    .diq({open_n1258,open_n1259,open_n1260,\u2_wrrd/app_wr_dm_1d [2]}),
    .opad(open_n1261),
    .bpad(open_n1262));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(26)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .SRMODE("ASYNC"),
    .TSMUX("1"))
    \App_wr_dm[3]_syn_6  (
    .ce(open_n1263),
    .do({open_n1264,open_n1265,open_n1266,open_n1267}),
    .ipad(App_wr_dm[3]),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n1268),
    .opclk(open_n1269),
    .osclk(open_n1270),
    .rst(open_n1271),
    .ts(open_n1272),
    .di(open_n1273),
    .diq({open_n1274,open_n1275,open_n1276,\u2_wrrd/app_wr_dm_1d [3]}),
    .opad(open_n1277),
    .bpad(open_n1278));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(26)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("RST"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .SRMODE("SYNC"),
    .TSMUX("1"))
    App_wr_en_syn_6 (
    .ce(open_n1279),
    .do({open_n1280,open_n1281,open_n1282,open_n1283}),
    .ipad(App_wr_en),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n1284),
    .opclk(open_n1285),
    .osclk(open_n1286),
    .rst(Rst_dup_177),
    .ts(open_n1287),
    .di(App_wr_en_dup_5),
    .diq({open_n1288,open_n1289,open_n1290,\u2_wrrd/app_wr_en_sft [0]}),
    .opad(open_n1291),
    .bpad(open_n1292));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(24)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    Rst_syn_178 (
    .ce(open_n1293),
    .do({open_n1294,open_n1295,open_n1296,open_n1297}),
    .ipad(Rst),
    .ipclk(open_n1298),
    .isclk(open_n1299),
    .opclk(open_n1300),
    .osclk(open_n1301),
    .rst(open_n1302),
    .ts(open_n1303),
    .di(Rst_dup_177),
    .diq({open_n1304,open_n1305,open_n1306,open_n1307}),
    .opad(open_n1308),
    .bpad(open_n1309));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(16)
  buf SDRAM_CLK_syn_1 (SDRAM_CLK_dup_3, Sdr_clk_sft_dup_1);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(35)
  EG_PHY_PAD #(
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    SDRAM_CLK_syn_4 (
    .ce(open_n1310),
    .do({open_n1311,open_n1312,open_n1313,SDRAM_CLK_dup_3}),
    .ipad(open_n1314),
    .ipclk(open_n1315),
    .isclk(open_n1316),
    .opclk(open_n1317),
    .osclk(open_n1318),
    .rst(open_n1319),
    .ts(open_n1320),
    .di(open_n1321),
    .diq({open_n1322,open_n1323,open_n1324,open_n1325}),
    .opad(SDRAM_CLK),
    .bpad(open_n1326));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(35)
  EG_PHY_PAD #(
    //.SLEWRATE("SLOW"),
    .DO_DFFMODE("FF"),
    .DO_REGSET("RESET"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .ODDRMODE("OFF"),
    .OUTCEMUX("1"),
    .OUTRSTMUX("INV"),
    .OUTSCLKMUX("CLK"),
    .SRMODE("SYNC"),
    .TSMUX("0"))
    \SDR_ADDR[0]_syn_6  (
    .ce(open_n1327),
    .do({open_n1328,open_n1329,open_n1330,\u2_wrrd/addr [0]}),
    .ipad(open_n1331),
    .ipclk(open_n1332),
    .isclk(open_n1333),
    .opclk(open_n1334),
    .osclk(Sdr_clk_dup_1),
    .rst(\u2_wrrd/rw_vld ),
    .ts(open_n1335),
    .di(open_n1336),
    .diq({open_n1337,open_n1338,open_n1339,open_n1340}),
    .opad(SDR_ADDR[0]),
    .bpad(open_n1341));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(40)
  EG_PHY_PAD #(
    //.SLEWRATE("SLOW"),
    .DO_DFFMODE("FF"),
    .DO_REGSET("RESET"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .ODDRMODE("OFF"),
    .OUTCEMUX("1"),
    .OUTRSTMUX("0"),
    .OUTSCLKMUX("CLK"),
    .SRMODE("ASYNC"),
    .TSMUX("0"))
    \SDR_ADDR[10]_syn_6  (
    .ce(open_n1342),
    .do({open_n1343,open_n1344,open_n1345,\u2_wrrd/SDR_ADDR_b [10]}),
    .ipad(open_n1346),
    .ipclk(open_n1347),
    .isclk(open_n1348),
    .opclk(open_n1349),
    .osclk(Sdr_clk_dup_1),
    .rst(open_n1350),
    .ts(open_n1351),
    .di(open_n1352),
    .diq({open_n1353,open_n1354,open_n1355,open_n1356}),
    .opad(SDR_ADDR[10]),
    .bpad(open_n1357));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(40)
  EG_PHY_PAD #(
    //.SLEWRATE("SLOW"),
    .DO_DFFMODE("FF"),
    .DO_REGSET("RESET"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .ODDRMODE("OFF"),
    .OUTCEMUX("1"),
    .OUTRSTMUX("0"),
    .OUTSCLKMUX("CLK"),
    .SRMODE("ASYNC"),
    .TSMUX("0"))
    \SDR_ADDR[1]_syn_6  (
    .ce(open_n1358),
    .do({open_n1359,open_n1360,open_n1361,\u2_wrrd/SDR_ADDR_b [1]}),
    .ipad(open_n1362),
    .ipclk(open_n1363),
    .isclk(open_n1364),
    .opclk(open_n1365),
    .osclk(Sdr_clk_dup_1),
    .rst(open_n1366),
    .ts(open_n1367),
    .di(open_n1368),
    .diq({open_n1369,open_n1370,open_n1371,open_n1372}),
    .opad(SDR_ADDR[1]),
    .bpad(open_n1373));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(40)
  EG_PHY_PAD #(
    //.SLEWRATE("SLOW"),
    .DO_DFFMODE("FF"),
    .DO_REGSET("RESET"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .ODDRMODE("OFF"),
    .OUTCEMUX("1"),
    .OUTRSTMUX("INV"),
    .OUTSCLKMUX("CLK"),
    .SRMODE("SYNC"),
    .TSMUX("0"))
    \SDR_ADDR[2]_syn_6  (
    .ce(open_n1374),
    .do({open_n1375,open_n1376,open_n1377,\u2_wrrd/addr [2]}),
    .ipad(open_n1378),
    .ipclk(open_n1379),
    .isclk(open_n1380),
    .opclk(open_n1381),
    .osclk(Sdr_clk_dup_1),
    .rst(\u2_wrrd/rw_vld ),
    .ts(open_n1382),
    .di(open_n1383),
    .diq({open_n1384,open_n1385,open_n1386,open_n1387}),
    .opad(SDR_ADDR[2]),
    .bpad(open_n1388));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(40)
  EG_PHY_PAD #(
    //.SLEWRATE("SLOW"),
    .DO_DFFMODE("FF"),
    .DO_REGSET("RESET"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .ODDRMODE("OFF"),
    .OUTCEMUX("1"),
    .OUTRSTMUX("INV"),
    .OUTSCLKMUX("CLK"),
    .SRMODE("SYNC"),
    .TSMUX("0"))
    \SDR_ADDR[3]_syn_6  (
    .ce(open_n1389),
    .do({open_n1390,open_n1391,open_n1392,\u2_wrrd/addr [3]}),
    .ipad(open_n1393),
    .ipclk(open_n1394),
    .isclk(open_n1395),
    .opclk(open_n1396),
    .osclk(Sdr_clk_dup_1),
    .rst(\u2_wrrd/rw_vld ),
    .ts(open_n1397),
    .di(open_n1398),
    .diq({open_n1399,open_n1400,open_n1401,open_n1402}),
    .opad(SDR_ADDR[3]),
    .bpad(open_n1403));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(40)
  EG_PHY_PAD #(
    //.SLEWRATE("SLOW"),
    .DO_DFFMODE("FF"),
    .DO_REGSET("RESET"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .ODDRMODE("OFF"),
    .OUTCEMUX("1"),
    .OUTRSTMUX("0"),
    .OUTSCLKMUX("CLK"),
    .SRMODE("ASYNC"),
    .TSMUX("0"))
    \SDR_ADDR[4]_syn_6  (
    .ce(open_n1404),
    .do({open_n1405,open_n1406,open_n1407,\u2_wrrd/SDR_ADDR_b [4]}),
    .ipad(open_n1408),
    .ipclk(open_n1409),
    .isclk(open_n1410),
    .opclk(open_n1411),
    .osclk(Sdr_clk_dup_1),
    .rst(open_n1412),
    .ts(open_n1413),
    .di(open_n1414),
    .diq({open_n1415,open_n1416,open_n1417,open_n1418}),
    .opad(SDR_ADDR[4]),
    .bpad(open_n1419));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(40)
  EG_PHY_PAD #(
    //.SLEWRATE("SLOW"),
    .DO_DFFMODE("FF"),
    .DO_REGSET("RESET"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .ODDRMODE("OFF"),
    .OUTCEMUX("1"),
    .OUTRSTMUX("0"),
    .OUTSCLKMUX("CLK"),
    .SRMODE("ASYNC"),
    .TSMUX("0"))
    \SDR_ADDR[5]_syn_6  (
    .ce(open_n1420),
    .do({open_n1421,open_n1422,open_n1423,\u2_wrrd/SDR_ADDR_b [5]}),
    .ipad(open_n1424),
    .ipclk(open_n1425),
    .isclk(open_n1426),
    .opclk(open_n1427),
    .osclk(Sdr_clk_dup_1),
    .rst(open_n1428),
    .ts(open_n1429),
    .di(open_n1430),
    .diq({open_n1431,open_n1432,open_n1433,open_n1434}),
    .opad(SDR_ADDR[5]),
    .bpad(open_n1435));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(40)
  EG_PHY_PAD #(
    //.SLEWRATE("SLOW"),
    .DO_DFFMODE("FF"),
    .DO_REGSET("RESET"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .ODDRMODE("OFF"),
    .OUTCEMUX("1"),
    .OUTRSTMUX("INV"),
    .OUTSCLKMUX("CLK"),
    .SRMODE("SYNC"),
    .TSMUX("0"))
    \SDR_ADDR[6]_syn_6  (
    .ce(open_n1436),
    .do({open_n1437,open_n1438,open_n1439,\u2_wrrd/addr [6]}),
    .ipad(open_n1440),
    .ipclk(open_n1441),
    .isclk(open_n1442),
    .opclk(open_n1443),
    .osclk(Sdr_clk_dup_1),
    .rst(\u2_wrrd/rw_vld ),
    .ts(open_n1444),
    .di(open_n1445),
    .diq({open_n1446,open_n1447,open_n1448,open_n1449}),
    .opad(SDR_ADDR[6]),
    .bpad(open_n1450));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(40)
  EG_PHY_PAD #(
    //.SLEWRATE("SLOW"),
    .DO_DFFMODE("FF"),
    .DO_REGSET("RESET"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .ODDRMODE("OFF"),
    .OUTCEMUX("1"),
    .OUTRSTMUX("INV"),
    .OUTSCLKMUX("CLK"),
    .SRMODE("SYNC"),
    .TSMUX("0"))
    \SDR_ADDR[7]_syn_6  (
    .ce(open_n1451),
    .do({open_n1452,open_n1453,open_n1454,\u2_wrrd/addr [7]}),
    .ipad(open_n1455),
    .ipclk(open_n1456),
    .isclk(open_n1457),
    .opclk(open_n1458),
    .osclk(Sdr_clk_dup_1),
    .rst(\u2_wrrd/rw_vld ),
    .ts(open_n1459),
    .di(open_n1460),
    .diq({open_n1461,open_n1462,open_n1463,open_n1464}),
    .opad(SDR_ADDR[7]),
    .bpad(open_n1465));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(40)
  EG_PHY_PAD #(
    //.SLEWRATE("SLOW"),
    .DO_DFFMODE("FF"),
    .DO_REGSET("RESET"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .ODDRMODE("OFF"),
    .OUTCEMUX("1"),
    .OUTRSTMUX("INV"),
    .OUTSCLKMUX("CLK"),
    .SRMODE("SYNC"),
    .TSMUX("0"))
    \SDR_ADDR[8]_syn_6  (
    .ce(open_n1466),
    .do({open_n1467,open_n1468,open_n1469,\u2_wrrd/addr [8]}),
    .ipad(open_n1470),
    .ipclk(open_n1471),
    .isclk(open_n1472),
    .opclk(open_n1473),
    .osclk(Sdr_clk_dup_1),
    .rst(\u2_wrrd/rw_vld ),
    .ts(open_n1474),
    .di(open_n1475),
    .diq({open_n1476,open_n1477,open_n1478,open_n1479}),
    .opad(SDR_ADDR[8]),
    .bpad(open_n1480));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(40)
  EG_PHY_PAD #(
    //.SLEWRATE("SLOW"),
    .DO_DFFMODE("FF"),
    .DO_REGSET("RESET"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .ODDRMODE("OFF"),
    .OUTCEMUX("1"),
    .OUTRSTMUX("INV"),
    .OUTSCLKMUX("CLK"),
    .SRMODE("SYNC"),
    .TSMUX("0"))
    \SDR_ADDR[9]_syn_6  (
    .ce(open_n1481),
    .do({open_n1482,open_n1483,open_n1484,\u2_wrrd/addr [9]}),
    .ipad(open_n1485),
    .ipclk(open_n1486),
    .isclk(open_n1487),
    .opclk(open_n1488),
    .osclk(Sdr_clk_dup_1),
    .rst(\u2_wrrd/rw_vld ),
    .ts(open_n1489),
    .di(open_n1490),
    .diq({open_n1491,open_n1492,open_n1493,open_n1494}),
    .opad(SDR_ADDR[9]),
    .bpad(open_n1495));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(40)
  EG_PHY_PAD #(
    //.SLEWRATE("SLOW"),
    .DO_DFFMODE("FF"),
    .DO_REGSET("RESET"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .ODDRMODE("OFF"),
    .OUTCEMUX("1"),
    .OUTRSTMUX("INV"),
    .OUTSCLKMUX("CLK"),
    .SRMODE("SYNC"),
    .TSMUX("0"))
    \SDR_BA[0]_syn_6  (
    .ce(open_n1496),
    .do({open_n1497,open_n1498,open_n1499,\u2_wrrd/ba [0]}),
    .ipad(open_n1500),
    .ipclk(open_n1501),
    .isclk(open_n1502),
    .opclk(open_n1503),
    .osclk(Sdr_clk_dup_1),
    .rst(\u2_wrrd/rw_vld ),
    .ts(open_n1504),
    .di(open_n1505),
    .diq({open_n1506,open_n1507,open_n1508,open_n1509}),
    .opad(SDR_BA[0]),
    .bpad(open_n1510));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(39)
  EG_PHY_PAD #(
    //.SLEWRATE("SLOW"),
    .DO_DFFMODE("FF"),
    .DO_REGSET("RESET"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .ODDRMODE("OFF"),
    .OUTCEMUX("1"),
    .OUTRSTMUX("INV"),
    .OUTSCLKMUX("CLK"),
    .SRMODE("SYNC"),
    .TSMUX("0"))
    \SDR_BA[1]_syn_6  (
    .ce(open_n1511),
    .do({open_n1512,open_n1513,open_n1514,\u2_wrrd/ba [1]}),
    .ipad(open_n1515),
    .ipclk(open_n1516),
    .isclk(open_n1517),
    .opclk(open_n1518),
    .osclk(Sdr_clk_dup_1),
    .rst(\u2_wrrd/rw_vld ),
    .ts(open_n1519),
    .di(open_n1520),
    .diq({open_n1521,open_n1522,open_n1523,open_n1524}),
    .opad(SDR_BA[1]),
    .bpad(open_n1525));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(39)
  EG_PHY_PAD #(
    //.SLEWRATE("SLOW"),
    .DO_DFFMODE("FF"),
    .DO_REGSET("RESET"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .ODDRMODE("OFF"),
    .OUTCEMUX("1"),
    .OUTRSTMUX("0"),
    .OUTSCLKMUX("CLK"),
    .SRMODE("ASYNC"),
    .TSMUX("0"))
    SDR_CAS_syn_6 (
    .ce(open_n1526),
    .do({open_n1527,open_n1528,open_n1529,\u2_wrrd/SDR_CAS_n }),
    .ipad(open_n1530),
    .ipclk(open_n1531),
    .isclk(open_n1532),
    .opclk(open_n1533),
    .osclk(Sdr_clk_dup_1),
    .rst(open_n1534),
    .ts(open_n1535),
    .di(open_n1536),
    .diq({open_n1537,open_n1538,open_n1539,open_n1540}),
    .opad(SDR_CAS),
    .bpad(open_n1541));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(37)
  EG_PHY_PAD #(
    //.SLEWRATE("SLOW"),
    .DO_DFFMODE("FF"),
    .DO_REGSET("SET"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .ODDRMODE("OFF"),
    .OUTCEMUX("1"),
    .OUTRSTMUX("RST"),
    .OUTSCLKMUX("CLK"),
    .SRMODE("SYNC"),
    .TSMUX("0"))
    \SDR_DM[0]_syn_6  (
    .ce(open_n1542),
    .do({open_n1543,open_n1544,open_n1545,\u2_wrrd/app_wr_dm_6d [0]}),
    .ipad(open_n1546),
    .ipclk(open_n1547),
    .isclk(open_n1548),
    .opclk(open_n1549),
    .osclk(Sdr_clk_dup_1),
    .rst(Rst_dup_177),
    .ts(open_n1550),
    .di(open_n1551),
    .diq({open_n1552,open_n1553,open_n1554,open_n1555}),
    .opad(SDR_DM[0]),
    .bpad(open_n1556));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(41)
  EG_PHY_PAD #(
    //.SLEWRATE("SLOW"),
    .DO_DFFMODE("FF"),
    .DO_REGSET("SET"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .ODDRMODE("OFF"),
    .OUTCEMUX("1"),
    .OUTRSTMUX("RST"),
    .OUTSCLKMUX("CLK"),
    .SRMODE("SYNC"),
    .TSMUX("0"))
    \SDR_DM[1]_syn_6  (
    .ce(open_n1557),
    .do({open_n1558,open_n1559,open_n1560,\u2_wrrd/app_wr_dm_6d [1]}),
    .ipad(open_n1561),
    .ipclk(open_n1562),
    .isclk(open_n1563),
    .opclk(open_n1564),
    .osclk(Sdr_clk_dup_1),
    .rst(Rst_dup_177),
    .ts(open_n1565),
    .di(open_n1566),
    .diq({open_n1567,open_n1568,open_n1569,open_n1570}),
    .opad(SDR_DM[1]),
    .bpad(open_n1571));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(41)
  EG_PHY_PAD #(
    //.SLEWRATE("SLOW"),
    .DO_DFFMODE("FF"),
    .DO_REGSET("SET"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .ODDRMODE("OFF"),
    .OUTCEMUX("1"),
    .OUTRSTMUX("RST"),
    .OUTSCLKMUX("CLK"),
    .SRMODE("SYNC"),
    .TSMUX("0"))
    \SDR_DM[2]_syn_6  (
    .ce(open_n1572),
    .do({open_n1573,open_n1574,open_n1575,\u2_wrrd/app_wr_dm_6d [2]}),
    .ipad(open_n1576),
    .ipclk(open_n1577),
    .isclk(open_n1578),
    .opclk(open_n1579),
    .osclk(Sdr_clk_dup_1),
    .rst(Rst_dup_177),
    .ts(open_n1580),
    .di(open_n1581),
    .diq({open_n1582,open_n1583,open_n1584,open_n1585}),
    .opad(SDR_DM[2]),
    .bpad(open_n1586));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(41)
  EG_PHY_PAD #(
    //.SLEWRATE("SLOW"),
    .DO_DFFMODE("FF"),
    .DO_REGSET("SET"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .ODDRMODE("OFF"),
    .OUTCEMUX("1"),
    .OUTRSTMUX("RST"),
    .OUTSCLKMUX("CLK"),
    .SRMODE("SYNC"),
    .TSMUX("0"))
    \SDR_DM[3]_syn_6  (
    .ce(open_n1587),
    .do({open_n1588,open_n1589,open_n1590,\u2_wrrd/app_wr_dm_6d [3]}),
    .ipad(open_n1591),
    .ipclk(open_n1592),
    .isclk(open_n1593),
    .opclk(open_n1594),
    .osclk(Sdr_clk_dup_1),
    .rst(Rst_dup_177),
    .ts(open_n1595),
    .di(open_n1596),
    .diq({open_n1597,open_n1598,open_n1599,open_n1600}),
    .opad(SDR_DM[3]),
    .bpad(open_n1601));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(41)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    //.SLEWRATE("SLOW"),
    .DO_DFFMODE("FF"),
    .DO_REGSET("RESET"),
    .DRIVE("8"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("BI"),
    .ODDRMODE("OFF"),
    .OUTCEMUX("1"),
    .OUTRSTMUX("0"),
    .OUTSCLKMUX("CLK"),
    .SRMODE("ASYNC"),
    .TSMUX("INV"))
    \SDR_DQ[0]_syn_2  (
    .ce(open_n1602),
    .do({open_n1603,open_n1604,open_n1605,\u2_wrrd/app_wr_din_6d [0]}),
    .ipad(open_n1606),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n1607),
    .opclk(open_n1608),
    .osclk(Sdr_clk_dup_1),
    .rst(open_n1609),
    .ts(\u2_wrrd/sdr_t ),
    .di(\SDR_DQ[0]_dup_1 ),
    .diq({open_n1610,open_n1611,open_n1612,\u2_wrrd/Sdr_rd_dout[0]_syn_3 }),
    .opad(open_n1613),
    .bpad(SDR_DQ[0]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(42)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    //.SLEWRATE("SLOW"),
    .DO_DFFMODE("FF"),
    .DO_REGSET("RESET"),
    .DRIVE("8"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("BI"),
    .ODDRMODE("OFF"),
    .OUTCEMUX("1"),
    .OUTRSTMUX("0"),
    .OUTSCLKMUX("CLK"),
    .SRMODE("ASYNC"),
    .TSMUX("INV"))
    \SDR_DQ[10]_syn_2  (
    .ce(open_n1614),
    .do({open_n1615,open_n1616,open_n1617,\u2_wrrd/app_wr_din_6d [10]}),
    .ipad(open_n1618),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n1619),
    .opclk(open_n1620),
    .osclk(Sdr_clk_dup_1),
    .rst(open_n1621),
    .ts(\u2_wrrd/sdr_t ),
    .di(\SDR_DQ[10]_dup_1 ),
    .diq({open_n1622,open_n1623,open_n1624,\u2_wrrd/Sdr_rd_dout[10]_syn_3 }),
    .opad(open_n1625),
    .bpad(SDR_DQ[10]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(42)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    //.SLEWRATE("SLOW"),
    .DO_DFFMODE("FF"),
    .DO_REGSET("RESET"),
    .DRIVE("8"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("BI"),
    .ODDRMODE("OFF"),
    .OUTCEMUX("1"),
    .OUTRSTMUX("0"),
    .OUTSCLKMUX("CLK"),
    .SRMODE("ASYNC"),
    .TSMUX("INV"))
    \SDR_DQ[11]_syn_2  (
    .ce(open_n1626),
    .do({open_n1627,open_n1628,open_n1629,\u2_wrrd/app_wr_din_6d [11]}),
    .ipad(open_n1630),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n1631),
    .opclk(open_n1632),
    .osclk(Sdr_clk_dup_1),
    .rst(open_n1633),
    .ts(\u2_wrrd/sdr_t ),
    .di(\SDR_DQ[11]_dup_1 ),
    .diq({open_n1634,open_n1635,open_n1636,\u2_wrrd/Sdr_rd_dout[11]_syn_3 }),
    .opad(open_n1637),
    .bpad(SDR_DQ[11]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(42)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    //.SLEWRATE("SLOW"),
    .DO_DFFMODE("FF"),
    .DO_REGSET("RESET"),
    .DRIVE("8"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("BI"),
    .ODDRMODE("OFF"),
    .OUTCEMUX("1"),
    .OUTRSTMUX("0"),
    .OUTSCLKMUX("CLK"),
    .SRMODE("ASYNC"),
    .TSMUX("INV"))
    \SDR_DQ[12]_syn_2  (
    .ce(open_n1638),
    .do({open_n1639,open_n1640,open_n1641,\u2_wrrd/app_wr_din_6d [12]}),
    .ipad(open_n1642),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n1643),
    .opclk(open_n1644),
    .osclk(Sdr_clk_dup_1),
    .rst(open_n1645),
    .ts(\u2_wrrd/sdr_t ),
    .di(\SDR_DQ[12]_dup_1 ),
    .diq({open_n1646,open_n1647,open_n1648,\u2_wrrd/Sdr_rd_dout[12]_syn_3 }),
    .opad(open_n1649),
    .bpad(SDR_DQ[12]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(42)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    //.SLEWRATE("SLOW"),
    .DO_DFFMODE("FF"),
    .DO_REGSET("RESET"),
    .DRIVE("8"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("BI"),
    .ODDRMODE("OFF"),
    .OUTCEMUX("1"),
    .OUTRSTMUX("0"),
    .OUTSCLKMUX("CLK"),
    .SRMODE("ASYNC"),
    .TSMUX("INV"))
    \SDR_DQ[13]_syn_2  (
    .ce(open_n1650),
    .do({open_n1651,open_n1652,open_n1653,\u2_wrrd/app_wr_din_6d [13]}),
    .ipad(open_n1654),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n1655),
    .opclk(open_n1656),
    .osclk(Sdr_clk_dup_1),
    .rst(open_n1657),
    .ts(\u2_wrrd/sdr_t ),
    .di(\SDR_DQ[13]_dup_1 ),
    .diq({open_n1658,open_n1659,open_n1660,\u2_wrrd/Sdr_rd_dout[13]_syn_3 }),
    .opad(open_n1661),
    .bpad(SDR_DQ[13]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(42)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    //.SLEWRATE("SLOW"),
    .DO_DFFMODE("FF"),
    .DO_REGSET("RESET"),
    .DRIVE("8"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("BI"),
    .ODDRMODE("OFF"),
    .OUTCEMUX("1"),
    .OUTRSTMUX("0"),
    .OUTSCLKMUX("CLK"),
    .SRMODE("ASYNC"),
    .TSMUX("INV"))
    \SDR_DQ[14]_syn_2  (
    .ce(open_n1662),
    .do({open_n1663,open_n1664,open_n1665,\u2_wrrd/app_wr_din_6d [14]}),
    .ipad(open_n1666),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n1667),
    .opclk(open_n1668),
    .osclk(Sdr_clk_dup_1),
    .rst(open_n1669),
    .ts(\u2_wrrd/sdr_t ),
    .di(\SDR_DQ[14]_dup_1 ),
    .diq({open_n1670,open_n1671,open_n1672,\u2_wrrd/Sdr_rd_dout[14]_syn_3 }),
    .opad(open_n1673),
    .bpad(SDR_DQ[14]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(42)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    //.SLEWRATE("SLOW"),
    .DO_DFFMODE("FF"),
    .DO_REGSET("RESET"),
    .DRIVE("8"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("BI"),
    .ODDRMODE("OFF"),
    .OUTCEMUX("1"),
    .OUTRSTMUX("0"),
    .OUTSCLKMUX("CLK"),
    .SRMODE("ASYNC"),
    .TSMUX("INV"))
    \SDR_DQ[15]_syn_2  (
    .ce(open_n1674),
    .do({open_n1675,open_n1676,open_n1677,\u2_wrrd/app_wr_din_6d [15]}),
    .ipad(open_n1678),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n1679),
    .opclk(open_n1680),
    .osclk(Sdr_clk_dup_1),
    .rst(open_n1681),
    .ts(\u2_wrrd/sdr_t ),
    .di(\SDR_DQ[15]_dup_1 ),
    .diq({open_n1682,open_n1683,open_n1684,\u2_wrrd/Sdr_rd_dout[15]_syn_3 }),
    .opad(open_n1685),
    .bpad(SDR_DQ[15]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(42)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    //.SLEWRATE("SLOW"),
    .DO_DFFMODE("FF"),
    .DO_REGSET("RESET"),
    .DRIVE("8"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("BI"),
    .ODDRMODE("OFF"),
    .OUTCEMUX("1"),
    .OUTRSTMUX("0"),
    .OUTSCLKMUX("CLK"),
    .SRMODE("ASYNC"),
    .TSMUX("INV"))
    \SDR_DQ[16]_syn_2  (
    .ce(open_n1686),
    .do({open_n1687,open_n1688,open_n1689,\u2_wrrd/app_wr_din_6d [16]}),
    .ipad(open_n1690),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n1691),
    .opclk(open_n1692),
    .osclk(Sdr_clk_dup_1),
    .rst(open_n1693),
    .ts(\u2_wrrd/sdr_t ),
    .di(\SDR_DQ[16]_dup_1 ),
    .diq({open_n1694,open_n1695,open_n1696,\u2_wrrd/Sdr_rd_dout[16]_syn_3 }),
    .opad(open_n1697),
    .bpad(SDR_DQ[16]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(42)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    //.SLEWRATE("SLOW"),
    .DO_DFFMODE("FF"),
    .DO_REGSET("RESET"),
    .DRIVE("8"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("BI"),
    .ODDRMODE("OFF"),
    .OUTCEMUX("1"),
    .OUTRSTMUX("0"),
    .OUTSCLKMUX("CLK"),
    .SRMODE("ASYNC"),
    .TSMUX("INV"))
    \SDR_DQ[17]_syn_2  (
    .ce(open_n1698),
    .do({open_n1699,open_n1700,open_n1701,\u2_wrrd/app_wr_din_6d [17]}),
    .ipad(open_n1702),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n1703),
    .opclk(open_n1704),
    .osclk(Sdr_clk_dup_1),
    .rst(open_n1705),
    .ts(\u2_wrrd/sdr_t ),
    .di(\SDR_DQ[17]_dup_1 ),
    .diq({open_n1706,open_n1707,open_n1708,\u2_wrrd/Sdr_rd_dout[17]_syn_3 }),
    .opad(open_n1709),
    .bpad(SDR_DQ[17]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(42)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    //.SLEWRATE("SLOW"),
    .DO_DFFMODE("FF"),
    .DO_REGSET("RESET"),
    .DRIVE("8"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("BI"),
    .ODDRMODE("OFF"),
    .OUTCEMUX("1"),
    .OUTRSTMUX("0"),
    .OUTSCLKMUX("CLK"),
    .SRMODE("ASYNC"),
    .TSMUX("INV"))
    \SDR_DQ[18]_syn_2  (
    .ce(open_n1710),
    .do({open_n1711,open_n1712,open_n1713,\u2_wrrd/app_wr_din_6d [18]}),
    .ipad(open_n1714),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n1715),
    .opclk(open_n1716),
    .osclk(Sdr_clk_dup_1),
    .rst(open_n1717),
    .ts(\u2_wrrd/sdr_t ),
    .di(\SDR_DQ[18]_dup_1 ),
    .diq({open_n1718,open_n1719,open_n1720,\u2_wrrd/Sdr_rd_dout[18]_syn_3 }),
    .opad(open_n1721),
    .bpad(SDR_DQ[18]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(42)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    //.SLEWRATE("SLOW"),
    .DO_DFFMODE("FF"),
    .DO_REGSET("RESET"),
    .DRIVE("8"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("BI"),
    .ODDRMODE("OFF"),
    .OUTCEMUX("1"),
    .OUTRSTMUX("0"),
    .OUTSCLKMUX("CLK"),
    .SRMODE("ASYNC"),
    .TSMUX("INV"))
    \SDR_DQ[19]_syn_2  (
    .ce(open_n1722),
    .do({open_n1723,open_n1724,open_n1725,\u2_wrrd/app_wr_din_6d [19]}),
    .ipad(open_n1726),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n1727),
    .opclk(open_n1728),
    .osclk(Sdr_clk_dup_1),
    .rst(open_n1729),
    .ts(\u2_wrrd/sdr_t ),
    .di(\SDR_DQ[19]_dup_1 ),
    .diq({open_n1730,open_n1731,open_n1732,\u2_wrrd/Sdr_rd_dout[19]_syn_3 }),
    .opad(open_n1733),
    .bpad(SDR_DQ[19]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(42)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    //.SLEWRATE("SLOW"),
    .DO_DFFMODE("FF"),
    .DO_REGSET("RESET"),
    .DRIVE("8"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("BI"),
    .ODDRMODE("OFF"),
    .OUTCEMUX("1"),
    .OUTRSTMUX("0"),
    .OUTSCLKMUX("CLK"),
    .SRMODE("ASYNC"),
    .TSMUX("INV"))
    \SDR_DQ[1]_syn_2  (
    .ce(open_n1734),
    .do({open_n1735,open_n1736,open_n1737,\u2_wrrd/app_wr_din_6d [1]}),
    .ipad(open_n1738),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n1739),
    .opclk(open_n1740),
    .osclk(Sdr_clk_dup_1),
    .rst(open_n1741),
    .ts(\u2_wrrd/sdr_t ),
    .di(\SDR_DQ[1]_dup_1 ),
    .diq({open_n1742,open_n1743,open_n1744,\u2_wrrd/Sdr_rd_dout[1]_syn_3 }),
    .opad(open_n1745),
    .bpad(SDR_DQ[1]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(42)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    //.SLEWRATE("SLOW"),
    .DO_DFFMODE("FF"),
    .DO_REGSET("RESET"),
    .DRIVE("8"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("BI"),
    .ODDRMODE("OFF"),
    .OUTCEMUX("1"),
    .OUTRSTMUX("0"),
    .OUTSCLKMUX("CLK"),
    .SRMODE("ASYNC"),
    .TSMUX("INV"))
    \SDR_DQ[20]_syn_2  (
    .ce(open_n1746),
    .do({open_n1747,open_n1748,open_n1749,\u2_wrrd/app_wr_din_6d [20]}),
    .ipad(open_n1750),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n1751),
    .opclk(open_n1752),
    .osclk(Sdr_clk_dup_1),
    .rst(open_n1753),
    .ts(\u2_wrrd/sdr_t ),
    .di(\SDR_DQ[20]_dup_1 ),
    .diq({open_n1754,open_n1755,open_n1756,\u2_wrrd/Sdr_rd_dout[20]_syn_3 }),
    .opad(open_n1757),
    .bpad(SDR_DQ[20]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(42)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    //.SLEWRATE("SLOW"),
    .DO_DFFMODE("FF"),
    .DO_REGSET("RESET"),
    .DRIVE("8"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("BI"),
    .ODDRMODE("OFF"),
    .OUTCEMUX("1"),
    .OUTRSTMUX("0"),
    .OUTSCLKMUX("CLK"),
    .SRMODE("ASYNC"),
    .TSMUX("INV"))
    \SDR_DQ[21]_syn_2  (
    .ce(open_n1758),
    .do({open_n1759,open_n1760,open_n1761,\u2_wrrd/app_wr_din_6d [21]}),
    .ipad(open_n1762),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n1763),
    .opclk(open_n1764),
    .osclk(Sdr_clk_dup_1),
    .rst(open_n1765),
    .ts(\u2_wrrd/sdr_t ),
    .di(\SDR_DQ[21]_dup_1 ),
    .diq({open_n1766,open_n1767,open_n1768,\u2_wrrd/Sdr_rd_dout[21]_syn_3 }),
    .opad(open_n1769),
    .bpad(SDR_DQ[21]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(42)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    //.SLEWRATE("SLOW"),
    .DO_DFFMODE("FF"),
    .DO_REGSET("RESET"),
    .DRIVE("8"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("BI"),
    .ODDRMODE("OFF"),
    .OUTCEMUX("1"),
    .OUTRSTMUX("0"),
    .OUTSCLKMUX("CLK"),
    .SRMODE("ASYNC"),
    .TSMUX("INV"))
    \SDR_DQ[22]_syn_2  (
    .ce(open_n1770),
    .do({open_n1771,open_n1772,open_n1773,\u2_wrrd/app_wr_din_6d [22]}),
    .ipad(open_n1774),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n1775),
    .opclk(open_n1776),
    .osclk(Sdr_clk_dup_1),
    .rst(open_n1777),
    .ts(\u2_wrrd/sdr_t ),
    .di(\SDR_DQ[22]_dup_1 ),
    .diq({open_n1778,open_n1779,open_n1780,\u2_wrrd/Sdr_rd_dout[22]_syn_3 }),
    .opad(open_n1781),
    .bpad(SDR_DQ[22]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(42)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    //.SLEWRATE("SLOW"),
    .DO_DFFMODE("FF"),
    .DO_REGSET("RESET"),
    .DRIVE("8"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("BI"),
    .ODDRMODE("OFF"),
    .OUTCEMUX("1"),
    .OUTRSTMUX("0"),
    .OUTSCLKMUX("CLK"),
    .SRMODE("ASYNC"),
    .TSMUX("INV"))
    \SDR_DQ[23]_syn_2  (
    .ce(open_n1782),
    .do({open_n1783,open_n1784,open_n1785,\u2_wrrd/app_wr_din_6d [23]}),
    .ipad(open_n1786),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n1787),
    .opclk(open_n1788),
    .osclk(Sdr_clk_dup_1),
    .rst(open_n1789),
    .ts(\u2_wrrd/sdr_t ),
    .di(\SDR_DQ[23]_dup_1 ),
    .diq({open_n1790,open_n1791,open_n1792,\u2_wrrd/Sdr_rd_dout[23]_syn_3 }),
    .opad(open_n1793),
    .bpad(SDR_DQ[23]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(42)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    //.SLEWRATE("SLOW"),
    .DO_DFFMODE("FF"),
    .DO_REGSET("RESET"),
    .DRIVE("8"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("BI"),
    .ODDRMODE("OFF"),
    .OUTCEMUX("1"),
    .OUTRSTMUX("0"),
    .OUTSCLKMUX("CLK"),
    .SRMODE("ASYNC"),
    .TSMUX("INV"))
    \SDR_DQ[24]_syn_2  (
    .ce(open_n1794),
    .do({open_n1795,open_n1796,open_n1797,\u2_wrrd/app_wr_din_6d [24]}),
    .ipad(open_n1798),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n1799),
    .opclk(open_n1800),
    .osclk(Sdr_clk_dup_1),
    .rst(open_n1801),
    .ts(\u2_wrrd/sdr_t ),
    .di(\SDR_DQ[24]_dup_1 ),
    .diq({open_n1802,open_n1803,open_n1804,\u2_wrrd/Sdr_rd_dout[24]_syn_3 }),
    .opad(open_n1805),
    .bpad(SDR_DQ[24]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(42)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    //.SLEWRATE("SLOW"),
    .DO_DFFMODE("FF"),
    .DO_REGSET("RESET"),
    .DRIVE("8"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("BI"),
    .ODDRMODE("OFF"),
    .OUTCEMUX("1"),
    .OUTRSTMUX("0"),
    .OUTSCLKMUX("CLK"),
    .SRMODE("ASYNC"),
    .TSMUX("INV"))
    \SDR_DQ[25]_syn_2  (
    .ce(open_n1806),
    .do({open_n1807,open_n1808,open_n1809,\u2_wrrd/app_wr_din_6d [25]}),
    .ipad(open_n1810),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n1811),
    .opclk(open_n1812),
    .osclk(Sdr_clk_dup_1),
    .rst(open_n1813),
    .ts(\u2_wrrd/sdr_t ),
    .di(\SDR_DQ[25]_dup_1 ),
    .diq({open_n1814,open_n1815,open_n1816,\u2_wrrd/Sdr_rd_dout[25]_syn_3 }),
    .opad(open_n1817),
    .bpad(SDR_DQ[25]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(42)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    //.SLEWRATE("SLOW"),
    .DO_DFFMODE("FF"),
    .DO_REGSET("RESET"),
    .DRIVE("8"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("BI"),
    .ODDRMODE("OFF"),
    .OUTCEMUX("1"),
    .OUTRSTMUX("0"),
    .OUTSCLKMUX("CLK"),
    .SRMODE("ASYNC"),
    .TSMUX("INV"))
    \SDR_DQ[26]_syn_2  (
    .ce(open_n1818),
    .do({open_n1819,open_n1820,open_n1821,\u2_wrrd/app_wr_din_6d [26]}),
    .ipad(open_n1822),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n1823),
    .opclk(open_n1824),
    .osclk(Sdr_clk_dup_1),
    .rst(open_n1825),
    .ts(\u2_wrrd/sdr_t ),
    .di(\SDR_DQ[26]_dup_1 ),
    .diq({open_n1826,open_n1827,open_n1828,\u2_wrrd/Sdr_rd_dout[26]_syn_3 }),
    .opad(open_n1829),
    .bpad(SDR_DQ[26]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(42)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    //.SLEWRATE("SLOW"),
    .DO_DFFMODE("FF"),
    .DO_REGSET("RESET"),
    .DRIVE("8"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("BI"),
    .ODDRMODE("OFF"),
    .OUTCEMUX("1"),
    .OUTRSTMUX("0"),
    .OUTSCLKMUX("CLK"),
    .SRMODE("ASYNC"),
    .TSMUX("INV"))
    \SDR_DQ[27]_syn_2  (
    .ce(open_n1830),
    .do({open_n1831,open_n1832,open_n1833,\u2_wrrd/app_wr_din_6d [27]}),
    .ipad(open_n1834),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n1835),
    .opclk(open_n1836),
    .osclk(Sdr_clk_dup_1),
    .rst(open_n1837),
    .ts(\u2_wrrd/sdr_t ),
    .di(\SDR_DQ[27]_dup_1 ),
    .diq({open_n1838,open_n1839,open_n1840,\u2_wrrd/Sdr_rd_dout[27]_syn_3 }),
    .opad(open_n1841),
    .bpad(SDR_DQ[27]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(42)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    //.SLEWRATE("SLOW"),
    .DO_DFFMODE("FF"),
    .DO_REGSET("RESET"),
    .DRIVE("8"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("BI"),
    .ODDRMODE("OFF"),
    .OUTCEMUX("1"),
    .OUTRSTMUX("0"),
    .OUTSCLKMUX("CLK"),
    .SRMODE("ASYNC"),
    .TSMUX("INV"))
    \SDR_DQ[28]_syn_2  (
    .ce(open_n1842),
    .do({open_n1843,open_n1844,open_n1845,\u2_wrrd/app_wr_din_6d [28]}),
    .ipad(open_n1846),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n1847),
    .opclk(open_n1848),
    .osclk(Sdr_clk_dup_1),
    .rst(open_n1849),
    .ts(\u2_wrrd/sdr_t ),
    .di(\SDR_DQ[28]_dup_1 ),
    .diq({open_n1850,open_n1851,open_n1852,\u2_wrrd/Sdr_rd_dout[28]_syn_3 }),
    .opad(open_n1853),
    .bpad(SDR_DQ[28]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(42)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    //.SLEWRATE("SLOW"),
    .DO_DFFMODE("FF"),
    .DO_REGSET("RESET"),
    .DRIVE("8"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("BI"),
    .ODDRMODE("OFF"),
    .OUTCEMUX("1"),
    .OUTRSTMUX("0"),
    .OUTSCLKMUX("CLK"),
    .SRMODE("ASYNC"),
    .TSMUX("INV"))
    \SDR_DQ[29]_syn_2  (
    .ce(open_n1854),
    .do({open_n1855,open_n1856,open_n1857,\u2_wrrd/app_wr_din_6d [29]}),
    .ipad(open_n1858),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n1859),
    .opclk(open_n1860),
    .osclk(Sdr_clk_dup_1),
    .rst(open_n1861),
    .ts(\u2_wrrd/sdr_t ),
    .di(\SDR_DQ[29]_dup_1 ),
    .diq({open_n1862,open_n1863,open_n1864,\u2_wrrd/Sdr_rd_dout[29]_syn_3 }),
    .opad(open_n1865),
    .bpad(SDR_DQ[29]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(42)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    //.SLEWRATE("SLOW"),
    .DO_DFFMODE("FF"),
    .DO_REGSET("RESET"),
    .DRIVE("8"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("BI"),
    .ODDRMODE("OFF"),
    .OUTCEMUX("1"),
    .OUTRSTMUX("0"),
    .OUTSCLKMUX("CLK"),
    .SRMODE("ASYNC"),
    .TSMUX("INV"))
    \SDR_DQ[2]_syn_2  (
    .ce(open_n1866),
    .do({open_n1867,open_n1868,open_n1869,\u2_wrrd/app_wr_din_6d [2]}),
    .ipad(open_n1870),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n1871),
    .opclk(open_n1872),
    .osclk(Sdr_clk_dup_1),
    .rst(open_n1873),
    .ts(\u2_wrrd/sdr_t ),
    .di(\SDR_DQ[2]_dup_1 ),
    .diq({open_n1874,open_n1875,open_n1876,\u2_wrrd/Sdr_rd_dout[2]_syn_3 }),
    .opad(open_n1877),
    .bpad(SDR_DQ[2]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(42)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    //.SLEWRATE("SLOW"),
    .DO_DFFMODE("FF"),
    .DO_REGSET("RESET"),
    .DRIVE("8"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("BI"),
    .ODDRMODE("OFF"),
    .OUTCEMUX("1"),
    .OUTRSTMUX("0"),
    .OUTSCLKMUX("CLK"),
    .SRMODE("ASYNC"),
    .TSMUX("INV"))
    \SDR_DQ[30]_syn_2  (
    .ce(open_n1878),
    .do({open_n1879,open_n1880,open_n1881,\u2_wrrd/app_wr_din_6d [30]}),
    .ipad(open_n1882),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n1883),
    .opclk(open_n1884),
    .osclk(Sdr_clk_dup_1),
    .rst(open_n1885),
    .ts(\u2_wrrd/sdr_t ),
    .di(\SDR_DQ[30]_dup_1 ),
    .diq({open_n1886,open_n1887,open_n1888,\u2_wrrd/Sdr_rd_dout[30]_syn_3 }),
    .opad(open_n1889),
    .bpad(SDR_DQ[30]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(42)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    //.SLEWRATE("SLOW"),
    .DO_DFFMODE("FF"),
    .DO_REGSET("RESET"),
    .DRIVE("8"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("BI"),
    .ODDRMODE("OFF"),
    .OUTCEMUX("1"),
    .OUTRSTMUX("0"),
    .OUTSCLKMUX("CLK"),
    .SRMODE("ASYNC"),
    .TSMUX("INV"))
    \SDR_DQ[31]_syn_2  (
    .ce(open_n1890),
    .do({open_n1891,open_n1892,open_n1893,\u2_wrrd/app_wr_din_6d [31]}),
    .ipad(open_n1894),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n1895),
    .opclk(open_n1896),
    .osclk(Sdr_clk_dup_1),
    .rst(open_n1897),
    .ts(\u2_wrrd/sdr_t ),
    .di(\SDR_DQ[31]_dup_1 ),
    .diq({open_n1898,open_n1899,open_n1900,\u2_wrrd/Sdr_rd_dout[31]_syn_3 }),
    .opad(open_n1901),
    .bpad(SDR_DQ[31]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(42)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    //.SLEWRATE("SLOW"),
    .DO_DFFMODE("FF"),
    .DO_REGSET("RESET"),
    .DRIVE("8"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("BI"),
    .ODDRMODE("OFF"),
    .OUTCEMUX("1"),
    .OUTRSTMUX("0"),
    .OUTSCLKMUX("CLK"),
    .SRMODE("ASYNC"),
    .TSMUX("INV"))
    \SDR_DQ[3]_syn_2  (
    .ce(open_n1902),
    .do({open_n1903,open_n1904,open_n1905,\u2_wrrd/app_wr_din_6d [3]}),
    .ipad(open_n1906),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n1907),
    .opclk(open_n1908),
    .osclk(Sdr_clk_dup_1),
    .rst(open_n1909),
    .ts(\u2_wrrd/sdr_t ),
    .di(\SDR_DQ[3]_dup_1 ),
    .diq({open_n1910,open_n1911,open_n1912,\u2_wrrd/Sdr_rd_dout[3]_syn_3 }),
    .opad(open_n1913),
    .bpad(SDR_DQ[3]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(42)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    //.SLEWRATE("SLOW"),
    .DO_DFFMODE("FF"),
    .DO_REGSET("RESET"),
    .DRIVE("8"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("BI"),
    .ODDRMODE("OFF"),
    .OUTCEMUX("1"),
    .OUTRSTMUX("0"),
    .OUTSCLKMUX("CLK"),
    .SRMODE("ASYNC"),
    .TSMUX("INV"))
    \SDR_DQ[4]_syn_2  (
    .ce(open_n1914),
    .do({open_n1915,open_n1916,open_n1917,\u2_wrrd/app_wr_din_6d [4]}),
    .ipad(open_n1918),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n1919),
    .opclk(open_n1920),
    .osclk(Sdr_clk_dup_1),
    .rst(open_n1921),
    .ts(\u2_wrrd/sdr_t ),
    .di(\SDR_DQ[4]_dup_1 ),
    .diq({open_n1922,open_n1923,open_n1924,\u2_wrrd/Sdr_rd_dout[4]_syn_3 }),
    .opad(open_n1925),
    .bpad(SDR_DQ[4]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(42)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    //.SLEWRATE("SLOW"),
    .DO_DFFMODE("FF"),
    .DO_REGSET("RESET"),
    .DRIVE("8"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("BI"),
    .ODDRMODE("OFF"),
    .OUTCEMUX("1"),
    .OUTRSTMUX("0"),
    .OUTSCLKMUX("CLK"),
    .SRMODE("ASYNC"),
    .TSMUX("INV"))
    \SDR_DQ[5]_syn_2  (
    .ce(open_n1926),
    .do({open_n1927,open_n1928,open_n1929,\u2_wrrd/app_wr_din_6d [5]}),
    .ipad(open_n1930),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n1931),
    .opclk(open_n1932),
    .osclk(Sdr_clk_dup_1),
    .rst(open_n1933),
    .ts(\u2_wrrd/sdr_t ),
    .di(\SDR_DQ[5]_dup_1 ),
    .diq({open_n1934,open_n1935,open_n1936,\u2_wrrd/Sdr_rd_dout[5]_syn_3 }),
    .opad(open_n1937),
    .bpad(SDR_DQ[5]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(42)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    //.SLEWRATE("SLOW"),
    .DO_DFFMODE("FF"),
    .DO_REGSET("RESET"),
    .DRIVE("8"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("BI"),
    .ODDRMODE("OFF"),
    .OUTCEMUX("1"),
    .OUTRSTMUX("0"),
    .OUTSCLKMUX("CLK"),
    .SRMODE("ASYNC"),
    .TSMUX("INV"))
    \SDR_DQ[6]_syn_2  (
    .ce(open_n1938),
    .do({open_n1939,open_n1940,open_n1941,\u2_wrrd/app_wr_din_6d [6]}),
    .ipad(open_n1942),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n1943),
    .opclk(open_n1944),
    .osclk(Sdr_clk_dup_1),
    .rst(open_n1945),
    .ts(\u2_wrrd/sdr_t ),
    .di(\SDR_DQ[6]_dup_1 ),
    .diq({open_n1946,open_n1947,open_n1948,\u2_wrrd/Sdr_rd_dout[6]_syn_3 }),
    .opad(open_n1949),
    .bpad(SDR_DQ[6]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(42)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    //.SLEWRATE("SLOW"),
    .DO_DFFMODE("FF"),
    .DO_REGSET("RESET"),
    .DRIVE("8"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("BI"),
    .ODDRMODE("OFF"),
    .OUTCEMUX("1"),
    .OUTRSTMUX("0"),
    .OUTSCLKMUX("CLK"),
    .SRMODE("ASYNC"),
    .TSMUX("INV"))
    \SDR_DQ[7]_syn_2  (
    .ce(open_n1950),
    .do({open_n1951,open_n1952,open_n1953,\u2_wrrd/app_wr_din_6d [7]}),
    .ipad(open_n1954),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n1955),
    .opclk(open_n1956),
    .osclk(Sdr_clk_dup_1),
    .rst(open_n1957),
    .ts(\u2_wrrd/sdr_t ),
    .di(\SDR_DQ[7]_dup_1 ),
    .diq({open_n1958,open_n1959,open_n1960,\u2_wrrd/Sdr_rd_dout[7]_syn_3 }),
    .opad(open_n1961),
    .bpad(SDR_DQ[7]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(42)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    //.SLEWRATE("SLOW"),
    .DO_DFFMODE("FF"),
    .DO_REGSET("RESET"),
    .DRIVE("8"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("BI"),
    .ODDRMODE("OFF"),
    .OUTCEMUX("1"),
    .OUTRSTMUX("0"),
    .OUTSCLKMUX("CLK"),
    .SRMODE("ASYNC"),
    .TSMUX("INV"))
    \SDR_DQ[8]_syn_2  (
    .ce(open_n1962),
    .do({open_n1963,open_n1964,open_n1965,\u2_wrrd/app_wr_din_6d [8]}),
    .ipad(open_n1966),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n1967),
    .opclk(open_n1968),
    .osclk(Sdr_clk_dup_1),
    .rst(open_n1969),
    .ts(\u2_wrrd/sdr_t ),
    .di(\SDR_DQ[8]_dup_1 ),
    .diq({open_n1970,open_n1971,open_n1972,\u2_wrrd/Sdr_rd_dout[8]_syn_3 }),
    .opad(open_n1973),
    .bpad(SDR_DQ[8]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(42)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    //.SLEWRATE("SLOW"),
    .DO_DFFMODE("FF"),
    .DO_REGSET("RESET"),
    .DRIVE("8"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("0"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("RESET"),
    .IOTYPE("LVCMOS25"),
    .MODE("BI"),
    .ODDRMODE("OFF"),
    .OUTCEMUX("1"),
    .OUTRSTMUX("0"),
    .OUTSCLKMUX("CLK"),
    .SRMODE("ASYNC"),
    .TSMUX("INV"))
    \SDR_DQ[9]_syn_2  (
    .ce(open_n1974),
    .do({open_n1975,open_n1976,open_n1977,\u2_wrrd/app_wr_din_6d [9]}),
    .ipad(open_n1978),
    .ipclk(Sdr_clk_dup_1),
    .isclk(open_n1979),
    .opclk(open_n1980),
    .osclk(Sdr_clk_dup_1),
    .rst(open_n1981),
    .ts(\u2_wrrd/sdr_t ),
    .di(\SDR_DQ[9]_dup_1 ),
    .diq({open_n1982,open_n1983,open_n1984,\u2_wrrd/Sdr_rd_dout[9]_syn_3 }),
    .opad(open_n1985),
    .bpad(SDR_DQ[9]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(42)
  EG_PHY_PAD #(
    //.SLEWRATE("SLOW"),
    .DO_DFFMODE("FF"),
    .DO_REGSET("RESET"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .ODDRMODE("OFF"),
    .OUTCEMUX("1"),
    .OUTRSTMUX("0"),
    .OUTSCLKMUX("CLK"),
    .SRMODE("ASYNC"),
    .TSMUX("0"))
    SDR_RAS_syn_6 (
    .ce(open_n1986),
    .do({open_n1987,open_n1988,open_n1989,\u2_wrrd/SDR_RAS_n }),
    .ipad(open_n1990),
    .ipclk(open_n1991),
    .isclk(open_n1992),
    .opclk(open_n1993),
    .osclk(Sdr_clk_dup_1),
    .rst(open_n1994),
    .ts(open_n1995),
    .di(open_n1996),
    .diq({open_n1997,open_n1998,open_n1999,open_n2000}),
    .opad(SDR_RAS),
    .bpad(open_n2001));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(36)
  EG_PHY_PAD #(
    //.SLEWRATE("SLOW"),
    .DO_DFFMODE("FF"),
    .DO_REGSET("RESET"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .ODDRMODE("OFF"),
    .OUTCEMUX("1"),
    .OUTRSTMUX("0"),
    .OUTSCLKMUX("CLK"),
    .SRMODE("ASYNC"),
    .TSMUX("0"))
    SDR_WE_syn_6 (
    .ce(open_n2002),
    .do({open_n2003,open_n2004,open_n2005,\u2_wrrd/SDR_WE_n }),
    .ipad(open_n2006),
    .ipclk(open_n2007),
    .isclk(open_n2008),
    .opclk(open_n2009),
    .osclk(Sdr_clk_dup_1),
    .rst(open_n2010),
    .ts(open_n2011),
    .di(open_n2012),
    .diq({open_n2013,open_n2014,open_n2015,open_n2016}),
    .opad(SDR_WE),
    .bpad(open_n2017));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(38)
  EG_PHY_PAD #(
    //.SLEWRATE("SLOW"),
    .DO_DFFMODE("FF"),
    .DO_REGSET("RESET"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .ODDRMODE("OFF"),
    .OUTCEMUX("1"),
    .OUTRSTMUX("RST"),
    .OUTSCLKMUX("CLK"),
    .SRMODE("SYNC"),
    .TSMUX("0"))
    Sdr_busy_syn_6 (
    .ce(open_n2018),
    .do({open_n2019,open_n2020,open_n2021,\u2_wrrd/Sdr_busy_n4 }),
    .ipad(open_n2022),
    .ipclk(open_n2023),
    .isclk(open_n2024),
    .opclk(open_n2025),
    .osclk(Sdr_clk_dup_1),
    .rst(Rst_dup_177),
    .ts(open_n2026),
    .di(open_n2027),
    .diq({open_n2028,open_n2029,open_n2030,open_n2031}),
    .opad(Sdr_busy),
    .bpad(open_n2032));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(20)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    Sdr_clk_sft_syn_2 (
    .ce(open_n2033),
    .do({open_n2034,open_n2035,open_n2036,open_n2037}),
    .ipad(Sdr_clk_sft),
    .ipclk(open_n2038),
    .isclk(open_n2039),
    .opclk(open_n2040),
    .osclk(open_n2041),
    .rst(open_n2042),
    .ts(open_n2043),
    .di(Sdr_clk_sft_dup_1),
    .diq({open_n2044,open_n2045,open_n2046,open_n2047}),
    .opad(open_n2048),
    .bpad(open_n2049));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(15)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    Sdr_clk_syn_2 (
    .ce(open_n2050),
    .do({open_n2051,open_n2052,open_n2053,open_n2054}),
    .ipad(Sdr_clk),
    .ipclk(open_n2055),
    .isclk(open_n2056),
    .opclk(open_n2057),
    .osclk(open_n2058),
    .rst(open_n2059),
    .ts(open_n2060),
    .di(Sdr_clk_dup_1),
    .diq({open_n2061,open_n2062,open_n2063,open_n2064}),
    .opad(open_n2065),
    .bpad(open_n2066));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(14)
  EG_PHY_PAD #(
    //.SLEWRATE("SLOW"),
    .DO_DFFMODE("FF"),
    .DO_REGSET("RESET"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .ODDRMODE("OFF"),
    .OUTCEMUX("CE"),
    .OUTRSTMUX("RST"),
    .OUTSCLKMUX("CLK"),
    .SRMODE("SYNC"),
    .TSMUX("0"))
    Sdr_init_done_syn_6 (
    .ce(\u1_init_ref/sdr_init_cnt [30]),
    .do({open_n2067,open_n2068,open_n2069,1'b1}),
    .ipad(open_n2070),
    .ipclk(open_n2071),
    .isclk(open_n2072),
    .opclk(open_n2073),
    .osclk(Sdr_clk_dup_1),
    .rst(\u1_init_ref/init_done_n2 ),
    .ts(open_n2074),
    .di(open_n2075),
    .diq({open_n2076,open_n2077,open_n2078,open_n2079}),
    .opad(Sdr_init_done),
    .bpad(open_n2080));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(18)
  EG_PHY_PAD #(
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    Sdr_init_ref_vld_syn_2 (
    .ce(open_n2081),
    .do({open_n2082,open_n2083,open_n2084,Sdr_init_ref_vld_dup_1}),
    .ipad(open_n2085),
    .ipclk(open_n2086),
    .isclk(open_n2087),
    .opclk(open_n2088),
    .osclk(open_n2089),
    .rst(open_n2090),
    .ts(open_n2091),
    .di(open_n2092),
    .diq({open_n2093,open_n2094,open_n2095,open_n2096}),
    .opad(Sdr_init_ref_vld),
    .bpad(open_n2097));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(19)
  buf \Sdr_rd_dout[0]_syn_1  (\Sdr_rd_dout[0]_dup_3 , \u2_wrrd/Sdr_rd_dout[0]_syn_4 );  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  EG_PHY_PAD #(
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \Sdr_rd_dout[0]_syn_4  (
    .ce(open_n2098),
    .do({open_n2099,open_n2100,open_n2101,\Sdr_rd_dout[0]_dup_3 }),
    .ipad(open_n2102),
    .ipclk(open_n2103),
    .isclk(open_n2104),
    .opclk(open_n2105),
    .osclk(open_n2106),
    .rst(open_n2107),
    .ts(open_n2108),
    .di(open_n2109),
    .diq({open_n2110,open_n2111,open_n2112,open_n2113}),
    .opad(Sdr_rd_dout[0]),
    .bpad(open_n2114));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  buf \Sdr_rd_dout[10]_syn_1  (\Sdr_rd_dout[10]_dup_3 , \u2_wrrd/Sdr_rd_dout[10]_syn_4 );  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  EG_PHY_PAD #(
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \Sdr_rd_dout[10]_syn_4  (
    .ce(open_n2115),
    .do({open_n2116,open_n2117,open_n2118,\Sdr_rd_dout[10]_dup_3 }),
    .ipad(open_n2119),
    .ipclk(open_n2120),
    .isclk(open_n2121),
    .opclk(open_n2122),
    .osclk(open_n2123),
    .rst(open_n2124),
    .ts(open_n2125),
    .di(open_n2126),
    .diq({open_n2127,open_n2128,open_n2129,open_n2130}),
    .opad(Sdr_rd_dout[10]),
    .bpad(open_n2131));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  buf \Sdr_rd_dout[11]_syn_1  (\Sdr_rd_dout[11]_dup_3 , \u2_wrrd/Sdr_rd_dout[11]_syn_4 );  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  EG_PHY_PAD #(
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \Sdr_rd_dout[11]_syn_4  (
    .ce(open_n2132),
    .do({open_n2133,open_n2134,open_n2135,\Sdr_rd_dout[11]_dup_3 }),
    .ipad(open_n2136),
    .ipclk(open_n2137),
    .isclk(open_n2138),
    .opclk(open_n2139),
    .osclk(open_n2140),
    .rst(open_n2141),
    .ts(open_n2142),
    .di(open_n2143),
    .diq({open_n2144,open_n2145,open_n2146,open_n2147}),
    .opad(Sdr_rd_dout[11]),
    .bpad(open_n2148));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  buf \Sdr_rd_dout[12]_syn_1  (\Sdr_rd_dout[12]_dup_3 , \u2_wrrd/Sdr_rd_dout[12]_syn_4 );  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  EG_PHY_PAD #(
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \Sdr_rd_dout[12]_syn_4  (
    .ce(open_n2149),
    .do({open_n2150,open_n2151,open_n2152,\Sdr_rd_dout[12]_dup_3 }),
    .ipad(open_n2153),
    .ipclk(open_n2154),
    .isclk(open_n2155),
    .opclk(open_n2156),
    .osclk(open_n2157),
    .rst(open_n2158),
    .ts(open_n2159),
    .di(open_n2160),
    .diq({open_n2161,open_n2162,open_n2163,open_n2164}),
    .opad(Sdr_rd_dout[12]),
    .bpad(open_n2165));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  buf \Sdr_rd_dout[13]_syn_1  (\Sdr_rd_dout[13]_dup_3 , \u2_wrrd/Sdr_rd_dout[13]_syn_4 );  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  EG_PHY_PAD #(
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \Sdr_rd_dout[13]_syn_4  (
    .ce(open_n2166),
    .do({open_n2167,open_n2168,open_n2169,\Sdr_rd_dout[13]_dup_3 }),
    .ipad(open_n2170),
    .ipclk(open_n2171),
    .isclk(open_n2172),
    .opclk(open_n2173),
    .osclk(open_n2174),
    .rst(open_n2175),
    .ts(open_n2176),
    .di(open_n2177),
    .diq({open_n2178,open_n2179,open_n2180,open_n2181}),
    .opad(Sdr_rd_dout[13]),
    .bpad(open_n2182));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  buf \Sdr_rd_dout[14]_syn_1  (\Sdr_rd_dout[14]_dup_3 , \u2_wrrd/Sdr_rd_dout[14]_syn_4 );  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  EG_PHY_PAD #(
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \Sdr_rd_dout[14]_syn_4  (
    .ce(open_n2183),
    .do({open_n2184,open_n2185,open_n2186,\Sdr_rd_dout[14]_dup_3 }),
    .ipad(open_n2187),
    .ipclk(open_n2188),
    .isclk(open_n2189),
    .opclk(open_n2190),
    .osclk(open_n2191),
    .rst(open_n2192),
    .ts(open_n2193),
    .di(open_n2194),
    .diq({open_n2195,open_n2196,open_n2197,open_n2198}),
    .opad(Sdr_rd_dout[14]),
    .bpad(open_n2199));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  buf \Sdr_rd_dout[15]_syn_1  (\Sdr_rd_dout[15]_dup_3 , \u2_wrrd/Sdr_rd_dout[15]_syn_4 );  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  EG_PHY_PAD #(
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \Sdr_rd_dout[15]_syn_4  (
    .ce(open_n2200),
    .do({open_n2201,open_n2202,open_n2203,\Sdr_rd_dout[15]_dup_3 }),
    .ipad(open_n2204),
    .ipclk(open_n2205),
    .isclk(open_n2206),
    .opclk(open_n2207),
    .osclk(open_n2208),
    .rst(open_n2209),
    .ts(open_n2210),
    .di(open_n2211),
    .diq({open_n2212,open_n2213,open_n2214,open_n2215}),
    .opad(Sdr_rd_dout[15]),
    .bpad(open_n2216));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  buf \Sdr_rd_dout[16]_syn_1  (\Sdr_rd_dout[16]_dup_3 , \u2_wrrd/Sdr_rd_dout[16]_syn_4 );  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  EG_PHY_PAD #(
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \Sdr_rd_dout[16]_syn_4  (
    .ce(open_n2217),
    .do({open_n2218,open_n2219,open_n2220,\Sdr_rd_dout[16]_dup_3 }),
    .ipad(open_n2221),
    .ipclk(open_n2222),
    .isclk(open_n2223),
    .opclk(open_n2224),
    .osclk(open_n2225),
    .rst(open_n2226),
    .ts(open_n2227),
    .di(open_n2228),
    .diq({open_n2229,open_n2230,open_n2231,open_n2232}),
    .opad(Sdr_rd_dout[16]),
    .bpad(open_n2233));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  buf \Sdr_rd_dout[17]_syn_1  (\Sdr_rd_dout[17]_dup_3 , \u2_wrrd/Sdr_rd_dout[17]_syn_4 );  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  EG_PHY_PAD #(
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \Sdr_rd_dout[17]_syn_4  (
    .ce(open_n2234),
    .do({open_n2235,open_n2236,open_n2237,\Sdr_rd_dout[17]_dup_3 }),
    .ipad(open_n2238),
    .ipclk(open_n2239),
    .isclk(open_n2240),
    .opclk(open_n2241),
    .osclk(open_n2242),
    .rst(open_n2243),
    .ts(open_n2244),
    .di(open_n2245),
    .diq({open_n2246,open_n2247,open_n2248,open_n2249}),
    .opad(Sdr_rd_dout[17]),
    .bpad(open_n2250));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  buf \Sdr_rd_dout[18]_syn_1  (\Sdr_rd_dout[18]_dup_3 , \u2_wrrd/Sdr_rd_dout[18]_syn_4 );  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  EG_PHY_PAD #(
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \Sdr_rd_dout[18]_syn_4  (
    .ce(open_n2251),
    .do({open_n2252,open_n2253,open_n2254,\Sdr_rd_dout[18]_dup_3 }),
    .ipad(open_n2255),
    .ipclk(open_n2256),
    .isclk(open_n2257),
    .opclk(open_n2258),
    .osclk(open_n2259),
    .rst(open_n2260),
    .ts(open_n2261),
    .di(open_n2262),
    .diq({open_n2263,open_n2264,open_n2265,open_n2266}),
    .opad(Sdr_rd_dout[18]),
    .bpad(open_n2267));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  buf \Sdr_rd_dout[19]_syn_1  (\Sdr_rd_dout[19]_dup_3 , \u2_wrrd/Sdr_rd_dout[19]_syn_4 );  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  EG_PHY_PAD #(
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \Sdr_rd_dout[19]_syn_4  (
    .ce(open_n2268),
    .do({open_n2269,open_n2270,open_n2271,\Sdr_rd_dout[19]_dup_3 }),
    .ipad(open_n2272),
    .ipclk(open_n2273),
    .isclk(open_n2274),
    .opclk(open_n2275),
    .osclk(open_n2276),
    .rst(open_n2277),
    .ts(open_n2278),
    .di(open_n2279),
    .diq({open_n2280,open_n2281,open_n2282,open_n2283}),
    .opad(Sdr_rd_dout[19]),
    .bpad(open_n2284));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  buf \Sdr_rd_dout[1]_syn_1  (\Sdr_rd_dout[1]_dup_3 , \u2_wrrd/Sdr_rd_dout[1]_syn_4 );  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  EG_PHY_PAD #(
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \Sdr_rd_dout[1]_syn_4  (
    .ce(open_n2285),
    .do({open_n2286,open_n2287,open_n2288,\Sdr_rd_dout[1]_dup_3 }),
    .ipad(open_n2289),
    .ipclk(open_n2290),
    .isclk(open_n2291),
    .opclk(open_n2292),
    .osclk(open_n2293),
    .rst(open_n2294),
    .ts(open_n2295),
    .di(open_n2296),
    .diq({open_n2297,open_n2298,open_n2299,open_n2300}),
    .opad(Sdr_rd_dout[1]),
    .bpad(open_n2301));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  buf \Sdr_rd_dout[20]_syn_1  (\Sdr_rd_dout[20]_dup_3 , \u2_wrrd/Sdr_rd_dout[20]_syn_4 );  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  EG_PHY_PAD #(
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \Sdr_rd_dout[20]_syn_4  (
    .ce(open_n2302),
    .do({open_n2303,open_n2304,open_n2305,\Sdr_rd_dout[20]_dup_3 }),
    .ipad(open_n2306),
    .ipclk(open_n2307),
    .isclk(open_n2308),
    .opclk(open_n2309),
    .osclk(open_n2310),
    .rst(open_n2311),
    .ts(open_n2312),
    .di(open_n2313),
    .diq({open_n2314,open_n2315,open_n2316,open_n2317}),
    .opad(Sdr_rd_dout[20]),
    .bpad(open_n2318));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  buf \Sdr_rd_dout[21]_syn_1  (\Sdr_rd_dout[21]_dup_3 , \u2_wrrd/Sdr_rd_dout[21]_syn_4 );  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  EG_PHY_PAD #(
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \Sdr_rd_dout[21]_syn_4  (
    .ce(open_n2319),
    .do({open_n2320,open_n2321,open_n2322,\Sdr_rd_dout[21]_dup_3 }),
    .ipad(open_n2323),
    .ipclk(open_n2324),
    .isclk(open_n2325),
    .opclk(open_n2326),
    .osclk(open_n2327),
    .rst(open_n2328),
    .ts(open_n2329),
    .di(open_n2330),
    .diq({open_n2331,open_n2332,open_n2333,open_n2334}),
    .opad(Sdr_rd_dout[21]),
    .bpad(open_n2335));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  buf \Sdr_rd_dout[22]_syn_1  (\Sdr_rd_dout[22]_dup_3 , \u2_wrrd/Sdr_rd_dout[22]_syn_4 );  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  EG_PHY_PAD #(
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \Sdr_rd_dout[22]_syn_4  (
    .ce(open_n2336),
    .do({open_n2337,open_n2338,open_n2339,\Sdr_rd_dout[22]_dup_3 }),
    .ipad(open_n2340),
    .ipclk(open_n2341),
    .isclk(open_n2342),
    .opclk(open_n2343),
    .osclk(open_n2344),
    .rst(open_n2345),
    .ts(open_n2346),
    .di(open_n2347),
    .diq({open_n2348,open_n2349,open_n2350,open_n2351}),
    .opad(Sdr_rd_dout[22]),
    .bpad(open_n2352));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  buf \Sdr_rd_dout[23]_syn_1  (\Sdr_rd_dout[23]_dup_3 , \u2_wrrd/Sdr_rd_dout[23]_syn_4 );  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  EG_PHY_PAD #(
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \Sdr_rd_dout[23]_syn_4  (
    .ce(open_n2353),
    .do({open_n2354,open_n2355,open_n2356,\Sdr_rd_dout[23]_dup_3 }),
    .ipad(open_n2357),
    .ipclk(open_n2358),
    .isclk(open_n2359),
    .opclk(open_n2360),
    .osclk(open_n2361),
    .rst(open_n2362),
    .ts(open_n2363),
    .di(open_n2364),
    .diq({open_n2365,open_n2366,open_n2367,open_n2368}),
    .opad(Sdr_rd_dout[23]),
    .bpad(open_n2369));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  buf \Sdr_rd_dout[24]_syn_1  (\Sdr_rd_dout[24]_dup_3 , \u2_wrrd/Sdr_rd_dout[24]_syn_4 );  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  EG_PHY_PAD #(
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \Sdr_rd_dout[24]_syn_4  (
    .ce(open_n2370),
    .do({open_n2371,open_n2372,open_n2373,\Sdr_rd_dout[24]_dup_3 }),
    .ipad(open_n2374),
    .ipclk(open_n2375),
    .isclk(open_n2376),
    .opclk(open_n2377),
    .osclk(open_n2378),
    .rst(open_n2379),
    .ts(open_n2380),
    .di(open_n2381),
    .diq({open_n2382,open_n2383,open_n2384,open_n2385}),
    .opad(Sdr_rd_dout[24]),
    .bpad(open_n2386));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  buf \Sdr_rd_dout[25]_syn_1  (\Sdr_rd_dout[25]_dup_3 , \u2_wrrd/Sdr_rd_dout[25]_syn_4 );  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  EG_PHY_PAD #(
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \Sdr_rd_dout[25]_syn_4  (
    .ce(open_n2387),
    .do({open_n2388,open_n2389,open_n2390,\Sdr_rd_dout[25]_dup_3 }),
    .ipad(open_n2391),
    .ipclk(open_n2392),
    .isclk(open_n2393),
    .opclk(open_n2394),
    .osclk(open_n2395),
    .rst(open_n2396),
    .ts(open_n2397),
    .di(open_n2398),
    .diq({open_n2399,open_n2400,open_n2401,open_n2402}),
    .opad(Sdr_rd_dout[25]),
    .bpad(open_n2403));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  buf \Sdr_rd_dout[26]_syn_1  (\Sdr_rd_dout[26]_dup_3 , \u2_wrrd/Sdr_rd_dout[26]_syn_4 );  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  EG_PHY_PAD #(
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \Sdr_rd_dout[26]_syn_4  (
    .ce(open_n2404),
    .do({open_n2405,open_n2406,open_n2407,\Sdr_rd_dout[26]_dup_3 }),
    .ipad(open_n2408),
    .ipclk(open_n2409),
    .isclk(open_n2410),
    .opclk(open_n2411),
    .osclk(open_n2412),
    .rst(open_n2413),
    .ts(open_n2414),
    .di(open_n2415),
    .diq({open_n2416,open_n2417,open_n2418,open_n2419}),
    .opad(Sdr_rd_dout[26]),
    .bpad(open_n2420));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  buf \Sdr_rd_dout[27]_syn_1  (\Sdr_rd_dout[27]_dup_3 , \u2_wrrd/Sdr_rd_dout[27]_syn_4 );  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  EG_PHY_PAD #(
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \Sdr_rd_dout[27]_syn_4  (
    .ce(open_n2421),
    .do({open_n2422,open_n2423,open_n2424,\Sdr_rd_dout[27]_dup_3 }),
    .ipad(open_n2425),
    .ipclk(open_n2426),
    .isclk(open_n2427),
    .opclk(open_n2428),
    .osclk(open_n2429),
    .rst(open_n2430),
    .ts(open_n2431),
    .di(open_n2432),
    .diq({open_n2433,open_n2434,open_n2435,open_n2436}),
    .opad(Sdr_rd_dout[27]),
    .bpad(open_n2437));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  buf \Sdr_rd_dout[28]_syn_1  (\Sdr_rd_dout[28]_dup_3 , \u2_wrrd/Sdr_rd_dout[28]_syn_4 );  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  EG_PHY_PAD #(
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \Sdr_rd_dout[28]_syn_4  (
    .ce(open_n2438),
    .do({open_n2439,open_n2440,open_n2441,\Sdr_rd_dout[28]_dup_3 }),
    .ipad(open_n2442),
    .ipclk(open_n2443),
    .isclk(open_n2444),
    .opclk(open_n2445),
    .osclk(open_n2446),
    .rst(open_n2447),
    .ts(open_n2448),
    .di(open_n2449),
    .diq({open_n2450,open_n2451,open_n2452,open_n2453}),
    .opad(Sdr_rd_dout[28]),
    .bpad(open_n2454));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  buf \Sdr_rd_dout[29]_syn_1  (\Sdr_rd_dout[29]_dup_3 , \u2_wrrd/Sdr_rd_dout[29]_syn_4 );  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  EG_PHY_PAD #(
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \Sdr_rd_dout[29]_syn_4  (
    .ce(open_n2455),
    .do({open_n2456,open_n2457,open_n2458,\Sdr_rd_dout[29]_dup_3 }),
    .ipad(open_n2459),
    .ipclk(open_n2460),
    .isclk(open_n2461),
    .opclk(open_n2462),
    .osclk(open_n2463),
    .rst(open_n2464),
    .ts(open_n2465),
    .di(open_n2466),
    .diq({open_n2467,open_n2468,open_n2469,open_n2470}),
    .opad(Sdr_rd_dout[29]),
    .bpad(open_n2471));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  buf \Sdr_rd_dout[2]_syn_1  (\Sdr_rd_dout[2]_dup_3 , \u2_wrrd/Sdr_rd_dout[2]_syn_4 );  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  EG_PHY_PAD #(
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \Sdr_rd_dout[2]_syn_4  (
    .ce(open_n2472),
    .do({open_n2473,open_n2474,open_n2475,\Sdr_rd_dout[2]_dup_3 }),
    .ipad(open_n2476),
    .ipclk(open_n2477),
    .isclk(open_n2478),
    .opclk(open_n2479),
    .osclk(open_n2480),
    .rst(open_n2481),
    .ts(open_n2482),
    .di(open_n2483),
    .diq({open_n2484,open_n2485,open_n2486,open_n2487}),
    .opad(Sdr_rd_dout[2]),
    .bpad(open_n2488));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  buf \Sdr_rd_dout[30]_syn_1  (\Sdr_rd_dout[30]_dup_3 , \u2_wrrd/Sdr_rd_dout[30]_syn_4 );  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  EG_PHY_PAD #(
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \Sdr_rd_dout[30]_syn_4  (
    .ce(open_n2489),
    .do({open_n2490,open_n2491,open_n2492,\Sdr_rd_dout[30]_dup_3 }),
    .ipad(open_n2493),
    .ipclk(open_n2494),
    .isclk(open_n2495),
    .opclk(open_n2496),
    .osclk(open_n2497),
    .rst(open_n2498),
    .ts(open_n2499),
    .di(open_n2500),
    .diq({open_n2501,open_n2502,open_n2503,open_n2504}),
    .opad(Sdr_rd_dout[30]),
    .bpad(open_n2505));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  buf \Sdr_rd_dout[31]_syn_1  (\Sdr_rd_dout[31]_dup_3 , \u2_wrrd/Sdr_rd_dout[31]_syn_4 );  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  EG_PHY_PAD #(
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \Sdr_rd_dout[31]_syn_4  (
    .ce(open_n2506),
    .do({open_n2507,open_n2508,open_n2509,\Sdr_rd_dout[31]_dup_3 }),
    .ipad(open_n2510),
    .ipclk(open_n2511),
    .isclk(open_n2512),
    .opclk(open_n2513),
    .osclk(open_n2514),
    .rst(open_n2515),
    .ts(open_n2516),
    .di(open_n2517),
    .diq({open_n2518,open_n2519,open_n2520,open_n2521}),
    .opad(Sdr_rd_dout[31]),
    .bpad(open_n2522));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  buf \Sdr_rd_dout[3]_syn_1  (\Sdr_rd_dout[3]_dup_3 , \u2_wrrd/Sdr_rd_dout[3]_syn_4 );  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  EG_PHY_PAD #(
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \Sdr_rd_dout[3]_syn_4  (
    .ce(open_n2523),
    .do({open_n2524,open_n2525,open_n2526,\Sdr_rd_dout[3]_dup_3 }),
    .ipad(open_n2527),
    .ipclk(open_n2528),
    .isclk(open_n2529),
    .opclk(open_n2530),
    .osclk(open_n2531),
    .rst(open_n2532),
    .ts(open_n2533),
    .di(open_n2534),
    .diq({open_n2535,open_n2536,open_n2537,open_n2538}),
    .opad(Sdr_rd_dout[3]),
    .bpad(open_n2539));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  buf \Sdr_rd_dout[4]_syn_1  (\Sdr_rd_dout[4]_dup_3 , \u2_wrrd/Sdr_rd_dout[4]_syn_4 );  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  EG_PHY_PAD #(
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \Sdr_rd_dout[4]_syn_4  (
    .ce(open_n2540),
    .do({open_n2541,open_n2542,open_n2543,\Sdr_rd_dout[4]_dup_3 }),
    .ipad(open_n2544),
    .ipclk(open_n2545),
    .isclk(open_n2546),
    .opclk(open_n2547),
    .osclk(open_n2548),
    .rst(open_n2549),
    .ts(open_n2550),
    .di(open_n2551),
    .diq({open_n2552,open_n2553,open_n2554,open_n2555}),
    .opad(Sdr_rd_dout[4]),
    .bpad(open_n2556));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  buf \Sdr_rd_dout[5]_syn_1  (\Sdr_rd_dout[5]_dup_3 , \u2_wrrd/Sdr_rd_dout[5]_syn_4 );  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  EG_PHY_PAD #(
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \Sdr_rd_dout[5]_syn_4  (
    .ce(open_n2557),
    .do({open_n2558,open_n2559,open_n2560,\Sdr_rd_dout[5]_dup_3 }),
    .ipad(open_n2561),
    .ipclk(open_n2562),
    .isclk(open_n2563),
    .opclk(open_n2564),
    .osclk(open_n2565),
    .rst(open_n2566),
    .ts(open_n2567),
    .di(open_n2568),
    .diq({open_n2569,open_n2570,open_n2571,open_n2572}),
    .opad(Sdr_rd_dout[5]),
    .bpad(open_n2573));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  buf \Sdr_rd_dout[6]_syn_1  (\Sdr_rd_dout[6]_dup_3 , \u2_wrrd/Sdr_rd_dout[6]_syn_4 );  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  EG_PHY_PAD #(
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \Sdr_rd_dout[6]_syn_4  (
    .ce(open_n2574),
    .do({open_n2575,open_n2576,open_n2577,\Sdr_rd_dout[6]_dup_3 }),
    .ipad(open_n2578),
    .ipclk(open_n2579),
    .isclk(open_n2580),
    .opclk(open_n2581),
    .osclk(open_n2582),
    .rst(open_n2583),
    .ts(open_n2584),
    .di(open_n2585),
    .diq({open_n2586,open_n2587,open_n2588,open_n2589}),
    .opad(Sdr_rd_dout[6]),
    .bpad(open_n2590));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  buf \Sdr_rd_dout[7]_syn_1  (\Sdr_rd_dout[7]_dup_3 , \u2_wrrd/Sdr_rd_dout[7]_syn_4 );  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  EG_PHY_PAD #(
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \Sdr_rd_dout[7]_syn_4  (
    .ce(open_n2591),
    .do({open_n2592,open_n2593,open_n2594,\Sdr_rd_dout[7]_dup_3 }),
    .ipad(open_n2595),
    .ipclk(open_n2596),
    .isclk(open_n2597),
    .opclk(open_n2598),
    .osclk(open_n2599),
    .rst(open_n2600),
    .ts(open_n2601),
    .di(open_n2602),
    .diq({open_n2603,open_n2604,open_n2605,open_n2606}),
    .opad(Sdr_rd_dout[7]),
    .bpad(open_n2607));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  buf \Sdr_rd_dout[8]_syn_1  (\Sdr_rd_dout[8]_dup_3 , \u2_wrrd/Sdr_rd_dout[8]_syn_4 );  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  EG_PHY_PAD #(
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \Sdr_rd_dout[8]_syn_4  (
    .ce(open_n2608),
    .do({open_n2609,open_n2610,open_n2611,\Sdr_rd_dout[8]_dup_3 }),
    .ipad(open_n2612),
    .ipclk(open_n2613),
    .isclk(open_n2614),
    .opclk(open_n2615),
    .osclk(open_n2616),
    .rst(open_n2617),
    .ts(open_n2618),
    .di(open_n2619),
    .diq({open_n2620,open_n2621,open_n2622,open_n2623}),
    .opad(Sdr_rd_dout[8]),
    .bpad(open_n2624));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  buf \Sdr_rd_dout[9]_syn_1  (\Sdr_rd_dout[9]_dup_3 , \u2_wrrd/Sdr_rd_dout[9]_syn_4 );  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  EG_PHY_PAD #(
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \Sdr_rd_dout[9]_syn_4  (
    .ce(open_n2625),
    .do({open_n2626,open_n2627,open_n2628,\Sdr_rd_dout[9]_dup_3 }),
    .ipad(open_n2629),
    .ipclk(open_n2630),
    .isclk(open_n2631),
    .opclk(open_n2632),
    .osclk(open_n2633),
    .rst(open_n2634),
    .ts(open_n2635),
    .di(open_n2636),
    .diq({open_n2637,open_n2638,open_n2639,open_n2640}),
    .opad(Sdr_rd_dout[9]),
    .bpad(open_n2641));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  EG_PHY_PAD #(
    //.SLEWRATE("SLOW"),
    .DO_DFFMODE("FF"),
    .DO_REGSET("RESET"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .ODDRMODE("OFF"),
    .OUTCEMUX("1"),
    .OUTRSTMUX("0"),
    .OUTSCLKMUX("CLK"),
    .SRMODE("ASYNC"),
    .TSMUX("0"))
    Sdr_rd_en_syn_6 (
    .ce(open_n2642),
    .do({open_n2643,open_n2644,open_n2645,\u2_wrrd/app_rd_en_sft [9]}),
    .ipad(open_n2646),
    .ipclk(open_n2647),
    .isclk(open_n2648),
    .opclk(open_n2649),
    .osclk(Sdr_clk_dup_1),
    .rst(open_n2650),
    .ts(open_n2651),
    .di(open_n2652),
    .diq({open_n2653,open_n2654,open_n2655,open_n2656}),
    .opad(Sdr_rd_en),
    .bpad(open_n2657));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(31)
  EG_PHY_CONFIG #(
    .DONE_PERSISTN("ENABLE"),
    .INIT_PERSISTN("ENABLE"),
    .JTAG_PERSISTN("DISABLE"),
    .PROGRAMN_PERSISTN("DISABLE"))
    config_inst ();
  AL_MAP_LUT2 #(
    .EQN("~(~B*~A)"),
    .INIT(4'he))
    \u1_init_ref/Sdr_ref_req_syn_1  (
    .a(App_ref_req_dup_1),
    .b(\u1_init_ref/ref_req ),
    .o(\u1_init_ref/Sdr_ref_req ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(26)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u1_init_ref/ad_reg[10]  (
    .clk(Sdr_clk_dup_1),
    .d(\u1_init_ref/ad_reg[10]_syn_4 ),
    .q(\u1_init_ref/Sdr_init_ref_addr [10]));
  AL_MAP_LUT4 #(
    .EQN("(~C*~(~A*~(D*~B)))"),
    .INIT(16'h0b0a))
    \u1_init_ref/ad_reg[10]_syn_5  (
    .a(\u1_init_ref/ras_reg_syn_5 ),
    .b(\u1_init_ref/ras_reg_syn_7 ),
    .c(Rst_dup_177),
    .d(\u1_init_ref/Sdr_init_ref_addr [10]),
    .o(\u1_init_ref/ad_reg[10]_syn_4 ));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u1_init_ref/ad_reg[1]  (
    .clk(Sdr_clk_dup_1),
    .d(\u1_init_ref/ad_reg[1]_syn_4 ),
    .q(\u1_init_ref/Sdr_init_ref_addr [1]));
  AL_MAP_LUT4 #(
    .EQN("(~C*~A*~(~D*~B))"),
    .INIT(16'h0504))
    \u1_init_ref/ad_reg[1]_syn_5  (
    .a(\u1_init_ref/ras_reg_syn_5 ),
    .b(\u1_init_ref/ras_reg_syn_7 ),
    .c(Rst_dup_177),
    .d(\u1_init_ref/Sdr_init_ref_addr [1]),
    .o(\u1_init_ref/ad_reg[1]_syn_4 ));
  EG_PHY_MSLICE #(
    //.MACRO("u1_init_ref/add0_syn_90"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("ADD_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"))
    \u1_init_ref/add0_syn_90  (
    .a({\u1_init_ref/init_cnt [0],1'b0}),
    .b({1'b1,open_n2709}),
    .fco(\u1_init_ref/add0_syn_72 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(105)
  EG_PHY_LSLICE #(
    //.MACRO("u1_init_ref/add1_syn_110"),
    //.R_POSITION("X0Y0Z0"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'h000A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u1_init_ref/add1_syn_110  (
    .a({\u1_init_ref/pwr_200ms_cnt [1],1'b0}),
    .b({\u1_init_ref/pwr_200ms_cnt [2],\u1_init_ref/pwr_200ms_cnt [0]}),
    .c(2'b00),
    .d(2'b01),
    .e(2'b01),
    .f({\u1_init_ref/pwr_200ms_cnt_b3 [1],open_n2752}),
    .fco(\u1_init_ref/add1_syn_94 ),
    .fx({\u1_init_ref/pwr_200ms_cnt_b3 [2],open_n2753}));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(62)
  EG_PHY_LSLICE #(
    //.MACRO("u1_init_ref/add1_syn_110"),
    //.R_POSITION("X0Y0Z1"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u1_init_ref/add1_syn_111  (
    .a({\u1_init_ref/pwr_200ms_cnt [5],\u1_init_ref/pwr_200ms_cnt [3]}),
    .b({\u1_init_ref/pwr_200ms_cnt [6],\u1_init_ref/pwr_200ms_cnt [4]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\u1_init_ref/add1_syn_94 ),
    .f({\u1_init_ref/pwr_200ms_cnt_b3 [5],\u1_init_ref/pwr_200ms_cnt_b3 [3]}),
    .fco(\u1_init_ref/add1_syn_98 ),
    .fx({\u1_init_ref/pwr_200ms_cnt_b3 [6],\u1_init_ref/pwr_200ms_cnt_b3 [4]}));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(62)
  EG_PHY_LSLICE #(
    //.MACRO("u1_init_ref/add1_syn_110"),
    //.R_POSITION("X0Y1Z0"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u1_init_ref/add1_syn_112  (
    .a({\u1_init_ref/pwr_200ms_cnt [9],\u1_init_ref/pwr_200ms_cnt [7]}),
    .b({\u1_init_ref/pwr_200ms_cnt [10],\u1_init_ref/pwr_200ms_cnt [8]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\u1_init_ref/add1_syn_98 ),
    .f({\u1_init_ref/pwr_200ms_cnt_b3 [9],\u1_init_ref/pwr_200ms_cnt_b3 [7]}),
    .fco(\u1_init_ref/add1_syn_102 ),
    .fx({\u1_init_ref/pwr_200ms_cnt_b3 [10],\u1_init_ref/pwr_200ms_cnt_b3 [8]}));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(62)
  EG_PHY_LSLICE #(
    //.MACRO("u1_init_ref/add1_syn_110"),
    //.R_POSITION("X0Y1Z1"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u1_init_ref/add1_syn_113  (
    .a({\u1_init_ref/pwr_200ms_cnt [13],\u1_init_ref/pwr_200ms_cnt [11]}),
    .b({\u1_init_ref/pwr_200ms_cnt [14],\u1_init_ref/pwr_200ms_cnt [12]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(\u1_init_ref/add1_syn_102 ),
    .f({\u1_init_ref/pwr_200ms_cnt_b3 [13],\u1_init_ref/pwr_200ms_cnt_b3 [11]}),
    .fco(\u1_init_ref/add1_syn_106 ),
    .fx({\u1_init_ref/pwr_200ms_cnt_b3 [14],\u1_init_ref/pwr_200ms_cnt_b3 [12]}));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(62)
  EG_PHY_LSLICE #(
    //.MACRO("u1_init_ref/add1_syn_110"),
    //.R_POSITION("X0Y2Z0"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'hA55A),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    \u1_init_ref/add1_syn_114  (
    .a({\u1_init_ref/pwr_200ms_cnt [17],\u1_init_ref/pwr_200ms_cnt [15]}),
    .b({open_n2810,\u1_init_ref/pwr_200ms_cnt [16]}),
    .c(2'b00),
    .d(2'b00),
    .e({open_n2813,1'b0}),
    .fci(\u1_init_ref/add1_syn_106 ),
    .f({\u1_init_ref/pwr_200ms_cnt_b3 [17],\u1_init_ref/pwr_200ms_cnt_b3 [15]}),
    .fx({open_n2829,\u1_init_ref/pwr_200ms_cnt_b3 [16]}));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(62)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u1_init_ref/cas_reg  (
    .clk(Sdr_clk_dup_1),
    .d(\u1_init_ref/cas_reg_syn_3 ),
    .q(\u1_init_ref/Sdr_init_ref_cas ));
  AL_MAP_LUT4 #(
    .EQN("~(~D*~B*~(~C*~A))"),
    .INIT(16'hffcd))
    \u1_init_ref/cas_reg_syn_4  (
    .a(\u1_init_ref/ras_reg_syn_10 ),
    .b(\u1_init_ref/ras_reg_syn_5 ),
    .c(\u1_init_ref/ras_reg_syn_7 ),
    .d(Rst_dup_177),
    .o(\u1_init_ref/cas_reg_syn_3 ));
  AL_MAP_LUT1 #(
    .EQN("(~A)"),
    .INIT(2'h1))
    \u1_init_ref/init_cnt[0]_syn_3  (
    .a(\u1_init_ref/init_cnt [0]),
    .o(\u1_init_ref/init_cnt[0]_syn_2 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(45)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u1_init_ref/init_cnt_reg[0]  (
    .clk(Sdr_clk_dup_1),
    .d(\u1_init_ref/init_cnt[0]_syn_2 ),
    .sr(\u1_init_ref/mux4_syn_2 [13]),
    .q(\u1_init_ref/init_cnt [0]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(97)
  EG_PHY_MSLICE #(
    //.MACRO("u1_init_ref/add0_syn_90"),
    //.R_POSITION("X0Y2Z1"),
    .ALUTYPE("ADD"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0110011001101010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u1_init_ref/init_cnt_reg[10]_syn_4  (
    .a(\u1_init_ref/init_cnt [10:9]),
    .b(2'b00),
    .clk(Sdr_clk_dup_1),
    .fci(\u1_init_ref/add0_syn_80 ),
    .sr(\u1_init_ref/mux4_syn_2 [13]),
    .fco(\u1_init_ref/add0_syn_82 ),
    .q(\u1_init_ref/init_cnt [10:9]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(97)
  EG_PHY_MSLICE #(
    //.MACRO("u1_init_ref/add0_syn_90"),
    //.R_POSITION("X0Y3Z0"),
    .ALUTYPE("ADD"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0110011001101010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u1_init_ref/init_cnt_reg[12]_syn_4  (
    .a(\u1_init_ref/init_cnt [12:11]),
    .b(2'b00),
    .clk(Sdr_clk_dup_1),
    .fci(\u1_init_ref/add0_syn_82 ),
    .sr(\u1_init_ref/mux4_syn_2 [13]),
    .fco(\u1_init_ref/add0_syn_84 ),
    .q(\u1_init_ref/init_cnt [12:11]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(97)
  EG_PHY_MSLICE #(
    //.MACRO("u1_init_ref/add0_syn_90"),
    //.R_POSITION("X0Y3Z1"),
    .ALUTYPE("ADD"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0110011001101010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u1_init_ref/init_cnt_reg[13]_syn_4  (
    .a({open_n2875,\u1_init_ref/init_cnt [13]}),
    .b({open_n2876,1'b0}),
    .clk(Sdr_clk_dup_1),
    .fci(\u1_init_ref/add0_syn_84 ),
    .sr(\u1_init_ref/mux4_syn_2 [13]),
    .q({open_n2898,\u1_init_ref/init_cnt [13]}));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(97)
  EG_PHY_MSLICE #(
    //.MACRO("u1_init_ref/add0_syn_90"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("ADD"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0110011001101010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u1_init_ref/init_cnt_reg[2]_syn_4  (
    .a(\u1_init_ref/init_cnt [2:1]),
    .b(2'b00),
    .clk(Sdr_clk_dup_1),
    .fci(\u1_init_ref/add0_syn_72 ),
    .sr(\u1_init_ref/mux4_syn_2 [13]),
    .fco(\u1_init_ref/add0_syn_74 ),
    .q(\u1_init_ref/init_cnt [2:1]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(97)
  EG_PHY_MSLICE #(
    //.MACRO("u1_init_ref/add0_syn_90"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("ADD"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0110011001101010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u1_init_ref/init_cnt_reg[4]_syn_4  (
    .a(\u1_init_ref/init_cnt [4:3]),
    .b(2'b00),
    .clk(Sdr_clk_dup_1),
    .fci(\u1_init_ref/add0_syn_74 ),
    .sr(\u1_init_ref/mux4_syn_2 [13]),
    .fco(\u1_init_ref/add0_syn_76 ),
    .q(\u1_init_ref/init_cnt [4:3]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(97)
  EG_PHY_MSLICE #(
    //.MACRO("u1_init_ref/add0_syn_90"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("ADD"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0110011001101010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u1_init_ref/init_cnt_reg[6]_syn_4  (
    .a(\u1_init_ref/init_cnt [6:5]),
    .b(2'b00),
    .clk(Sdr_clk_dup_1),
    .fci(\u1_init_ref/add0_syn_76 ),
    .sr(\u1_init_ref/mux4_syn_2 [13]),
    .fco(\u1_init_ref/add0_syn_78 ),
    .q(\u1_init_ref/init_cnt [6:5]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(97)
  EG_PHY_MSLICE #(
    //.MACRO("u1_init_ref/add0_syn_90"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("ADD"),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .INIT_LUT0(16'b0110011001101010),
    .INIT_LUT1(16'b0110011001101010),
    .MODE("RIPPLE"),
    .REG0_REGSET("RESET"),
    .REG0_SD("F"),
    .REG1_REGSET("RESET"),
    .REG1_SD("F"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u1_init_ref/init_cnt_reg[8]_syn_4  (
    .a(\u1_init_ref/init_cnt [8:7]),
    .b(2'b00),
    .clk(Sdr_clk_dup_1),
    .fci(\u1_init_ref/add0_syn_78 ),
    .sr(\u1_init_ref/mux4_syn_2 [13]),
    .fco(\u1_init_ref/add0_syn_80 ),
    .q(\u1_init_ref/init_cnt [8:7]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(97)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u1_init_ref/init_done_reg  (
    .clk(Sdr_clk_dup_1),
    .d(\u1_init_ref/init_done_reg_syn_5 ),
    .q(Sdr_init_done_dup_5));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(85)
  AL_MAP_LUT2 #(
    .EQN("~(~B*~A)"),
    .INIT(4'he))
    \u1_init_ref/init_done_reg_syn_6  (
    .a(Rst_dup_177),
    .b(\u1_init_ref/sdr_init_en ),
    .o(\u1_init_ref/init_done_n2 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(85)
  AL_MAP_LUT3 #(
    .EQN("(~A*~(~C*~B))"),
    .INIT(8'h54))
    \u1_init_ref/init_done_reg_syn_7  (
    .a(\u1_init_ref/init_done_n2 ),
    .b(Sdr_init_done_dup_5),
    .c(\u1_init_ref/sdr_init_cnt [30]),
    .o(\u1_init_ref/init_done_reg_syn_5 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(85)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u1_init_ref/init_vld_reg  (
    .clk(Sdr_clk_dup_1),
    .d(\u1_init_ref/init_vld_reg_syn_5 ),
    .q(\u1_init_ref/init_vld ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(78)
  AL_MAP_LUT4 #(
    .EQN("(~D*~A*~(~C*~B))"),
    .INIT(16'h0054))
    \u1_init_ref/init_vld_reg_syn_6  (
    .a(Rst_dup_177),
    .b(\u1_init_ref/init_vld ),
    .c(\u1_init_ref/sdr_init_cnt [0]),
    .d(\u1_init_ref/sdr_init_cnt [30]),
    .o(\u1_init_ref/init_vld_reg_syn_5 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(78)
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    \u1_init_ref/mux4_syn_35  (
    .a(Rst_dup_177),
    .b(Sdr_init_done_dup_5),
    .o(\u1_init_ref/mux4_syn_36 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(99)
  AL_MAP_LUT3 #(
    .EQN("(C*~B*A)"),
    .INIT(8'h20))
    \u1_init_ref/mux4_syn_37  (
    .a(\u1_init_ref/init_cnt [1]),
    .b(\u1_init_ref/init_cnt [3]),
    .c(\u1_init_ref/init_cnt [4]),
    .o(\u1_init_ref/mux4_syn_38 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(99)
  AL_MAP_LUT5 #(
    .EQN("~(E*~(D*C*B*A))"),
    .INIT(32'h8000ffff))
    \u1_init_ref/mux4_syn_39  (
    .a(\u1_init_ref/ref_req_n2_syn_4 ),
    .b(\u1_init_ref/ref_req_n2_syn_6 ),
    .c(\u1_init_ref/mux4_syn_38 ),
    .d(\u1_init_ref/ref_req_n2_syn_2 ),
    .e(\u1_init_ref/mux4_syn_36 ),
    .o(\u1_init_ref/mux4_syn_2 [13]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(99)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u1_init_ref/power_up_200ms_1d_reg  (
    .clk(Sdr_clk_dup_1),
    .d(\u1_init_ref/pwr_200ms_cnt [17]),
    .q(\u1_init_ref/power_up_200ms_1d ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(55)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u1_init_ref/power_up_200ms_2d_reg  (
    .clk(Sdr_clk_dup_1),
    .d(\u1_init_ref/power_up_200ms_1d ),
    .q(\u1_init_ref/power_up_200ms_2d ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(55)
  AL_MAP_LUT2 #(
    .EQN("(~B*A)"),
    .INIT(4'h2))
    \u1_init_ref/power_up_en_n_syn_1  (
    .a(\u1_init_ref/power_up_200ms_1d ),
    .b(\u1_init_ref/power_up_200ms_2d ),
    .o(\u1_init_ref/power_up_en_n ));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u1_init_ref/power_up_en_reg  (
    .clk(Sdr_clk_dup_1),
    .d(\u1_init_ref/power_up_en_n ),
    .q(\u1_init_ref/power_up_en ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(55)
  AL_MAP_LUT1 #(
    .EQN("(~A)"),
    .INIT(2'h1))
    \u1_init_ref/pwr_200ms_cnt[0]_syn_3  (
    .a(\u1_init_ref/pwr_200ms_cnt [0]),
    .o(\u1_init_ref/pwr_200ms_cnt[0]_syn_2 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(39)
  AL_MAP_LUT2 #(
    .EQN("~(~B*~A)"),
    .INIT(4'he))
    \u1_init_ref/pwr_200ms_cnt_b1[17]_syn_1  (
    .a(\u1_init_ref/pwr_200ms_cnt_b3 [17]),
    .b(\u1_init_ref/pwr_200ms_cnt [17]),
    .o(\u1_init_ref/pwr_200ms_cnt_b1 [17]));
  AL_MAP_SEQ #(
    .CEMUX("INV"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u1_init_ref/pwr_200ms_cnt_reg[0]  (
    .ce(\u1_init_ref/pwr_200ms_cnt [17]),
    .clk(Sdr_clk_dup_1),
    .d(\u1_init_ref/pwr_200ms_cnt[0]_syn_2 ),
    .sr(Rst_dup_177),
    .q(\u1_init_ref/pwr_200ms_cnt [0]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(55)
  AL_MAP_SEQ #(
    .CEMUX("INV"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u1_init_ref/pwr_200ms_cnt_reg[10]  (
    .ce(\u1_init_ref/pwr_200ms_cnt [17]),
    .clk(Sdr_clk_dup_1),
    .d(\u1_init_ref/pwr_200ms_cnt_b3 [10]),
    .sr(Rst_dup_177),
    .q(\u1_init_ref/pwr_200ms_cnt [10]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(55)
  AL_MAP_SEQ #(
    .CEMUX("INV"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u1_init_ref/pwr_200ms_cnt_reg[11]  (
    .ce(\u1_init_ref/pwr_200ms_cnt [17]),
    .clk(Sdr_clk_dup_1),
    .d(\u1_init_ref/pwr_200ms_cnt_b3 [11]),
    .sr(Rst_dup_177),
    .q(\u1_init_ref/pwr_200ms_cnt [11]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(55)
  AL_MAP_SEQ #(
    .CEMUX("INV"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u1_init_ref/pwr_200ms_cnt_reg[12]  (
    .ce(\u1_init_ref/pwr_200ms_cnt [17]),
    .clk(Sdr_clk_dup_1),
    .d(\u1_init_ref/pwr_200ms_cnt_b3 [12]),
    .sr(Rst_dup_177),
    .q(\u1_init_ref/pwr_200ms_cnt [12]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(55)
  AL_MAP_SEQ #(
    .CEMUX("INV"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u1_init_ref/pwr_200ms_cnt_reg[13]  (
    .ce(\u1_init_ref/pwr_200ms_cnt [17]),
    .clk(Sdr_clk_dup_1),
    .d(\u1_init_ref/pwr_200ms_cnt_b3 [13]),
    .sr(Rst_dup_177),
    .q(\u1_init_ref/pwr_200ms_cnt [13]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(55)
  AL_MAP_SEQ #(
    .CEMUX("INV"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u1_init_ref/pwr_200ms_cnt_reg[14]  (
    .ce(\u1_init_ref/pwr_200ms_cnt [17]),
    .clk(Sdr_clk_dup_1),
    .d(\u1_init_ref/pwr_200ms_cnt_b3 [14]),
    .sr(Rst_dup_177),
    .q(\u1_init_ref/pwr_200ms_cnt [14]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(55)
  AL_MAP_SEQ #(
    .CEMUX("INV"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u1_init_ref/pwr_200ms_cnt_reg[15]  (
    .ce(\u1_init_ref/pwr_200ms_cnt [17]),
    .clk(Sdr_clk_dup_1),
    .d(\u1_init_ref/pwr_200ms_cnt_b3 [15]),
    .sr(Rst_dup_177),
    .q(\u1_init_ref/pwr_200ms_cnt [15]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(55)
  AL_MAP_SEQ #(
    .CEMUX("INV"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u1_init_ref/pwr_200ms_cnt_reg[16]  (
    .ce(\u1_init_ref/pwr_200ms_cnt [17]),
    .clk(Sdr_clk_dup_1),
    .d(\u1_init_ref/pwr_200ms_cnt_b3 [16]),
    .sr(Rst_dup_177),
    .q(\u1_init_ref/pwr_200ms_cnt [16]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(55)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u1_init_ref/pwr_200ms_cnt_reg[17]  (
    .clk(Sdr_clk_dup_1),
    .d(\u1_init_ref/pwr_200ms_cnt_b1 [17]),
    .sr(Rst_dup_177),
    .q(\u1_init_ref/pwr_200ms_cnt [17]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(55)
  AL_MAP_SEQ #(
    .CEMUX("INV"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u1_init_ref/pwr_200ms_cnt_reg[1]  (
    .ce(\u1_init_ref/pwr_200ms_cnt [17]),
    .clk(Sdr_clk_dup_1),
    .d(\u1_init_ref/pwr_200ms_cnt_b3 [1]),
    .sr(Rst_dup_177),
    .q(\u1_init_ref/pwr_200ms_cnt [1]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(55)
  AL_MAP_SEQ #(
    .CEMUX("INV"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u1_init_ref/pwr_200ms_cnt_reg[2]  (
    .ce(\u1_init_ref/pwr_200ms_cnt [17]),
    .clk(Sdr_clk_dup_1),
    .d(\u1_init_ref/pwr_200ms_cnt_b3 [2]),
    .sr(Rst_dup_177),
    .q(\u1_init_ref/pwr_200ms_cnt [2]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(55)
  AL_MAP_SEQ #(
    .CEMUX("INV"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u1_init_ref/pwr_200ms_cnt_reg[3]  (
    .ce(\u1_init_ref/pwr_200ms_cnt [17]),
    .clk(Sdr_clk_dup_1),
    .d(\u1_init_ref/pwr_200ms_cnt_b3 [3]),
    .sr(Rst_dup_177),
    .q(\u1_init_ref/pwr_200ms_cnt [3]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(55)
  AL_MAP_SEQ #(
    .CEMUX("INV"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u1_init_ref/pwr_200ms_cnt_reg[4]  (
    .ce(\u1_init_ref/pwr_200ms_cnt [17]),
    .clk(Sdr_clk_dup_1),
    .d(\u1_init_ref/pwr_200ms_cnt_b3 [4]),
    .sr(Rst_dup_177),
    .q(\u1_init_ref/pwr_200ms_cnt [4]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(55)
  AL_MAP_SEQ #(
    .CEMUX("INV"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u1_init_ref/pwr_200ms_cnt_reg[5]  (
    .ce(\u1_init_ref/pwr_200ms_cnt [17]),
    .clk(Sdr_clk_dup_1),
    .d(\u1_init_ref/pwr_200ms_cnt_b3 [5]),
    .sr(Rst_dup_177),
    .q(\u1_init_ref/pwr_200ms_cnt [5]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(55)
  AL_MAP_SEQ #(
    .CEMUX("INV"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u1_init_ref/pwr_200ms_cnt_reg[6]  (
    .ce(\u1_init_ref/pwr_200ms_cnt [17]),
    .clk(Sdr_clk_dup_1),
    .d(\u1_init_ref/pwr_200ms_cnt_b3 [6]),
    .sr(Rst_dup_177),
    .q(\u1_init_ref/pwr_200ms_cnt [6]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(55)
  AL_MAP_SEQ #(
    .CEMUX("INV"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u1_init_ref/pwr_200ms_cnt_reg[7]  (
    .ce(\u1_init_ref/pwr_200ms_cnt [17]),
    .clk(Sdr_clk_dup_1),
    .d(\u1_init_ref/pwr_200ms_cnt_b3 [7]),
    .sr(Rst_dup_177),
    .q(\u1_init_ref/pwr_200ms_cnt [7]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(55)
  AL_MAP_SEQ #(
    .CEMUX("INV"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u1_init_ref/pwr_200ms_cnt_reg[8]  (
    .ce(\u1_init_ref/pwr_200ms_cnt [17]),
    .clk(Sdr_clk_dup_1),
    .d(\u1_init_ref/pwr_200ms_cnt_b3 [8]),
    .sr(Rst_dup_177),
    .q(\u1_init_ref/pwr_200ms_cnt [8]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(55)
  AL_MAP_SEQ #(
    .CEMUX("INV"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u1_init_ref/pwr_200ms_cnt_reg[9]  (
    .ce(\u1_init_ref/pwr_200ms_cnt [17]),
    .clk(Sdr_clk_dup_1),
    .d(\u1_init_ref/pwr_200ms_cnt_b3 [9]),
    .sr(Rst_dup_177),
    .q(\u1_init_ref/pwr_200ms_cnt [9]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(55)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u1_init_ref/ras_reg  (
    .clk(Sdr_clk_dup_1),
    .d(\u1_init_ref/ras_reg_syn_3 ),
    .q(\u1_init_ref/Sdr_init_ref_ras ));
  AL_MAP_LUT3 #(
    .EQN("(A*~(~C*B))"),
    .INIT(8'ha2))
    \u1_init_ref/ras_reg_syn_11  (
    .a(\u1_init_ref/we_reg_syn_3 ),
    .b(\u1_init_ref/ras_reg_syn_10 ),
    .c(Rst_dup_177),
    .o(\u1_init_ref/ras_reg_syn_3 ));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    \u1_init_ref/ras_reg_syn_4  (
    .a(\u1_init_ref/sdr_init_cnt [0]),
    .b(\u1_init_ref/sdr_init_cnt [1]),
    .o(\u1_init_ref/ras_reg_syn_5 ));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    \u1_init_ref/ras_reg_syn_6  (
    .a(\u1_init_ref/sdr_init_cnt [7]),
    .b(\u1_init_ref/sdr_init_cnt [8]),
    .o(\u1_init_ref/ras_reg_syn_7 ));
  AL_MAP_LUT3 #(
    .EQN("~(~C*~(~B*~A))"),
    .INIT(8'hf1))
    \u1_init_ref/ras_reg_syn_8  (
    .a(\u1_init_ref/ras_reg_syn_5 ),
    .b(\u1_init_ref/ras_reg_syn_7 ),
    .c(Rst_dup_177),
    .o(\u1_init_ref/we_reg_syn_3 ));
  AL_MAP_LUT4 #(
    .EQN("(D*~C*~B*~A)"),
    .INIT(16'h0100))
    \u1_init_ref/ras_reg_syn_9  (
    .a(App_rd_en_dup_5),
    .b(App_wr_en_dup_5),
    .c(\u2_wrrd/rw_vld ),
    .d(\u1_init_ref/sdr_ref_ack_sft [2]),
    .o(\u1_init_ref/ras_reg_syn_10 ));
  AL_MAP_LUT3 #(
    .EQN("(~C*~B*~A)"),
    .INIT(8'h01))
    \u1_init_ref/ref_req_n2_syn_1  (
    .a(\u1_init_ref/init_cnt [11]),
    .b(\u1_init_ref/init_cnt [12]),
    .c(\u1_init_ref/init_cnt [13]),
    .o(\u1_init_ref/ref_req_n2_syn_2 ));
  AL_MAP_LUT4 #(
    .EQN("(D*~C*B*~A)"),
    .INIT(16'h0400))
    \u1_init_ref/ref_req_n2_syn_3  (
    .a(\u1_init_ref/init_cnt [7]),
    .b(\u1_init_ref/init_cnt [8]),
    .c(\u1_init_ref/init_cnt [9]),
    .d(\u1_init_ref/init_cnt [10]),
    .o(\u1_init_ref/ref_req_n2_syn_4 ));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*B*~A)"),
    .INIT(16'h0004))
    \u1_init_ref/ref_req_n2_syn_5  (
    .a(\u1_init_ref/init_cnt [0]),
    .b(\u1_init_ref/init_cnt [2]),
    .c(\u1_init_ref/init_cnt [5]),
    .d(\u1_init_ref/init_cnt [6]),
    .o(\u1_init_ref/ref_req_n2_syn_6 ));
  AL_MAP_LUT4 #(
    .EQN("(~D*C*~B*~A)"),
    .INIT(16'h0010))
    \u1_init_ref/ref_req_n2_syn_7  (
    .a(\u1_init_ref/Sdr_ref_ack ),
    .b(\u1_init_ref/init_cnt [1]),
    .c(\u1_init_ref/init_cnt [3]),
    .d(\u1_init_ref/init_cnt [4]),
    .o(\u1_init_ref/ref_req_n2_syn_8 ));
  AL_MAP_LUT4 #(
    .EQN("(D*C*B*A)"),
    .INIT(16'h8000))
    \u1_init_ref/ref_req_n2_syn_9  (
    .a(\u1_init_ref/ref_req_n2_syn_4 ),
    .b(\u1_init_ref/ref_req_n2_syn_6 ),
    .c(\u1_init_ref/ref_req_n2_syn_8 ),
    .d(\u1_init_ref/ref_req_n2_syn_2 ),
    .o(\u1_init_ref/ref_req_n2 ));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u1_init_ref/ref_req_reg  (
    .clk(Sdr_clk_dup_1),
    .d(\u1_init_ref/ref_req_n2 ),
    .sr(Rst_dup_177),
    .q(\u1_init_ref/ref_req ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(122)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u1_init_ref/ref_vld_reg  (
    .clk(Sdr_clk_dup_1),
    .d(\u1_init_ref/ref_vld_reg_syn_5 ),
    .q(\u1_init_ref/ref_vld ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(122)
  AL_MAP_LUT4 #(
    .EQN("(~D*C*~B*~A)"),
    .INIT(16'h0010))
    \u1_init_ref/ref_vld_reg_syn_6  (
    .a(App_rd_en_dup_5),
    .b(App_wr_en_dup_5),
    .c(\u1_init_ref/Sdr_ref_ack ),
    .d(\u2_wrrd/rw_vld ),
    .o(\u1_init_ref/ref_vld_reg_syn_7 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(122)
  AL_MAP_LUT4 #(
    .EQN("(~B*~(~A*~(~D*C)))"),
    .INIT(16'h2232))
    \u1_init_ref/ref_vld_reg_syn_8  (
    .a(\u1_init_ref/ref_vld_reg_syn_7 ),
    .b(Rst_dup_177),
    .c(\u1_init_ref/ref_vld ),
    .d(\u1_init_ref/sdr_ref_ack_sft [19]),
    .o(\u1_init_ref/ref_vld_reg_syn_5 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(122)
  AL_MAP_SEQ #(
    //.INIT(1'b0),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u1_init_ref/sdr_init_cnt_reg[0]  (
    .clk(Sdr_clk_dup_1),
    .d(\u1_init_ref/sdr_init_en ),
    .q(\u1_init_ref/sdr_init_cnt [0]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(72)
  AL_MAP_SEQ #(
    //.INIT(1'b0),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u1_init_ref/sdr_init_cnt_reg[10]  (
    .clk(Sdr_clk_dup_1),
    .d(\u1_init_ref/sdr_init_cnt [9]),
    .q(\u1_init_ref/sdr_init_cnt [10]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(72)
  AL_MAP_SEQ #(
    //.INIT(1'b0),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u1_init_ref/sdr_init_cnt_reg[11]  (
    .clk(Sdr_clk_dup_1),
    .d(\u1_init_ref/sdr_init_cnt [10]),
    .q(\u1_init_ref/sdr_init_cnt [11]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(72)
  AL_MAP_SEQ #(
    //.INIT(1'b0),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u1_init_ref/sdr_init_cnt_reg[12]  (
    .clk(Sdr_clk_dup_1),
    .d(\u1_init_ref/sdr_init_cnt [11]),
    .q(\u1_init_ref/sdr_init_cnt [12]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(72)
  AL_MAP_SEQ #(
    //.INIT(1'b0),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u1_init_ref/sdr_init_cnt_reg[13]  (
    .clk(Sdr_clk_dup_1),
    .d(\u1_init_ref/sdr_init_cnt [12]),
    .q(\u1_init_ref/sdr_init_cnt [13]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(72)
  AL_MAP_SEQ #(
    //.INIT(1'b0),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u1_init_ref/sdr_init_cnt_reg[14]  (
    .clk(Sdr_clk_dup_1),
    .d(\u1_init_ref/sdr_init_cnt [13]),
    .q(\u1_init_ref/sdr_init_cnt [14]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(72)
  AL_MAP_SEQ #(
    //.INIT(1'b0),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u1_init_ref/sdr_init_cnt_reg[15]  (
    .clk(Sdr_clk_dup_1),
    .d(\u1_init_ref/sdr_init_cnt [14]),
    .q(\u1_init_ref/sdr_init_cnt [15]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(72)
  AL_MAP_SEQ #(
    //.INIT(1'b0),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u1_init_ref/sdr_init_cnt_reg[16]  (
    .clk(Sdr_clk_dup_1),
    .d(\u1_init_ref/sdr_init_cnt [15]),
    .q(\u1_init_ref/sdr_init_cnt [16]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(72)
  AL_MAP_SEQ #(
    //.INIT(1'b0),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u1_init_ref/sdr_init_cnt_reg[17]  (
    .clk(Sdr_clk_dup_1),
    .d(\u1_init_ref/sdr_init_cnt [16]),
    .q(\u1_init_ref/sdr_init_cnt [17]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(72)
  AL_MAP_SEQ #(
    //.INIT(1'b0),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u1_init_ref/sdr_init_cnt_reg[18]  (
    .clk(Sdr_clk_dup_1),
    .d(\u1_init_ref/sdr_init_cnt [17]),
    .q(\u1_init_ref/sdr_init_cnt [18]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(72)
  AL_MAP_SEQ #(
    //.INIT(1'b0),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u1_init_ref/sdr_init_cnt_reg[19]  (
    .clk(Sdr_clk_dup_1),
    .d(\u1_init_ref/sdr_init_cnt [18]),
    .q(\u1_init_ref/sdr_init_cnt [19]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(72)
  AL_MAP_SEQ #(
    //.INIT(1'b0),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u1_init_ref/sdr_init_cnt_reg[1]  (
    .clk(Sdr_clk_dup_1),
    .d(\u1_init_ref/sdr_init_cnt [0]),
    .q(\u1_init_ref/sdr_init_cnt [1]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(72)
  AL_MAP_SEQ #(
    //.INIT(1'b0),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u1_init_ref/sdr_init_cnt_reg[20]  (
    .clk(Sdr_clk_dup_1),
    .d(\u1_init_ref/sdr_init_cnt [19]),
    .q(\u1_init_ref/sdr_init_cnt [20]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(72)
  AL_MAP_SEQ #(
    //.INIT(1'b0),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u1_init_ref/sdr_init_cnt_reg[21]  (
    .clk(Sdr_clk_dup_1),
    .d(\u1_init_ref/sdr_init_cnt [20]),
    .q(\u1_init_ref/sdr_init_cnt [21]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(72)
  AL_MAP_SEQ #(
    //.INIT(1'b0),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u1_init_ref/sdr_init_cnt_reg[22]  (
    .clk(Sdr_clk_dup_1),
    .d(\u1_init_ref/sdr_init_cnt [21]),
    .q(\u1_init_ref/sdr_init_cnt [22]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(72)
  AL_MAP_SEQ #(
    //.INIT(1'b0),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u1_init_ref/sdr_init_cnt_reg[23]  (
    .clk(Sdr_clk_dup_1),
    .d(\u1_init_ref/sdr_init_cnt [22]),
    .q(\u1_init_ref/sdr_init_cnt [23]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(72)
  AL_MAP_SEQ #(
    //.INIT(1'b0),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u1_init_ref/sdr_init_cnt_reg[24]  (
    .clk(Sdr_clk_dup_1),
    .d(\u1_init_ref/sdr_init_cnt [23]),
    .q(\u1_init_ref/sdr_init_cnt [24]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(72)
  AL_MAP_SEQ #(
    //.INIT(1'b0),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u1_init_ref/sdr_init_cnt_reg[25]  (
    .clk(Sdr_clk_dup_1),
    .d(\u1_init_ref/sdr_init_cnt [24]),
    .q(\u1_init_ref/sdr_init_cnt [25]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(72)
  AL_MAP_SEQ #(
    //.INIT(1'b0),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u1_init_ref/sdr_init_cnt_reg[26]  (
    .clk(Sdr_clk_dup_1),
    .d(\u1_init_ref/sdr_init_cnt [25]),
    .q(\u1_init_ref/sdr_init_cnt [26]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(72)
  AL_MAP_SEQ #(
    //.INIT(1'b0),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u1_init_ref/sdr_init_cnt_reg[27]  (
    .clk(Sdr_clk_dup_1),
    .d(\u1_init_ref/sdr_init_cnt [26]),
    .q(\u1_init_ref/sdr_init_cnt [27]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(72)
  AL_MAP_SEQ #(
    //.INIT(1'b0),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u1_init_ref/sdr_init_cnt_reg[28]  (
    .clk(Sdr_clk_dup_1),
    .d(\u1_init_ref/sdr_init_cnt [27]),
    .q(\u1_init_ref/sdr_init_cnt [28]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(72)
  AL_MAP_SEQ #(
    //.INIT(1'b0),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u1_init_ref/sdr_init_cnt_reg[29]  (
    .clk(Sdr_clk_dup_1),
    .d(\u1_init_ref/sdr_init_cnt [28]),
    .q(\u1_init_ref/sdr_init_cnt [29]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(72)
  AL_MAP_SEQ #(
    //.INIT(1'b0),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u1_init_ref/sdr_init_cnt_reg[2]  (
    .clk(Sdr_clk_dup_1),
    .d(\u1_init_ref/sdr_init_cnt [1]),
    .q(\u1_init_ref/sdr_init_cnt [2]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(72)
  AL_MAP_SEQ #(
    //.INIT(1'b0),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u1_init_ref/sdr_init_cnt_reg[30]  (
    .clk(Sdr_clk_dup_1),
    .d(\u1_init_ref/sdr_init_cnt [29]),
    .q(\u1_init_ref/sdr_init_cnt [30]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(72)
  AL_MAP_SEQ #(
    //.INIT(1'b0),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u1_init_ref/sdr_init_cnt_reg[3]  (
    .clk(Sdr_clk_dup_1),
    .d(\u1_init_ref/sdr_init_cnt [2]),
    .q(\u1_init_ref/sdr_init_cnt [3]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(72)
  AL_MAP_SEQ #(
    //.INIT(1'b0),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u1_init_ref/sdr_init_cnt_reg[4]  (
    .clk(Sdr_clk_dup_1),
    .d(\u1_init_ref/sdr_init_cnt [3]),
    .q(\u1_init_ref/sdr_init_cnt [4]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(72)
  AL_MAP_SEQ #(
    //.INIT(1'b0),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u1_init_ref/sdr_init_cnt_reg[5]  (
    .clk(Sdr_clk_dup_1),
    .d(\u1_init_ref/sdr_init_cnt [4]),
    .q(\u1_init_ref/sdr_init_cnt [5]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(72)
  AL_MAP_SEQ #(
    //.INIT(1'b0),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u1_init_ref/sdr_init_cnt_reg[6]  (
    .clk(Sdr_clk_dup_1),
    .d(\u1_init_ref/sdr_init_cnt [5]),
    .q(\u1_init_ref/sdr_init_cnt [6]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(72)
  AL_MAP_SEQ #(
    //.INIT(1'b0),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u1_init_ref/sdr_init_cnt_reg[7]  (
    .clk(Sdr_clk_dup_1),
    .d(\u1_init_ref/sdr_init_cnt [6]),
    .q(\u1_init_ref/sdr_init_cnt [7]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(72)
  AL_MAP_SEQ #(
    //.INIT(1'b0),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u1_init_ref/sdr_init_cnt_reg[8]  (
    .clk(Sdr_clk_dup_1),
    .d(\u1_init_ref/sdr_init_cnt [7]),
    .q(\u1_init_ref/sdr_init_cnt [8]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(72)
  AL_MAP_SEQ #(
    //.INIT(1'b0),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u1_init_ref/sdr_init_cnt_reg[9]  (
    .clk(Sdr_clk_dup_1),
    .d(\u1_init_ref/sdr_init_cnt [8]),
    .q(\u1_init_ref/sdr_init_cnt [9]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(72)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u1_init_ref/sdr_init_en_reg  (
    .clk(Sdr_clk_dup_1),
    .d(\u1_init_ref/power_up_en ),
    .q(\u1_init_ref/sdr_init_en ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(55)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u1_init_ref/sdr_ref_ack_sft_reg[0]  (
    .clk(Sdr_clk_dup_1),
    .d(\u1_init_ref/Sdr_ref_ack ),
    .sr(Rst_dup_177),
    .q(\u1_init_ref/sdr_ref_ack_sft [0]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(109)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u1_init_ref/sdr_ref_ack_sft_reg[10]  (
    .clk(Sdr_clk_dup_1),
    .d(\u1_init_ref/sdr_ref_ack_sft [9]),
    .sr(Rst_dup_177),
    .q(\u1_init_ref/sdr_ref_ack_sft [10]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(109)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u1_init_ref/sdr_ref_ack_sft_reg[11]  (
    .clk(Sdr_clk_dup_1),
    .d(\u1_init_ref/sdr_ref_ack_sft [10]),
    .sr(Rst_dup_177),
    .q(\u1_init_ref/sdr_ref_ack_sft [11]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(109)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u1_init_ref/sdr_ref_ack_sft_reg[12]  (
    .clk(Sdr_clk_dup_1),
    .d(\u1_init_ref/sdr_ref_ack_sft [11]),
    .sr(Rst_dup_177),
    .q(\u1_init_ref/sdr_ref_ack_sft [12]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(109)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u1_init_ref/sdr_ref_ack_sft_reg[13]  (
    .clk(Sdr_clk_dup_1),
    .d(\u1_init_ref/sdr_ref_ack_sft [12]),
    .sr(Rst_dup_177),
    .q(\u1_init_ref/sdr_ref_ack_sft [13]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(109)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u1_init_ref/sdr_ref_ack_sft_reg[14]  (
    .clk(Sdr_clk_dup_1),
    .d(\u1_init_ref/sdr_ref_ack_sft [13]),
    .sr(Rst_dup_177),
    .q(\u1_init_ref/sdr_ref_ack_sft [14]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(109)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u1_init_ref/sdr_ref_ack_sft_reg[15]  (
    .clk(Sdr_clk_dup_1),
    .d(\u1_init_ref/sdr_ref_ack_sft [14]),
    .sr(Rst_dup_177),
    .q(\u1_init_ref/sdr_ref_ack_sft [15]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(109)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u1_init_ref/sdr_ref_ack_sft_reg[16]  (
    .clk(Sdr_clk_dup_1),
    .d(\u1_init_ref/sdr_ref_ack_sft [15]),
    .sr(Rst_dup_177),
    .q(\u1_init_ref/sdr_ref_ack_sft [16]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(109)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u1_init_ref/sdr_ref_ack_sft_reg[17]  (
    .clk(Sdr_clk_dup_1),
    .d(\u1_init_ref/sdr_ref_ack_sft [16]),
    .sr(Rst_dup_177),
    .q(\u1_init_ref/sdr_ref_ack_sft [17]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(109)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u1_init_ref/sdr_ref_ack_sft_reg[18]  (
    .clk(Sdr_clk_dup_1),
    .d(\u1_init_ref/sdr_ref_ack_sft [17]),
    .sr(Rst_dup_177),
    .q(\u1_init_ref/sdr_ref_ack_sft [18]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(109)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u1_init_ref/sdr_ref_ack_sft_reg[19]  (
    .clk(Sdr_clk_dup_1),
    .d(\u1_init_ref/sdr_ref_ack_sft [18]),
    .sr(Rst_dup_177),
    .q(\u1_init_ref/sdr_ref_ack_sft [19]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(109)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u1_init_ref/sdr_ref_ack_sft_reg[1]  (
    .clk(Sdr_clk_dup_1),
    .d(\u1_init_ref/sdr_ref_ack_sft [0]),
    .sr(Rst_dup_177),
    .q(\u1_init_ref/sdr_ref_ack_sft [1]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(109)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u1_init_ref/sdr_ref_ack_sft_reg[2]  (
    .clk(Sdr_clk_dup_1),
    .d(\u1_init_ref/sdr_ref_ack_sft [1]),
    .sr(Rst_dup_177),
    .q(\u1_init_ref/sdr_ref_ack_sft [2]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(109)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u1_init_ref/sdr_ref_ack_sft_reg[3]  (
    .clk(Sdr_clk_dup_1),
    .d(\u1_init_ref/sdr_ref_ack_sft [2]),
    .sr(Rst_dup_177),
    .q(\u1_init_ref/sdr_ref_ack_sft [3]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(109)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u1_init_ref/sdr_ref_ack_sft_reg[4]  (
    .clk(Sdr_clk_dup_1),
    .d(\u1_init_ref/sdr_ref_ack_sft [3]),
    .sr(Rst_dup_177),
    .q(\u1_init_ref/sdr_ref_ack_sft [4]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(109)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u1_init_ref/sdr_ref_ack_sft_reg[5]  (
    .clk(Sdr_clk_dup_1),
    .d(\u1_init_ref/sdr_ref_ack_sft [4]),
    .sr(Rst_dup_177),
    .q(\u1_init_ref/sdr_ref_ack_sft [5]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(109)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u1_init_ref/sdr_ref_ack_sft_reg[6]  (
    .clk(Sdr_clk_dup_1),
    .d(\u1_init_ref/sdr_ref_ack_sft [5]),
    .sr(Rst_dup_177),
    .q(\u1_init_ref/sdr_ref_ack_sft [6]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(109)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u1_init_ref/sdr_ref_ack_sft_reg[7]  (
    .clk(Sdr_clk_dup_1),
    .d(\u1_init_ref/sdr_ref_ack_sft [6]),
    .sr(Rst_dup_177),
    .q(\u1_init_ref/sdr_ref_ack_sft [7]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(109)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u1_init_ref/sdr_ref_ack_sft_reg[8]  (
    .clk(Sdr_clk_dup_1),
    .d(\u1_init_ref/sdr_ref_ack_sft [7]),
    .sr(Rst_dup_177),
    .q(\u1_init_ref/sdr_ref_ack_sft [8]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(109)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u1_init_ref/sdr_ref_ack_sft_reg[9]  (
    .clk(Sdr_clk_dup_1),
    .d(\u1_init_ref/sdr_ref_ack_sft [8]),
    .sr(Rst_dup_177),
    .q(\u1_init_ref/sdr_ref_ack_sft [9]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(109)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u1_init_ref/we_reg  (
    .clk(Sdr_clk_dup_1),
    .d(\u1_init_ref/we_reg_syn_3 ),
    .q(\u1_init_ref/Sdr_init_ref_we ));
  AL_MAP_LUT3 #(
    .EQN("(B*~(C)*~(A)+B*C*~(A)+~(B)*C*A+B*C*A)"),
    .INIT(8'he4))
    \u2_wrrd/SDR_ADDR_b[10]_syn_1  (
    .a(\u2_wrrd/rw_vld ),
    .b(\u1_init_ref/Sdr_init_ref_addr [10]),
    .c(\u2_wrrd/addr [10]),
    .o(\u2_wrrd/SDR_ADDR_b [10]));
  AL_MAP_LUT3 #(
    .EQN("(B*~(C)*~(A)+B*C*~(A)+~(B)*C*A+B*C*A)"),
    .INIT(8'he4))
    \u2_wrrd/SDR_ADDR_b[1]_syn_1  (
    .a(\u2_wrrd/rw_vld ),
    .b(\u1_init_ref/Sdr_init_ref_addr [1]),
    .c(\u2_wrrd/addr [1]),
    .o(\u2_wrrd/SDR_ADDR_b [1]));
  AL_MAP_LUT3 #(
    .EQN("(B*~(C)*~(A)+B*C*~(A)+~(B)*C*A+B*C*A)"),
    .INIT(8'he4))
    \u2_wrrd/SDR_ADDR_b[4]_syn_1  (
    .a(\u2_wrrd/rw_vld ),
    .b(\u1_init_ref/Sdr_init_ref_addr [1]),
    .c(\u2_wrrd/addr [4]),
    .o(\u2_wrrd/SDR_ADDR_b [4]));
  AL_MAP_LUT3 #(
    .EQN("(B*~(C)*~(A)+B*C*~(A)+~(B)*C*A+B*C*A)"),
    .INIT(8'he4))
    \u2_wrrd/SDR_ADDR_b[5]_syn_1  (
    .a(\u2_wrrd/rw_vld ),
    .b(\u1_init_ref/Sdr_init_ref_addr [1]),
    .c(\u2_wrrd/addr [5]),
    .o(\u2_wrrd/SDR_ADDR_b [5]));
  AL_MAP_LUT3 #(
    .EQN("(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C)"),
    .INIT(8'hca))
    \u2_wrrd/SDR_CAS_n_syn_1  (
    .a(\u1_init_ref/Sdr_init_ref_cas ),
    .b(\u2_wrrd/cas ),
    .c(\u2_wrrd/rw_vld ),
    .o(\u2_wrrd/SDR_CAS_n ));
  AL_MAP_LUT3 #(
    .EQN("(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C)"),
    .INIT(8'hca))
    \u2_wrrd/SDR_RAS_n_syn_1  (
    .a(\u1_init_ref/Sdr_init_ref_ras ),
    .b(\u2_wrrd/ras ),
    .c(\u2_wrrd/rw_vld ),
    .o(\u2_wrrd/SDR_RAS_n ));
  AL_MAP_LUT3 #(
    .EQN("(A*~(C)*~(B)+A*C*~(B)+~(A)*C*B+A*C*B)"),
    .INIT(8'he2))
    \u2_wrrd/SDR_WE_n_syn_1  (
    .a(\u1_init_ref/Sdr_init_ref_we ),
    .b(\u2_wrrd/rw_vld ),
    .c(\u2_wrrd/we ),
    .o(\u2_wrrd/SDR_WE_n ));
  AL_MAP_LUT2 #(
    .EQN("~(~B*~A)"),
    .INIT(4'he))
    \u2_wrrd/Sdr_busy_n4_syn_1  (
    .a(\u2_wrrd/state_reg_syn_1 [1]),
    .b(\u2_wrrd/state_reg_syn_1 [2]),
    .o(\u2_wrrd/Sdr_busy_n4 ));
  buf \u2_wrrd/Sdr_rd_dout[0]_syn_1  (\u2_wrrd/Sdr_rd_dout [0], \u2_wrrd/Sdr_rd_dout[0]_syn_3 );
  buf \u2_wrrd/Sdr_rd_dout[0]_syn_2  (\u2_wrrd/Sdr_rd_dout[0]_syn_4 , \u2_wrrd/Sdr_rd_dout [0]);
  buf \u2_wrrd/Sdr_rd_dout[10]_syn_1  (\u2_wrrd/Sdr_rd_dout [10], \u2_wrrd/Sdr_rd_dout[10]_syn_3 );
  buf \u2_wrrd/Sdr_rd_dout[10]_syn_2  (\u2_wrrd/Sdr_rd_dout[10]_syn_4 , \u2_wrrd/Sdr_rd_dout [10]);
  buf \u2_wrrd/Sdr_rd_dout[11]_syn_1  (\u2_wrrd/Sdr_rd_dout [11], \u2_wrrd/Sdr_rd_dout[11]_syn_3 );
  buf \u2_wrrd/Sdr_rd_dout[11]_syn_2  (\u2_wrrd/Sdr_rd_dout[11]_syn_4 , \u2_wrrd/Sdr_rd_dout [11]);
  buf \u2_wrrd/Sdr_rd_dout[12]_syn_1  (\u2_wrrd/Sdr_rd_dout [12], \u2_wrrd/Sdr_rd_dout[12]_syn_3 );
  buf \u2_wrrd/Sdr_rd_dout[12]_syn_2  (\u2_wrrd/Sdr_rd_dout[12]_syn_4 , \u2_wrrd/Sdr_rd_dout [12]);
  buf \u2_wrrd/Sdr_rd_dout[13]_syn_1  (\u2_wrrd/Sdr_rd_dout [13], \u2_wrrd/Sdr_rd_dout[13]_syn_3 );
  buf \u2_wrrd/Sdr_rd_dout[13]_syn_2  (\u2_wrrd/Sdr_rd_dout[13]_syn_4 , \u2_wrrd/Sdr_rd_dout [13]);
  buf \u2_wrrd/Sdr_rd_dout[14]_syn_1  (\u2_wrrd/Sdr_rd_dout [14], \u2_wrrd/Sdr_rd_dout[14]_syn_3 );
  buf \u2_wrrd/Sdr_rd_dout[14]_syn_2  (\u2_wrrd/Sdr_rd_dout[14]_syn_4 , \u2_wrrd/Sdr_rd_dout [14]);
  buf \u2_wrrd/Sdr_rd_dout[15]_syn_1  (\u2_wrrd/Sdr_rd_dout [15], \u2_wrrd/Sdr_rd_dout[15]_syn_3 );
  buf \u2_wrrd/Sdr_rd_dout[15]_syn_2  (\u2_wrrd/Sdr_rd_dout[15]_syn_4 , \u2_wrrd/Sdr_rd_dout [15]);
  buf \u2_wrrd/Sdr_rd_dout[16]_syn_1  (\u2_wrrd/Sdr_rd_dout [16], \u2_wrrd/Sdr_rd_dout[16]_syn_3 );
  buf \u2_wrrd/Sdr_rd_dout[16]_syn_2  (\u2_wrrd/Sdr_rd_dout[16]_syn_4 , \u2_wrrd/Sdr_rd_dout [16]);
  buf \u2_wrrd/Sdr_rd_dout[17]_syn_1  (\u2_wrrd/Sdr_rd_dout [17], \u2_wrrd/Sdr_rd_dout[17]_syn_3 );
  buf \u2_wrrd/Sdr_rd_dout[17]_syn_2  (\u2_wrrd/Sdr_rd_dout[17]_syn_4 , \u2_wrrd/Sdr_rd_dout [17]);
  buf \u2_wrrd/Sdr_rd_dout[18]_syn_1  (\u2_wrrd/Sdr_rd_dout [18], \u2_wrrd/Sdr_rd_dout[18]_syn_3 );
  buf \u2_wrrd/Sdr_rd_dout[18]_syn_2  (\u2_wrrd/Sdr_rd_dout[18]_syn_4 , \u2_wrrd/Sdr_rd_dout [18]);
  buf \u2_wrrd/Sdr_rd_dout[19]_syn_1  (\u2_wrrd/Sdr_rd_dout [19], \u2_wrrd/Sdr_rd_dout[19]_syn_3 );
  buf \u2_wrrd/Sdr_rd_dout[19]_syn_2  (\u2_wrrd/Sdr_rd_dout[19]_syn_4 , \u2_wrrd/Sdr_rd_dout [19]);
  buf \u2_wrrd/Sdr_rd_dout[1]_syn_1  (\u2_wrrd/Sdr_rd_dout [1], \u2_wrrd/Sdr_rd_dout[1]_syn_3 );
  buf \u2_wrrd/Sdr_rd_dout[1]_syn_2  (\u2_wrrd/Sdr_rd_dout[1]_syn_4 , \u2_wrrd/Sdr_rd_dout [1]);
  buf \u2_wrrd/Sdr_rd_dout[20]_syn_1  (\u2_wrrd/Sdr_rd_dout [20], \u2_wrrd/Sdr_rd_dout[20]_syn_3 );
  buf \u2_wrrd/Sdr_rd_dout[20]_syn_2  (\u2_wrrd/Sdr_rd_dout[20]_syn_4 , \u2_wrrd/Sdr_rd_dout [20]);
  buf \u2_wrrd/Sdr_rd_dout[21]_syn_1  (\u2_wrrd/Sdr_rd_dout [21], \u2_wrrd/Sdr_rd_dout[21]_syn_3 );
  buf \u2_wrrd/Sdr_rd_dout[21]_syn_2  (\u2_wrrd/Sdr_rd_dout[21]_syn_4 , \u2_wrrd/Sdr_rd_dout [21]);
  buf \u2_wrrd/Sdr_rd_dout[22]_syn_1  (\u2_wrrd/Sdr_rd_dout [22], \u2_wrrd/Sdr_rd_dout[22]_syn_3 );
  buf \u2_wrrd/Sdr_rd_dout[22]_syn_2  (\u2_wrrd/Sdr_rd_dout[22]_syn_4 , \u2_wrrd/Sdr_rd_dout [22]);
  buf \u2_wrrd/Sdr_rd_dout[23]_syn_1  (\u2_wrrd/Sdr_rd_dout [23], \u2_wrrd/Sdr_rd_dout[23]_syn_3 );
  buf \u2_wrrd/Sdr_rd_dout[23]_syn_2  (\u2_wrrd/Sdr_rd_dout[23]_syn_4 , \u2_wrrd/Sdr_rd_dout [23]);
  buf \u2_wrrd/Sdr_rd_dout[24]_syn_1  (\u2_wrrd/Sdr_rd_dout [24], \u2_wrrd/Sdr_rd_dout[24]_syn_3 );
  buf \u2_wrrd/Sdr_rd_dout[24]_syn_2  (\u2_wrrd/Sdr_rd_dout[24]_syn_4 , \u2_wrrd/Sdr_rd_dout [24]);
  buf \u2_wrrd/Sdr_rd_dout[25]_syn_1  (\u2_wrrd/Sdr_rd_dout [25], \u2_wrrd/Sdr_rd_dout[25]_syn_3 );
  buf \u2_wrrd/Sdr_rd_dout[25]_syn_2  (\u2_wrrd/Sdr_rd_dout[25]_syn_4 , \u2_wrrd/Sdr_rd_dout [25]);
  buf \u2_wrrd/Sdr_rd_dout[26]_syn_1  (\u2_wrrd/Sdr_rd_dout [26], \u2_wrrd/Sdr_rd_dout[26]_syn_3 );
  buf \u2_wrrd/Sdr_rd_dout[26]_syn_2  (\u2_wrrd/Sdr_rd_dout[26]_syn_4 , \u2_wrrd/Sdr_rd_dout [26]);
  buf \u2_wrrd/Sdr_rd_dout[27]_syn_1  (\u2_wrrd/Sdr_rd_dout [27], \u2_wrrd/Sdr_rd_dout[27]_syn_3 );
  buf \u2_wrrd/Sdr_rd_dout[27]_syn_2  (\u2_wrrd/Sdr_rd_dout[27]_syn_4 , \u2_wrrd/Sdr_rd_dout [27]);
  buf \u2_wrrd/Sdr_rd_dout[28]_syn_1  (\u2_wrrd/Sdr_rd_dout [28], \u2_wrrd/Sdr_rd_dout[28]_syn_3 );
  buf \u2_wrrd/Sdr_rd_dout[28]_syn_2  (\u2_wrrd/Sdr_rd_dout[28]_syn_4 , \u2_wrrd/Sdr_rd_dout [28]);
  buf \u2_wrrd/Sdr_rd_dout[29]_syn_1  (\u2_wrrd/Sdr_rd_dout [29], \u2_wrrd/Sdr_rd_dout[29]_syn_3 );
  buf \u2_wrrd/Sdr_rd_dout[29]_syn_2  (\u2_wrrd/Sdr_rd_dout[29]_syn_4 , \u2_wrrd/Sdr_rd_dout [29]);
  buf \u2_wrrd/Sdr_rd_dout[2]_syn_1  (\u2_wrrd/Sdr_rd_dout [2], \u2_wrrd/Sdr_rd_dout[2]_syn_3 );
  buf \u2_wrrd/Sdr_rd_dout[2]_syn_2  (\u2_wrrd/Sdr_rd_dout[2]_syn_4 , \u2_wrrd/Sdr_rd_dout [2]);
  buf \u2_wrrd/Sdr_rd_dout[30]_syn_1  (\u2_wrrd/Sdr_rd_dout [30], \u2_wrrd/Sdr_rd_dout[30]_syn_3 );
  buf \u2_wrrd/Sdr_rd_dout[30]_syn_2  (\u2_wrrd/Sdr_rd_dout[30]_syn_4 , \u2_wrrd/Sdr_rd_dout [30]);
  buf \u2_wrrd/Sdr_rd_dout[31]_syn_1  (\u2_wrrd/Sdr_rd_dout [31], \u2_wrrd/Sdr_rd_dout[31]_syn_3 );
  buf \u2_wrrd/Sdr_rd_dout[31]_syn_2  (\u2_wrrd/Sdr_rd_dout[31]_syn_4 , \u2_wrrd/Sdr_rd_dout [31]);
  buf \u2_wrrd/Sdr_rd_dout[3]_syn_1  (\u2_wrrd/Sdr_rd_dout [3], \u2_wrrd/Sdr_rd_dout[3]_syn_3 );
  buf \u2_wrrd/Sdr_rd_dout[3]_syn_2  (\u2_wrrd/Sdr_rd_dout[3]_syn_4 , \u2_wrrd/Sdr_rd_dout [3]);
  buf \u2_wrrd/Sdr_rd_dout[4]_syn_1  (\u2_wrrd/Sdr_rd_dout [4], \u2_wrrd/Sdr_rd_dout[4]_syn_3 );
  buf \u2_wrrd/Sdr_rd_dout[4]_syn_2  (\u2_wrrd/Sdr_rd_dout[4]_syn_4 , \u2_wrrd/Sdr_rd_dout [4]);
  buf \u2_wrrd/Sdr_rd_dout[5]_syn_1  (\u2_wrrd/Sdr_rd_dout [5], \u2_wrrd/Sdr_rd_dout[5]_syn_3 );
  buf \u2_wrrd/Sdr_rd_dout[5]_syn_2  (\u2_wrrd/Sdr_rd_dout[5]_syn_4 , \u2_wrrd/Sdr_rd_dout [5]);
  buf \u2_wrrd/Sdr_rd_dout[6]_syn_1  (\u2_wrrd/Sdr_rd_dout [6], \u2_wrrd/Sdr_rd_dout[6]_syn_3 );
  buf \u2_wrrd/Sdr_rd_dout[6]_syn_2  (\u2_wrrd/Sdr_rd_dout[6]_syn_4 , \u2_wrrd/Sdr_rd_dout [6]);
  buf \u2_wrrd/Sdr_rd_dout[7]_syn_1  (\u2_wrrd/Sdr_rd_dout [7], \u2_wrrd/Sdr_rd_dout[7]_syn_3 );
  buf \u2_wrrd/Sdr_rd_dout[7]_syn_2  (\u2_wrrd/Sdr_rd_dout[7]_syn_4 , \u2_wrrd/Sdr_rd_dout [7]);
  buf \u2_wrrd/Sdr_rd_dout[8]_syn_1  (\u2_wrrd/Sdr_rd_dout [8], \u2_wrrd/Sdr_rd_dout[8]_syn_3 );
  buf \u2_wrrd/Sdr_rd_dout[8]_syn_2  (\u2_wrrd/Sdr_rd_dout[8]_syn_4 , \u2_wrrd/Sdr_rd_dout [8]);
  buf \u2_wrrd/Sdr_rd_dout[9]_syn_1  (\u2_wrrd/Sdr_rd_dout [9], \u2_wrrd/Sdr_rd_dout[9]_syn_3 );
  buf \u2_wrrd/Sdr_rd_dout[9]_syn_2  (\u2_wrrd/Sdr_rd_dout[9]_syn_4 , \u2_wrrd/Sdr_rd_dout [9]);
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/Sdr_rd_dout_reg[0]  (
    .clk(1'b0),
    .d(\SDR_DQ[0]_dup_1 )); /* synthesis keep=true */ 
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/Sdr_rd_dout_reg[10]  (
    .clk(1'b0),
    .d(\SDR_DQ[10]_dup_1 )); /* synthesis keep=true */ 
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/Sdr_rd_dout_reg[11]  (
    .clk(1'b0),
    .d(\SDR_DQ[11]_dup_1 )); /* synthesis keep=true */ 
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/Sdr_rd_dout_reg[12]  (
    .clk(1'b0),
    .d(\SDR_DQ[12]_dup_1 )); /* synthesis keep=true */ 
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/Sdr_rd_dout_reg[13]  (
    .clk(1'b0),
    .d(\SDR_DQ[13]_dup_1 )); /* synthesis keep=true */ 
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/Sdr_rd_dout_reg[14]  (
    .clk(1'b0),
    .d(\SDR_DQ[14]_dup_1 )); /* synthesis keep=true */ 
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/Sdr_rd_dout_reg[15]  (
    .clk(1'b0),
    .d(\SDR_DQ[15]_dup_1 )); /* synthesis keep=true */ 
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/Sdr_rd_dout_reg[16]  (
    .clk(1'b0),
    .d(\SDR_DQ[16]_dup_1 )); /* synthesis keep=true */ 
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/Sdr_rd_dout_reg[17]  (
    .clk(1'b0),
    .d(\SDR_DQ[17]_dup_1 )); /* synthesis keep=true */ 
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/Sdr_rd_dout_reg[18]  (
    .clk(1'b0),
    .d(\SDR_DQ[18]_dup_1 )); /* synthesis keep=true */ 
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/Sdr_rd_dout_reg[19]  (
    .clk(1'b0),
    .d(\SDR_DQ[19]_dup_1 )); /* synthesis keep=true */ 
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/Sdr_rd_dout_reg[1]  (
    .clk(1'b0),
    .d(\SDR_DQ[1]_dup_1 )); /* synthesis keep=true */ 
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/Sdr_rd_dout_reg[20]  (
    .clk(1'b0),
    .d(\SDR_DQ[20]_dup_1 )); /* synthesis keep=true */ 
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/Sdr_rd_dout_reg[21]  (
    .clk(1'b0),
    .d(\SDR_DQ[21]_dup_1 )); /* synthesis keep=true */ 
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/Sdr_rd_dout_reg[22]  (
    .clk(1'b0),
    .d(\SDR_DQ[22]_dup_1 )); /* synthesis keep=true */ 
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/Sdr_rd_dout_reg[23]  (
    .clk(1'b0),
    .d(\SDR_DQ[23]_dup_1 )); /* synthesis keep=true */ 
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/Sdr_rd_dout_reg[24]  (
    .clk(1'b0),
    .d(\SDR_DQ[24]_dup_1 )); /* synthesis keep=true */ 
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/Sdr_rd_dout_reg[25]  (
    .clk(1'b0),
    .d(\SDR_DQ[25]_dup_1 )); /* synthesis keep=true */ 
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/Sdr_rd_dout_reg[26]  (
    .clk(1'b0),
    .d(\SDR_DQ[26]_dup_1 )); /* synthesis keep=true */ 
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/Sdr_rd_dout_reg[27]  (
    .clk(1'b0),
    .d(\SDR_DQ[27]_dup_1 )); /* synthesis keep=true */ 
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/Sdr_rd_dout_reg[28]  (
    .clk(1'b0),
    .d(\SDR_DQ[28]_dup_1 )); /* synthesis keep=true */ 
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/Sdr_rd_dout_reg[29]  (
    .clk(1'b0),
    .d(\SDR_DQ[29]_dup_1 )); /* synthesis keep=true */ 
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/Sdr_rd_dout_reg[2]  (
    .clk(1'b0),
    .d(\SDR_DQ[2]_dup_1 )); /* synthesis keep=true */ 
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/Sdr_rd_dout_reg[30]  (
    .clk(1'b0),
    .d(\SDR_DQ[30]_dup_1 )); /* synthesis keep=true */ 
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/Sdr_rd_dout_reg[31]  (
    .clk(1'b0),
    .d(\SDR_DQ[31]_dup_1 )); /* synthesis keep=true */ 
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/Sdr_rd_dout_reg[3]  (
    .clk(1'b0),
    .d(\SDR_DQ[3]_dup_1 )); /* synthesis keep=true */ 
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/Sdr_rd_dout_reg[4]  (
    .clk(1'b0),
    .d(\SDR_DQ[4]_dup_1 )); /* synthesis keep=true */ 
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/Sdr_rd_dout_reg[5]  (
    .clk(1'b0),
    .d(\SDR_DQ[5]_dup_1 )); /* synthesis keep=true */ 
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/Sdr_rd_dout_reg[6]  (
    .clk(1'b0),
    .d(\SDR_DQ[6]_dup_1 )); /* synthesis keep=true */ 
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/Sdr_rd_dout_reg[7]  (
    .clk(1'b0),
    .d(\SDR_DQ[7]_dup_1 )); /* synthesis keep=true */ 
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/Sdr_rd_dout_reg[8]  (
    .clk(1'b0),
    .d(\SDR_DQ[8]_dup_1 )); /* synthesis keep=true */ 
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/Sdr_rd_dout_reg[9]  (
    .clk(1'b0),
    .d(\SDR_DQ[9]_dup_1 )); /* synthesis keep=true */ 
  AL_MAP_LUT4 #(
    .EQN("(~B*~A*~(~D*~C))"),
    .INIT(16'h1110))
    \u2_wrrd/Sdr_ref_ack_n_syn_1  (
    .a(App_rd_en_dup_5),
    .b(App_wr_en_dup_5),
    .c(\u2_wrrd/ref_ack ),
    .d(\u2_wrrd/wrrd_ref_ack ),
    .o(\u2_wrrd/Sdr_ref_ack_n ));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/Sdr_ref_ack_reg  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/Sdr_ref_ack_n ),
    .q(\u1_init_ref/Sdr_ref_ack ));
  buf \u2_wrrd/Sdr_ref_req_syn_1  (\u2_wrrd/Sdr_ref_req , \u1_init_ref/Sdr_ref_req );
  buf \u2_wrrd/Sdr_ref_req_syn_2  (\u2_wrrd/Sdr_ref_req_syn_4 , \u2_wrrd/Sdr_ref_req );
  AL_MAP_LUT3 #(
    .EQN("(B*~(C)*~(A)+B*C*~(A)+~(B)*C*A+B*C*A)"),
    .INIT(8'he4))
    \u2_wrrd/active_ba_b1[0]_syn_1  (
    .a(\u2_wrrd/active_row_b1[9]_syn_2 ),
    .b(\u2_wrrd/app_rd_addr_1d [2]),
    .c(\u2_wrrd/app_wr_addr_1d [2]),
    .o(\u2_wrrd/active_ba_b1 [0]));
  AL_MAP_LUT3 #(
    .EQN("(B*~(C)*~(A)+B*C*~(A)+~(B)*C*A+B*C*A)"),
    .INIT(8'he4))
    \u2_wrrd/active_ba_b1[1]_syn_1  (
    .a(\u2_wrrd/active_row_b1[9]_syn_2 ),
    .b(\u2_wrrd/app_rd_addr_1d [3]),
    .c(\u2_wrrd/app_wr_addr_1d [3]),
    .o(\u2_wrrd/active_ba_b1 [1]));
  AL_MAP_SEQ #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u2_wrrd/active_ba_reg[0]  (
    .ce(\u2_wrrd/mux21_syn_2 [0]),
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/active_ba_b1 [0]),
    .sr(Rst_dup_177),
    .q(\u2_wrrd/active_ba [0]));
  AL_MAP_SEQ #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u2_wrrd/active_ba_reg[1]  (
    .ce(\u2_wrrd/mux21_syn_2 [0]),
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/active_ba_b1 [1]),
    .sr(Rst_dup_177),
    .q(\u2_wrrd/active_ba [1]));
  AL_MAP_LUT3 #(
    .EQN("(B*~(C)*~(A)+B*C*~(A)+~(B)*C*A+B*C*A)"),
    .INIT(8'he4))
    \u2_wrrd/active_col_b1[0]_syn_1  (
    .a(\u2_wrrd/active_col_b1[6]_syn_2 ),
    .b(\u2_wrrd/app_rd_addr_4d [0]),
    .c(\u2_wrrd/app_wr_addr_4d [0]),
    .o(\u2_wrrd/active_col_b1 [0]));
  AL_MAP_LUT3 #(
    .EQN("(B*~(C)*~(A)+B*C*~(A)+~(B)*C*A+B*C*A)"),
    .INIT(8'he4))
    \u2_wrrd/active_col_b1[1]_syn_1  (
    .a(\u2_wrrd/active_col_b1[6]_syn_2 ),
    .b(\u2_wrrd/app_rd_addr_4d [1]),
    .c(\u2_wrrd/app_wr_addr_4d [1]),
    .o(\u2_wrrd/active_col_b1 [1]));
  AL_MAP_LUT3 #(
    .EQN("(B*~(C)*~(A)+B*C*~(A)+~(B)*C*A+B*C*A)"),
    .INIT(8'he4))
    \u2_wrrd/active_col_b1[2]_syn_1  (
    .a(\u2_wrrd/active_col_b1[6]_syn_2 ),
    .b(\u2_wrrd/app_rd_addr_4d [4]),
    .c(\u2_wrrd/app_wr_addr_4d [4]),
    .o(\u2_wrrd/active_col_b1 [2]));
  AL_MAP_LUT3 #(
    .EQN("(B*~(C)*~(A)+B*C*~(A)+~(B)*C*A+B*C*A)"),
    .INIT(8'he4))
    \u2_wrrd/active_col_b1[3]_syn_1  (
    .a(\u2_wrrd/active_col_b1[6]_syn_2 ),
    .b(\u2_wrrd/app_rd_addr_4d [5]),
    .c(\u2_wrrd/app_wr_addr_4d [5]),
    .o(\u2_wrrd/active_col_b1 [3]));
  AL_MAP_LUT3 #(
    .EQN("(B*~(C)*~(A)+B*C*~(A)+~(B)*C*A+B*C*A)"),
    .INIT(8'he4))
    \u2_wrrd/active_col_b1[4]_syn_1  (
    .a(\u2_wrrd/active_col_b1[6]_syn_2 ),
    .b(\u2_wrrd/app_rd_addr_4d [6]),
    .c(\u2_wrrd/app_wr_addr_4d [6]),
    .o(\u2_wrrd/active_col_b1 [4]));
  AL_MAP_LUT3 #(
    .EQN("(B*~(C)*~(A)+B*C*~(A)+~(B)*C*A+B*C*A)"),
    .INIT(8'he4))
    \u2_wrrd/active_col_b1[5]_syn_1  (
    .a(\u2_wrrd/active_col_b1[6]_syn_2 ),
    .b(\u2_wrrd/app_rd_addr_4d [7]),
    .c(\u2_wrrd/app_wr_addr_4d [7]),
    .o(\u2_wrrd/active_col_b1 [5]));
  AL_MAP_LUT3 #(
    .EQN("(C*B*A)"),
    .INIT(8'h80))
    \u2_wrrd/active_col_b1[6]_syn_1  (
    .a(\u2_wrrd/app_wr_en_sft [0]),
    .b(\u2_wrrd/cnt4 [0]),
    .c(\u2_wrrd/cnt4 [1]),
    .o(\u2_wrrd/active_col_b1[6]_syn_2 ));
  AL_MAP_LUT3 #(
    .EQN("(B*~(C)*~(A)+B*C*~(A)+~(B)*C*A+B*C*A)"),
    .INIT(8'he4))
    \u2_wrrd/active_col_b1[6]_syn_3  (
    .a(\u2_wrrd/active_col_b1[6]_syn_2 ),
    .b(\u2_wrrd/app_rd_addr_4d [8]),
    .c(\u2_wrrd/app_wr_addr_4d [8]),
    .o(\u2_wrrd/active_col_b1 [6]));
  AL_MAP_LUT3 #(
    .EQN("(B*~(C)*~(A)+B*C*~(A)+~(B)*C*A+B*C*A)"),
    .INIT(8'he4))
    \u2_wrrd/active_col_b1[7]_syn_1  (
    .a(\u2_wrrd/active_col_b1[6]_syn_2 ),
    .b(\u2_wrrd/app_rd_addr_4d [9]),
    .c(\u2_wrrd/app_wr_addr_4d [9]),
    .o(\u2_wrrd/active_col_b1 [7]));
  AL_MAP_SEQ #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u2_wrrd/active_col_reg[0]  (
    .ce(\u2_wrrd/mux1_syn_2 [7]),
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/active_col_b1 [0]),
    .sr(Rst_dup_177),
    .q(\u2_wrrd/active_col [0]));
  AL_MAP_SEQ #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u2_wrrd/active_col_reg[1]  (
    .ce(\u2_wrrd/mux1_syn_2 [7]),
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/active_col_b1 [1]),
    .sr(Rst_dup_177),
    .q(\u2_wrrd/active_col [1]));
  AL_MAP_SEQ #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u2_wrrd/active_col_reg[2]  (
    .ce(\u2_wrrd/mux1_syn_2 [7]),
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/active_col_b1 [2]),
    .sr(Rst_dup_177),
    .q(\u2_wrrd/active_col [2]));
  AL_MAP_SEQ #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u2_wrrd/active_col_reg[3]  (
    .ce(\u2_wrrd/mux1_syn_2 [7]),
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/active_col_b1 [3]),
    .sr(Rst_dup_177),
    .q(\u2_wrrd/active_col [3]));
  AL_MAP_SEQ #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u2_wrrd/active_col_reg[4]  (
    .ce(\u2_wrrd/mux1_syn_2 [7]),
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/active_col_b1 [4]),
    .sr(Rst_dup_177),
    .q(\u2_wrrd/active_col [4]));
  AL_MAP_SEQ #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u2_wrrd/active_col_reg[5]  (
    .ce(\u2_wrrd/mux1_syn_2 [7]),
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/active_col_b1 [5]),
    .sr(Rst_dup_177),
    .q(\u2_wrrd/active_col [5]));
  AL_MAP_SEQ #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u2_wrrd/active_col_reg[6]  (
    .ce(\u2_wrrd/mux1_syn_2 [7]),
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/active_col_b1 [6]),
    .sr(Rst_dup_177),
    .q(\u2_wrrd/active_col [6]));
  AL_MAP_SEQ #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u2_wrrd/active_col_reg[7]  (
    .ce(\u2_wrrd/mux1_syn_2 [7]),
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/active_col_b1 [7]),
    .sr(Rst_dup_177),
    .q(\u2_wrrd/active_col [7]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/active_en_reg  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/active_en_reg_syn_3 ),
    .q(\u2_wrrd/active_en ));
  AL_MAP_LUT2 #(
    .EQN("(~B*A)"),
    .INIT(4'h2))
    \u2_wrrd/active_en_reg_syn_4  (
    .a(\u2_wrrd/mux21_syn_2 [0]),
    .b(Rst_dup_177),
    .o(\u2_wrrd/active_en_reg_syn_3 ));
  AL_MAP_LUT1 #(
    .EQN("(~A)"),
    .INIT(2'h1))
    \u2_wrrd/active_en_syn_15  (
    .a(\u2_wrrd/active_en ),
    .o(\u2_wrrd/active_en_syn_2 ));
  AL_MAP_LUT3 #(
    .EQN("(B*~(C)*~(A)+B*C*~(A)+~(B)*C*A+B*C*A)"),
    .INIT(8'he4))
    \u2_wrrd/active_row_b1[0]_syn_1  (
    .a(\u2_wrrd/active_row_b1[9]_syn_2 ),
    .b(\u2_wrrd/app_rd_addr_1d [10]),
    .c(\u2_wrrd/app_wr_addr_1d [10]),
    .o(\u2_wrrd/active_row_b1 [0]));
  AL_MAP_LUT3 #(
    .EQN("(B*~(C)*~(A)+B*C*~(A)+~(B)*C*A+B*C*A)"),
    .INIT(8'he4))
    \u2_wrrd/active_row_b1[10]_syn_1  (
    .a(\u2_wrrd/active_row_b1[9]_syn_2 ),
    .b(\u2_wrrd/app_rd_addr_1d [20]),
    .c(\u2_wrrd/app_wr_addr_1d [20]),
    .o(\u2_wrrd/active_row_b1 [10]));
  AL_MAP_LUT3 #(
    .EQN("(B*~(C)*~(A)+B*C*~(A)+~(B)*C*A+B*C*A)"),
    .INIT(8'he4))
    \u2_wrrd/active_row_b1[1]_syn_1  (
    .a(\u2_wrrd/active_row_b1[9]_syn_2 ),
    .b(\u2_wrrd/app_rd_addr_1d [11]),
    .c(\u2_wrrd/app_wr_addr_1d [11]),
    .o(\u2_wrrd/active_row_b1 [1]));
  AL_MAP_LUT3 #(
    .EQN("(B*~(C)*~(A)+B*C*~(A)+~(B)*C*A+B*C*A)"),
    .INIT(8'he4))
    \u2_wrrd/active_row_b1[2]_syn_1  (
    .a(\u2_wrrd/active_row_b1[9]_syn_2 ),
    .b(\u2_wrrd/app_rd_addr_1d [12]),
    .c(\u2_wrrd/app_wr_addr_1d [12]),
    .o(\u2_wrrd/active_row_b1 [2]));
  AL_MAP_LUT3 #(
    .EQN("(B*~(C)*~(A)+B*C*~(A)+~(B)*C*A+B*C*A)"),
    .INIT(8'he4))
    \u2_wrrd/active_row_b1[3]_syn_1  (
    .a(\u2_wrrd/active_row_b1[9]_syn_2 ),
    .b(\u2_wrrd/app_rd_addr_1d [13]),
    .c(\u2_wrrd/app_wr_addr_1d [13]),
    .o(\u2_wrrd/active_row_b1 [3]));
  AL_MAP_LUT3 #(
    .EQN("(B*~(C)*~(A)+B*C*~(A)+~(B)*C*A+B*C*A)"),
    .INIT(8'he4))
    \u2_wrrd/active_row_b1[4]_syn_1  (
    .a(\u2_wrrd/active_row_b1[9]_syn_2 ),
    .b(\u2_wrrd/app_rd_addr_1d [14]),
    .c(\u2_wrrd/app_wr_addr_1d [14]),
    .o(\u2_wrrd/active_row_b1 [4]));
  AL_MAP_LUT3 #(
    .EQN("(B*~(C)*~(A)+B*C*~(A)+~(B)*C*A+B*C*A)"),
    .INIT(8'he4))
    \u2_wrrd/active_row_b1[5]_syn_1  (
    .a(\u2_wrrd/active_row_b1[9]_syn_2 ),
    .b(\u2_wrrd/app_rd_addr_1d [15]),
    .c(\u2_wrrd/app_wr_addr_1d [15]),
    .o(\u2_wrrd/active_row_b1 [5]));
  AL_MAP_LUT3 #(
    .EQN("(B*~(C)*~(A)+B*C*~(A)+~(B)*C*A+B*C*A)"),
    .INIT(8'he4))
    \u2_wrrd/active_row_b1[6]_syn_1  (
    .a(\u2_wrrd/active_row_b1[9]_syn_2 ),
    .b(\u2_wrrd/app_rd_addr_1d [16]),
    .c(\u2_wrrd/app_wr_addr_1d [16]),
    .o(\u2_wrrd/active_row_b1 [6]));
  AL_MAP_LUT3 #(
    .EQN("(B*~(C)*~(A)+B*C*~(A)+~(B)*C*A+B*C*A)"),
    .INIT(8'he4))
    \u2_wrrd/active_row_b1[7]_syn_1  (
    .a(\u2_wrrd/active_row_b1[9]_syn_2 ),
    .b(\u2_wrrd/app_rd_addr_1d [17]),
    .c(\u2_wrrd/app_wr_addr_1d [17]),
    .o(\u2_wrrd/active_row_b1 [7]));
  AL_MAP_LUT3 #(
    .EQN("(B*~(C)*~(A)+B*C*~(A)+~(B)*C*A+B*C*A)"),
    .INIT(8'he4))
    \u2_wrrd/active_row_b1[8]_syn_1  (
    .a(\u2_wrrd/active_row_b1[9]_syn_2 ),
    .b(\u2_wrrd/app_rd_addr_1d [18]),
    .c(\u2_wrrd/app_wr_addr_1d [18]),
    .o(\u2_wrrd/active_row_b1 [8]));
  AL_MAP_LUT3 #(
    .EQN("(~C*~B*A)"),
    .INIT(8'h02))
    \u2_wrrd/active_row_b1[9]_syn_1  (
    .a(\u2_wrrd/app_wr_en_sft [0]),
    .b(\u2_wrrd/cnt4 [0]),
    .c(\u2_wrrd/cnt4 [1]),
    .o(\u2_wrrd/active_row_b1[9]_syn_2 ));
  AL_MAP_LUT3 #(
    .EQN("(B*~(C)*~(A)+B*C*~(A)+~(B)*C*A+B*C*A)"),
    .INIT(8'he4))
    \u2_wrrd/active_row_b1[9]_syn_3  (
    .a(\u2_wrrd/active_row_b1[9]_syn_2 ),
    .b(\u2_wrrd/app_rd_addr_1d [19]),
    .c(\u2_wrrd/app_wr_addr_1d [19]),
    .o(\u2_wrrd/active_row_b1 [9]));
  AL_MAP_SEQ #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u2_wrrd/active_row_reg[0]  (
    .ce(\u2_wrrd/mux21_syn_2 [0]),
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/active_row_b1 [0]),
    .sr(Rst_dup_177),
    .q(\u2_wrrd/active_row [0]));
  AL_MAP_SEQ #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u2_wrrd/active_row_reg[10]  (
    .ce(\u2_wrrd/mux21_syn_2 [0]),
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/active_row_b1 [10]),
    .sr(Rst_dup_177),
    .q(\u2_wrrd/active_row [10]));
  AL_MAP_SEQ #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u2_wrrd/active_row_reg[1]  (
    .ce(\u2_wrrd/mux21_syn_2 [0]),
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/active_row_b1 [1]),
    .sr(Rst_dup_177),
    .q(\u2_wrrd/active_row [1]));
  AL_MAP_SEQ #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u2_wrrd/active_row_reg[2]  (
    .ce(\u2_wrrd/mux21_syn_2 [0]),
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/active_row_b1 [2]),
    .sr(Rst_dup_177),
    .q(\u2_wrrd/active_row [2]));
  AL_MAP_SEQ #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u2_wrrd/active_row_reg[3]  (
    .ce(\u2_wrrd/mux21_syn_2 [0]),
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/active_row_b1 [3]),
    .sr(Rst_dup_177),
    .q(\u2_wrrd/active_row [3]));
  AL_MAP_SEQ #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u2_wrrd/active_row_reg[4]  (
    .ce(\u2_wrrd/mux21_syn_2 [0]),
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/active_row_b1 [4]),
    .sr(Rst_dup_177),
    .q(\u2_wrrd/active_row [4]));
  AL_MAP_SEQ #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u2_wrrd/active_row_reg[5]  (
    .ce(\u2_wrrd/mux21_syn_2 [0]),
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/active_row_b1 [5]),
    .sr(Rst_dup_177),
    .q(\u2_wrrd/active_row [5]));
  AL_MAP_SEQ #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u2_wrrd/active_row_reg[6]  (
    .ce(\u2_wrrd/mux21_syn_2 [0]),
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/active_row_b1 [6]),
    .sr(Rst_dup_177),
    .q(\u2_wrrd/active_row [6]));
  AL_MAP_SEQ #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u2_wrrd/active_row_reg[7]  (
    .ce(\u2_wrrd/mux21_syn_2 [0]),
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/active_row_b1 [7]),
    .sr(Rst_dup_177),
    .q(\u2_wrrd/active_row [7]));
  AL_MAP_SEQ #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u2_wrrd/active_row_reg[8]  (
    .ce(\u2_wrrd/mux21_syn_2 [0]),
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/active_row_b1 [8]),
    .sr(Rst_dup_177),
    .q(\u2_wrrd/active_row [8]));
  AL_MAP_SEQ #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u2_wrrd/active_row_reg[9]  (
    .ce(\u2_wrrd/mux21_syn_2 [0]),
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/active_row_b1 [9]),
    .sr(Rst_dup_177),
    .q(\u2_wrrd/active_row [9]));
  AL_MAP_LUT3 #(
    .EQN("(B*~(C)*~(A)+B*C*~(A)+~(B)*C*A+B*C*A)"),
    .INIT(8'he4))
    \u2_wrrd/addr_b[0]_syn_1  (
    .a(\u2_wrrd/active_en ),
    .b(\u2_wrrd/active_col [0]),
    .c(\u2_wrrd/active_row [0]),
    .o(\u2_wrrd/addr_b [0]));
  AL_MAP_LUT2 #(
    .EQN("~(~B*A)"),
    .INIT(4'hd))
    \u2_wrrd/addr_b[10]_syn_1  (
    .a(\u2_wrrd/active_en ),
    .b(\u2_wrrd/active_row [10]),
    .o(\u2_wrrd/addr_b [10]));
  AL_MAP_LUT3 #(
    .EQN("(B*~(C)*~(A)+B*C*~(A)+~(B)*C*A+B*C*A)"),
    .INIT(8'he4))
    \u2_wrrd/addr_b[1]_syn_1  (
    .a(\u2_wrrd/active_en ),
    .b(\u2_wrrd/active_col [1]),
    .c(\u2_wrrd/active_row [1]),
    .o(\u2_wrrd/addr_b [1]));
  AL_MAP_LUT3 #(
    .EQN("(B*~(C)*~(A)+B*C*~(A)+~(B)*C*A+B*C*A)"),
    .INIT(8'he4))
    \u2_wrrd/addr_b[2]_syn_1  (
    .a(\u2_wrrd/active_en ),
    .b(\u2_wrrd/active_col [2]),
    .c(\u2_wrrd/active_row [2]),
    .o(\u2_wrrd/addr_b [2]));
  AL_MAP_LUT3 #(
    .EQN("(B*~(C)*~(A)+B*C*~(A)+~(B)*C*A+B*C*A)"),
    .INIT(8'he4))
    \u2_wrrd/addr_b[3]_syn_1  (
    .a(\u2_wrrd/active_en ),
    .b(\u2_wrrd/active_col [3]),
    .c(\u2_wrrd/active_row [3]),
    .o(\u2_wrrd/addr_b [3]));
  AL_MAP_LUT3 #(
    .EQN("(B*~(C)*~(A)+B*C*~(A)+~(B)*C*A+B*C*A)"),
    .INIT(8'he4))
    \u2_wrrd/addr_b[4]_syn_1  (
    .a(\u2_wrrd/active_en ),
    .b(\u2_wrrd/active_col [4]),
    .c(\u2_wrrd/active_row [4]),
    .o(\u2_wrrd/addr_b [4]));
  AL_MAP_LUT3 #(
    .EQN("(B*~(C)*~(A)+B*C*~(A)+~(B)*C*A+B*C*A)"),
    .INIT(8'he4))
    \u2_wrrd/addr_b[5]_syn_1  (
    .a(\u2_wrrd/active_en ),
    .b(\u2_wrrd/active_col [5]),
    .c(\u2_wrrd/active_row [5]),
    .o(\u2_wrrd/addr_b [5]));
  AL_MAP_LUT3 #(
    .EQN("(B*~(C)*~(A)+B*C*~(A)+~(B)*C*A+B*C*A)"),
    .INIT(8'he4))
    \u2_wrrd/addr_b[6]_syn_1  (
    .a(\u2_wrrd/active_en ),
    .b(\u2_wrrd/active_col [6]),
    .c(\u2_wrrd/active_row [6]),
    .o(\u2_wrrd/addr_b [6]));
  AL_MAP_LUT3 #(
    .EQN("(B*~(C)*~(A)+B*C*~(A)+~(B)*C*A+B*C*A)"),
    .INIT(8'he4))
    \u2_wrrd/addr_b[7]_syn_1  (
    .a(\u2_wrrd/active_en ),
    .b(\u2_wrrd/active_col [7]),
    .c(\u2_wrrd/active_row [7]),
    .o(\u2_wrrd/addr_b [7]));
  AL_MAP_SEQ #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/addr_reg[0]  (
    .ce(\u2_wrrd/mux4_syn_2 [10]),
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/addr_b [0]),
    .q(\u2_wrrd/addr [0]));
  AL_MAP_SEQ #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/addr_reg[10]  (
    .ce(\u2_wrrd/mux4_syn_2 [10]),
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/addr_b [10]),
    .q(\u2_wrrd/addr [10]));
  AL_MAP_SEQ #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/addr_reg[1]  (
    .ce(\u2_wrrd/mux4_syn_2 [10]),
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/addr_b [1]),
    .q(\u2_wrrd/addr [1]));
  AL_MAP_SEQ #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/addr_reg[2]  (
    .ce(\u2_wrrd/mux4_syn_2 [10]),
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/addr_b [2]),
    .q(\u2_wrrd/addr [2]));
  AL_MAP_SEQ #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/addr_reg[3]  (
    .ce(\u2_wrrd/mux4_syn_2 [10]),
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/addr_b [3]),
    .q(\u2_wrrd/addr [3]));
  AL_MAP_SEQ #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/addr_reg[4]  (
    .ce(\u2_wrrd/mux4_syn_2 [10]),
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/addr_b [4]),
    .q(\u2_wrrd/addr [4]));
  AL_MAP_SEQ #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/addr_reg[5]  (
    .ce(\u2_wrrd/mux4_syn_2 [10]),
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/addr_b [5]),
    .q(\u2_wrrd/addr [5]));
  AL_MAP_SEQ #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/addr_reg[6]  (
    .ce(\u2_wrrd/mux4_syn_2 [10]),
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/addr_b [6]),
    .q(\u2_wrrd/addr [6]));
  AL_MAP_SEQ #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/addr_reg[7]  (
    .ce(\u2_wrrd/mux4_syn_2 [10]),
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/addr_b [7]),
    .q(\u2_wrrd/addr [7]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/addr_reg[8]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/addr_reg[8]_syn_2 ),
    .q(\u2_wrrd/addr [8]));
  AL_MAP_LUT3 #(
    .EQN("(C*~(B)*~(A)+C*B*~(A)+~(C)*B*A+C*B*A)"),
    .INIT(8'hd8))
    \u2_wrrd/addr_reg[8]_syn_3  (
    .a(\u2_wrrd/active_en ),
    .b(\u2_wrrd/active_row [8]),
    .c(\u2_wrrd/addr [8]),
    .o(\u2_wrrd/addr_reg[8]_syn_2 ));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/addr_reg[9]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/addr_reg[9]_syn_2 ),
    .q(\u2_wrrd/addr [9]));
  AL_MAP_LUT3 #(
    .EQN("(C*~(B)*~(A)+C*B*~(A)+~(C)*B*A+C*B*A)"),
    .INIT(8'hd8))
    \u2_wrrd/addr_reg[9]_syn_3  (
    .a(\u2_wrrd/active_en ),
    .b(\u2_wrrd/active_row [9]),
    .c(\u2_wrrd/addr [9]),
    .o(\u2_wrrd/addr_reg[9]_syn_2 ));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_rd_addr_2d_reg[0]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_rd_addr_1d [0]),
    .q(\u2_wrrd/app_rd_addr_2d [0]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_rd_addr_2d_reg[1]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_rd_addr_1d [1]),
    .q(\u2_wrrd/app_rd_addr_2d [1]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_rd_addr_2d_reg[4]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_rd_addr_1d [4]),
    .q(\u2_wrrd/app_rd_addr_2d [4]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_rd_addr_2d_reg[5]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_rd_addr_1d [5]),
    .q(\u2_wrrd/app_rd_addr_2d [5]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_rd_addr_2d_reg[6]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_rd_addr_1d [6]),
    .q(\u2_wrrd/app_rd_addr_2d [6]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_rd_addr_2d_reg[7]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_rd_addr_1d [7]),
    .q(\u2_wrrd/app_rd_addr_2d [7]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_rd_addr_2d_reg[8]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_rd_addr_1d [8]),
    .q(\u2_wrrd/app_rd_addr_2d [8]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_rd_addr_2d_reg[9]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_rd_addr_1d [9]),
    .q(\u2_wrrd/app_rd_addr_2d [9]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_rd_addr_3d_reg[0]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_rd_addr_2d [0]),
    .q(\u2_wrrd/app_rd_addr_3d [0]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_rd_addr_3d_reg[1]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_rd_addr_2d [1]),
    .q(\u2_wrrd/app_rd_addr_3d [1]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_rd_addr_3d_reg[4]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_rd_addr_2d [4]),
    .q(\u2_wrrd/app_rd_addr_3d [4]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_rd_addr_3d_reg[5]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_rd_addr_2d [5]),
    .q(\u2_wrrd/app_rd_addr_3d [5]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_rd_addr_3d_reg[6]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_rd_addr_2d [6]),
    .q(\u2_wrrd/app_rd_addr_3d [6]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_rd_addr_3d_reg[7]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_rd_addr_2d [7]),
    .q(\u2_wrrd/app_rd_addr_3d [7]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_rd_addr_3d_reg[8]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_rd_addr_2d [8]),
    .q(\u2_wrrd/app_rd_addr_3d [8]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_rd_addr_3d_reg[9]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_rd_addr_2d [9]),
    .q(\u2_wrrd/app_rd_addr_3d [9]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_rd_addr_4d_reg[0]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_rd_addr_3d [0]),
    .q(\u2_wrrd/app_rd_addr_4d [0]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_rd_addr_4d_reg[1]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_rd_addr_3d [1]),
    .q(\u2_wrrd/app_rd_addr_4d [1]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_rd_addr_4d_reg[4]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_rd_addr_3d [4]),
    .q(\u2_wrrd/app_rd_addr_4d [4]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_rd_addr_4d_reg[5]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_rd_addr_3d [5]),
    .q(\u2_wrrd/app_rd_addr_4d [5]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_rd_addr_4d_reg[6]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_rd_addr_3d [6]),
    .q(\u2_wrrd/app_rd_addr_4d [6]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_rd_addr_4d_reg[7]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_rd_addr_3d [7]),
    .q(\u2_wrrd/app_rd_addr_4d [7]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_rd_addr_4d_reg[8]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_rd_addr_3d [8]),
    .q(\u2_wrrd/app_rd_addr_4d [8]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_rd_addr_4d_reg[9]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_rd_addr_3d [9]),
    .q(\u2_wrrd/app_rd_addr_4d [9]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u2_wrrd/app_rd_en_sft_reg[10]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_rd_en_sft [9]),
    .sr(Rst_dup_177),
    .q(\u2_wrrd/app_rd_en_sft [10]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u2_wrrd/app_rd_en_sft_reg[1]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_rd_en_sft [0]),
    .sr(Rst_dup_177),
    .q(\u2_wrrd/app_rd_en_sft [1]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u2_wrrd/app_rd_en_sft_reg[2]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_rd_en_sft [1]),
    .sr(Rst_dup_177),
    .q(\u2_wrrd/app_rd_en_sft [2]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u2_wrrd/app_rd_en_sft_reg[3]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_rd_en_sft [2]),
    .sr(Rst_dup_177),
    .q(\u2_wrrd/app_rd_en_sft [3]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u2_wrrd/app_rd_en_sft_reg[4]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_rd_en_sft [3]),
    .sr(Rst_dup_177),
    .q(\u2_wrrd/app_rd_en_sft [4]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u2_wrrd/app_rd_en_sft_reg[5]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_rd_en_sft [4]),
    .sr(Rst_dup_177),
    .q(\u2_wrrd/app_rd_en_sft [5]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u2_wrrd/app_rd_en_sft_reg[6]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_rd_en_sft [5]),
    .sr(Rst_dup_177),
    .q(\u2_wrrd/app_rd_en_sft [6]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u2_wrrd/app_rd_en_sft_reg[7]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_rd_en_sft [6]),
    .sr(Rst_dup_177),
    .q(\u2_wrrd/app_rd_en_sft [7]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u2_wrrd/app_rd_en_sft_reg[8]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_rd_en_sft [7]),
    .sr(Rst_dup_177),
    .q(\u2_wrrd/app_rd_en_sft [8]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u2_wrrd/app_rd_en_sft_reg[9]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_rd_en_sft [8]),
    .sr(Rst_dup_177),
    .q(\u2_wrrd/app_rd_en_sft [9]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_addr_2d_reg[0]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_addr_1d [0]),
    .q(\u2_wrrd/app_wr_addr_2d [0]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_addr_2d_reg[1]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_addr_1d [1]),
    .q(\u2_wrrd/app_wr_addr_2d [1]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_addr_2d_reg[4]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_addr_1d [4]),
    .q(\u2_wrrd/app_wr_addr_2d [4]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_addr_2d_reg[5]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_addr_1d [5]),
    .q(\u2_wrrd/app_wr_addr_2d [5]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_addr_2d_reg[6]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_addr_1d [6]),
    .q(\u2_wrrd/app_wr_addr_2d [6]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_addr_2d_reg[7]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_addr_1d [7]),
    .q(\u2_wrrd/app_wr_addr_2d [7]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_addr_2d_reg[8]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_addr_1d [8]),
    .q(\u2_wrrd/app_wr_addr_2d [8]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_addr_2d_reg[9]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_addr_1d [9]),
    .q(\u2_wrrd/app_wr_addr_2d [9]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_addr_3d_reg[0]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_addr_2d [0]),
    .q(\u2_wrrd/app_wr_addr_3d [0]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_addr_3d_reg[1]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_addr_2d [1]),
    .q(\u2_wrrd/app_wr_addr_3d [1]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_addr_3d_reg[4]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_addr_2d [4]),
    .q(\u2_wrrd/app_wr_addr_3d [4]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_addr_3d_reg[5]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_addr_2d [5]),
    .q(\u2_wrrd/app_wr_addr_3d [5]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_addr_3d_reg[6]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_addr_2d [6]),
    .q(\u2_wrrd/app_wr_addr_3d [6]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_addr_3d_reg[7]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_addr_2d [7]),
    .q(\u2_wrrd/app_wr_addr_3d [7]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_addr_3d_reg[8]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_addr_2d [8]),
    .q(\u2_wrrd/app_wr_addr_3d [8]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_addr_3d_reg[9]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_addr_2d [9]),
    .q(\u2_wrrd/app_wr_addr_3d [9]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_addr_4d_reg[0]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_addr_3d [0]),
    .q(\u2_wrrd/app_wr_addr_4d [0]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_addr_4d_reg[1]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_addr_3d [1]),
    .q(\u2_wrrd/app_wr_addr_4d [1]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_addr_4d_reg[4]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_addr_3d [4]),
    .q(\u2_wrrd/app_wr_addr_4d [4]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_addr_4d_reg[5]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_addr_3d [5]),
    .q(\u2_wrrd/app_wr_addr_4d [5]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_addr_4d_reg[6]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_addr_3d [6]),
    .q(\u2_wrrd/app_wr_addr_4d [6]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_addr_4d_reg[7]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_addr_3d [7]),
    .q(\u2_wrrd/app_wr_addr_4d [7]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_addr_4d_reg[8]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_addr_3d [8]),
    .q(\u2_wrrd/app_wr_addr_4d [8]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_addr_4d_reg[9]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_addr_3d [9]),
    .q(\u2_wrrd/app_wr_addr_4d [9]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_2d_reg[0]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_1d [0]),
    .q(\u2_wrrd/app_wr_din_2d [0]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_2d_reg[10]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_1d [10]),
    .q(\u2_wrrd/app_wr_din_2d [10]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_2d_reg[11]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_1d [11]),
    .q(\u2_wrrd/app_wr_din_2d [11]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_2d_reg[12]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_1d [12]),
    .q(\u2_wrrd/app_wr_din_2d [12]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_2d_reg[13]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_1d [13]),
    .q(\u2_wrrd/app_wr_din_2d [13]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_2d_reg[14]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_1d [14]),
    .q(\u2_wrrd/app_wr_din_2d [14]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_2d_reg[15]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_1d [15]),
    .q(\u2_wrrd/app_wr_din_2d [15]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_2d_reg[16]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_1d [16]),
    .q(\u2_wrrd/app_wr_din_2d [16]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_2d_reg[17]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_1d [17]),
    .q(\u2_wrrd/app_wr_din_2d [17]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_2d_reg[18]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_1d [18]),
    .q(\u2_wrrd/app_wr_din_2d [18]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_2d_reg[19]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_1d [19]),
    .q(\u2_wrrd/app_wr_din_2d [19]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_2d_reg[1]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_1d [1]),
    .q(\u2_wrrd/app_wr_din_2d [1]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_2d_reg[20]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_1d [20]),
    .q(\u2_wrrd/app_wr_din_2d [20]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_2d_reg[21]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_1d [21]),
    .q(\u2_wrrd/app_wr_din_2d [21]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_2d_reg[22]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_1d [22]),
    .q(\u2_wrrd/app_wr_din_2d [22]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_2d_reg[23]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_1d [23]),
    .q(\u2_wrrd/app_wr_din_2d [23]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_2d_reg[24]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_1d [24]),
    .q(\u2_wrrd/app_wr_din_2d [24]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_2d_reg[25]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_1d [25]),
    .q(\u2_wrrd/app_wr_din_2d [25]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_2d_reg[26]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_1d [26]),
    .q(\u2_wrrd/app_wr_din_2d [26]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_2d_reg[27]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_1d [27]),
    .q(\u2_wrrd/app_wr_din_2d [27]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_2d_reg[28]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_1d [28]),
    .q(\u2_wrrd/app_wr_din_2d [28]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_2d_reg[29]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_1d [29]),
    .q(\u2_wrrd/app_wr_din_2d [29]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_2d_reg[2]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_1d [2]),
    .q(\u2_wrrd/app_wr_din_2d [2]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_2d_reg[30]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_1d [30]),
    .q(\u2_wrrd/app_wr_din_2d [30]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_2d_reg[31]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_1d [31]),
    .q(\u2_wrrd/app_wr_din_2d [31]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_2d_reg[3]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_1d [3]),
    .q(\u2_wrrd/app_wr_din_2d [3]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_2d_reg[4]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_1d [4]),
    .q(\u2_wrrd/app_wr_din_2d [4]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_2d_reg[5]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_1d [5]),
    .q(\u2_wrrd/app_wr_din_2d [5]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_2d_reg[6]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_1d [6]),
    .q(\u2_wrrd/app_wr_din_2d [6]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_2d_reg[7]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_1d [7]),
    .q(\u2_wrrd/app_wr_din_2d [7]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_2d_reg[8]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_1d [8]),
    .q(\u2_wrrd/app_wr_din_2d [8]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_2d_reg[9]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_1d [9]),
    .q(\u2_wrrd/app_wr_din_2d [9]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_3d_reg[0]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_2d [0]),
    .q(\u2_wrrd/app_wr_din_3d [0]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_3d_reg[10]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_2d [10]),
    .q(\u2_wrrd/app_wr_din_3d [10]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_3d_reg[11]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_2d [11]),
    .q(\u2_wrrd/app_wr_din_3d [11]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_3d_reg[12]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_2d [12]),
    .q(\u2_wrrd/app_wr_din_3d [12]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_3d_reg[13]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_2d [13]),
    .q(\u2_wrrd/app_wr_din_3d [13]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_3d_reg[14]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_2d [14]),
    .q(\u2_wrrd/app_wr_din_3d [14]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_3d_reg[15]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_2d [15]),
    .q(\u2_wrrd/app_wr_din_3d [15]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_3d_reg[16]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_2d [16]),
    .q(\u2_wrrd/app_wr_din_3d [16]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_3d_reg[17]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_2d [17]),
    .q(\u2_wrrd/app_wr_din_3d [17]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_3d_reg[18]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_2d [18]),
    .q(\u2_wrrd/app_wr_din_3d [18]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_3d_reg[19]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_2d [19]),
    .q(\u2_wrrd/app_wr_din_3d [19]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_3d_reg[1]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_2d [1]),
    .q(\u2_wrrd/app_wr_din_3d [1]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_3d_reg[20]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_2d [20]),
    .q(\u2_wrrd/app_wr_din_3d [20]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_3d_reg[21]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_2d [21]),
    .q(\u2_wrrd/app_wr_din_3d [21]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_3d_reg[22]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_2d [22]),
    .q(\u2_wrrd/app_wr_din_3d [22]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_3d_reg[23]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_2d [23]),
    .q(\u2_wrrd/app_wr_din_3d [23]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_3d_reg[24]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_2d [24]),
    .q(\u2_wrrd/app_wr_din_3d [24]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_3d_reg[25]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_2d [25]),
    .q(\u2_wrrd/app_wr_din_3d [25]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_3d_reg[26]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_2d [26]),
    .q(\u2_wrrd/app_wr_din_3d [26]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_3d_reg[27]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_2d [27]),
    .q(\u2_wrrd/app_wr_din_3d [27]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_3d_reg[28]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_2d [28]),
    .q(\u2_wrrd/app_wr_din_3d [28]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_3d_reg[29]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_2d [29]),
    .q(\u2_wrrd/app_wr_din_3d [29]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_3d_reg[2]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_2d [2]),
    .q(\u2_wrrd/app_wr_din_3d [2]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_3d_reg[30]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_2d [30]),
    .q(\u2_wrrd/app_wr_din_3d [30]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_3d_reg[31]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_2d [31]),
    .q(\u2_wrrd/app_wr_din_3d [31]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_3d_reg[3]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_2d [3]),
    .q(\u2_wrrd/app_wr_din_3d [3]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_3d_reg[4]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_2d [4]),
    .q(\u2_wrrd/app_wr_din_3d [4]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_3d_reg[5]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_2d [5]),
    .q(\u2_wrrd/app_wr_din_3d [5]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_3d_reg[6]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_2d [6]),
    .q(\u2_wrrd/app_wr_din_3d [6]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_3d_reg[7]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_2d [7]),
    .q(\u2_wrrd/app_wr_din_3d [7]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_3d_reg[8]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_2d [8]),
    .q(\u2_wrrd/app_wr_din_3d [8]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_3d_reg[9]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_2d [9]),
    .q(\u2_wrrd/app_wr_din_3d [9]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_4d_reg[0]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_3d [0]),
    .q(\u2_wrrd/app_wr_din_4d [0]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_4d_reg[10]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_3d [10]),
    .q(\u2_wrrd/app_wr_din_4d [10]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_4d_reg[11]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_3d [11]),
    .q(\u2_wrrd/app_wr_din_4d [11]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_4d_reg[12]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_3d [12]),
    .q(\u2_wrrd/app_wr_din_4d [12]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_4d_reg[13]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_3d [13]),
    .q(\u2_wrrd/app_wr_din_4d [13]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_4d_reg[14]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_3d [14]),
    .q(\u2_wrrd/app_wr_din_4d [14]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_4d_reg[15]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_3d [15]),
    .q(\u2_wrrd/app_wr_din_4d [15]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_4d_reg[16]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_3d [16]),
    .q(\u2_wrrd/app_wr_din_4d [16]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_4d_reg[17]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_3d [17]),
    .q(\u2_wrrd/app_wr_din_4d [17]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_4d_reg[18]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_3d [18]),
    .q(\u2_wrrd/app_wr_din_4d [18]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_4d_reg[19]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_3d [19]),
    .q(\u2_wrrd/app_wr_din_4d [19]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_4d_reg[1]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_3d [1]),
    .q(\u2_wrrd/app_wr_din_4d [1]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_4d_reg[20]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_3d [20]),
    .q(\u2_wrrd/app_wr_din_4d [20]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_4d_reg[21]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_3d [21]),
    .q(\u2_wrrd/app_wr_din_4d [21]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_4d_reg[22]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_3d [22]),
    .q(\u2_wrrd/app_wr_din_4d [22]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_4d_reg[23]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_3d [23]),
    .q(\u2_wrrd/app_wr_din_4d [23]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_4d_reg[24]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_3d [24]),
    .q(\u2_wrrd/app_wr_din_4d [24]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_4d_reg[25]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_3d [25]),
    .q(\u2_wrrd/app_wr_din_4d [25]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_4d_reg[26]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_3d [26]),
    .q(\u2_wrrd/app_wr_din_4d [26]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_4d_reg[27]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_3d [27]),
    .q(\u2_wrrd/app_wr_din_4d [27]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_4d_reg[28]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_3d [28]),
    .q(\u2_wrrd/app_wr_din_4d [28]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_4d_reg[29]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_3d [29]),
    .q(\u2_wrrd/app_wr_din_4d [29]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_4d_reg[2]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_3d [2]),
    .q(\u2_wrrd/app_wr_din_4d [2]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_4d_reg[30]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_3d [30]),
    .q(\u2_wrrd/app_wr_din_4d [30]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_4d_reg[31]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_3d [31]),
    .q(\u2_wrrd/app_wr_din_4d [31]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_4d_reg[3]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_3d [3]),
    .q(\u2_wrrd/app_wr_din_4d [3]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_4d_reg[4]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_3d [4]),
    .q(\u2_wrrd/app_wr_din_4d [4]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_4d_reg[5]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_3d [5]),
    .q(\u2_wrrd/app_wr_din_4d [5]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_4d_reg[6]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_3d [6]),
    .q(\u2_wrrd/app_wr_din_4d [6]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_4d_reg[7]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_3d [7]),
    .q(\u2_wrrd/app_wr_din_4d [7]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_4d_reg[8]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_3d [8]),
    .q(\u2_wrrd/app_wr_din_4d [8]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_4d_reg[9]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_3d [9]),
    .q(\u2_wrrd/app_wr_din_4d [9]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_5d_reg[0]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_4d [0]),
    .q(\u2_wrrd/app_wr_din_5d [0]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_5d_reg[10]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_4d [10]),
    .q(\u2_wrrd/app_wr_din_5d [10]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_5d_reg[11]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_4d [11]),
    .q(\u2_wrrd/app_wr_din_5d [11]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_5d_reg[12]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_4d [12]),
    .q(\u2_wrrd/app_wr_din_5d [12]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_5d_reg[13]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_4d [13]),
    .q(\u2_wrrd/app_wr_din_5d [13]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_5d_reg[14]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_4d [14]),
    .q(\u2_wrrd/app_wr_din_5d [14]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_5d_reg[15]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_4d [15]),
    .q(\u2_wrrd/app_wr_din_5d [15]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_5d_reg[16]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_4d [16]),
    .q(\u2_wrrd/app_wr_din_5d [16]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_5d_reg[17]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_4d [17]),
    .q(\u2_wrrd/app_wr_din_5d [17]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_5d_reg[18]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_4d [18]),
    .q(\u2_wrrd/app_wr_din_5d [18]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_5d_reg[19]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_4d [19]),
    .q(\u2_wrrd/app_wr_din_5d [19]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_5d_reg[1]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_4d [1]),
    .q(\u2_wrrd/app_wr_din_5d [1]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_5d_reg[20]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_4d [20]),
    .q(\u2_wrrd/app_wr_din_5d [20]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_5d_reg[21]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_4d [21]),
    .q(\u2_wrrd/app_wr_din_5d [21]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_5d_reg[22]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_4d [22]),
    .q(\u2_wrrd/app_wr_din_5d [22]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_5d_reg[23]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_4d [23]),
    .q(\u2_wrrd/app_wr_din_5d [23]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_5d_reg[24]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_4d [24]),
    .q(\u2_wrrd/app_wr_din_5d [24]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_5d_reg[25]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_4d [25]),
    .q(\u2_wrrd/app_wr_din_5d [25]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_5d_reg[26]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_4d [26]),
    .q(\u2_wrrd/app_wr_din_5d [26]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_5d_reg[27]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_4d [27]),
    .q(\u2_wrrd/app_wr_din_5d [27]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_5d_reg[28]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_4d [28]),
    .q(\u2_wrrd/app_wr_din_5d [28]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_5d_reg[29]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_4d [29]),
    .q(\u2_wrrd/app_wr_din_5d [29]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_5d_reg[2]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_4d [2]),
    .q(\u2_wrrd/app_wr_din_5d [2]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_5d_reg[30]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_4d [30]),
    .q(\u2_wrrd/app_wr_din_5d [30]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_5d_reg[31]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_4d [31]),
    .q(\u2_wrrd/app_wr_din_5d [31]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_5d_reg[3]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_4d [3]),
    .q(\u2_wrrd/app_wr_din_5d [3]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_5d_reg[4]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_4d [4]),
    .q(\u2_wrrd/app_wr_din_5d [4]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_5d_reg[5]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_4d [5]),
    .q(\u2_wrrd/app_wr_din_5d [5]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_5d_reg[6]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_4d [6]),
    .q(\u2_wrrd/app_wr_din_5d [6]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_5d_reg[7]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_4d [7]),
    .q(\u2_wrrd/app_wr_din_5d [7]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_5d_reg[8]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_4d [8]),
    .q(\u2_wrrd/app_wr_din_5d [8]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_5d_reg[9]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_4d [9]),
    .q(\u2_wrrd/app_wr_din_5d [9]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_6d_reg[0]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_5d [0]),
    .q(\u2_wrrd/app_wr_din_6d [0]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_6d_reg[10]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_5d [10]),
    .q(\u2_wrrd/app_wr_din_6d [10]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_6d_reg[11]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_5d [11]),
    .q(\u2_wrrd/app_wr_din_6d [11]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_6d_reg[12]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_5d [12]),
    .q(\u2_wrrd/app_wr_din_6d [12]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_6d_reg[13]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_5d [13]),
    .q(\u2_wrrd/app_wr_din_6d [13]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_6d_reg[14]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_5d [14]),
    .q(\u2_wrrd/app_wr_din_6d [14]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_6d_reg[15]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_5d [15]),
    .q(\u2_wrrd/app_wr_din_6d [15]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_6d_reg[16]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_5d [16]),
    .q(\u2_wrrd/app_wr_din_6d [16]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_6d_reg[17]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_5d [17]),
    .q(\u2_wrrd/app_wr_din_6d [17]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_6d_reg[18]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_5d [18]),
    .q(\u2_wrrd/app_wr_din_6d [18]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_6d_reg[19]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_5d [19]),
    .q(\u2_wrrd/app_wr_din_6d [19]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_6d_reg[1]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_5d [1]),
    .q(\u2_wrrd/app_wr_din_6d [1]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_6d_reg[20]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_5d [20]),
    .q(\u2_wrrd/app_wr_din_6d [20]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_6d_reg[21]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_5d [21]),
    .q(\u2_wrrd/app_wr_din_6d [21]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_6d_reg[22]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_5d [22]),
    .q(\u2_wrrd/app_wr_din_6d [22]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_6d_reg[23]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_5d [23]),
    .q(\u2_wrrd/app_wr_din_6d [23]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_6d_reg[24]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_5d [24]),
    .q(\u2_wrrd/app_wr_din_6d [24]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_6d_reg[25]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_5d [25]),
    .q(\u2_wrrd/app_wr_din_6d [25]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_6d_reg[26]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_5d [26]),
    .q(\u2_wrrd/app_wr_din_6d [26]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_6d_reg[27]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_5d [27]),
    .q(\u2_wrrd/app_wr_din_6d [27]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_6d_reg[28]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_5d [28]),
    .q(\u2_wrrd/app_wr_din_6d [28]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_6d_reg[29]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_5d [29]),
    .q(\u2_wrrd/app_wr_din_6d [29]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_6d_reg[2]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_5d [2]),
    .q(\u2_wrrd/app_wr_din_6d [2]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_6d_reg[30]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_5d [30]),
    .q(\u2_wrrd/app_wr_din_6d [30]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_6d_reg[31]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_5d [31]),
    .q(\u2_wrrd/app_wr_din_6d [31]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_6d_reg[3]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_5d [3]),
    .q(\u2_wrrd/app_wr_din_6d [3]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_6d_reg[4]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_5d [4]),
    .q(\u2_wrrd/app_wr_din_6d [4]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_6d_reg[5]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_5d [5]),
    .q(\u2_wrrd/app_wr_din_6d [5]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_6d_reg[6]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_5d [6]),
    .q(\u2_wrrd/app_wr_din_6d [6]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_6d_reg[7]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_5d [7]),
    .q(\u2_wrrd/app_wr_din_6d [7]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_6d_reg[8]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_5d [8]),
    .q(\u2_wrrd/app_wr_din_6d [8]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_din_6d_reg[9]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_din_5d [9]),
    .q(\u2_wrrd/app_wr_din_6d [9]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_dm_2d_reg[0]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_dm_1d [0]),
    .q(\u2_wrrd/app_wr_dm_2d [0]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_dm_2d_reg[1]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_dm_1d [1]),
    .q(\u2_wrrd/app_wr_dm_2d [1]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_dm_2d_reg[2]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_dm_1d [2]),
    .q(\u2_wrrd/app_wr_dm_2d [2]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_dm_2d_reg[3]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_dm_1d [3]),
    .q(\u2_wrrd/app_wr_dm_2d [3]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_dm_3d_reg[0]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_dm_2d [0]),
    .q(\u2_wrrd/app_wr_dm_3d [0]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_dm_3d_reg[1]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_dm_2d [1]),
    .q(\u2_wrrd/app_wr_dm_3d [1]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_dm_3d_reg[2]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_dm_2d [2]),
    .q(\u2_wrrd/app_wr_dm_3d [2]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_dm_3d_reg[3]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_dm_2d [3]),
    .q(\u2_wrrd/app_wr_dm_3d [3]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_dm_4d_reg[0]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_dm_3d [0]),
    .q(\u2_wrrd/app_wr_dm_4d [0]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_dm_4d_reg[1]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_dm_3d [1]),
    .q(\u2_wrrd/app_wr_dm_4d [1]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_dm_4d_reg[2]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_dm_3d [2]),
    .q(\u2_wrrd/app_wr_dm_4d [2]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_dm_4d_reg[3]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_dm_3d [3]),
    .q(\u2_wrrd/app_wr_dm_4d [3]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_dm_5d_reg[0]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_dm_4d [0]),
    .q(\u2_wrrd/app_wr_dm_5d [0]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_dm_5d_reg[1]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_dm_4d [1]),
    .q(\u2_wrrd/app_wr_dm_5d [1]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_dm_5d_reg[2]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_dm_4d [2]),
    .q(\u2_wrrd/app_wr_dm_5d [2]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_dm_5d_reg[3]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_dm_4d [3]),
    .q(\u2_wrrd/app_wr_dm_5d [3]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_dm_6d_reg[0]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_dm_5d [0]),
    .q(\u2_wrrd/app_wr_dm_6d [0]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_dm_6d_reg[1]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_dm_5d [1]),
    .q(\u2_wrrd/app_wr_dm_6d [1]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_dm_6d_reg[2]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_dm_5d [2]),
    .q(\u2_wrrd/app_wr_dm_6d [2]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/app_wr_dm_6d_reg[3]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_dm_5d [3]),
    .q(\u2_wrrd/app_wr_dm_6d [3]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u2_wrrd/app_wr_en_sft_reg[1]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_en_sft [0]),
    .sr(Rst_dup_177),
    .q(\u2_wrrd/app_wr_en_sft [1]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u2_wrrd/app_wr_en_sft_reg[2]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_en_sft [1]),
    .sr(Rst_dup_177),
    .q(\u2_wrrd/app_wr_en_sft [2]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u2_wrrd/app_wr_en_sft_reg[3]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_en_sft [2]),
    .sr(Rst_dup_177),
    .q(\u2_wrrd/app_wr_en_sft [3]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u2_wrrd/app_wr_en_sft_reg[4]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_en_sft [3]),
    .sr(Rst_dup_177),
    .q(\u2_wrrd/app_wr_en_sft [4]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u2_wrrd/app_wr_en_sft_reg[5]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_en_sft [4]),
    .sr(Rst_dup_177),
    .q(\u2_wrrd/app_wr_en_sft [5]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u2_wrrd/app_wr_en_sft_reg[6]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_en_sft [5]),
    .sr(Rst_dup_177),
    .q(\u2_wrrd/app_wr_en_sft [6]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u2_wrrd/app_wr_en_sft_reg[7]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/app_wr_en_sft [6]),
    .sr(Rst_dup_177),
    .q(\u2_wrrd/app_wr_en_sft [7]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/ba_reg[0]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/ba_reg[0]_syn_2 ),
    .q(\u2_wrrd/ba [0]));
  AL_MAP_LUT3 #(
    .EQN("(C*~(B)*~(A)+C*B*~(A)+~(C)*B*A+C*B*A)"),
    .INIT(8'hd8))
    \u2_wrrd/ba_reg[0]_syn_3  (
    .a(\u2_wrrd/active_en ),
    .b(\u2_wrrd/active_ba [0]),
    .c(\u2_wrrd/ba [0]),
    .o(\u2_wrrd/ba_reg[0]_syn_2 ));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/ba_reg[1]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/ba_reg[1]_syn_2 ),
    .q(\u2_wrrd/ba [1]));
  AL_MAP_LUT3 #(
    .EQN("(C*~(B)*~(A)+C*B*~(A)+~(C)*B*A+C*B*A)"),
    .INIT(8'hd8))
    \u2_wrrd/ba_reg[1]_syn_3  (
    .a(\u2_wrrd/active_en ),
    .b(\u2_wrrd/active_ba [1]),
    .c(\u2_wrrd/ba [1]),
    .o(\u2_wrrd/ba_reg[1]_syn_2 ));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/cas_reg  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/cas_reg_syn_3 ),
    .q(\u2_wrrd/cas ));
  AL_MAP_LUT4 #(
    .EQN("~(B*~A*(D@C))"),
    .INIT(16'hfbbf))
    \u2_wrrd/cas_reg_syn_4  (
    .a(\u2_wrrd/active_en ),
    .b(\u2_wrrd/col_en ),
    .c(\u2_wrrd/app_rd_en_sft [1]),
    .d(\u2_wrrd/app_wr_en_sft [1]),
    .o(\u2_wrrd/cas_reg_syn_3 ));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/cnt4_reg[0]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/cnt4_reg[0]_syn_2 ),
    .q(\u2_wrrd/cnt4 [0]));
  AL_MAP_LUT3 #(
    .EQN("(~C*~(~B*~A))"),
    .INIT(8'h0e))
    \u2_wrrd/cnt4_reg[0]_syn_3  (
    .a(\u2_wrrd/app_rd_en_sft [0]),
    .b(\u2_wrrd/app_wr_en_sft [0]),
    .c(Rst_dup_177),
    .o(\u2_wrrd/cnt4_reg[0]_syn_4 ));
  AL_MAP_LUT2 #(
    .EQN("(~B*A)"),
    .INIT(4'h2))
    \u2_wrrd/cnt4_reg[0]_syn_5  (
    .a(\u2_wrrd/cnt4_reg[0]_syn_4 ),
    .b(\u2_wrrd/cnt4 [0]),
    .o(\u2_wrrd/cnt4_reg[0]_syn_2 ));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/cnt4_reg[1]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/cnt4_reg[1]_syn_2 ),
    .q(\u2_wrrd/cnt4 [1]));
  AL_MAP_LUT3 #(
    .EQN("(A*(C@B))"),
    .INIT(8'h28))
    \u2_wrrd/cnt4_reg[1]_syn_3  (
    .a(\u2_wrrd/cnt4_reg[0]_syn_4 ),
    .b(\u2_wrrd/cnt4 [0]),
    .c(\u2_wrrd/cnt4 [1]),
    .o(\u2_wrrd/cnt4_reg[1]_syn_2 ));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/col_en_reg  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/col_en_reg_syn_3 ),
    .q(\u2_wrrd/col_en ));
  AL_MAP_LUT2 #(
    .EQN("(~B*A)"),
    .INIT(4'h2))
    \u2_wrrd/col_en_reg_syn_4  (
    .a(\u2_wrrd/mux1_syn_2 [7]),
    .b(Rst_dup_177),
    .o(\u2_wrrd/col_en_reg_syn_3 ));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/init_ref_vld_1d_reg  (
    .clk(Sdr_clk_dup_1),
    .d(Sdr_init_ref_vld_dup_1),
    .q(\u2_wrrd/init_ref_vld_1d ));
  AL_MAP_LUT4 #(
    .EQN("(D*C*~(~B*~A))"),
    .INIT(16'he000))
    \u2_wrrd/mux1_syn_71  (
    .a(\u2_wrrd/app_rd_en_sft [0]),
    .b(\u2_wrrd/app_wr_en_sft [0]),
    .c(\u2_wrrd/cnt4 [0]),
    .d(\u2_wrrd/cnt4 [1]),
    .o(\u2_wrrd/mux1_syn_2 [7]));
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~(~B*~A))"),
    .INIT(16'h000e))
    \u2_wrrd/mux21_syn_23  (
    .a(\u2_wrrd/app_rd_en_sft [0]),
    .b(\u2_wrrd/app_wr_en_sft [0]),
    .c(\u2_wrrd/cnt4 [0]),
    .d(\u2_wrrd/cnt4 [1]),
    .o(\u2_wrrd/mux21_syn_2 [0]));
  AL_MAP_LUT2 #(
    .EQN("~(~B*~A)"),
    .INIT(4'he))
    \u2_wrrd/mux4_syn_85  (
    .a(\u2_wrrd/active_en ),
    .b(\u2_wrrd/col_en ),
    .o(\u2_wrrd/mux4_syn_2 [10]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/ras_reg  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/active_en_syn_2 ),
    .q(\u2_wrrd/ras ));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/ref_ack_reg  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/ref_ack_reg_syn_3 ),
    .q(\u2_wrrd/ref_ack ));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    \u2_wrrd/ref_ack_reg_syn_4  (
    .a(\u2_wrrd/rw_vld ),
    .b(\u2_wrrd/Sdr_ref_req_syn_4 ),
    .o(\u2_wrrd/ref_ack_reg_syn_3 ));
  AL_MAP_LUT2 #(
    .EQN("~(~B*~A)"),
    .INIT(4'he))
    \u2_wrrd/ref_over_n_syn_1  (
    .a(\u1_init_ref/init_vld ),
    .b(\u1_init_ref/ref_vld ),
    .o(Sdr_init_ref_vld_dup_1));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    \u2_wrrd/ref_over_n_syn_2  (
    .a(Sdr_init_ref_vld_dup_1),
    .b(\u2_wrrd/init_ref_vld_1d ),
    .o(\u2_wrrd/ref_over_n ));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/ref_over_reg  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/ref_over_n ),
    .q(\u2_wrrd/ref_over ));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/ref_vld_reg  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/ref_vld_reg_syn_5 ),
    .q(\u2_wrrd/ref_vld ));
  AL_MAP_LUT3 #(
    .EQN("(~A*~(~C*~B))"),
    .INIT(8'h54))
    \u2_wrrd/ref_vld_reg_syn_6  (
    .a(\u2_wrrd/ref_over ),
    .b(\u2_wrrd/ref_vld ),
    .c(\u2_wrrd/Sdr_ref_req_syn_4 ),
    .o(\u2_wrrd/ref_vld_reg_syn_5 ));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/rw_vld_1d_reg  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/rw_vld ),
    .q(\u2_wrrd/rw_vld_1d ));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/rw_vld_reg  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/rw_vld_reg_syn_5 ),
    .q(\u2_wrrd/rw_vld ));
  AL_MAP_LUT4 #(
    .EQN("(~B*~A*~(D*~C))"),
    .INIT(16'h1011))
    \u2_wrrd/rw_vld_reg_syn_6  (
    .a(\u2_wrrd/rw_vld_n4 ),
    .b(Rst_dup_177),
    .c(\u2_wrrd/app_rd_en_sft [9]),
    .d(\u2_wrrd/app_rd_en_sft [10]),
    .o(\u2_wrrd/rw_vld_reg_syn_7 ));
  AL_MAP_LUT4 #(
    .EQN("(A*~(~D*~C*~B))"),
    .INIT(16'haaa8))
    \u2_wrrd/rw_vld_reg_syn_8  (
    .a(\u2_wrrd/rw_vld_reg_syn_7 ),
    .b(\u2_wrrd/app_rd_en_sft [0]),
    .c(\u2_wrrd/app_wr_en_sft [0]),
    .d(\u2_wrrd/rw_vld ),
    .o(\u2_wrrd/rw_vld_reg_syn_5 ));
  AL_MAP_LUT2 #(
    .EQN("(~B*A)"),
    .INIT(4'h2))
    \u2_wrrd/sdr_op_over_n_syn_1  (
    .a(\u2_wrrd/rw_vld_1d ),
    .b(\u2_wrrd/rw_vld ),
    .o(\u2_wrrd/sdr_op_over_n ));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/sdr_op_over_reg  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/sdr_op_over_n ),
    .q(\u2_wrrd/sdr_op_over ));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/sdr_t_reg  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/sdr_t_reg_syn_5 ),
    .q(\u2_wrrd/sdr_t ));
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    \u2_wrrd/sdr_t_reg_syn_6  (
    .a(\u2_wrrd/app_wr_en_sft [6]),
    .b(\u2_wrrd/app_wr_en_sft [7]),
    .o(\u2_wrrd/rw_vld_n4 ));
  AL_MAP_LUT5 #(
    .EQN("(~C*~(~(~E*B)*~(D*~A)))"),
    .INIT(32'h05000d0c))
    \u2_wrrd/sdr_t_reg_syn_7  (
    .a(\u2_wrrd/rw_vld_n4 ),
    .b(\u2_wrrd/app_wr_en_sft [0]),
    .c(Rst_dup_177),
    .d(\u2_wrrd/sdr_t ),
    .e(\u2_wrrd/app_wr_en_sft [1]),
    .o(\u2_wrrd/sdr_t_reg_syn_5 ));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    \u2_wrrd/sel2_syn_90  (
    .a(\u2_wrrd/ref_vld ),
    .b(\u2_wrrd/sdr_op_over ),
    .o(\u2_wrrd/mux9_syn_1 [2]));
  AL_MAP_LUT4 #(
    .EQN("~(~(D*~B)*~(C*A))"),
    .INIT(16'hb3a0))
    \u2_wrrd/sel2_syn_91  (
    .a(\u2_wrrd/rw_vld ),
    .b(\u2_wrrd/sdr_op_over ),
    .c(\u2_wrrd/state_reg_syn_1 [0]),
    .d(\u2_wrrd/state_reg_syn_1 [1]),
    .o(\u2_wrrd/sel2_syn_1 [1]));
  AL_MAP_LUT4 #(
    .EQN("(~(D*~B)*~(C*A))"),
    .INIT(16'h4c5f))
    \u2_wrrd/sel2_syn_92  (
    .a(\u2_wrrd/mux9_syn_1 [2]),
    .b(\u2_wrrd/ref_over ),
    .c(\u2_wrrd/state_reg_syn_1 [1]),
    .d(\u2_wrrd/state_reg_syn_1 [2]),
    .o(\u2_wrrd/sel2_syn_93 ));
  AL_MAP_LUT4 #(
    .EQN("~(A*~(D*~C*B))"),
    .INIT(16'h5d55))
    \u2_wrrd/sel2_syn_94  (
    .a(\u2_wrrd/sel2_syn_93 ),
    .b(\u2_wrrd/ref_vld ),
    .c(\u2_wrrd/rw_vld ),
    .d(\u2_wrrd/state_reg_syn_1 [0]),
    .o(\u2_wrrd/sel2_syn_1 [2]));
  AL_MAP_LUT4 #(
    .EQN("(~(A)*~(B)*~(C)*~(D)+A*~(B)*~(C)*~(D)+A*~(B)*~(C)*D+A*B*~(C)*D+A*B*C*D)"),
    .INIT(16'h8a03))
    \u2_wrrd/sel2_syn_95  (
    .a(\u2_wrrd/ref_over ),
    .b(\u2_wrrd/state_reg_syn_1 [0]),
    .c(\u2_wrrd/state_reg_syn_1 [1]),
    .d(\u2_wrrd/state_reg_syn_1 [2]),
    .o(\u2_wrrd/sel2_syn_96 ));
  AL_MAP_LUT5 #(
    .EQN("(D*~(~(C*~B)*~(E*A)))"),
    .INIT(32'hba003000))
    \u2_wrrd/sel2_syn_97  (
    .a(\u2_wrrd/ref_over ),
    .b(\u2_wrrd/ref_vld ),
    .c(\u2_wrrd/sdr_op_over ),
    .d(\u2_wrrd/state_reg_syn_1 [1]),
    .e(\u2_wrrd/state_reg_syn_1 [2]),
    .o(\u2_wrrd/sel2_syn_98 ));
  AL_MAP_LUT5 #(
    .EQN("~(~B*~A*~(E*~D*~C))"),
    .INIT(32'heeefeeee))
    \u2_wrrd/sel2_syn_99  (
    .a(\u2_wrrd/sel2_syn_98 ),
    .b(\u2_wrrd/sel2_syn_96 ),
    .c(\u2_wrrd/ref_vld ),
    .d(\u2_wrrd/rw_vld ),
    .e(\u2_wrrd/state_reg_syn_1 [0]),
    .o(\u2_wrrd/sel2_syn_1 [0]));
  AL_MAP_SEQ #(
    //.INIT(1'b1),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("SET"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u2_wrrd/state_reg[0]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/sel2_syn_1 [0]),
    .sr(Rst_dup_177),
    .q(\u2_wrrd/state_reg_syn_1 [0]));
  AL_MAP_SEQ #(
    //.INIT(1'b0),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u2_wrrd/state_reg[1]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/sel2_syn_1 [1]),
    .sr(Rst_dup_177),
    .q(\u2_wrrd/state_reg_syn_1 [1]));
  AL_MAP_SEQ #(
    //.INIT(1'b0),
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("SYNC"),
    .SRMUX("SR"))
    \u2_wrrd/state_reg[2]  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/sel2_syn_1 [2]),
    .sr(Rst_dup_177),
    .q(\u2_wrrd/state_reg_syn_1 [2]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/we_reg  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/we_reg_syn_3 ),
    .q(\u2_wrrd/we ));
  AL_MAP_LUT4 #(
    .EQN("~(D*~C*B*~A)"),
    .INIT(16'hfbff))
    \u2_wrrd/we_reg_syn_4  (
    .a(\u2_wrrd/active_en ),
    .b(\u2_wrrd/col_en ),
    .c(\u2_wrrd/app_rd_en_sft [1]),
    .d(\u2_wrrd/app_wr_en_sft [1]),
    .o(\u2_wrrd/we_reg_syn_3 ));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("0"))
    \u2_wrrd/wrrd_ref_ack_reg  (
    .clk(Sdr_clk_dup_1),
    .d(\u2_wrrd/mux9_syn_1 [2]),
    .q(\u2_wrrd/wrrd_ref_ack ));

endmodule 


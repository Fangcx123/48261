// Verilog netlist created by Tang Dynasty v6.2.168116
// Wed Oct 28 17:04:15 2026

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
/*encrypted wire*/
  wire [13:0] \u1_init_ref/init_cnt ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(45)
  wire [13:0] \u1_init_ref/init_cnt_b3 ;
/*encrypted wire*/
  wire [13:0] \u1_init_ref/mux4_syn_2 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(99)
  wire [17:0] \u1_init_ref/pwr_200ms_cnt ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(39)
  wire [17:0] \u1_init_ref/pwr_200ms_cnt_b1 ;
  wire [17:0] \u1_init_ref/pwr_200ms_cnt_b3 ;
  wire  \u1_init_ref/ref_vld_i1_syn_2 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(139)
  wire  \u1_init_ref/ref_vld_i_syn_2 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(124)
  wire [31:0] \u1_init_ref/sdr_init_cnt ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(43)
  wire [19:0] \u1_init_ref/sdr_ref_ack_sft ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(46)
/*encrypted wire*/
  wire [10:0] \u2_wrrd/SDR_ADDR_b ;
/*encrypted wire*/
/*encrypted wire*/
  wire [1:0] \u2_wrrd/active_ba_b1 ;
/*encrypted wire*/
  wire [7:0] \u2_wrrd/active_col_b1 ;
/*encrypted wire*/
/*encrypted wire*/
  wire [10:0] \u2_wrrd/active_row_b1 ;
/*encrypted wire*/
  wire [10:0] \u2_wrrd/addr_b ;
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
  wire [1:0] \u2_wrrd/cnt4_b3 ;
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
  wire \u1_init_ref/init_cnt[0]_syn_2 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(45)
  wire \u1_init_ref/pwr_200ms_cnt[0]_syn_2 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(39)
  wire \u1_init_ref/Sdr_init_ref_cas ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(32)
  wire \u1_init_ref/Sdr_init_ref_ras ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(31)
  wire \u1_init_ref/Sdr_init_ref_we ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(33)
  wire \u1_init_ref/Sdr_init_req_syn_8 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(20)
  wire \u1_init_ref/Sdr_ref_ack ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(27)
  wire \u1_init_ref/Sdr_ref_req ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(26)
  wire \u1_init_ref/Sdr_rw_vld ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(28)
  wire \u1_init_ref/ad_b1_n ;
  wire \u1_init_ref/ad_b1_n_syn_2 ;
  wire \u1_init_ref/ad_b1_n1 ;
  wire \u1_init_ref/ad_b3_n ;
  wire \u1_init_ref/ad_b3_n_syn_2 ;
  wire \u1_init_ref/ad_b3_n1 ;
  wire \u1_init_ref/cas_n3 ;
  wire \u1_init_ref/cas_n6 ;
  wire \u1_init_ref/cas_n6_syn_2 ;
  wire \u1_init_ref/cas_n7 ;
  wire \u1_init_ref/init_cnt_b1_n ;
  wire \u1_init_ref/init_cnt_b_n ;
  wire \u1_init_ref/init_cnt_b_n1 ;
  wire \u1_init_ref/init_done_n2 ;
  wire \u1_init_ref/init_vld ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(44)
  wire \u1_init_ref/init_vld_n2 ;
  wire \u1_init_ref/power_up_200ms_1d ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(40)
  wire \u1_init_ref/power_up_200ms_2d ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(40)
  wire \u1_init_ref/power_up_en ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(40)
  wire \u1_init_ref/power_up_en_n ;
  wire \u1_init_ref/power_up_en_n2 ;
  wire \u1_init_ref/ras_n ;
  wire \u1_init_ref/ref_req ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(47)
  wire \u1_init_ref/ref_req_n2 ;
  wire \u1_init_ref/ref_req_n3 ;
  wire \u1_init_ref/ref_req_n4 ;
  wire \u1_init_ref/ref_vld ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(47)
  wire \u1_init_ref/ref_vld_n3 ;
  wire \u1_init_ref/sdr_init_en ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(42)
  wire \u1_init_ref/we_n ;
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
  wire \u2_wrrd/SDR_ADDR_b_n ;
  wire \u2_wrrd/SDR_CAS_n ;
  wire \u2_wrrd/SDR_RAS_n ;
  wire \u2_wrrd/SDR_WE_n ;
  wire \u2_wrrd/Sdr_busy_n4 ;
  wire \u2_wrrd/Sdr_ref_ack_n ;
  wire \u2_wrrd/Sdr_ref_ack_n2 ;
  wire \u2_wrrd/Sdr_ref_ack_n3 ;
  wire \u2_wrrd/Sdr_ref_ack_n4 ;
  wire \u2_wrrd/Sdr_ref_ack_n5 ;
  wire \u2_wrrd/Sdr_rw_vld_n1 ;
  wire \u2_wrrd/active_ba_b1_n ;
  wire \u2_wrrd/active_ba_b1_n1 ;
  wire \u2_wrrd/active_ba_b1_n1_syn_2 ;
  wire \u2_wrrd/active_ba_b3_n ;
  wire \u2_wrrd/active_col_b1_n ;
  wire \u2_wrrd/active_col_b1_n1 ;
  wire \u2_wrrd/active_col_b1_n1_syn_2 ;
  wire \u2_wrrd/active_col_b3_n ;
/*encrypted wire*/
/*encrypted wire*/
  wire \u2_wrrd/active_en_n2 ;
  wire \u2_wrrd/active_en_n2_syn_2 ;
/*encrypted wire*/
  wire \u2_wrrd/cas_n3 ;
  wire \u2_wrrd/cas_n3_syn_2 ;
  wire \u2_wrrd/cas_n4 ;
  wire \u2_wrrd/cas_n5 ;
  wire \u2_wrrd/cas_n5_syn_2 ;
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
  wire \u2_wrrd/ref_over_n ;
  wire \u2_wrrd/ref_over_n2 ;
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
/*encrypted wire*/
  wire \u2_wrrd/rw_vld_n3 ;
  wire \u2_wrrd/rw_vld_n4 ;
  wire \u2_wrrd/rw_vld_n5 ;
  wire \u2_wrrd/rw_vld_n6 ;
  wire \u2_wrrd/rw_vld_n7 ;
/*encrypted wire*/
/*encrypted wire*/
  wire \u2_wrrd/sdr_op_over_n ;
/*encrypted wire*/
  wire \u2_wrrd/sdr_t_n3 ;
  wire \u2_wrrd/sdr_t_n5 ;
/*encrypted wire*/
/*encrypted wire*/

  buf SDRAM_CLK_syn_1 (SDRAM_CLK, Sdr_clk_sft);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(35)
  buf \Sdr_rd_dout[0]_syn_1  (Sdr_rd_dout[0], al_a3ce97b5);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  buf \Sdr_rd_dout[10]_syn_1  (Sdr_rd_dout[10], al_b179f20d);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  buf \Sdr_rd_dout[11]_syn_1  (Sdr_rd_dout[11], al_93c94b0e);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  buf \Sdr_rd_dout[12]_syn_1  (Sdr_rd_dout[12], al_e1065b42);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  buf \Sdr_rd_dout[13]_syn_1  (Sdr_rd_dout[13], al_623a118e);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  buf \Sdr_rd_dout[14]_syn_1  (Sdr_rd_dout[14], al_2e31ee58);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  buf \Sdr_rd_dout[15]_syn_1  (Sdr_rd_dout[15], al_6bd2aae1);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  buf \Sdr_rd_dout[16]_syn_1  (Sdr_rd_dout[16], al_db48cd45);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  buf \Sdr_rd_dout[17]_syn_1  (Sdr_rd_dout[17], al_1efa94b9);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  buf \Sdr_rd_dout[18]_syn_1  (Sdr_rd_dout[18], al_38476a9f);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  buf \Sdr_rd_dout[19]_syn_1  (Sdr_rd_dout[19], al_68ccc825);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  buf \Sdr_rd_dout[1]_syn_1  (Sdr_rd_dout[1], al_126aaacb);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  buf \Sdr_rd_dout[20]_syn_1  (Sdr_rd_dout[20], al_c335e201);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  buf \Sdr_rd_dout[21]_syn_1  (Sdr_rd_dout[21], al_7f8eb58a);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  buf \Sdr_rd_dout[22]_syn_1  (Sdr_rd_dout[22], al_a0dc0b87);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  buf \Sdr_rd_dout[23]_syn_1  (Sdr_rd_dout[23], al_f81b9e26);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  buf \Sdr_rd_dout[24]_syn_1  (Sdr_rd_dout[24], al_1a2e005f);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  buf \Sdr_rd_dout[25]_syn_1  (Sdr_rd_dout[25], al_489869a7);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  buf \Sdr_rd_dout[26]_syn_1  (Sdr_rd_dout[26], al_bf7682be);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  buf \Sdr_rd_dout[27]_syn_1  (Sdr_rd_dout[27], al_56a24bde);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  buf \Sdr_rd_dout[28]_syn_1  (Sdr_rd_dout[28], al_93e48bd1);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  buf \Sdr_rd_dout[29]_syn_1  (Sdr_rd_dout[29], al_eda38f06);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  buf \Sdr_rd_dout[2]_syn_1  (Sdr_rd_dout[2], al_44bfdd4c);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  buf \Sdr_rd_dout[30]_syn_1  (Sdr_rd_dout[30], al_1032c63f);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  buf \Sdr_rd_dout[31]_syn_1  (Sdr_rd_dout[31], al_2cda3bd5);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  buf \Sdr_rd_dout[3]_syn_1  (Sdr_rd_dout[3], al_bfa4fc3a);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  buf \Sdr_rd_dout[4]_syn_1  (Sdr_rd_dout[4], al_2590cc);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  buf \Sdr_rd_dout[5]_syn_1  (Sdr_rd_dout[5], al_13e5eddb);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  buf \Sdr_rd_dout[6]_syn_1  (Sdr_rd_dout[6], al_7fe4f02f);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  buf \Sdr_rd_dout[7]_syn_1  (Sdr_rd_dout[7], al_27254107);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  buf \Sdr_rd_dout[8]_syn_1  (Sdr_rd_dout[8], al_57b83b17);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  buf \Sdr_rd_dout[9]_syn_1  (Sdr_rd_dout[9], al_2a8a748a);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_as_ram.enc.v(32)
  or \u1_init_ref/Sdr_init_ref_vld_i1  (Sdr_init_ref_vld, \u1_init_ref/init_vld , \u1_init_ref/ref_vld );  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(92)
  or \u1_init_ref/Sdr_init_req_syn_7  (\u1_init_ref/Sdr_init_req_syn_8 , al_7554eedb, al_93ac74c0);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(20)
  or \u1_init_ref/Sdr_ref_req_i1  (\u1_init_ref/Sdr_ref_req , \u1_init_ref/ref_req , App_ref_req);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(146)
/*encrypted inst*/
/*encrypted inst*/
  not \u1_init_ref/ad_b1_n_syn_1  (\u1_init_ref/ad_b1_n_syn_2 , \u1_init_ref/ad_b1_n );
/*encrypted inst*/
/*encrypted inst*/
  not \u1_init_ref/ad_b3_n_syn_1  (\u1_init_ref/ad_b3_n_syn_2 , \u1_init_ref/ad_b3_n );
/*encrypted inst*/
/*encrypted inst*/
  add_pu14_pu14_o14 \u1_init_ref/add0  (
    .i0(\u1_init_ref/init_cnt ),
    .i1(14'b00000000000001),
    .o({\u1_init_ref/init_cnt_b3 [13:1],open_n0}));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(105)
  add_pu18_pu18_o18 \u1_init_ref/add1  (
    .i0(\u1_init_ref/pwr_200ms_cnt ),
    .i1(18'b000000000000000001),
    .o({\u1_init_ref/pwr_200ms_cnt_b3 [17:1],open_n1}));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(62)
/*encrypted inst*/
/*encrypted inst*/
  not \u1_init_ref/cas_i7  (\u1_init_ref/cas_n7 , \u1_init_ref/Sdr_rw_vld );  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(139)
/*encrypted inst*/
  not \u1_init_ref/cas_n6_syn_1  (\u1_init_ref/cas_n6_syn_2 , \u1_init_ref/cas_n6 );
/*encrypted inst*/
  eq_w14 \u1_init_ref/eq0  (
    .i0(\u1_init_ref/init_cnt ),
    .i1(14'b00010100010110),
    .o(\u1_init_ref/init_cnt_b1_n ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(102)
  eq_w14 \u1_init_ref/eq1  (
    .i0(\u1_init_ref/init_cnt ),
    .i1(14'b00010100001100),
    .o(\u1_init_ref/ref_req_n3 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(131)
  not \u1_init_ref/init_cnt[0]_syn_1  (\u1_init_ref/init_cnt[0]_syn_2 , \u1_init_ref/init_cnt [0]);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(45)
  or \u1_init_ref/init_cnt_b_i  (\u1_init_ref/init_cnt_b_n , Rst, \u1_init_ref/init_cnt_b_n1 );  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(99)
  not \u1_init_ref/init_cnt_b_i1  (\u1_init_ref/init_cnt_b_n1 , Sdr_init_done);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(99)
  AL_DFF_X \u1_init_ref/init_cnt_reg[0]  (
    .ar(1'b0),
    .as(1'b0),
    .clk(Sdr_clk),
    .d(\u1_init_ref/init_cnt[0]_syn_2 ),
    .en(1'b1),
    .sr(\u1_init_ref/mux4_syn_2 [13]),
    .ss(1'b0),
    .q(\u1_init_ref/init_cnt [0]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(97)
  AL_DFF_X \u1_init_ref/init_cnt_reg[10]  (
    .ar(1'b0),
    .as(1'b0),
    .clk(Sdr_clk),
    .d(\u1_init_ref/init_cnt_b3 [10]),
    .en(1'b1),
    .sr(\u1_init_ref/mux4_syn_2 [13]),
    .ss(1'b0),
    .q(\u1_init_ref/init_cnt [10]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(97)
  AL_DFF_X \u1_init_ref/init_cnt_reg[11]  (
    .ar(1'b0),
    .as(1'b0),
    .clk(Sdr_clk),
    .d(\u1_init_ref/init_cnt_b3 [11]),
    .en(1'b1),
    .sr(\u1_init_ref/mux4_syn_2 [13]),
    .ss(1'b0),
    .q(\u1_init_ref/init_cnt [11]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(97)
  AL_DFF_X \u1_init_ref/init_cnt_reg[12]  (
    .ar(1'b0),
    .as(1'b0),
    .clk(Sdr_clk),
    .d(\u1_init_ref/init_cnt_b3 [12]),
    .en(1'b1),
    .sr(\u1_init_ref/mux4_syn_2 [13]),
    .ss(1'b0),
    .q(\u1_init_ref/init_cnt [12]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(97)
  AL_DFF_X \u1_init_ref/init_cnt_reg[13]  (
    .ar(1'b0),
    .as(1'b0),
    .clk(Sdr_clk),
    .d(\u1_init_ref/init_cnt_b3 [13]),
    .en(1'b1),
    .sr(\u1_init_ref/mux4_syn_2 [13]),
    .ss(1'b0),
    .q(\u1_init_ref/init_cnt [13]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(97)
  AL_DFF_X \u1_init_ref/init_cnt_reg[1]  (
    .ar(1'b0),
    .as(1'b0),
    .clk(Sdr_clk),
    .d(\u1_init_ref/init_cnt_b3 [1]),
    .en(1'b1),
    .sr(\u1_init_ref/mux4_syn_2 [13]),
    .ss(1'b0),
    .q(\u1_init_ref/init_cnt [1]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(97)
  AL_DFF_X \u1_init_ref/init_cnt_reg[2]  (
    .ar(1'b0),
    .as(1'b0),
    .clk(Sdr_clk),
    .d(\u1_init_ref/init_cnt_b3 [2]),
    .en(1'b1),
    .sr(\u1_init_ref/mux4_syn_2 [13]),
    .ss(1'b0),
    .q(\u1_init_ref/init_cnt [2]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(97)
  AL_DFF_X \u1_init_ref/init_cnt_reg[3]  (
    .ar(1'b0),
    .as(1'b0),
    .clk(Sdr_clk),
    .d(\u1_init_ref/init_cnt_b3 [3]),
    .en(1'b1),
    .sr(\u1_init_ref/mux4_syn_2 [13]),
    .ss(1'b0),
    .q(\u1_init_ref/init_cnt [3]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(97)
  AL_DFF_X \u1_init_ref/init_cnt_reg[4]  (
    .ar(1'b0),
    .as(1'b0),
    .clk(Sdr_clk),
    .d(\u1_init_ref/init_cnt_b3 [4]),
    .en(1'b1),
    .sr(\u1_init_ref/mux4_syn_2 [13]),
    .ss(1'b0),
    .q(\u1_init_ref/init_cnt [4]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(97)
  AL_DFF_X \u1_init_ref/init_cnt_reg[5]  (
    .ar(1'b0),
    .as(1'b0),
    .clk(Sdr_clk),
    .d(\u1_init_ref/init_cnt_b3 [5]),
    .en(1'b1),
    .sr(\u1_init_ref/mux4_syn_2 [13]),
    .ss(1'b0),
    .q(\u1_init_ref/init_cnt [5]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(97)
  AL_DFF_X \u1_init_ref/init_cnt_reg[6]  (
    .ar(1'b0),
    .as(1'b0),
    .clk(Sdr_clk),
    .d(\u1_init_ref/init_cnt_b3 [6]),
    .en(1'b1),
    .sr(\u1_init_ref/mux4_syn_2 [13]),
    .ss(1'b0),
    .q(\u1_init_ref/init_cnt [6]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(97)
  AL_DFF_X \u1_init_ref/init_cnt_reg[7]  (
    .ar(1'b0),
    .as(1'b0),
    .clk(Sdr_clk),
    .d(\u1_init_ref/init_cnt_b3 [7]),
    .en(1'b1),
    .sr(\u1_init_ref/mux4_syn_2 [13]),
    .ss(1'b0),
    .q(\u1_init_ref/init_cnt [7]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(97)
  AL_DFF_X \u1_init_ref/init_cnt_reg[8]  (
    .ar(1'b0),
    .as(1'b0),
    .clk(Sdr_clk),
    .d(\u1_init_ref/init_cnt_b3 [8]),
    .en(1'b1),
    .sr(\u1_init_ref/mux4_syn_2 [13]),
    .ss(1'b0),
    .q(\u1_init_ref/init_cnt [8]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(97)
  AL_DFF_X \u1_init_ref/init_cnt_reg[9]  (
    .ar(1'b0),
    .as(1'b0),
    .clk(Sdr_clk),
    .d(\u1_init_ref/init_cnt_b3 [9]),
    .en(1'b1),
    .sr(\u1_init_ref/mux4_syn_2 [13]),
    .ss(1'b0),
    .q(\u1_init_ref/init_cnt [9]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(97)
  or \u1_init_ref/init_done_i2  (\u1_init_ref/init_done_n2 , \u1_init_ref/sdr_init_en , Rst);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(87)
  AL_DFF_X \u1_init_ref/init_done_reg  (
    .ar(1'b0),
    .as(1'b0),
    .clk(Sdr_clk),
    .d(1'b1),
    .en(\u1_init_ref/sdr_init_cnt [30]),
    .sr(\u1_init_ref/init_done_n2 ),
    .ss(1'b0),
    .q(Sdr_init_done));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(85)
  or \u1_init_ref/init_vld_i2  (\u1_init_ref/init_vld_n2 , \u1_init_ref/sdr_init_cnt [30], Rst);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(80)
  AL_DFF_X \u1_init_ref/init_vld_reg  (
    .ar(1'b0),
    .as(1'b0),
    .clk(Sdr_clk),
    .d(1'b1),
    .en(\u1_init_ref/sdr_init_cnt [0]),
    .sr(\u1_init_ref/init_vld_n2 ),
    .ss(1'b0),
    .q(\u1_init_ref/init_vld ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(78)
/*encrypted inst*/
  binary_mux_s1_w1 \u1_init_ref/mux4_syn_29  (
    .i0(\u1_init_ref/init_cnt_b1_n ),
    .i1(1'b1),
    .sel(\u1_init_ref/init_cnt_b_n ),
    .o(\u1_init_ref/mux4_syn_2 [13]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(99)
  binary_mux_s1_w1 \u1_init_ref/mux6_syn_36  (
    .i0(\u1_init_ref/pwr_200ms_cnt_b3 [17]),
    .i1(1'b1),
    .sel(\u1_init_ref/pwr_200ms_cnt [17]),
    .o(\u1_init_ref/pwr_200ms_cnt_b1 [17]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(59)
  AL_DFF_X \u1_init_ref/power_up_200ms_1d_reg  (
    .ar(1'b0),
    .as(1'b0),
    .clk(Sdr_clk),
    .d(\u1_init_ref/pwr_200ms_cnt [17]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(\u1_init_ref/power_up_200ms_1d ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(55)
  AL_DFF_X \u1_init_ref/power_up_200ms_2d_reg  (
    .ar(1'b0),
    .as(1'b0),
    .clk(Sdr_clk),
    .d(\u1_init_ref/power_up_200ms_1d ),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(\u1_init_ref/power_up_200ms_2d ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(55)
  and \u1_init_ref/power_up_en_i1  (\u1_init_ref/power_up_en_n , \u1_init_ref/power_up_200ms_1d , \u1_init_ref/power_up_en_n2 );  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(66)
  not \u1_init_ref/power_up_en_i2  (\u1_init_ref/power_up_en_n2 , \u1_init_ref/power_up_200ms_2d );  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(66)
  AL_DFF_X \u1_init_ref/power_up_en_reg  (
    .ar(1'b0),
    .as(1'b0),
    .clk(Sdr_clk),
    .d(\u1_init_ref/power_up_en_n ),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(\u1_init_ref/power_up_en ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(55)
  not \u1_init_ref/pwr_200ms_cnt[0]_syn_1  (\u1_init_ref/pwr_200ms_cnt[0]_syn_2 , \u1_init_ref/pwr_200ms_cnt [0]);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(39)
  AL_DFF_X \u1_init_ref/pwr_200ms_cnt_reg[0]  (
    .ar(1'b0),
    .as(1'b0),
    .clk(Sdr_clk),
    .d(\u1_init_ref/pwr_200ms_cnt[0]_syn_2 ),
    .en(~\u1_init_ref/pwr_200ms_cnt [17]),
    .sr(Rst),
    .ss(1'b0),
    .q(\u1_init_ref/pwr_200ms_cnt [0]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(55)
  AL_DFF_X \u1_init_ref/pwr_200ms_cnt_reg[10]  (
    .ar(1'b0),
    .as(1'b0),
    .clk(Sdr_clk),
    .d(\u1_init_ref/pwr_200ms_cnt_b3 [10]),
    .en(~\u1_init_ref/pwr_200ms_cnt [17]),
    .sr(Rst),
    .ss(1'b0),
    .q(\u1_init_ref/pwr_200ms_cnt [10]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(55)
  AL_DFF_X \u1_init_ref/pwr_200ms_cnt_reg[11]  (
    .ar(1'b0),
    .as(1'b0),
    .clk(Sdr_clk),
    .d(\u1_init_ref/pwr_200ms_cnt_b3 [11]),
    .en(~\u1_init_ref/pwr_200ms_cnt [17]),
    .sr(Rst),
    .ss(1'b0),
    .q(\u1_init_ref/pwr_200ms_cnt [11]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(55)
  AL_DFF_X \u1_init_ref/pwr_200ms_cnt_reg[12]  (
    .ar(1'b0),
    .as(1'b0),
    .clk(Sdr_clk),
    .d(\u1_init_ref/pwr_200ms_cnt_b3 [12]),
    .en(~\u1_init_ref/pwr_200ms_cnt [17]),
    .sr(Rst),
    .ss(1'b0),
    .q(\u1_init_ref/pwr_200ms_cnt [12]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(55)
  AL_DFF_X \u1_init_ref/pwr_200ms_cnt_reg[13]  (
    .ar(1'b0),
    .as(1'b0),
    .clk(Sdr_clk),
    .d(\u1_init_ref/pwr_200ms_cnt_b3 [13]),
    .en(~\u1_init_ref/pwr_200ms_cnt [17]),
    .sr(Rst),
    .ss(1'b0),
    .q(\u1_init_ref/pwr_200ms_cnt [13]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(55)
  AL_DFF_X \u1_init_ref/pwr_200ms_cnt_reg[14]  (
    .ar(1'b0),
    .as(1'b0),
    .clk(Sdr_clk),
    .d(\u1_init_ref/pwr_200ms_cnt_b3 [14]),
    .en(~\u1_init_ref/pwr_200ms_cnt [17]),
    .sr(Rst),
    .ss(1'b0),
    .q(\u1_init_ref/pwr_200ms_cnt [14]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(55)
  AL_DFF_X \u1_init_ref/pwr_200ms_cnt_reg[15]  (
    .ar(1'b0),
    .as(1'b0),
    .clk(Sdr_clk),
    .d(\u1_init_ref/pwr_200ms_cnt_b3 [15]),
    .en(~\u1_init_ref/pwr_200ms_cnt [17]),
    .sr(Rst),
    .ss(1'b0),
    .q(\u1_init_ref/pwr_200ms_cnt [15]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(55)
  AL_DFF_X \u1_init_ref/pwr_200ms_cnt_reg[16]  (
    .ar(1'b0),
    .as(1'b0),
    .clk(Sdr_clk),
    .d(\u1_init_ref/pwr_200ms_cnt_b3 [16]),
    .en(~\u1_init_ref/pwr_200ms_cnt [17]),
    .sr(Rst),
    .ss(1'b0),
    .q(\u1_init_ref/pwr_200ms_cnt [16]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(55)
  AL_DFF_X \u1_init_ref/pwr_200ms_cnt_reg[17]  (
    .ar(1'b0),
    .as(1'b0),
    .clk(Sdr_clk),
    .d(\u1_init_ref/pwr_200ms_cnt_b1 [17]),
    .en(1'b1),
    .sr(Rst),
    .ss(1'b0),
    .q(\u1_init_ref/pwr_200ms_cnt [17]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(55)
  AL_DFF_X \u1_init_ref/pwr_200ms_cnt_reg[1]  (
    .ar(1'b0),
    .as(1'b0),
    .clk(Sdr_clk),
    .d(\u1_init_ref/pwr_200ms_cnt_b3 [1]),
    .en(~\u1_init_ref/pwr_200ms_cnt [17]),
    .sr(Rst),
    .ss(1'b0),
    .q(\u1_init_ref/pwr_200ms_cnt [1]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(55)
  AL_DFF_X \u1_init_ref/pwr_200ms_cnt_reg[2]  (
    .ar(1'b0),
    .as(1'b0),
    .clk(Sdr_clk),
    .d(\u1_init_ref/pwr_200ms_cnt_b3 [2]),
    .en(~\u1_init_ref/pwr_200ms_cnt [17]),
    .sr(Rst),
    .ss(1'b0),
    .q(\u1_init_ref/pwr_200ms_cnt [2]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(55)
  AL_DFF_X \u1_init_ref/pwr_200ms_cnt_reg[3]  (
    .ar(1'b0),
    .as(1'b0),
    .clk(Sdr_clk),
    .d(\u1_init_ref/pwr_200ms_cnt_b3 [3]),
    .en(~\u1_init_ref/pwr_200ms_cnt [17]),
    .sr(Rst),
    .ss(1'b0),
    .q(\u1_init_ref/pwr_200ms_cnt [3]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(55)
  AL_DFF_X \u1_init_ref/pwr_200ms_cnt_reg[4]  (
    .ar(1'b0),
    .as(1'b0),
    .clk(Sdr_clk),
    .d(\u1_init_ref/pwr_200ms_cnt_b3 [4]),
    .en(~\u1_init_ref/pwr_200ms_cnt [17]),
    .sr(Rst),
    .ss(1'b0),
    .q(\u1_init_ref/pwr_200ms_cnt [4]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(55)
  AL_DFF_X \u1_init_ref/pwr_200ms_cnt_reg[5]  (
    .ar(1'b0),
    .as(1'b0),
    .clk(Sdr_clk),
    .d(\u1_init_ref/pwr_200ms_cnt_b3 [5]),
    .en(~\u1_init_ref/pwr_200ms_cnt [17]),
    .sr(Rst),
    .ss(1'b0),
    .q(\u1_init_ref/pwr_200ms_cnt [5]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(55)
  AL_DFF_X \u1_init_ref/pwr_200ms_cnt_reg[6]  (
    .ar(1'b0),
    .as(1'b0),
    .clk(Sdr_clk),
    .d(\u1_init_ref/pwr_200ms_cnt_b3 [6]),
    .en(~\u1_init_ref/pwr_200ms_cnt [17]),
    .sr(Rst),
    .ss(1'b0),
    .q(\u1_init_ref/pwr_200ms_cnt [6]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(55)
  AL_DFF_X \u1_init_ref/pwr_200ms_cnt_reg[7]  (
    .ar(1'b0),
    .as(1'b0),
    .clk(Sdr_clk),
    .d(\u1_init_ref/pwr_200ms_cnt_b3 [7]),
    .en(~\u1_init_ref/pwr_200ms_cnt [17]),
    .sr(Rst),
    .ss(1'b0),
    .q(\u1_init_ref/pwr_200ms_cnt [7]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(55)
  AL_DFF_X \u1_init_ref/pwr_200ms_cnt_reg[8]  (
    .ar(1'b0),
    .as(1'b0),
    .clk(Sdr_clk),
    .d(\u1_init_ref/pwr_200ms_cnt_b3 [8]),
    .en(~\u1_init_ref/pwr_200ms_cnt [17]),
    .sr(Rst),
    .ss(1'b0),
    .q(\u1_init_ref/pwr_200ms_cnt [8]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(55)
  AL_DFF_X \u1_init_ref/pwr_200ms_cnt_reg[9]  (
    .ar(1'b0),
    .as(1'b0),
    .clk(Sdr_clk),
    .d(\u1_init_ref/pwr_200ms_cnt_b3 [9]),
    .en(~\u1_init_ref/pwr_200ms_cnt [17]),
    .sr(Rst),
    .ss(1'b0),
    .q(\u1_init_ref/pwr_200ms_cnt [9]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(55)
/*encrypted inst*/
/*encrypted inst*/
  and \u1_init_ref/ref_req_i2  (\u1_init_ref/ref_req_n2 , \u1_init_ref/ref_req_n3 , \u1_init_ref/ref_req_n4 );  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(131)
  not \u1_init_ref/ref_req_i3  (\u1_init_ref/ref_req_n4 , \u1_init_ref/Sdr_ref_ack );  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(131)
  AL_DFF_X \u1_init_ref/ref_req_reg  (
    .ar(1'b0),
    .as(1'b0),
    .clk(Sdr_clk),
    .d(\u1_init_ref/ref_req_n2 ),
    .en(1'b1),
    .sr(Rst),
    .ss(1'b0),
    .q(\u1_init_ref/ref_req ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(122)
  binary_mux_s1_w1 \u1_init_ref/ref_vld_i1_syn_1  (
    .i0(\u1_init_ref/sdr_ref_ack_sft [19]),
    .i1(1'b0),
    .sel(\u1_init_ref/ref_vld_n3 ),
    .o(\u1_init_ref/ref_vld_i1_syn_2 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(139)
  and \u1_init_ref/ref_vld_i3  (\u1_init_ref/ref_vld_n3 , \u1_init_ref/Sdr_ref_ack , \u1_init_ref/cas_n7 );  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(139)
  binary_mux_s1_w1 \u1_init_ref/ref_vld_i_syn_1  (
    .i0(\u1_init_ref/ref_vld_i1_syn_2 ),
    .i1(1'b1),
    .sel(Rst),
    .o(\u1_init_ref/ref_vld_i_syn_2 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(124)
  AL_DFF_X \u1_init_ref/ref_vld_reg  (
    .ar(1'b0),
    .as(1'b0),
    .clk(Sdr_clk),
    .d(1'b1),
    .en(\u1_init_ref/ref_vld_n3 ),
    .sr(\u1_init_ref/ref_vld_i_syn_2 ),
    .ss(1'b0),
    .q(\u1_init_ref/ref_vld ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(122)
  AL_DFF_X #(
    .INIT(1'b0))
    \u1_init_ref/sdr_init_cnt_reg[0]  (
    .ar(1'b0),
    .as(1'b0),
    .clk(Sdr_clk),
    .d(\u1_init_ref/sdr_init_en ),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(\u1_init_ref/sdr_init_cnt [0]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(72)
  AL_DFF_X #(
    .INIT(1'b0))
    \u1_init_ref/sdr_init_cnt_reg[10]  (
    .ar(1'b0),
    .as(1'b0),
    .clk(Sdr_clk),
    .d(\u1_init_ref/sdr_init_cnt [9]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(\u1_init_ref/sdr_init_cnt [10]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(72)
  AL_DFF_X #(
    .INIT(1'b0))
    \u1_init_ref/sdr_init_cnt_reg[11]  (
    .ar(1'b0),
    .as(1'b0),
    .clk(Sdr_clk),
    .d(\u1_init_ref/sdr_init_cnt [10]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(\u1_init_ref/sdr_init_cnt [11]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(72)
  AL_DFF_X #(
    .INIT(1'b0))
    \u1_init_ref/sdr_init_cnt_reg[12]  (
    .ar(1'b0),
    .as(1'b0),
    .clk(Sdr_clk),
    .d(\u1_init_ref/sdr_init_cnt [11]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(\u1_init_ref/sdr_init_cnt [12]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(72)
  AL_DFF_X #(
    .INIT(1'b0))
    \u1_init_ref/sdr_init_cnt_reg[13]  (
    .ar(1'b0),
    .as(1'b0),
    .clk(Sdr_clk),
    .d(\u1_init_ref/sdr_init_cnt [12]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(\u1_init_ref/sdr_init_cnt [13]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(72)
  AL_DFF_X #(
    .INIT(1'b0))
    \u1_init_ref/sdr_init_cnt_reg[14]  (
    .ar(1'b0),
    .as(1'b0),
    .clk(Sdr_clk),
    .d(\u1_init_ref/sdr_init_cnt [13]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(\u1_init_ref/sdr_init_cnt [14]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(72)
  AL_DFF_X #(
    .INIT(1'b0))
    \u1_init_ref/sdr_init_cnt_reg[15]  (
    .ar(1'b0),
    .as(1'b0),
    .clk(Sdr_clk),
    .d(\u1_init_ref/sdr_init_cnt [14]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(\u1_init_ref/sdr_init_cnt [15]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(72)
  AL_DFF_X #(
    .INIT(1'b0))
    \u1_init_ref/sdr_init_cnt_reg[16]  (
    .ar(1'b0),
    .as(1'b0),
    .clk(Sdr_clk),
    .d(\u1_init_ref/sdr_init_cnt [15]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(\u1_init_ref/sdr_init_cnt [16]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(72)
  AL_DFF_X #(
    .INIT(1'b0))
    \u1_init_ref/sdr_init_cnt_reg[17]  (
    .ar(1'b0),
    .as(1'b0),
    .clk(Sdr_clk),
    .d(\u1_init_ref/sdr_init_cnt [16]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(\u1_init_ref/sdr_init_cnt [17]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(72)
  AL_DFF_X #(
    .INIT(1'b0))
    \u1_init_ref/sdr_init_cnt_reg[18]  (
    .ar(1'b0),
    .as(1'b0),
    .clk(Sdr_clk),
    .d(\u1_init_ref/sdr_init_cnt [17]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(\u1_init_ref/sdr_init_cnt [18]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(72)
  AL_DFF_X #(
    .INIT(1'b0))
    \u1_init_ref/sdr_init_cnt_reg[19]  (
    .ar(1'b0),
    .as(1'b0),
    .clk(Sdr_clk),
    .d(\u1_init_ref/sdr_init_cnt [18]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(\u1_init_ref/sdr_init_cnt [19]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(72)
  AL_DFF_X #(
    .INIT(1'b0))
    \u1_init_ref/sdr_init_cnt_reg[1]  (
    .ar(1'b0),
    .as(1'b0),
    .clk(Sdr_clk),
    .d(\u1_init_ref/sdr_init_cnt [0]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(\u1_init_ref/sdr_init_cnt [1]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(72)
  AL_DFF_X #(
    .INIT(1'b0))
    \u1_init_ref/sdr_init_cnt_reg[20]  (
    .ar(1'b0),
    .as(1'b0),
    .clk(Sdr_clk),
    .d(\u1_init_ref/sdr_init_cnt [19]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(\u1_init_ref/sdr_init_cnt [20]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(72)
  AL_DFF_X #(
    .INIT(1'b0))
    \u1_init_ref/sdr_init_cnt_reg[21]  (
    .ar(1'b0),
    .as(1'b0),
    .clk(Sdr_clk),
    .d(\u1_init_ref/sdr_init_cnt [20]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(\u1_init_ref/sdr_init_cnt [21]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(72)
  AL_DFF_X #(
    .INIT(1'b0))
    \u1_init_ref/sdr_init_cnt_reg[22]  (
    .ar(1'b0),
    .as(1'b0),
    .clk(Sdr_clk),
    .d(\u1_init_ref/sdr_init_cnt [21]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(\u1_init_ref/sdr_init_cnt [22]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(72)
  AL_DFF_X #(
    .INIT(1'b0))
    \u1_init_ref/sdr_init_cnt_reg[23]  (
    .ar(1'b0),
    .as(1'b0),
    .clk(Sdr_clk),
    .d(\u1_init_ref/sdr_init_cnt [22]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(\u1_init_ref/sdr_init_cnt [23]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(72)
  AL_DFF_X #(
    .INIT(1'b0))
    \u1_init_ref/sdr_init_cnt_reg[24]  (
    .ar(1'b0),
    .as(1'b0),
    .clk(Sdr_clk),
    .d(\u1_init_ref/sdr_init_cnt [23]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(\u1_init_ref/sdr_init_cnt [24]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(72)
  AL_DFF_X #(
    .INIT(1'b0))
    \u1_init_ref/sdr_init_cnt_reg[25]  (
    .ar(1'b0),
    .as(1'b0),
    .clk(Sdr_clk),
    .d(\u1_init_ref/sdr_init_cnt [24]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(\u1_init_ref/sdr_init_cnt [25]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(72)
  AL_DFF_X #(
    .INIT(1'b0))
    \u1_init_ref/sdr_init_cnt_reg[26]  (
    .ar(1'b0),
    .as(1'b0),
    .clk(Sdr_clk),
    .d(\u1_init_ref/sdr_init_cnt [25]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(\u1_init_ref/sdr_init_cnt [26]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(72)
  AL_DFF_X #(
    .INIT(1'b0))
    \u1_init_ref/sdr_init_cnt_reg[27]  (
    .ar(1'b0),
    .as(1'b0),
    .clk(Sdr_clk),
    .d(\u1_init_ref/sdr_init_cnt [26]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(\u1_init_ref/sdr_init_cnt [27]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(72)
  AL_DFF_X #(
    .INIT(1'b0))
    \u1_init_ref/sdr_init_cnt_reg[28]  (
    .ar(1'b0),
    .as(1'b0),
    .clk(Sdr_clk),
    .d(\u1_init_ref/sdr_init_cnt [27]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(\u1_init_ref/sdr_init_cnt [28]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(72)
  AL_DFF_X #(
    .INIT(1'b0))
    \u1_init_ref/sdr_init_cnt_reg[29]  (
    .ar(1'b0),
    .as(1'b0),
    .clk(Sdr_clk),
    .d(\u1_init_ref/sdr_init_cnt [28]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(\u1_init_ref/sdr_init_cnt [29]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(72)
  AL_DFF_X #(
    .INIT(1'b0))
    \u1_init_ref/sdr_init_cnt_reg[2]  (
    .ar(1'b0),
    .as(1'b0),
    .clk(Sdr_clk),
    .d(\u1_init_ref/sdr_init_cnt [1]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(\u1_init_ref/sdr_init_cnt [2]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(72)
  AL_DFF_X #(
    .INIT(1'b0))
    \u1_init_ref/sdr_init_cnt_reg[30]  (
    .ar(1'b0),
    .as(1'b0),
    .clk(Sdr_clk),
    .d(\u1_init_ref/sdr_init_cnt [29]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(\u1_init_ref/sdr_init_cnt [30]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(72)
  AL_DFF_X #(
    .INIT(1'b0))
    \u1_init_ref/sdr_init_cnt_reg[3]  (
    .ar(1'b0),
    .as(1'b0),
    .clk(Sdr_clk),
    .d(\u1_init_ref/sdr_init_cnt [2]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(\u1_init_ref/sdr_init_cnt [3]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(72)
  AL_DFF_X #(
    .INIT(1'b0))
    \u1_init_ref/sdr_init_cnt_reg[4]  (
    .ar(1'b0),
    .as(1'b0),
    .clk(Sdr_clk),
    .d(\u1_init_ref/sdr_init_cnt [3]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(\u1_init_ref/sdr_init_cnt [4]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(72)
  AL_DFF_X #(
    .INIT(1'b0))
    \u1_init_ref/sdr_init_cnt_reg[5]  (
    .ar(1'b0),
    .as(1'b0),
    .clk(Sdr_clk),
    .d(\u1_init_ref/sdr_init_cnt [4]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(\u1_init_ref/sdr_init_cnt [5]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(72)
  AL_DFF_X #(
    .INIT(1'b0))
    \u1_init_ref/sdr_init_cnt_reg[6]  (
    .ar(1'b0),
    .as(1'b0),
    .clk(Sdr_clk),
    .d(\u1_init_ref/sdr_init_cnt [5]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(\u1_init_ref/sdr_init_cnt [6]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(72)
  AL_DFF_X #(
    .INIT(1'b0))
    \u1_init_ref/sdr_init_cnt_reg[7]  (
    .ar(1'b0),
    .as(1'b0),
    .clk(Sdr_clk),
    .d(\u1_init_ref/sdr_init_cnt [6]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(\u1_init_ref/sdr_init_cnt [7]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(72)
  AL_DFF_X #(
    .INIT(1'b0))
    \u1_init_ref/sdr_init_cnt_reg[8]  (
    .ar(1'b0),
    .as(1'b0),
    .clk(Sdr_clk),
    .d(\u1_init_ref/sdr_init_cnt [7]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(\u1_init_ref/sdr_init_cnt [8]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(72)
  AL_DFF_X #(
    .INIT(1'b0))
    \u1_init_ref/sdr_init_cnt_reg[9]  (
    .ar(1'b0),
    .as(1'b0),
    .clk(Sdr_clk),
    .d(\u1_init_ref/sdr_init_cnt [8]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(\u1_init_ref/sdr_init_cnt [9]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(72)
  AL_DFF_X \u1_init_ref/sdr_init_en_reg  (
    .ar(1'b0),
    .as(1'b0),
    .clk(Sdr_clk),
    .d(\u1_init_ref/power_up_en ),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(\u1_init_ref/sdr_init_en ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(55)
  AL_DFF_X \u1_init_ref/sdr_ref_ack_sft_reg[0]  (
    .ar(1'b0),
    .as(1'b0),
    .clk(Sdr_clk),
    .d(\u1_init_ref/Sdr_ref_ack ),
    .en(1'b1),
    .sr(Rst),
    .ss(1'b0),
    .q(\u1_init_ref/sdr_ref_ack_sft [0]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(109)
  AL_DFF_X \u1_init_ref/sdr_ref_ack_sft_reg[10]  (
    .ar(1'b0),
    .as(1'b0),
    .clk(Sdr_clk),
    .d(\u1_init_ref/sdr_ref_ack_sft [9]),
    .en(1'b1),
    .sr(Rst),
    .ss(1'b0),
    .q(\u1_init_ref/sdr_ref_ack_sft [10]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(109)
  AL_DFF_X \u1_init_ref/sdr_ref_ack_sft_reg[11]  (
    .ar(1'b0),
    .as(1'b0),
    .clk(Sdr_clk),
    .d(\u1_init_ref/sdr_ref_ack_sft [10]),
    .en(1'b1),
    .sr(Rst),
    .ss(1'b0),
    .q(\u1_init_ref/sdr_ref_ack_sft [11]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(109)
  AL_DFF_X \u1_init_ref/sdr_ref_ack_sft_reg[12]  (
    .ar(1'b0),
    .as(1'b0),
    .clk(Sdr_clk),
    .d(\u1_init_ref/sdr_ref_ack_sft [11]),
    .en(1'b1),
    .sr(Rst),
    .ss(1'b0),
    .q(\u1_init_ref/sdr_ref_ack_sft [12]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(109)
  AL_DFF_X \u1_init_ref/sdr_ref_ack_sft_reg[13]  (
    .ar(1'b0),
    .as(1'b0),
    .clk(Sdr_clk),
    .d(\u1_init_ref/sdr_ref_ack_sft [12]),
    .en(1'b1),
    .sr(Rst),
    .ss(1'b0),
    .q(\u1_init_ref/sdr_ref_ack_sft [13]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(109)
  AL_DFF_X \u1_init_ref/sdr_ref_ack_sft_reg[14]  (
    .ar(1'b0),
    .as(1'b0),
    .clk(Sdr_clk),
    .d(\u1_init_ref/sdr_ref_ack_sft [13]),
    .en(1'b1),
    .sr(Rst),
    .ss(1'b0),
    .q(\u1_init_ref/sdr_ref_ack_sft [14]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(109)
  AL_DFF_X \u1_init_ref/sdr_ref_ack_sft_reg[15]  (
    .ar(1'b0),
    .as(1'b0),
    .clk(Sdr_clk),
    .d(\u1_init_ref/sdr_ref_ack_sft [14]),
    .en(1'b1),
    .sr(Rst),
    .ss(1'b0),
    .q(\u1_init_ref/sdr_ref_ack_sft [15]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(109)
  AL_DFF_X \u1_init_ref/sdr_ref_ack_sft_reg[16]  (
    .ar(1'b0),
    .as(1'b0),
    .clk(Sdr_clk),
    .d(\u1_init_ref/sdr_ref_ack_sft [15]),
    .en(1'b1),
    .sr(Rst),
    .ss(1'b0),
    .q(\u1_init_ref/sdr_ref_ack_sft [16]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(109)
  AL_DFF_X \u1_init_ref/sdr_ref_ack_sft_reg[17]  (
    .ar(1'b0),
    .as(1'b0),
    .clk(Sdr_clk),
    .d(\u1_init_ref/sdr_ref_ack_sft [16]),
    .en(1'b1),
    .sr(Rst),
    .ss(1'b0),
    .q(\u1_init_ref/sdr_ref_ack_sft [17]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(109)
  AL_DFF_X \u1_init_ref/sdr_ref_ack_sft_reg[18]  (
    .ar(1'b0),
    .as(1'b0),
    .clk(Sdr_clk),
    .d(\u1_init_ref/sdr_ref_ack_sft [17]),
    .en(1'b1),
    .sr(Rst),
    .ss(1'b0),
    .q(\u1_init_ref/sdr_ref_ack_sft [18]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(109)
  AL_DFF_X \u1_init_ref/sdr_ref_ack_sft_reg[19]  (
    .ar(1'b0),
    .as(1'b0),
    .clk(Sdr_clk),
    .d(\u1_init_ref/sdr_ref_ack_sft [18]),
    .en(1'b1),
    .sr(Rst),
    .ss(1'b0),
    .q(\u1_init_ref/sdr_ref_ack_sft [19]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(109)
  AL_DFF_X \u1_init_ref/sdr_ref_ack_sft_reg[1]  (
    .ar(1'b0),
    .as(1'b0),
    .clk(Sdr_clk),
    .d(\u1_init_ref/sdr_ref_ack_sft [0]),
    .en(1'b1),
    .sr(Rst),
    .ss(1'b0),
    .q(\u1_init_ref/sdr_ref_ack_sft [1]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(109)
  AL_DFF_X \u1_init_ref/sdr_ref_ack_sft_reg[2]  (
    .ar(1'b0),
    .as(1'b0),
    .clk(Sdr_clk),
    .d(\u1_init_ref/sdr_ref_ack_sft [1]),
    .en(1'b1),
    .sr(Rst),
    .ss(1'b0),
    .q(\u1_init_ref/sdr_ref_ack_sft [2]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(109)
  AL_DFF_X \u1_init_ref/sdr_ref_ack_sft_reg[3]  (
    .ar(1'b0),
    .as(1'b0),
    .clk(Sdr_clk),
    .d(\u1_init_ref/sdr_ref_ack_sft [2]),
    .en(1'b1),
    .sr(Rst),
    .ss(1'b0),
    .q(\u1_init_ref/sdr_ref_ack_sft [3]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(109)
  AL_DFF_X \u1_init_ref/sdr_ref_ack_sft_reg[4]  (
    .ar(1'b0),
    .as(1'b0),
    .clk(Sdr_clk),
    .d(\u1_init_ref/sdr_ref_ack_sft [3]),
    .en(1'b1),
    .sr(Rst),
    .ss(1'b0),
    .q(\u1_init_ref/sdr_ref_ack_sft [4]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(109)
  AL_DFF_X \u1_init_ref/sdr_ref_ack_sft_reg[5]  (
    .ar(1'b0),
    .as(1'b0),
    .clk(Sdr_clk),
    .d(\u1_init_ref/sdr_ref_ack_sft [4]),
    .en(1'b1),
    .sr(Rst),
    .ss(1'b0),
    .q(\u1_init_ref/sdr_ref_ack_sft [5]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(109)
  AL_DFF_X \u1_init_ref/sdr_ref_ack_sft_reg[6]  (
    .ar(1'b0),
    .as(1'b0),
    .clk(Sdr_clk),
    .d(\u1_init_ref/sdr_ref_ack_sft [5]),
    .en(1'b1),
    .sr(Rst),
    .ss(1'b0),
    .q(\u1_init_ref/sdr_ref_ack_sft [6]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(109)
  AL_DFF_X \u1_init_ref/sdr_ref_ack_sft_reg[7]  (
    .ar(1'b0),
    .as(1'b0),
    .clk(Sdr_clk),
    .d(\u1_init_ref/sdr_ref_ack_sft [6]),
    .en(1'b1),
    .sr(Rst),
    .ss(1'b0),
    .q(\u1_init_ref/sdr_ref_ack_sft [7]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(109)
  AL_DFF_X \u1_init_ref/sdr_ref_ack_sft_reg[8]  (
    .ar(1'b0),
    .as(1'b0),
    .clk(Sdr_clk),
    .d(\u1_init_ref/sdr_ref_ack_sft [7]),
    .en(1'b1),
    .sr(Rst),
    .ss(1'b0),
    .q(\u1_init_ref/sdr_ref_ack_sft [8]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(109)
  AL_DFF_X \u1_init_ref/sdr_ref_ack_sft_reg[9]  (
    .ar(1'b0),
    .as(1'b0),
    .clk(Sdr_clk),
    .d(\u1_init_ref/sdr_ref_ack_sft [8]),
    .en(1'b1),
    .sr(Rst),
    .ss(1'b0),
    .q(\u1_init_ref/sdr_ref_ack_sft [9]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/include\sdr_init_ref.enc.v(109)
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
  not \u2_wrrd/active_ba_b1_n1_syn_1  (\u2_wrrd/active_ba_b1_n1_syn_2 , \u2_wrrd/active_ba_b1_n1 );
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
  not \u2_wrrd/active_col_b1_n1_syn_1  (\u2_wrrd/active_col_b1_n1_syn_2 , \u2_wrrd/active_col_b1_n1 );
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
  not \u2_wrrd/active_en_n2_syn_1  (\u2_wrrd/active_en_n2_syn_2 , \u2_wrrd/active_en_n2 );
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
  not \u2_wrrd/cas_n3_syn_1  (\u2_wrrd/cas_n3_syn_2 , \u2_wrrd/cas_n3 );
  not \u2_wrrd/cas_n5_syn_1  (\u2_wrrd/cas_n5_syn_2 , \u2_wrrd/cas_n5 );
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/
/*encrypted inst*/

endmodule 

module add_pu14_pu14_o14
  (
  i0,
  i1,
  o
  );

  input [13:0] i0;
  input [13:0] i1;
  output [13:0] o;

  wire net_a0;
  wire net_b0;
  wire net_sum0;
  wire net_cout0;
  wire net_a1;
  wire net_b1;
  wire net_sum1;
  wire net_cout1;
  wire net_a2;
  wire net_b2;
  wire net_sum2;
  wire net_cout2;
  wire net_a3;
  wire net_b3;
  wire net_sum3;
  wire net_cout3;
  wire net_a4;
  wire net_b4;
  wire net_sum4;
  wire net_cout4;
  wire net_a5;
  wire net_b5;
  wire net_sum5;
  wire net_cout5;
  wire net_a6;
  wire net_b6;
  wire net_sum6;
  wire net_cout6;
  wire net_a7;
  wire net_b7;
  wire net_sum7;
  wire net_cout7;
  wire net_a8;
  wire net_b8;
  wire net_sum8;
  wire net_cout8;
  wire net_a9;
  wire net_b9;
  wire net_sum9;
  wire net_cout9;
  wire net_a10;
  wire net_b10;
  wire net_sum10;
  wire net_cout10;
  wire net_a11;
  wire net_b11;
  wire net_sum11;
  wire net_cout11;
  wire net_a12;
  wire net_b12;
  wire net_sum12;
  wire net_cout12;
  wire net_a13;
  wire net_b13;
  wire net_sum13;
  wire net_cout13;

  assign net_a13 = i0[13];
  assign net_a12 = i0[12];
  assign net_a11 = i0[11];
  assign net_a10 = i0[10];
  assign net_a9 = i0[9];
  assign net_a8 = i0[8];
  assign net_a7 = i0[7];
  assign net_a6 = i0[6];
  assign net_a5 = i0[5];
  assign net_a4 = i0[4];
  assign net_a3 = i0[3];
  assign net_a2 = i0[2];
  assign net_a1 = i0[1];
  assign net_a0 = i0[0];
  assign net_b13 = i1[13];
  assign net_b12 = i1[12];
  assign net_b11 = i1[11];
  assign net_b10 = i1[10];
  assign net_b9 = i1[9];
  assign net_b8 = i1[8];
  assign net_b7 = i1[7];
  assign net_b6 = i1[6];
  assign net_b5 = i1[5];
  assign net_b4 = i1[4];
  assign net_b3 = i1[3];
  assign net_b2 = i1[2];
  assign net_b1 = i1[1];
  assign net_b0 = i1[0];
  assign o[13] = net_sum13;
  assign o[12] = net_sum12;
  assign o[11] = net_sum11;
  assign o[10] = net_sum10;
  assign o[9] = net_sum9;
  assign o[8] = net_sum8;
  assign o[7] = net_sum7;
  assign o[6] = net_sum6;
  assign o[5] = net_sum5;
  assign o[4] = net_sum4;
  assign o[3] = net_sum3;
  assign o[2] = net_sum2;
  assign o[1] = net_sum1;
  assign o[0] = net_sum0;
  AL_FADD al_152 (
    .a(net_a0),
    .b(net_b0),
    .c(1'b0),
    .cout(net_cout0),
    .sum(net_sum0));
  AL_FADD al_153 (
    .a(net_a1),
    .b(net_b1),
    .c(net_cout0),
    .cout(net_cout1),
    .sum(net_sum1));
  AL_FADD al_154 (
    .a(net_a2),
    .b(net_b2),
    .c(net_cout1),
    .cout(net_cout2),
    .sum(net_sum2));
  AL_FADD al_155 (
    .a(net_a3),
    .b(net_b3),
    .c(net_cout2),
    .cout(net_cout3),
    .sum(net_sum3));
  AL_FADD al_156 (
    .a(net_a4),
    .b(net_b4),
    .c(net_cout3),
    .cout(net_cout4),
    .sum(net_sum4));
  AL_FADD al_157 (
    .a(net_a5),
    .b(net_b5),
    .c(net_cout4),
    .cout(net_cout5),
    .sum(net_sum5));
  AL_FADD al_158 (
    .a(net_a6),
    .b(net_b6),
    .c(net_cout5),
    .cout(net_cout6),
    .sum(net_sum6));
  AL_FADD al_159 (
    .a(net_a7),
    .b(net_b7),
    .c(net_cout6),
    .cout(net_cout7),
    .sum(net_sum7));
  AL_FADD al_160 (
    .a(net_a8),
    .b(net_b8),
    .c(net_cout7),
    .cout(net_cout8),
    .sum(net_sum8));
  AL_FADD al_161 (
    .a(net_a9),
    .b(net_b9),
    .c(net_cout8),
    .cout(net_cout9),
    .sum(net_sum9));
  AL_FADD al_162 (
    .a(net_a10),
    .b(net_b10),
    .c(net_cout9),
    .cout(net_cout10),
    .sum(net_sum10));
  AL_FADD al_163 (
    .a(net_a11),
    .b(net_b11),
    .c(net_cout10),
    .cout(net_cout11),
    .sum(net_sum11));
  AL_FADD al_164 (
    .a(net_a12),
    .b(net_b12),
    .c(net_cout11),
    .cout(net_cout12),
    .sum(net_sum12));
  AL_FADD al_165 (
    .a(net_a13),
    .b(net_b13),
    .c(net_cout12),
    .cout(net_cout13),
    .sum(net_sum13));

endmodule 

module add_pu18_pu18_o18
  (
  i0,
  i1,
  o
  );

  input [17:0] i0;
  input [17:0] i1;
  output [17:0] o;

  wire net_a0;
  wire net_b0;
  wire net_sum0;
  wire net_cout0;
  wire net_a1;
  wire net_b1;
  wire net_sum1;
  wire net_cout1;
  wire net_a2;
  wire net_b2;
  wire net_sum2;
  wire net_cout2;
  wire net_a3;
  wire net_b3;
  wire net_sum3;
  wire net_cout3;
  wire net_a4;
  wire net_b4;
  wire net_sum4;
  wire net_cout4;
  wire net_a5;
  wire net_b5;
  wire net_sum5;
  wire net_cout5;
  wire net_a6;
  wire net_b6;
  wire net_sum6;
  wire net_cout6;
  wire net_a7;
  wire net_b7;
  wire net_sum7;
  wire net_cout7;
  wire net_a8;
  wire net_b8;
  wire net_sum8;
  wire net_cout8;
  wire net_a9;
  wire net_b9;
  wire net_sum9;
  wire net_cout9;
  wire net_a10;
  wire net_b10;
  wire net_sum10;
  wire net_cout10;
  wire net_a11;
  wire net_b11;
  wire net_sum11;
  wire net_cout11;
  wire net_a12;
  wire net_b12;
  wire net_sum12;
  wire net_cout12;
  wire net_a13;
  wire net_b13;
  wire net_sum13;
  wire net_cout13;
  wire net_a14;
  wire net_b14;
  wire net_sum14;
  wire net_cout14;
  wire net_a15;
  wire net_b15;
  wire net_sum15;
  wire net_cout15;
  wire net_a16;
  wire net_b16;
  wire net_sum16;
  wire net_cout16;
  wire net_a17;
  wire net_b17;
  wire net_sum17;
  wire net_cout17;

  assign net_a17 = i0[17];
  assign net_a16 = i0[16];
  assign net_a15 = i0[15];
  assign net_a14 = i0[14];
  assign net_a13 = i0[13];
  assign net_a12 = i0[12];
  assign net_a11 = i0[11];
  assign net_a10 = i0[10];
  assign net_a9 = i0[9];
  assign net_a8 = i0[8];
  assign net_a7 = i0[7];
  assign net_a6 = i0[6];
  assign net_a5 = i0[5];
  assign net_a4 = i0[4];
  assign net_a3 = i0[3];
  assign net_a2 = i0[2];
  assign net_a1 = i0[1];
  assign net_a0 = i0[0];
  assign net_b17 = i1[17];
  assign net_b16 = i1[16];
  assign net_b15 = i1[15];
  assign net_b14 = i1[14];
  assign net_b13 = i1[13];
  assign net_b12 = i1[12];
  assign net_b11 = i1[11];
  assign net_b10 = i1[10];
  assign net_b9 = i1[9];
  assign net_b8 = i1[8];
  assign net_b7 = i1[7];
  assign net_b6 = i1[6];
  assign net_b5 = i1[5];
  assign net_b4 = i1[4];
  assign net_b3 = i1[3];
  assign net_b2 = i1[2];
  assign net_b1 = i1[1];
  assign net_b0 = i1[0];
  assign o[17] = net_sum17;
  assign o[16] = net_sum16;
  assign o[15] = net_sum15;
  assign o[14] = net_sum14;
  assign o[13] = net_sum13;
  assign o[12] = net_sum12;
  assign o[11] = net_sum11;
  assign o[10] = net_sum10;
  assign o[9] = net_sum9;
  assign o[8] = net_sum8;
  assign o[7] = net_sum7;
  assign o[6] = net_sum6;
  assign o[5] = net_sum5;
  assign o[4] = net_sum4;
  assign o[3] = net_sum3;
  assign o[2] = net_sum2;
  assign o[1] = net_sum1;
  assign o[0] = net_sum0;
  AL_FADD al_166 (
    .a(net_a0),
    .b(net_b0),
    .c(1'b0),
    .cout(net_cout0),
    .sum(net_sum0));
  AL_FADD al_167 (
    .a(net_a1),
    .b(net_b1),
    .c(net_cout0),
    .cout(net_cout1),
    .sum(net_sum1));
  AL_FADD al_168 (
    .a(net_a2),
    .b(net_b2),
    .c(net_cout1),
    .cout(net_cout2),
    .sum(net_sum2));
  AL_FADD al_169 (
    .a(net_a3),
    .b(net_b3),
    .c(net_cout2),
    .cout(net_cout3),
    .sum(net_sum3));
  AL_FADD al_170 (
    .a(net_a4),
    .b(net_b4),
    .c(net_cout3),
    .cout(net_cout4),
    .sum(net_sum4));
  AL_FADD al_171 (
    .a(net_a5),
    .b(net_b5),
    .c(net_cout4),
    .cout(net_cout5),
    .sum(net_sum5));
  AL_FADD al_172 (
    .a(net_a6),
    .b(net_b6),
    .c(net_cout5),
    .cout(net_cout6),
    .sum(net_sum6));
  AL_FADD al_173 (
    .a(net_a7),
    .b(net_b7),
    .c(net_cout6),
    .cout(net_cout7),
    .sum(net_sum7));
  AL_FADD al_174 (
    .a(net_a8),
    .b(net_b8),
    .c(net_cout7),
    .cout(net_cout8),
    .sum(net_sum8));
  AL_FADD al_175 (
    .a(net_a9),
    .b(net_b9),
    .c(net_cout8),
    .cout(net_cout9),
    .sum(net_sum9));
  AL_FADD al_176 (
    .a(net_a10),
    .b(net_b10),
    .c(net_cout9),
    .cout(net_cout10),
    .sum(net_sum10));
  AL_FADD al_177 (
    .a(net_a11),
    .b(net_b11),
    .c(net_cout10),
    .cout(net_cout11),
    .sum(net_sum11));
  AL_FADD al_178 (
    .a(net_a12),
    .b(net_b12),
    .c(net_cout11),
    .cout(net_cout12),
    .sum(net_sum12));
  AL_FADD al_179 (
    .a(net_a13),
    .b(net_b13),
    .c(net_cout12),
    .cout(net_cout13),
    .sum(net_sum13));
  AL_FADD al_180 (
    .a(net_a14),
    .b(net_b14),
    .c(net_cout13),
    .cout(net_cout14),
    .sum(net_sum14));
  AL_FADD al_181 (
    .a(net_a15),
    .b(net_b15),
    .c(net_cout14),
    .cout(net_cout15),
    .sum(net_sum15));
  AL_FADD al_182 (
    .a(net_a16),
    .b(net_b16),
    .c(net_cout15),
    .cout(net_cout16),
    .sum(net_sum16));
  AL_FADD al_183 (
    .a(net_a17),
    .b(net_b17),
    .c(net_cout16),
    .cout(net_cout17),
    .sum(net_sum17));

endmodule 

module eq_w14
  (
  i0,
  i1,
  o
  );

  input [13:0] i0;
  input [13:0] i1;
  output o;

  wire i0_syn_15;
  wire i0_syn_17;
  wire i0_syn_19;
  wire i0_syn_21;
  wire i0_syn_23;
  wire i0_syn_25;
  wire i0_syn_27;
  wire i0_syn_29;
  wire i0_syn_31;
  wire i0_syn_33;
  wire i0_syn_35;
  wire i0_syn_37;
  wire i0_syn_39;
  wire i0_syn_41;
  wire i0_syn_43;
  wire i0_syn_45;
  wire i0_syn_47;
  wire i0_syn_49;
  wire i0_syn_51;
  wire i0_syn_53;
  wire i0_syn_55;
  wire i0_syn_57;
  wire i0_syn_59;
  wire i0_syn_61;
  wire i0_syn_63;
  wire i0_syn_65;
  wire i0_syn_67;

  not al_185 (o, i0_syn_67);
  xor i0_syn_14 (i0_syn_15, i0[0], i1[0]);
  xor i0_syn_16 (i0_syn_17, i0[1], i1[1]);
  xor i0_syn_18 (i0_syn_19, i0[2], i1[2]);
  xor i0_syn_20 (i0_syn_21, i0[3], i1[3]);
  xor i0_syn_22 (i0_syn_23, i0[4], i1[4]);
  xor i0_syn_24 (i0_syn_25, i0[5], i1[5]);
  xor i0_syn_26 (i0_syn_27, i0[6], i1[6]);
  xor i0_syn_28 (i0_syn_29, i0[7], i1[7]);
  xor i0_syn_30 (i0_syn_31, i0[8], i1[8]);
  xor i0_syn_32 (i0_syn_33, i0[9], i1[9]);
  xor i0_syn_34 (i0_syn_35, i0[10], i1[10]);
  xor i0_syn_36 (i0_syn_37, i0[11], i1[11]);
  xor i0_syn_38 (i0_syn_39, i0[12], i1[12]);
  xor i0_syn_40 (i0_syn_41, i0[13], i1[13]);
  or i0_syn_42 (i0_syn_43, i0_syn_17, i0_syn_19);
  or i0_syn_44 (i0_syn_45, i0_syn_15, i0_syn_43);
  or i0_syn_46 (i0_syn_47, i0_syn_21, i0_syn_23);
  or i0_syn_48 (i0_syn_49, i0_syn_25, i0_syn_27);
  or i0_syn_50 (i0_syn_51, i0_syn_47, i0_syn_49);
  or i0_syn_52 (i0_syn_53, i0_syn_45, i0_syn_51);
  or i0_syn_54 (i0_syn_55, i0_syn_31, i0_syn_33);
  or i0_syn_56 (i0_syn_57, i0_syn_29, i0_syn_55);
  or i0_syn_58 (i0_syn_59, i0_syn_35, i0_syn_37);
  or i0_syn_60 (i0_syn_61, i0_syn_39, i0_syn_41);
  or i0_syn_62 (i0_syn_63, i0_syn_59, i0_syn_61);
  or i0_syn_64 (i0_syn_65, i0_syn_57, i0_syn_63);
  or i0_syn_66 (i0_syn_67, i0_syn_53, i0_syn_65);

endmodule 

module binary_mux_s1_w1
  (
  i0,
  i1,
  sel,
  o
  );

  input i0;
  input i1;
  input sel;
  output o;


  AL_MUX al_184 (
    .i0(i0),
    .i1(i1),
    .sel(sel),
    .o(o));

endmodule 


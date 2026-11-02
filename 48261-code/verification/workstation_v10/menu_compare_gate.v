// Verilog netlist created by Tang Dynasty v6.2.168116
// Wed Oct 28 17:38:37 2026

`timescale 1ns / 1ps
module media_menu_gate  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(2)
  (
  audio_available,
  audio_busy,
  brightness,
  clk,
  contrast,
  de,
  field,
  mode,
  period_s,
  rgb,
  rst,
  volume,
  vs,
  de_out,
  rgb_out,
  vs_out
  );

  input audio_available;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  input audio_busy;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  input [7:0] brightness;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  input clk;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(3)
  input [7:0] contrast;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  input de;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(3)
  input [2:0] field;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(3)
  input [1:0] mode;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(3)
  input [5:0] period_s;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  input [23:0] rgb;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(3)
  input rst;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(3)
  input [7:0] volume;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  input vs;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(3)
  output de_out;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)
  output [23:0] rgb_out;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)
  output vs_out;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)

  wire [2:0] bar_b10;
  wire [2:0] bar_b5;
  wire [2:0] bar_b9;
  wire [23:0] bg;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  wire [23:0] bg1;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(9)
  wire [23:0] bg2;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(9)
  wire [22:0] bg_b1;
  wire [10:0] bg_b11;
  wire [5:0] bg_b12;
  wire [5:0] bg_b15;
  wire [22:0] bg_b2;
  wire [22:0] bg_b4;
  wire [22:0] bg_b6;
  wire [22:0] bg_b9;
  wire [15:0] bits;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(11)
  wire [6:0] char_id;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(11)
  wire [3:0] col1;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(10)
  wire [3:0] col2;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(10)
  wire [1:0] deq;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(8)
  wire [23:0] fg1;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(9)
  wire [23:0] fg2;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(9)
  wire [3:0] fg_b10;
  wire [9:0] footer_left;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(15)
  wire [3:0] gx_b2;
  wire [3:0] gx_b6;
  wire [3:0] gy_b11;
  wire [3:0] gy_b6;
  wire [9:0] mux64_syn_2;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1191)
  wire [5:0] ones;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(43)
  wire [2:0] ones_b1;
  wire [23:0] rgb_out_b1;
  wire [3:0] row1;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(10)
  wire [7:0] sel1_syn_11;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1152)
  wire [7:0] sel1_syn_2;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1152)
  wire [4:0] sel4_syn_2;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(20)
  wire [4:0] sel4_syn_8;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(20)
  wire [4:0] sel5_syn_2;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(20)
  wire [4:0] sel5_syn_8;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(20)
  wire [4:0] sel7_syn_2;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(20)
  wire [4:0] sel7_syn_8;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(20)
  wire [2:0] slot_b2;
  wire [2:0] tens;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(42)
  wire [2:0] tens_b1;
  wire [2:0] tens_b2;
  wire [1:0] tens_b3;
  wire [1:0] tens_b4;
  wire [9:0] text_addr;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire [9:0] text_addr_b;
  wire [9:0] text_addr_b1;
  wire [10:0] text_addr_b10;
  wire [9:0] text_addr_b11;
  wire [9:0] text_addr_b12;
  wire [9:0] text_addr_b13;
  wire [9:0] text_addr_b15;
  wire [9:0] text_addr_b16;
  wire [9:0] text_addr_b17;
  wire [10:0] text_addr_b19;
  wire [9:0] text_addr_b2;
  wire [9:0] text_addr_b20;
  wire [7:0] text_addr_b21;
  wire [2:0] text_addr_b24;
  wire [3:0] text_addr_b28;
  wire [9:0] text_addr_b3;
  wire [6:0] text_addr_b35;
  wire [1:0] text_addr_b37;
  wire [3:0] text_addr_b38;
  wire [9:0] text_addr_b4;
  wire [7:0] text_addr_b40;
  wire [10:0] text_addr_b6;
  wire [1:0] vq;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(8)
  wire [9:0] x;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(7)
  wire [9:0] x_b;
  wire [9:0] x_b4;
  wire [9:0] y;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(7)
  wire [9:0] y_b;
  wire [9:0] y_b2;
  wire al_2;
  wire al_18;
  wire al_22;
  wire al_64;
  wire al_66;
  wire al_68;
  wire al_102;
  wire al_104;
  wire al_110;
  wire al_112;
  wire al_130;
  wire al_132;
  wire al_134;
  wire al_138;
  wire al_140;
  wire mux11_syn_24;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1159)
  wire mux11_syn_26;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1159)
  wire mux11_syn_28;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1159)
  wire mux11_syn_30;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1159)
  wire mux11_syn_33;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1159)
  wire mux14_syn_11;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1166)
  wire mux14_syn_13;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1166)
  wire mux17_syn_11;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1170)
  wire mux17_syn_13;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1170)
  wire mux17_syn_15;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1170)
  wire mux18_syn_11;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1171)
  wire mux18_syn_13;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1171)
  wire mux18_syn_15;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1171)
  wire mux18_syn_19;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1171)
  wire mux18_syn_25;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1171)
  wire mux18_syn_28;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1171)
  wire mux19_syn_11;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1172)
  wire mux19_syn_13;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1172)
  wire mux19_syn_15;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1172)
  wire mux19_syn_17;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1172)
  wire mux19_syn_19;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1172)
  wire mux19_syn_24;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1172)
  wire mux20_syn_4;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1174)
  wire mux20_syn_8;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1174)
  wire mux21_syn_13;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1169)
  wire mux21_syn_17;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1169)
  wire mux21_syn_21;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1169)
  wire mux21_syn_25;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1169)
  wire mux21_syn_29;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1169)
  wire mux21_syn_33;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1169)
  wire mux21_syn_37;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1169)
  wire mux21_syn_41;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1169)
  wire mux21_syn_44;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1169)
  wire mux21_syn_49;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1169)
  wire mux23_syn_13;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1167)
  wire mux23_syn_15;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1167)
  wire mux23_syn_17;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1167)
  wire mux25_syn_15;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1163)
  wire mux25_syn_17;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1163)
  wire mux25_syn_19;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1163)
  wire mux25_syn_21;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1163)
  wire mux25_syn_23;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1163)
  wire mux25_syn_25;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1163)
  wire mux25_syn_30;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1163)
  wire mux25_syn_32;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1163)
  wire mux25_syn_40;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1163)
  wire mux28_syn_11;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1161)
  wire mux28_syn_14;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1161)
  wire mux28_syn_23;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1161)
  wire mux30_syn_21;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1161)
  wire mux30_syn_25;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1161)
  wire mux30_syn_29;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1161)
  wire mux30_syn_33;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1161)
  wire mux30_syn_37;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1161)
  wire mux30_syn_43;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1161)
  wire mux30_syn_45;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1161)
  wire mux30_syn_47;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1161)
  wire mux31_syn_12;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1161)
  wire mux31_syn_14;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1161)
  wire mux31_syn_18;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1161)
  wire mux34_syn_24;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1139)
  wire mux34_syn_26;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1139)
  wire mux34_syn_34;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1139)
  wire mux34_syn_50;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1139)
  wire mux34_syn_56;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1139)
  wire mux34_syn_62;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1139)
  wire mux34_syn_65;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1139)
  wire mux34_syn_83;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1139)
  wire mux34_syn_85;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1139)
  wire mux35_syn_29;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1139)
  wire mux35_syn_46;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1139)
  wire mux36_syn_19;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1139)
  wire mux36_syn_22;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1139)
  wire mux36_syn_37;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1139)
  wire mux37_syn_15;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1139)
  wire mux37_syn_19;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1139)
  wire mux4_syn_10;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1147)
  wire mux4_syn_16;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1147)
  wire mux41_syn_4;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1139)
  wire mux41_syn_6;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1139)
  wire mux41_syn_12;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1139)
  wire mux41_syn_19;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1139)
  wire mux43_syn_11;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1180)
  wire mux43_syn_13;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1180)
  wire mux43_syn_15;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1180)
  wire mux43_syn_17;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1180)
  wire mux43_syn_21;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1180)
  wire mux43_syn_26;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1180)
  wire mux44_syn_5;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1180)
  wire mux44_syn_7;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1180)
  wire mux44_syn_9;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1180)
  wire mux44_syn_11;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1180)
  wire mux44_syn_14;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1180)
  wire mux45_syn_5;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1180)
  wire mux45_syn_7;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1180)
  wire mux47_syn_11;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1183)
  wire mux47_syn_13;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1183)
  wire mux47_syn_15;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1183)
  wire mux47_syn_17;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1183)
  wire mux47_syn_19;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1183)
  wire mux47_syn_23;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1183)
  wire mux48_syn_11;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1183)
  wire mux5_syn_24;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1145)
  wire mux5_syn_26;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1145)
  wire mux5_syn_28;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1145)
  wire mux5_syn_30;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1145)
  wire mux50_syn_4;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1183)
  wire mux50_syn_8;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1183)
  wire mux50_syn_16;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1183)
  wire mux51_syn_25;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1132)
  wire mux51_syn_27;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1132)
  wire mux51_syn_35;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1132)
  wire mux51_syn_51;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1132)
  wire mux51_syn_57;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1132)
  wire mux52_syn_25;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1132)
  wire mux52_syn_29;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1132)
  wire mux52_syn_37;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1132)
  wire mux52_syn_46;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1132)
  wire mux53_syn_7;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1132)
  wire mux53_syn_11;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1132)
  wire mux53_syn_15;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1132)
  wire mux53_syn_19;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1132)
  wire mux54_syn_7;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1132)
  wire mux54_syn_11;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1132)
  wire mux54_syn_15;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1132)
  wire mux54_syn_19;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1132)
  wire mux60_syn_4;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1132)
  wire mux60_syn_6;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1132)
  wire mux60_syn_8;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1132)
  wire mux60_syn_10;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1132)
  wire mux60_syn_14;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1132)
  wire mux60_syn_16;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1132)
  wire mux60_syn_18;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1132)
  wire mux60_syn_20;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1132)
  wire mux60_syn_22;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1132)
  wire mux60_syn_25;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1132)
  wire mux60_syn_27;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1132)
  wire mux63_syn_12;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1191)
  wire mux66_syn_26;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1201)
  wire mux67_syn_8;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1135)
  wire mux67_syn_18;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1135)
  wire mux68_syn_2;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1136)
  wire mux68_syn_4;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1136)
  wire mux68_syn_6;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1136)
  wire mux71_syn_7;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1143)
  wire mux73_syn_7;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1142)
  wire mux75_syn_7;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1141)
  wire mux77_syn_7;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1140)
  wire mux9_syn_11;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1149)
  wire sel1_syn_40;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1152)
  wire sel1_syn_42;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1152)
  wire sel1_syn_44;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1152)
  wire sel1_syn_46;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1152)
  wire sel1_syn_48;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1152)
  wire sel1_syn_52;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1152)
  wire sel1_syn_54;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1152)
  wire sel1_syn_56;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1152)
  wire sel1_syn_58;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1152)
  wire sel1_syn_60;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1152)
  wire sel1_syn_78;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1152)
  wire sel1_syn_81;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1152)
  wire sel2_syn_26;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(27)
  wire sel2_syn_28;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(27)
  wire sel2_syn_30;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(27)
  wire sel2_syn_32;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(27)
  wire sel2_syn_38;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(27)
  wire sel2_syn_40;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(27)
  wire sel2_syn_42;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(27)
  wire sel4_syn_43;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(20)
  wire sel4_syn_46;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(20)
  wire sel5_syn_43;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(20)
  wire sel5_syn_46;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(20)
  wire sel7_syn_43;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(20)
  wire sel7_syn_46;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(20)
  wire bar_b10_n;
  wire bar_b10_n_syn_2;
  wire bar_b10_n1;
  wire bar_b1_n1;
  wire bar_b1_n2;
  wire bar_b5_n;
  wire bar_b7_n3;
  wire bar_b7_n3_syn_4;
  wire bar_b8_n;
  wire bar_b9_n;
  wire bar_b_n;
  wire bar_b_n1;
  wire bar_b_n2;
  wire \bg[21]_syn_2 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  wire \bg[17]_syn_2 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  wire \bg[6]_syn_2 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  wire \bg[0]_syn_2 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  wire bg_b10_n;
  wire bg_b10_n_syn_2;
  wire bg_b1_n;
  wire bg_b1_n1;
  wire bg_b1_n2;
  wire bg_b1_n3;
  wire bg_b1_n4;
  wire bg_b1_n5;
  wire bg_b1_n6;
  wire bg_b3_n;
  wire bg_b3_n_syn_2;
  wire bg_b3_n1;
  wire bg_b3_n1_syn_2;
  wire bg_b3_n10;
  wire bg_b3_n11;
  wire bg_b3_n2;
  wire bg_b3_n3;
  wire bg_b3_n4;
  wire bg_b3_n5;
  wire bg_b3_n6;
  wire bg_b3_n7;
  wire bg_b3_n8;
  wire bg_b3_n9;
  wire bg_b4_n;
  wire bg_b4_n_syn_2;
  wire bg_b4_n1;
  wire bg_b4_n2;
  wire bg_b4_n3;
  wire bg_b4_n4;
  wire bg_b4_n5;
  wire bg_b4_n6;
  wire bg_b6_n;
  wire bg_b6_n1;
  wire bg_b6_n2;
  wire bg_b7_n;
  wire bg_b8_n;
  wire bg_b8_n_syn_2;
  wire bg_b8_n1;
  wire \brightness[7]_syn_16 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  wire \brightness[6]_syn_6 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  wire \brightness[4]_syn_3 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  wire \brightness[4]_syn_4 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  wire \brightness[3]_syn_2 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  wire \brightness[2]_syn_2 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  wire \brightness[1]_syn_2 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  wire \brightness[0]_syn_2 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  wire \contrast[7]_syn_16 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  wire \contrast[6]_syn_6 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  wire \contrast[4]_syn_3 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  wire \contrast[4]_syn_4 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  wire \contrast[3]_syn_2 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  wire \contrast[2]_syn_2 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  wire \contrast[1]_syn_2 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  wire \contrast[0]_syn_2 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  wire fg_b1_n;
  wire fg_b1_n_syn_2;
  wire fg_b1_n1;
  wire fg_b1_n2;
  wire fg_b1_n3;
  wire fg_b1_n5;
  wire fg_b1_n6;
  wire fg_b3_n;
  wire fg_b3_n_syn_2;
  wire fg_b3_n1;
  wire fg_b3_n2;
  wire fg_b3_n3;
  wire fg_b3_n4;
  wire fg_b3_n5;
  wire fg_b3_n6;
  wire fg_b5_n;
  wire fg_b8_n;
  wire fg_b_n;
  wire fg_b_n1;
  wire fg_b_n2;
  wire fg_b_n3;
  wire fg_b_n4;
  wire fg_b_n4_syn_2;
  wire fg_b_n5;
  wire fg_b_n6;
  wire \footer_left[3]_syn_2 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(15)
  wire \gx[3]_syn_2 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \gx[3]_syn_4 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \gx[2]_syn_2 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \gx[2]_syn_4 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \gx[1]_syn_2 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \gx[1]_syn_4 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \gx[0]_syn_2 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \gx[0]_syn_4 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire gx_b10_n;
  wire gx_b10_n_syn_2;
  wire gx_b10_n1;
  wire gx_b10_n2;
  wire gx_b10_n4;
  wire gx_b6_n;
  wire gx_b6_n_syn_2;
  wire gx_b6_n1;
  wire gx_b6_n2;
  wire gx_b6_n3;
  wire gx_b6_n4;
  wire gx_b6_n5;
  wire gx_b6_n6;
  wire \gy[3]_syn_2 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \gy[2]_syn_2 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \gy[1]_syn_2 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \gy[0]_syn_2 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \text_addr_b17[9]_syn_2 ;
  wire \bg_b2[7]_syn_2 ;
  wire \text_addr_b10[10]_syn_2 ;
  wire \bg_b15[5]_syn_2 ;
  wire \bar_b10[0]_syn_2 ;
  wire \bar_b9[1]_syn_2 ;
  wire \bar_b5[0]_syn_2 ;
  wire \bg_b12[5]_syn_2 ;
  wire \bg_b6[14]_syn_2 ;
  wire \text_addr_b19[10]_syn_2 ;
  wire \text_addr_b15[0]_syn_2 ;
  wire \bg_b11[10]_syn_2 ;
  wire \slot_b2[2]_syn_14 ;
  wire panel;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(44)
  wire panel_n1;
  wire panel_n2;
  wire panel_n3;
  wire panel_n4;
  wire panel_n5;
  wire panel_n6;
  wire panel_n7;
  wire panel_n8;
  wire \period_s[0]_syn_2 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  wire rgb_out_b1_n;
  wire rgb_out_b1_n_syn_2;
  wire \tens[0]_syn_2 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(42)
  wire tens_b1_n;
  wire tens_b2_n;
  wire tens_b3_n;
  wire tens_b4_n;
  wire tens_b4_n1;
  wire tens_b_n;
  wire \text_addr[9]_syn_2 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \text_addr[9]_syn_4 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \text_addr[7]_syn_2 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \text_addr[7]_syn_4 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \text_addr[6]_syn_2 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \text_addr[6]_syn_4 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \text_addr[5]_syn_2 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \text_addr[5]_syn_4 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \text_addr[3]_syn_2 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \text_addr[2]_syn_2 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \text_addr[2]_syn_4 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \text_addr[2]_syn_6 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \text_addr[1]_syn_2 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \text_addr[1]_syn_6 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \text_addr[1]_syn_10 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \text_addr[1]_syn_12 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \text_addr[0]_syn_2 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \text_addr[0]_syn_7 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \text_addr[0]_syn_11 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \text_addr[0]_syn_14 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \text_addr[0]_syn_16 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire text_addr_b17_n;
  wire text_addr_b22_n;
  wire text_addr_b22_n_syn_2;
  wire text_addr_b26_n;
  wire text_addr_b26_n_syn_2;
  wire text_addr_b30_n;
  wire text_addr_b30_n_syn_2;
  wire text_addr_b33_n;
  wire text_addr_b33_n11;
  wire text_addr_b33_n11_syn_2;
  wire text_addr_b33_n12;
  wire text_addr_b33_n12_syn_2;
  wire text_addr_b33_n13;
  wire text_addr_b33_n14;
  wire text_addr_b33_n15;
  wire text_addr_b33_n15_syn_2;
  wire text_addr_b33_n16;
  wire text_addr_b33_n18;
  wire text_addr_b33_n19;
  wire text_addr_b33_n19_syn_2;
  wire text_addr_b33_n3;
  wire text_addr_b33_n4;
  wire text_addr_b33_n5;
  wire text_addr_b33_n8;
  wire text_addr_b33_n8_syn_2;
  wire text_addr_b33_n9;
  wire text_addr_b34_n;
  wire text_addr_b34_n_syn_2;
  wire text_addr_b36_n;
  wire text_addr_b36_n_syn_2;
  wire \volume[7]_syn_16 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  wire \volume[6]_syn_6 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  wire \volume[4]_syn_3 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  wire \volume[4]_syn_4 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  wire \volume[3]_syn_2 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  wire \volume[2]_syn_2 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  wire \volume[1]_syn_2 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  wire \volume[0]_syn_2 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  wire \x[8]_syn_2 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(7)
  wire \x[5]_syn_2 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(7)
  wire \x[4]_syn_2 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(7)
  wire \x[3]_syn_2 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(7)
  wire \x[0]_syn_2 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(7)
  wire x_b_n;
  wire \y[5]_syn_2 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(7)
  wire \y[4]_syn_2 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(7)
  wire \y[3]_syn_2 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(7)
  wire \y[2]_syn_2 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(7)
  wire \y[0]_syn_2 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(7)
  wire y_b1_n;
  wire y_b1_n1;

  add_pu3_pu3_o3 add0 (
    .i0({bar_b10_n_syn_2,bar_b9[1],bar_b5[0]}),
    .i1(3'b001),
    .o(text_addr_b24));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1150)
  add_pu3_pu3_o3 add1 (
    .i0(text_addr_b24),
    .i1({text_addr_b19[10],text_addr_b19[10:9]}),
    .o(text_addr_b15[7:5]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1150)
  add_pu1_pu1_o1 add2 (
    .i0(tens[0]),
    .i1(tens_b2_n),
    .o(ones_b1[0]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(43)
  add_pu2_pu2_o2 add3 (
    .i0(2'b01),
    .i1(tens[1:0]),
    .o({text_addr_b38[1],open_n0}));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1170)
  add_pu4_pu4_o4 add4 (
    .i0(4'b0001),
    .i1(ones[3:0]),
    .o({text_addr_b35[3:1],open_n1}));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1171)
  add_pu3_pu3_o3 add6 (
    .i0({2'b01,footer_left[3]}),
    .i1({fg_b_n4_syn_2,fg_b_n4_syn_2,text_addr_b6[9]}),
    .o({text_addr_b2[7],open_n2,text_addr_b2[5]}));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1184)
  add_pu10_pu10_o10 add7 (
    .i0(x),
    .i1(10'b0000000001),
    .o({x_b4[9:1],open_n3}));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1192)
  add_pu10_pu10_o10 add8 (
    .i0(y),
    .i1(10'b0000000001),
    .o({y_b2[9:1],open_n4}));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1192)
  or al_1 (al_2, bg_b1_n, mux51_syn_25);
  or al_101 (al_102, al_64, mux60_syn_25);
  or al_103 (al_104, fg_b_n, mux51_syn_25);
  or al_109 (al_110, fg_b1_n, fg_b_n);
  or al_111 (al_112, al_110, mux51_syn_25);
  or al_129 (al_130, al_134, fg_b3_n_syn_2);
  or al_131 (al_132, mux60_syn_25, \text_addr[0]_syn_7 );
  or al_133 (al_134, text_addr_b17_n, mux25_syn_30);
  or al_137 (al_138, al_130, mux60_syn_25);
  not al_139 (al_140, al_110);
  or al_17 (al_18, \bar_b10[0]_syn_2 , fg_b3_n_syn_2);
  or al_21 (al_22, al_18, mux51_syn_25);
  or al_63 (al_64, bar_b10_n1, fg_b3_n_syn_2);
  or al_65 (al_66, al_64, mux34_syn_24);
  or al_67 (al_68, al_66, al_112);
  not \bar_b10[0]_syn_1  (\bar_b10[0]_syn_2 , bar_b10[0]);
  not bar_b10_n_syn_1 (bar_b10_n_syn_2, bar_b10_n);
  not \bar_b5[0]_syn_1  (\bar_b5[0]_syn_2 , bar_b5[0]);
  not bar_b7_n3_syn_3 (bar_b7_n3_syn_4, bar_b7_n3);
  not \bar_b9[1]_syn_1  (\bar_b9[1]_syn_2 , bar_b9[1]);
  and bar_b_i (bar_b_n, bar_b_n1, bar_b_n2);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1139)
  AL_DFF_X \bg1_reg[0]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(\bg[0]_syn_2 ),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(bg1[0]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_DFF_X \bg1_reg[10]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(bg[10]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(bg1[10]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_DFF_X \bg1_reg[11]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(bg[11]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(bg1[11]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_DFF_X \bg1_reg[12]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(bg[12]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(bg1[12]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_DFF_X \bg1_reg[13]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(bg[13]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(bg1[13]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_DFF_X \bg1_reg[14]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(bg[14]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(bg1[14]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_DFF_X \bg1_reg[15]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(bg[15]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(bg1[15]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_DFF_X \bg1_reg[16]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(bg[16]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(bg1[16]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_DFF_X \bg1_reg[17]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(\bg[17]_syn_2 ),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(bg1[17]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_DFF_X \bg1_reg[18]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(bg[18]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(bg1[18]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_DFF_X \bg1_reg[19]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(bg[19]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(bg1[19]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_DFF_X \bg1_reg[1]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(bg[1]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(bg1[1]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_DFF_X \bg1_reg[20]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(bg[20]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(bg1[20]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_DFF_X \bg1_reg[21]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(\bg[21]_syn_2 ),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(bg1[21]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_DFF_X \bg1_reg[22]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(bg[22]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(bg1[22]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_DFF_X \bg1_reg[23]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(bg[23]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(bg1[23]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_DFF_X \bg1_reg[2]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(bg[2]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(bg1[2]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_DFF_X \bg1_reg[3]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(bg[3]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(bg1[3]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_DFF_X \bg1_reg[4]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(bg[4]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(bg1[4]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_DFF_X \bg1_reg[5]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(bg[5]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(bg1[5]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_DFF_X \bg1_reg[6]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(\bg[6]_syn_2 ),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(bg1[6]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_DFF_X \bg1_reg[7]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(bg[7]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(bg1[7]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_DFF_X \bg1_reg[8]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(bg[8]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(bg1[8]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_DFF_X \bg1_reg[9]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(bg[9]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(bg1[9]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_DFF_X \bg2_reg[0]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(bg1[0]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(bg2[0]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_DFF_X \bg2_reg[10]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(bg1[10]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(bg2[10]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_DFF_X \bg2_reg[11]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(bg1[11]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(bg2[11]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_DFF_X \bg2_reg[12]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(bg1[12]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(bg2[12]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_DFF_X \bg2_reg[13]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(bg1[13]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(bg2[13]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_DFF_X \bg2_reg[14]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(bg1[14]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(bg2[14]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_DFF_X \bg2_reg[15]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(bg1[15]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(bg2[15]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_DFF_X \bg2_reg[16]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(bg1[16]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(bg2[16]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_DFF_X \bg2_reg[17]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(bg1[17]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(bg2[17]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_DFF_X \bg2_reg[18]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(bg1[18]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(bg2[18]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_DFF_X \bg2_reg[19]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(bg1[19]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(bg2[19]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_DFF_X \bg2_reg[1]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(bg1[1]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(bg2[1]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_DFF_X \bg2_reg[20]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(bg1[20]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(bg2[20]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_DFF_X \bg2_reg[21]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(bg1[21]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(bg2[21]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_DFF_X \bg2_reg[22]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(bg1[22]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(bg2[22]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_DFF_X \bg2_reg[23]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(bg1[23]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(bg2[23]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_DFF_X \bg2_reg[2]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(bg1[2]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(bg2[2]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_DFF_X \bg2_reg[3]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(bg1[3]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(bg2[3]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_DFF_X \bg2_reg[4]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(bg1[4]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(bg2[4]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_DFF_X \bg2_reg[5]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(bg1[5]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(bg2[5]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_DFF_X \bg2_reg[6]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(bg1[6]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(bg2[6]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_DFF_X \bg2_reg[7]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(bg1[7]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(bg2[7]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_DFF_X \bg2_reg[8]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(bg1[8]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(bg2[8]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_DFF_X \bg2_reg[9]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(bg1[9]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(bg2[9]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_MUX \bg[0]_syn_1  (
    .i0(mux34_syn_26),
    .i1(mux51_syn_27),
    .sel(al_2),
    .o(\bg[0]_syn_2 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  AL_MUX \bg[17]_syn_1  (
    .i0(mux34_syn_50),
    .i1(mux51_syn_51),
    .sel(al_2),
    .o(\bg[17]_syn_2 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  AL_MUX \bg[21]_syn_1  (
    .i0(mux34_syn_56),
    .i1(mux51_syn_57),
    .sel(al_2),
    .o(\bg[21]_syn_2 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  AL_MUX \bg[6]_syn_1  (
    .i0(mux34_syn_34),
    .i1(mux51_syn_35),
    .sel(al_2),
    .o(\bg[6]_syn_2 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  not bg_b10_n_syn_1 (bg_b10_n_syn_2, bg_b10_n);
  not \bg_b11[10]_syn_1  (\bg_b11[10]_syn_2 , bg_b11[10]);
  AL_MUX \bg_b12[5]_syn_1  (
    .i0(mux73_syn_7),
    .i1(mux77_syn_7),
    .sel(bar_b9_n),
    .o(\bg_b12[5]_syn_2 ));
  not \bg_b15[5]_syn_1  (\bg_b15[5]_syn_2 , bg_b15[5]);
  and bg_b1_i (bg_b1_n, bg_b1_n1, bg_b1_n2);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1179)
  and bg_b1_i1 (bg_b1_n1, bg_b1_n3, bg_b1_n4);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1179)
  and bg_b1_i2 (bg_b1_n3, bg_b1_n5, bg_b1_n6);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1179)
  not \bg_b2[7]_syn_1  (\bg_b2[7]_syn_2 , bg_b2[7]);
  or bg_b3_i (bg_b3_n, bg_b3_n2, bg_b3_n3);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1134)
  and bg_b3_i1 (bg_b3_n1, bg_b3_n4, bg_b1_n2);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1135)
  or bg_b3_i2 (bg_b3_n2, bg_b3_n5, bg_b3_n6);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1134)
  and bg_b3_i3 (bg_b3_n4, bg_b3_n7, bg_b1_n4);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1135)
  or bg_b3_i4 (bg_b3_n5, bg_b3_n8, bg_b3_n9);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1134)
  and bg_b3_i5 (bg_b3_n7, bg_b3_n10, bg_b3_n11);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1135)
  not bg_b3_n1_syn_1 (bg_b3_n1_syn_2, bg_b3_n1);
  not bg_b3_n_syn_1 (bg_b3_n_syn_2, bg_b3_n);
  and bg_b4_i (bg_b4_n, bg_b4_n1, bg_b4_n2);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1159)
  and bg_b4_i1 (bg_b4_n1, bg_b4_n3, bg_b4_n4);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1159)
  and bg_b4_i2 (bg_b4_n3, bg_b4_n5, bg_b4_n6);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1159)
  and bg_b4_i3 (bg_b4_n5, bar_b10_n1, \bg_b11[10]_syn_2 );  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1159)
  not bg_b4_n_syn_1 (bg_b4_n_syn_2, bg_b4_n);
  not \bg_b6[14]_syn_1  (\bg_b6[14]_syn_2 , bg_b6[14]);
  and bg_b6_i (bg_b6_n, bg_b6_n1, bg_b6_n2);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1145)
  and bg_b6_i1 (bg_b6_n1, bg_b1_n4, bg_b1_n2);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1145)
  and bg_b8_i (bg_b8_n, bg_b10_n, bg_b8_n1);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1147)
  not bg_b8_n_syn_1 (bg_b8_n_syn_2, bg_b8_n);
  not bg_b9_i (bg_b9[21], bg_b7_n);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1160)
  not \brightness[0]_syn_1  (\brightness[0]_syn_2 , brightness[0]);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  not \brightness[1]_syn_1  (\brightness[1]_syn_2 , brightness[1]);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  not \brightness[2]_syn_1  (\brightness[2]_syn_2 , brightness[2]);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  not \brightness[3]_syn_1  (\brightness[3]_syn_2 , brightness[3]);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  and \brightness[4]_syn_1  (\brightness[4]_syn_4 , \brightness[4]_syn_3 , \brightness[3]_syn_2 , \brightness[2]_syn_2 , \brightness[1]_syn_2 , \brightness[0]_syn_2 );  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  not \brightness[4]_syn_2  (\brightness[4]_syn_3 , brightness[4]);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  not \brightness[6]_syn_5  (\brightness[6]_syn_6 , brightness[6]);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  not \brightness[7]_syn_15  (\brightness[7]_syn_16 , brightness[7]);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  AL_DFF_X \col1_reg[0]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(\gx[0]_syn_2 ),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(col1[0]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_DFF_X \col1_reg[1]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(\gx[1]_syn_2 ),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(col1[1]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_DFF_X \col1_reg[2]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(\gx[2]_syn_2 ),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(col1[2]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_DFF_X \col1_reg[3]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(\gx[3]_syn_2 ),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(col1[3]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_DFF_X \col2_reg[0]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(col1[0]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(col2[0]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_DFF_X \col2_reg[1]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(col1[1]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(col2[1]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_DFF_X \col2_reg[2]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(col1[2]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(col2[2]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_DFF_X \col2_reg[3]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(col1[3]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(col2[3]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  not \contrast[0]_syn_1  (\contrast[0]_syn_2 , contrast[0]);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  not \contrast[1]_syn_1  (\contrast[1]_syn_2 , contrast[1]);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  not \contrast[2]_syn_1  (\contrast[2]_syn_2 , contrast[2]);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  not \contrast[3]_syn_1  (\contrast[3]_syn_2 , contrast[3]);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  and \contrast[4]_syn_1  (\contrast[4]_syn_4 , \contrast[4]_syn_3 , \contrast[3]_syn_2 , \contrast[2]_syn_2 , \contrast[1]_syn_2 , \contrast[0]_syn_2 );  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  not \contrast[4]_syn_2  (\contrast[4]_syn_3 , contrast[4]);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  not \contrast[6]_syn_5  (\contrast[6]_syn_6 , contrast[6]);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  not \contrast[7]_syn_15  (\contrast[7]_syn_16 , contrast[7]);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  AL_DFF_X \deq_reg[0]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(de),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(deq[0]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_DFF_X \deq_reg[1]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(deq[0]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(de_out));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  eq_w3 eq0 (
    .i0({bar_b10_n_syn_2,bar_b9[1],bar_b5[0]}),
    .i1(field),
    .o(bg_b10_n));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1146)
  eq_w8 eq11 (
    .i0(volume),
    .i1(8'b00000000),
    .o(bar_b8_n));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(17)
  eq_w2 eq16 (
    .i0(mode),
    .i1(2'b10),
    .o(panel_n7));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(44)
  eq_w3 eq18 (
    .i0({bar_b10_n_syn_2,bar_b9[1],bar_b5[0]}),
    .i1(3'b001),
    .o(bar_b1_n1));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1154)
  eq_w3 eq19 (
    .i0({bar_b10_n_syn_2,bar_b9[1],bar_b5[0]}),
    .i1(3'b010),
    .o(bar_b1_n2));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1155)
  eq_w3 eq26 (
    .i0({slot_b2[2:1],\x[4]_syn_2 }),
    .i1(3'b000),
    .o(text_addr_b33_n));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(28)
  eq_w3 eq27 (
    .i0({slot_b2[2:1],\x[4]_syn_2 }),
    .i1(3'b001),
    .o(text_addr_b30_n));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(29)
  eq_w3 eq28 (
    .i0({slot_b2[2:1],\x[4]_syn_2 }),
    .i1(3'b010),
    .o(text_addr_b26_n));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(31)
  eq_w3 eq29 (
    .i0(field),
    .i1(3'b100),
    .o(footer_left[3]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1131)
  eq_w3 eq30 (
    .i0({slot_b2[2:1],\x[4]_syn_2 }),
    .i1(3'b011),
    .o(text_addr_b22_n));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1165)
  eq_w8 eq9 (
    .i0(contrast),
    .i1(8'b10000000),
    .o(bar_b7_n3));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(20)
  AL_DFF_X \fg1_reg[11]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(mux60_syn_16),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(fg1[11]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_DFF_X \fg1_reg[12]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(mux60_syn_18),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(fg1[12]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_DFF_X \fg1_reg[13]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(mux60_syn_20),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(fg1[13]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_DFF_X \fg1_reg[14]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(mux60_syn_10),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(fg1[14]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_DFF_X \fg1_reg[15]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(1'b1),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(fg1[15]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_DFF_X \fg1_reg[19]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(mux60_syn_8),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(fg1[19]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_DFF_X \fg1_reg[1]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(mux60_syn_4),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(fg1[1]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_DFF_X \fg1_reg[20]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(mux60_syn_14),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(fg1[20]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_DFF_X \fg1_reg[23]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(mux60_syn_6),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(fg1[23]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_DFF_X \fg2_reg[11]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(fg1[11]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(fg2[11]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_DFF_X \fg2_reg[12]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(fg1[12]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(fg2[12]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_DFF_X \fg2_reg[13]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(fg1[13]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(fg2[13]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_DFF_X \fg2_reg[14]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(fg1[14]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(fg2[14]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_DFF_X \fg2_reg[15]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(fg1[15]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(fg2[15]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_DFF_X \fg2_reg[19]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(fg1[19]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(fg2[19]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_DFF_X \fg2_reg[1]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(fg1[1]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(fg2[1]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_DFF_X \fg2_reg[20]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(fg1[20]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(fg2[20]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_DFF_X \fg2_reg[23]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(fg1[23]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(fg2[23]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  not fg_b10_i (fg_b10[3], audio_available);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1174)
  and fg_b1_i (fg_b1_n, fg_b1_n1, fg_b1_n2);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1180)
  and fg_b1_i1 (fg_b1_n1, fg_b1_n3, \text_addr_b10[10]_syn_2 );  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1180)
  and fg_b1_i2 (fg_b1_n3, fg_b1_n5, fg_b1_n6);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1180)
  not fg_b1_n_syn_1 (fg_b1_n_syn_2, fg_b1_n);
  and fg_b3_i (fg_b3_n, fg_b3_n1, fg_b3_n2);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1161)
  and fg_b3_i1 (fg_b3_n1, fg_b3_n3, fg_b3_n4);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1161)
  and fg_b3_i2 (fg_b3_n3, fg_b3_n5, fg_b3_n6);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1161)
  not fg_b3_n_syn_1 (fg_b3_n_syn_2, fg_b3_n);
  or fg_b5_i (fg_b5_n, bar_b5_n, bar_b1_n2);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1163)
  or fg_b8_i24 (fg_b8_n, audio_busy, fg_b10[3]);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1175)
  and fg_b_i (fg_b_n, fg_b_n1, fg_b_n2);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1183)
  and fg_b_i1 (fg_b_n1, fg_b_n3, fg_b_n4);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1183)
  and fg_b_i2 (fg_b_n3, fg_b_n5, fg_b_n6);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1183)
  not fg_b_n4_syn_1 (fg_b_n4_syn_2, fg_b_n4);
  not \footer_left[3]_syn_1  (\footer_left[3]_syn_2 , footer_left[3]);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(15)
  not \gx[0]_syn_1  (\gx[0]_syn_2 , \gx[0]_syn_4 );  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MUX \gx[0]_syn_3  (
    .i0(mux44_syn_5),
    .i1(mux53_syn_7),
    .sel(al_104),
    .o(\gx[0]_syn_4 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  not \gx[1]_syn_1  (\gx[1]_syn_2 , \gx[1]_syn_4 );  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MUX \gx[1]_syn_3  (
    .i0(mux44_syn_7),
    .i1(mux53_syn_11),
    .sel(al_104),
    .o(\gx[1]_syn_4 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  not \gx[2]_syn_1  (\gx[2]_syn_2 , \gx[2]_syn_4 );  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MUX \gx[2]_syn_3  (
    .i0(mux44_syn_9),
    .i1(mux53_syn_15),
    .sel(al_104),
    .o(\gx[2]_syn_4 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  not \gx[3]_syn_1  (\gx[3]_syn_2 , \gx[3]_syn_4 );  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MUX \gx[3]_syn_3  (
    .i0(mux36_syn_19),
    .i1(mux53_syn_19),
    .sel(al_112),
    .o(\gx[3]_syn_4 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  and gx_b10_i (gx_b10_n, gx_b10_n1, fg_b3_n2);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1149)
  and gx_b10_i1 (gx_b10_n1, gx_b10_n2, fg_b3_n4);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1149)
  and gx_b10_i2 (gx_b10_n2, \text_addr_b19[10]_syn_2 , gx_b10_n4);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1149)
  not gx_b10_n_syn_1 (gx_b10_n_syn_2, gx_b10_n);
  and gx_b6_i (gx_b6_n, gx_b6_n1, gx_b6_n2);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1136)
  and gx_b6_i1 (gx_b6_n1, gx_b6_n3, gx_b6_n4);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1136)
  and gx_b6_i2 (gx_b6_n3, gx_b6_n5, gx_b6_n6);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1136)
  not gx_b6_n_syn_1 (gx_b6_n_syn_2, gx_b6_n);
  AL_MUX \gy[0]_syn_1  (
    .i0(mux45_syn_5),
    .i1(mux54_syn_7),
    .sel(al_104),
    .o(\gy[0]_syn_2 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MUX \gy[1]_syn_1  (
    .i0(mux45_syn_7),
    .i1(mux54_syn_11),
    .sel(al_104),
    .o(\gy[1]_syn_2 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MUX \gy[2]_syn_1  (
    .i0(mux37_syn_15),
    .i1(mux54_syn_15),
    .sel(al_112),
    .o(\gy[2]_syn_2 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MUX \gy[3]_syn_1  (
    .i0(mux37_syn_19),
    .i1(mux54_syn_19),
    .sel(al_112),
    .o(\gy[3]_syn_2 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  lt_u8_u8 lt0 (
    .ci(1'b0),
    .i0(x[9:2]),
    .i1(8'b00010111),
    .o(bg_b8_n1));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1147)
  lt_u6_u6 lt10 (
    .ci(1'b0),
    .i0({\bg_b12[5]_syn_2 ,bg_b12[4],y[3:0]}),
    .i1(6'b010111),
    .o(bg_b4_n2));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1159)
  lt_u11_u11 lt11 (
    .ci(1'b0),
    .i0({bg_b11[10:9],\x[8]_syn_2 ,x[7:0]}),
    .i1({3'b000,sel1_syn_2[7:3],3'b000}),
    .o(bg_b7_n));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1160)
  lt_u4_u4 lt12 (
    .ci(1'b0),
    .i0(x[9:6]),
    .i1(4'b1001),
    .o(panel_n6));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(44)
  lt_u6_u6 lt13 (
    .ci(1'b1),
    .i0(6'b011101),
    .i1(x[9:4]),
    .o(fg_b3_n5));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1161)
  lt_u5_u5 lt14 (
    .ci(1'b0),
    .i0(x[9:5]),
    .i1(5'b10001),
    .o(fg_b3_n6));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1161)
  lt_u7_u7 lt15 (
    .ci(1'b1),
    .i0(7'b0000101),
    .i1(y[9:3]),
    .o(panel_n4));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(44)
  lt_u7_u7 lt16 (
    .ci(1'b0),
    .i0(y[9:3]),
    .i1(7'b0110111),
    .o(panel_n2));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(44)
  lt_u4_u4 lt17 (
    .ci(1'b1),
    .i0(4'b1111),
    .i1(period_s[5:2]),
    .o(tens_b_n));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(38)
  lt_u8_u8 lt19 (
    .ci(1'b1),
    .i0(contrast),
    .i1(8'b11000000),
    .o(text_addr_b36_n));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1168)
  lt_u7_u7 lt2 (
    .ci(1'b0),
    .i0(x[9:3]),
    .i1(7'b0011101),
    .o(gx_b10_n4));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1149)
  lt_u7_u7 lt20 (
    .ci(1'b1),
    .i0(7'b0101101),
    .i1(y[9:3]),
    .o(bg_b1_n5));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1179)
  lt_u9_u9 lt21 (
    .ci(1'b0),
    .i0(y[9:1]),
    .i1(9'b010110101),
    .o(bg_b1_n6));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1179)
  lt_u9_u9 lt22 (
    .ci(1'b0),
    .i0(x[9:1]),
    .i1(9'b000100001),
    .o(bg_b3_n8));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1134)
  lt_u7_u7 lt23 (
    .ci(1'b1),
    .i0(7'b0101111),
    .i1(y[9:3]),
    .o(fg_b1_n5));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1180)
  lt_u7_u7 lt24 (
    .ci(1'b0),
    .i0(y[9:3]),
    .i1(7'b0110001),
    .o(fg_b1_n6));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1180)
  lt_u5_u5 lt26 (
    .ci(1'b1),
    .i0(5'b11001),
    .i1(period_s[5:1]),
    .o(tens_b1_n));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(38)
  lt_u9_u9 lt27 (
    .ci(1'b1),
    .i0(9'b100011111),
    .i1(x[9:1]),
    .o(bg_b3_n9));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1134)
  lt_u7_u7 lt28 (
    .ci(1'b0),
    .i0(x[9:3]),
    .i1(7'b0111001),
    .o(fg_b1_n2));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1180)
  lt_u7_u7 lt29 (
    .ci(1'b1),
    .i0(7'b0110011),
    .i1(y[9:3]),
    .o(fg_b_n5));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1183)
  lt_u4_u4 lt3 (
    .ci(1'b1),
    .i0(4'b0001),
    .i1({\bg_b12[5]_syn_2 ,bg_b12[4],y[3:2]}),
    .o(fg_b3_n4));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1149)
  lt_u7_u7 lt30 (
    .ci(1'b0),
    .i0(y[9:3]),
    .i1(7'b0110101),
    .o(fg_b_n6));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1183)
  lt_u10_u10 lt31 (
    .ci(1'b1),
    .i0({3'b001,footer_left[3],\footer_left[3]_syn_2 ,1'b1,footer_left[3],3'b000}),
    .i1(x),
    .o(fg_b_n4));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1183)
  lt_u10_u10 lt32 (
    .ci(1'b0),
    .i0(x),
    .i1({3'b011,\footer_left[3]_syn_2 ,footer_left[3],\footer_left[3]_syn_2 ,footer_left[3],3'b000}),
    .o(fg_b_n2));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1183)
  lt_u9_u9 lt33 (
    .ci(1'b0),
    .i0(y[9:1]),
    .i1(9'b000010101),
    .o(bg_b3_n6));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1134)
  lt_u9_u9 lt34 (
    .ci(1'b1),
    .i0(9'b011011011),
    .i1(y[9:1]),
    .o(bg_b3_n3));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1134)
  lt_u8_u8 lt35 (
    .ci(1'b1),
    .i0(8'b00011001),
    .i1(y[9:2]),
    .o(bg_b3_n10));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1135)
  lt_u9_u9 lt36 (
    .ci(1'b0),
    .i0(y[9:1]),
    .i1(9'b000110011),
    .o(bg_b3_n11));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1135)
  lt_u3_u3 lt37 (
    .ci(1'b1),
    .i0(3'b101),
    .i1(period_s[5:3]),
    .o(tens_b2_n));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(38)
  lt_u7_u7 lt38 (
    .ci(1'b1),
    .i0(7'b0001011),
    .i1(x[9:3]),
    .o(bg_b1_n4));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1135)
  lt_u7_u7 lt39 (
    .ci(1'b0),
    .i0(x[9:3]),
    .i1(7'b1000101),
    .o(bg_b1_n2));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1135)
  lt_u4_u4 lt4 (
    .ci(1'b0),
    .i0({\bg_b12[5]_syn_2 ,bg_b12[4],y[3:2]}),
    .i1(4'b0101),
    .o(fg_b3_n2));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1149)
  lt_u4_u4 lt40 (
    .ci(1'b1),
    .i0(4'b0001),
    .i1(y[9:6]),
    .o(gx_b6_n5));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1136)
  lt_u5_u5 lt41 (
    .ci(1'b0),
    .i0(y[9:5]),
    .i1(5'b00011),
    .o(gx_b6_n6));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1136)
  lt_u5_u5 lt42 (
    .ci(1'b1),
    .i0(5'b00111),
    .i1(x[9:5]),
    .o(gx_b6_n4));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1136)
  lt_u5_u5 lt43 (
    .ci(1'b1),
    .i0(5'b01111),
    .i1(period_s[5:1]),
    .o(tens_b3_n));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(39)
  lt_u5_u5 lt44 (
    .ci(1'b0),
    .i0(x[9:5]),
    .i1(5'b01101),
    .o(gx_b6_n2));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1136)
  lt_u4_u4 lt45 (
    .ci(1'b1),
    .i0(4'b0101),
    .i1(period_s[5:2]),
    .o(tens_b4_n1));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(39)
  lt_u6_u6 lt46 (
    .ci(1'b1),
    .i0(6'b000111),
    .i1(y[9:4]),
    .o(bar_b_n1));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1139)
  lt_u5_u5 lt47 (
    .ci(1'b0),
    .i0(y[9:5]),
    .i1(5'b01011),
    .o(bar_b_n2));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1139)
  lt_u5_u5 lt48 (
    .ci(1'b0),
    .i0(y[9:5]),
    .i1(5'b00101),
    .o(bar_b5_n));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1140)
  lt_u6_u6 lt49 (
    .ci(1'b0),
    .i0(y[9:4]),
    .i1(6'b001101),
    .o(bar_b9_n));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1141)
  lt_u4_u4 lt5 (
    .ci(1'b1),
    .i0(4'b0001),
    .i1(x[9:6]),
    .o(panel_n8));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(44)
  lt_u5_u5 lt50 (
    .ci(1'b1),
    .i0(5'b00101),
    .i1(period_s[5:1]),
    .o(tens_b4_n));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(39)
  lt_u2_u2 lt51 (
    .ci(1'b0),
    .i0(y[9:8]),
    .i1(2'b01),
    .o(bar_b10_n1));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1142)
  lt_u6_u6 lt52 (
    .ci(1'b0),
    .i0(y[9:4]),
    .i1(6'b010011),
    .o(bar_b10_n));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1143)
  lt_u3_u3 lt53 (
    .ci(1'b0),
    .i0({\bg_b12[5]_syn_2 ,bg_b12[4],y[3]}),
    .i1(3'b101),
    .o(bg_b6_n2));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1145)
  lt_u4_u4 lt8 (
    .ci(1'b0),
    .i0(x[9:6]),
    .i1(4'b0111),
    .o(bg_b4_n6));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1159)
  lt_u6_u6 lt9 (
    .ci(1'b1),
    .i0(6'b001101),
    .i1({\bg_b12[5]_syn_2 ,bg_b12[4],y[3:0]}),
    .o(bg_b4_n4));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1159)
  binary_mux_s4_w1 mux0 (
    .i0(bits[0]),
    .i1(bits[1]),
    .i10(bits[10]),
    .i11(bits[11]),
    .i12(bits[12]),
    .i13(bits[13]),
    .i14(bits[14]),
    .i15(bits[15]),
    .i2(bits[2]),
    .i3(bits[3]),
    .i4(bits[4]),
    .i5(bits[5]),
    .i6(bits[6]),
    .i7(bits[7]),
    .i8(bits[8]),
    .i9(bits[9]),
    .sel(col2),
    .o(rgb_out_b1_n));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1201)
  binary_mux_s1_w1 mux11_syn_11 (
    .i0(bg_b6[10]),
    .i1(1'b0),
    .sel(bg_b4_n),
    .o(bg_b4[10]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1159)
  binary_mux_s1_w1 mux11_syn_12 (
    .i0(bg_b6[11]),
    .i1(1'b0),
    .sel(bg_b4_n),
    .o(bg_b4[11]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1159)
  binary_mux_s1_w1 mux11_syn_14 (
    .i0(bg_b6[13]),
    .i1(1'b0),
    .sel(bg_b4_n),
    .o(bg_b4[13]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1159)
  binary_mux_s1_w1 mux11_syn_15 (
    .i0(bg_b6[14]),
    .i1(1'b1),
    .sel(bg_b4_n),
    .o(bg_b4[14]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1159)
  binary_mux_s1_w1 mux11_syn_16 (
    .i0(bg_b6[15]),
    .i1(bg_b7_n),
    .sel(bg_b4_n),
    .o(bg_b4[15]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1159)
  binary_mux_s1_w1 mux11_syn_19 (
    .i0(bg_b6[2]),
    .i1(bg_b9[21]),
    .sel(bg_b4_n),
    .o(bg_b4[18]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1159)
  binary_mux_s1_w1 mux11_syn_2 (
    .i0(\bg_b6[14]_syn_2 ),
    .i1(bg_b9[21]),
    .sel(bg_b4_n),
    .o(bg_b4[1]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1159)
  AL_MUX mux11_syn_25 (
    .i0(mux5_syn_24),
    .i1(bg_b9[21]),
    .sel(bg_b4_n),
    .o(mux11_syn_24));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1159)
  AL_MUX mux11_syn_27 (
    .i0(mux5_syn_26),
    .i1(bg_b9[21]),
    .sel(bg_b4_n),
    .o(mux11_syn_26));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1159)
  AL_MUX mux11_syn_29 (
    .i0(mux5_syn_28),
    .i1(bg_b9[21]),
    .sel(bg_b4_n),
    .o(mux11_syn_28));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1159)
  AL_MUX mux11_syn_31 (
    .i0(mux5_syn_30),
    .i1(bg_b9[21]),
    .sel(bg_b4_n),
    .o(mux11_syn_30));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1159)
  and mux11_syn_32 (mux11_syn_33, bg_b4_n_syn_2, bg_b6_n);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1159)
  binary_mux_s1_w1 mux11_syn_5 (
    .i0(bg_b6[4]),
    .i1(bg_b7_n),
    .sel(bg_b4_n),
    .o(bg_b4[4]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1159)
  binary_mux_s1_w1 mux11_syn_8 (
    .i0(bg_b6[7]),
    .i1(bg_b7_n),
    .sel(bg_b4_n),
    .o(bg_b4[7]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1159)
  binary_mux_s1_w1 mux12_syn_1 (
    .i0(volume[0]),
    .i1(brightness[0]),
    .sel(bar_b5_n),
    .o(text_addr_b40[0]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1164)
  binary_mux_s1_w1 mux12_syn_2 (
    .i0(volume[1]),
    .i1(brightness[1]),
    .sel(bar_b5_n),
    .o(text_addr_b40[1]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1164)
  binary_mux_s1_w1 mux12_syn_3 (
    .i0(volume[2]),
    .i1(brightness[2]),
    .sel(bar_b5_n),
    .o(text_addr_b40[2]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1164)
  binary_mux_s1_w1 mux12_syn_4 (
    .i0(volume[3]),
    .i1(brightness[3]),
    .sel(bar_b5_n),
    .o(text_addr_b40[3]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1164)
  binary_mux_s1_w1 mux12_syn_5 (
    .i0(volume[4]),
    .i1(brightness[4]),
    .sel(bar_b5_n),
    .o(text_addr_b40[4]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1164)
  binary_mux_s1_w1 mux12_syn_6 (
    .i0(volume[5]),
    .i1(brightness[5]),
    .sel(bar_b5_n),
    .o(text_addr_b40[5]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1164)
  binary_mux_s1_w1 mux12_syn_7 (
    .i0(volume[6]),
    .i1(brightness[6]),
    .sel(bar_b5_n),
    .o(text_addr_b40[6]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1164)
  binary_mux_s1_w1 mux12_syn_8 (
    .i0(volume[7]),
    .i1(brightness[7]),
    .sel(bar_b5_n),
    .o(text_addr_b40[7]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1164)
  binary_mux_s1_w1 mux14_syn_10 (
    .i0(text_addr_b22_n_syn_2),
    .i1(1'b0),
    .sel(text_addr_b17_n),
    .o(text_addr_b17[9]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1166)
  AL_MUX mux14_syn_12 (
    .i0(1'b0),
    .i1(\x[4]_syn_2 ),
    .sel(text_addr_b17_n),
    .o(mux14_syn_11));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1166)
  AL_MUX mux14_syn_14 (
    .i0(1'b0),
    .i1(slot_b2[1]),
    .sel(text_addr_b17_n),
    .o(mux14_syn_13));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1166)
  binary_mux_s1_w1 mux14_syn_3 (
    .i0(text_addr_b28[2]),
    .i1(slot_b2[2]),
    .sel(text_addr_b17_n),
    .o(text_addr_b17[2]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1166)
  binary_mux_s1_w1 mux14_syn_7 (
    .i0(text_addr_b22_n),
    .i1(1'b0),
    .sel(text_addr_b17_n),
    .o(text_addr_b17[6]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1166)
  binary_mux_s1_w1 mux16_syn_2 (
    .i0(text_addr_b36_n_syn_2),
    .i1(1'b1),
    .sel(\contrast[7]_syn_16 ),
    .o(text_addr_b21[4]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1168)
  AL_MUX mux17_syn_12 (
    .i0(text_addr_b12[0]),
    .i1(\tens[0]_syn_2 ),
    .sel(text_addr_b34_n),
    .o(mux17_syn_11));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1170)
  AL_MUX mux17_syn_14 (
    .i0(text_addr_b12[1]),
    .i1(text_addr_b38[1]),
    .sel(text_addr_b34_n),
    .o(mux17_syn_13));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1170)
  AL_MUX mux17_syn_16 (
    .i0(text_addr_b12[2]),
    .i1(tens_b3_n),
    .sel(text_addr_b34_n),
    .o(mux17_syn_15));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1170)
  AL_MUX mux18_syn_12 (
    .i0(mux17_syn_11),
    .i1(\period_s[0]_syn_2 ),
    .sel(text_addr_b30_n),
    .o(mux18_syn_11));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1171)
  AL_MUX mux18_syn_14 (
    .i0(mux17_syn_13),
    .i1(text_addr_b35[1]),
    .sel(text_addr_b30_n),
    .o(mux18_syn_13));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1171)
  AL_MUX mux18_syn_16 (
    .i0(mux17_syn_15),
    .i1(text_addr_b35[2]),
    .sel(text_addr_b30_n),
    .o(mux18_syn_15));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1171)
  AL_MUX mux18_syn_20 (
    .i0(1'b0),
    .i1(text_addr_b12[5]),
    .sel(mux18_syn_28),
    .o(mux18_syn_19));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1171)
  AL_MUX mux18_syn_26 (
    .i0(1'b1),
    .i1(text_addr_b12[9]),
    .sel(mux18_syn_28),
    .o(mux18_syn_25));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1171)
  and mux18_syn_27 (mux18_syn_28, text_addr_b30_n_syn_2, text_addr_b34_n_syn_2);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1171)
  AL_MUX mux19_syn_12 (
    .i0(mux18_syn_11),
    .i1(1'b0),
    .sel(text_addr_b26_n),
    .o(mux19_syn_11));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1172)
  AL_MUX mux19_syn_14 (
    .i0(mux18_syn_15),
    .i1(1'b0),
    .sel(text_addr_b26_n),
    .o(mux19_syn_13));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1172)
  AL_MUX mux19_syn_16 (
    .i0(mux18_syn_19),
    .i1(1'b1),
    .sel(text_addr_b26_n),
    .o(mux19_syn_15));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1172)
  AL_MUX mux19_syn_18 (
    .i0(1'b0),
    .i1(text_addr_b12[6]),
    .sel(mux19_syn_24),
    .o(mux19_syn_17));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1172)
  AL_MUX mux19_syn_20 (
    .i0(1'b1),
    .i1(text_addr_b12[7]),
    .sel(mux19_syn_24),
    .o(mux19_syn_19));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1172)
  and mux19_syn_23 (mux19_syn_24, text_addr_b26_n_syn_2, mux18_syn_28);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1172)
  binary_mux_s1_w1 mux1_syn_1 (
    .i0(tens_b4_n),
    .i1(1'b0),
    .sel(tens_b4_n1),
    .o(tens_b4[0]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(39)
  AL_MUX mux20_syn_3 (
    .i0(audio_available),
    .i1(1'b1),
    .sel(audio_busy),
    .o(mux20_syn_4));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1174)
  not mux20_syn_7 (mux20_syn_8, mux20_syn_4);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1174)
  AL_MUX mux21_syn_14 (
    .i0(1'b0),
    .i1(\x[4]_syn_2 ),
    .sel(\bar_b10[0]_syn_2 ),
    .o(mux21_syn_13));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1169)
  AL_MUX mux21_syn_18 (
    .i0(1'b0),
    .i1(slot_b2[1]),
    .sel(\bar_b10[0]_syn_2 ),
    .o(mux21_syn_17));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1169)
  AL_MUX mux21_syn_22 (
    .i0(1'b0),
    .i1(slot_b2[2]),
    .sel(\bar_b10[0]_syn_2 ),
    .o(mux21_syn_21));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1169)
  AL_MUX mux21_syn_26 (
    .i0(1'b0),
    .i1(text_addr_b35[3]),
    .sel(mux21_syn_44),
    .o(mux21_syn_25));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1169)
  AL_MUX mux21_syn_30 (
    .i0(mux19_syn_15),
    .i1(audio_busy),
    .sel(\bar_b10[0]_syn_2 ),
    .o(mux21_syn_29));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1169)
  AL_MUX mux21_syn_34 (
    .i0(mux19_syn_17),
    .i1(mux20_syn_4),
    .sel(\bar_b10[0]_syn_2 ),
    .o(mux21_syn_33));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1169)
  AL_MUX mux21_syn_38 (
    .i0(mux19_syn_19),
    .i1(mux20_syn_4),
    .sel(\bar_b10[0]_syn_2 ),
    .o(mux21_syn_37));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1169)
  AL_MUX mux21_syn_42 (
    .i0(1'b0),
    .i1(mux18_syn_25),
    .sel(mux21_syn_49),
    .o(mux21_syn_41));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1169)
  and mux21_syn_43 (mux21_syn_44, bar_b10[0], text_addr_b30_n);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1169)
  and mux21_syn_48 (mux21_syn_49, bar_b10[0], text_addr_b26_n_syn_2);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1169)
  binary_mux_s1_w1 mux21_syn_9 (
    .i0(mux20_syn_8),
    .i1(text_addr_b26_n),
    .sel(bar_b10[0]),
    .o(text_addr_b20[8]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1169)
  AL_MUX mux23_syn_14 (
    .i0(1'b0),
    .i1(text_addr_b21[4]),
    .sel(bar_b1_n1),
    .o(mux23_syn_13));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1167)
  AL_MUX mux23_syn_16 (
    .i0(1'b0),
    .i1(\contrast[7]_syn_16 ),
    .sel(bar_b1_n1),
    .o(mux23_syn_15));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1167)
  AL_MUX mux23_syn_18 (
    .i0(1'b0),
    .i1(contrast[7]),
    .sel(bar_b1_n1),
    .o(mux23_syn_17));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1167)
  binary_mux_s1_w1 mux23_syn_9 (
    .i0(text_addr_b20[8]),
    .i1(\contrast[7]_syn_16 ),
    .sel(bar_b1_n1),
    .o(text_addr_b16[8]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1167)
  AL_MUX mux25_syn_16 (
    .i0(mux21_syn_21),
    .i1(text_addr_b17[2]),
    .sel(fg_b5_n),
    .o(mux25_syn_15));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1163)
  AL_MUX mux25_syn_18 (
    .i0(mux21_syn_25),
    .i1(text_addr_b28[3]),
    .sel(fg_b5_n),
    .o(mux25_syn_17));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1163)
  AL_MUX mux25_syn_20 (
    .i0(1'b0),
    .i1(bar_b7_n3_syn_4),
    .sel(bar_b1_n1),
    .o(mux25_syn_19));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1163)
  AL_MUX mux25_syn_22 (
    .i0(mux23_syn_13),
    .i1(text_addr_b17[6]),
    .sel(fg_b5_n),
    .o(mux25_syn_21));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1163)
  AL_MUX mux25_syn_24 (
    .i0(mux23_syn_15),
    .i1(1'b1),
    .sel(fg_b5_n),
    .o(mux25_syn_23));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1163)
  AL_MUX mux25_syn_26 (
    .i0(mux23_syn_17),
    .i1(text_addr_b17[9]),
    .sel(fg_b5_n),
    .o(mux25_syn_25));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1163)
  not mux25_syn_31 (mux25_syn_30, fg_b5_n);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1163)
  AL_MUX mux25_syn_33 (
    .i0(mux14_syn_11),
    .i1(mux21_syn_13),
    .sel(mux25_syn_30),
    .o(mux25_syn_32));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1163)
  AL_MUX mux25_syn_41 (
    .i0(mux14_syn_13),
    .i1(mux21_syn_17),
    .sel(mux25_syn_30),
    .o(mux25_syn_40));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1163)
  binary_mux_s1_w1 mux25_syn_9 (
    .i0(text_addr_b16[8]),
    .i1(\text_addr_b17[9]_syn_2 ),
    .sel(fg_b5_n),
    .o(text_addr_b13[8]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1163)
  AL_MUX mux28_syn_12 (
    .i0(mux9_syn_11),
    .i1(x[3]),
    .sel(fg_b3_n),
    .o(mux28_syn_11));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1161)
  and mux28_syn_13 (mux28_syn_14, fg_b3_n_syn_2, gx_b10_n_syn_2);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1161)
  not mux28_syn_22 (mux28_syn_23, mux28_syn_14);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1161)
  binary_mux_s1_w1 mux2_syn_1 (
    .i0(tens_b4[0]),
    .i1(1'b1),
    .sel(tens_b3_n),
    .o(tens_b3[0]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(39)
  AL_MUX mux30_syn_22 (
    .i0(mux25_syn_15),
    .i1(text_addr_b12[2]),
    .sel(fg_b3_n_syn_2),
    .o(mux30_syn_21));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1161)
  AL_MUX mux30_syn_26 (
    .i0(mux25_syn_17),
    .i1(1'b0),
    .sel(fg_b3_n_syn_2),
    .o(mux30_syn_25));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1161)
  AL_MUX mux30_syn_30 (
    .i0(mux25_syn_19),
    .i1(text_addr_b12[5]),
    .sel(fg_b3_n_syn_2),
    .o(mux30_syn_29));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1161)
  AL_MUX mux30_syn_34 (
    .i0(mux25_syn_21),
    .i1(text_addr_b12[6]),
    .sel(fg_b3_n_syn_2),
    .o(mux30_syn_33));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1161)
  AL_MUX mux30_syn_38 (
    .i0(mux25_syn_23),
    .i1(text_addr_b12[7]),
    .sel(fg_b3_n_syn_2),
    .o(mux30_syn_37));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1161)
  AL_MUX mux30_syn_44 (
    .i0(mux25_syn_25),
    .i1(text_addr_b12[9]),
    .sel(fg_b3_n_syn_2),
    .o(mux30_syn_43));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1161)
  AL_MUX mux30_syn_46 (
    .i0(mux25_syn_32),
    .i1(text_addr_b12[0]),
    .sel(fg_b3_n_syn_2),
    .o(mux30_syn_45));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1161)
  AL_MUX mux30_syn_48 (
    .i0(mux25_syn_40),
    .i1(text_addr_b12[1]),
    .sel(fg_b3_n_syn_2),
    .o(mux30_syn_47));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1161)
  AL_MUX mux31_syn_11 (
    .i0(1'b0),
    .i1(fg_b8_n),
    .sel(mux31_syn_18),
    .o(mux31_syn_12));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1161)
  not mux31_syn_13 (mux31_syn_14, mux31_syn_12);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1161)
  and mux31_syn_17 (mux31_syn_18, fg_b3_n, bar_b10_n_syn_2);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1161)
  binary_mux_s1_w1 mux34_syn_11 (
    .i0(1'b1),
    .i1(bg_b4[10]),
    .sel(bar_b_n),
    .o(bg_b2[10]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1139)
  binary_mux_s1_w1 mux34_syn_12 (
    .i0(bg_b3_n),
    .i1(bg_b4[11]),
    .sel(bar_b_n),
    .o(bg_b2[11]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1139)
  AL_MUX mux34_syn_13 (
    .i0(bg_b3_n1),
    .i1(bg_b8_n_syn_2),
    .sel(mux34_syn_65),
    .o(bg_b2[12]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1139)
  binary_mux_s1_w1 mux34_syn_14 (
    .i0(mux67_syn_18),
    .i1(bg_b4[13]),
    .sel(bar_b_n),
    .o(bg_b2[13]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1139)
  binary_mux_s1_w1 mux34_syn_15 (
    .i0(bg_b3_n1),
    .i1(bg_b4[14]),
    .sel(bar_b_n),
    .o(bg_b2[14]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1139)
  binary_mux_s1_w1 mux34_syn_16 (
    .i0(bg_b3_n),
    .i1(bg_b4[15]),
    .sel(bar_b_n),
    .o(bg_b2[15]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1139)
  binary_mux_s1_w1 mux34_syn_19 (
    .i0(bg_b3_n_syn_2),
    .i1(bg_b4[18]),
    .sel(bar_b_n),
    .o(bg_b2[18]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1139)
  binary_mux_s1_w1 mux34_syn_2 (
    .i0(bg_b3_n1_syn_2),
    .i1(bg_b4[1]),
    .sel(bar_b_n),
    .o(bg_b2[1]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1139)
  AL_MUX mux34_syn_20 (
    .i0(1'b0),
    .i1(bg_b10_n_syn_2),
    .sel(mux34_syn_62),
    .o(bg_b2[19]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1139)
  not mux34_syn_25 (mux34_syn_24, bar_b_n);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1139)
  AL_MUX mux34_syn_27 (
    .i0(mux11_syn_24),
    .i1(mux67_syn_18),
    .sel(mux34_syn_24),
    .o(mux34_syn_26));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1139)
  binary_mux_s1_w1 mux34_syn_3 (
    .i0(bg_b3_n_syn_2),
    .i1(bg_b6[2]),
    .sel(bar_b_n),
    .o(bg_b2[2]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1139)
  AL_MUX mux34_syn_35 (
    .i0(mux11_syn_26),
    .i1(bg_b3_n1),
    .sel(mux34_syn_24),
    .o(mux34_syn_34));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1139)
  binary_mux_s1_w1 mux34_syn_5 (
    .i0(mux67_syn_18),
    .i1(bg_b4[4]),
    .sel(bar_b_n),
    .o(bg_b2[4]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1139)
  AL_MUX mux34_syn_51 (
    .i0(mux11_syn_28),
    .i1(bg_b3_n1),
    .sel(mux34_syn_24),
    .o(mux34_syn_50));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1139)
  AL_MUX mux34_syn_57 (
    .i0(mux11_syn_30),
    .i1(bg_b3_n1),
    .sel(mux34_syn_24),
    .o(mux34_syn_56));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1139)
  and mux34_syn_61 (mux34_syn_62, bar_b_n, mux11_syn_33);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1139)
  and mux34_syn_64 (mux34_syn_65, bar_b_n, bg_b6_n);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1139)
  binary_mux_s1_w1 mux34_syn_8 (
    .i0(bg_b3_n),
    .i1(bg_b4[7]),
    .sel(bar_b_n),
    .o(bg_b2[7]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1139)
  not mux34_syn_82 (mux34_syn_83, mux34_syn_65);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1139)
  not mux34_syn_84 (mux34_syn_85, mux34_syn_62);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1139)
  AL_MUX mux34_syn_9 (
    .i0(1'b0),
    .i1(mux4_syn_10),
    .sel(mux34_syn_62),
    .o(bg_b2[8]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1139)
  AL_MUX mux35_syn_30 (
    .i0(mux30_syn_29),
    .i1(1'b0),
    .sel(mux34_syn_24),
    .o(mux35_syn_29));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1139)
  and mux35_syn_45 (mux35_syn_46, bar_b_n, fg_b3_n);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1139)
  AL_MUX mux35_syn_9 (
    .i0(1'b0),
    .i1(text_addr_b13[8]),
    .sel(mux35_syn_46),
    .o(text_addr_b3[8]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1139)
  AL_MUX mux36_syn_20 (
    .i0(mux28_syn_11),
    .i1(gx_b6[3]),
    .sel(mux34_syn_24),
    .o(mux36_syn_19));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1139)
  and mux36_syn_21 (mux36_syn_22, bar_b_n, mux28_syn_23);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1139)
  not mux36_syn_36 (mux36_syn_37, mux36_syn_22);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1139)
  AL_MUX mux37_syn_16 (
    .i0(gy_b6[2]),
    .i1(\y[2]_syn_2 ),
    .sel(mux36_syn_22),
    .o(mux37_syn_15));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1139)
  AL_MUX mux37_syn_20 (
    .i0(gy_b6[3]),
    .i1(gy_b11[3]),
    .sel(mux36_syn_22),
    .o(mux37_syn_19));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1139)
  binary_mux_s1_w1 mux3_syn_1 (
    .i0(tens_b3[0]),
    .i1(1'b0),
    .sel(tens_b2_n),
    .o(tens_b2[0]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(38)
  binary_mux_s1_w1 mux3_syn_2 (
    .i0(tens_b4_n1),
    .i1(1'b0),
    .sel(tens_b2_n),
    .o(tens_b2[1]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(38)
  AL_MUX mux41_syn_11 (
    .i0(1'b0),
    .i1(mux31_syn_12),
    .sel(bar_b_n),
    .o(mux41_syn_12));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1139)
  and mux41_syn_18 (mux41_syn_19, bar_b_n, mux31_syn_18);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1139)
  AL_MUX mux41_syn_3 (
    .i0(1'b1),
    .i1(bar_b10_n),
    .sel(mux35_syn_46),
    .o(mux41_syn_4));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1139)
  AL_MUX mux41_syn_5 (
    .i0(1'b1),
    .i1(fg_b8_n),
    .sel(mux41_syn_19),
    .o(mux41_syn_6));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1139)
  binary_mux_s1_w1 mux42_syn_13 (
    .i0(bg_b2[12]),
    .i1(1'b1),
    .sel(bg_b1_n),
    .o(bg_b1[12]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1179)
  binary_mux_s1_w1 mux42_syn_14 (
    .i0(bg_b2[13]),
    .i1(1'b0),
    .sel(bg_b1_n),
    .o(bg_b1[13]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1179)
  binary_mux_s1_w1 mux42_syn_15 (
    .i0(bg_b2[14]),
    .i1(1'b1),
    .sel(bg_b1_n),
    .o(bg_b1[14]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1179)
  binary_mux_s1_w1 mux42_syn_2 (
    .i0(bg_b2[1]),
    .i1(1'b0),
    .sel(bg_b1_n),
    .o(bg_b1[1]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1179)
  binary_mux_s1_w1 mux42_syn_4 (
    .i0(mux67_syn_8),
    .i1(1'b1),
    .sel(bg_b1_n),
    .o(bg_b1[3]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1179)
  binary_mux_s1_w1 mux42_syn_5 (
    .i0(bg_b2[4]),
    .i1(1'b0),
    .sel(bg_b1_n),
    .o(bg_b1[4]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1179)
  AL_MUX mux43_syn_12 (
    .i0(mux68_syn_2),
    .i1(\text_addr_b15[0]_syn_2 ),
    .sel(fg_b1_n),
    .o(mux43_syn_11));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1180)
  AL_MUX mux43_syn_14 (
    .i0(mux68_syn_4),
    .i1(text_addr_b4[1]),
    .sel(fg_b1_n),
    .o(mux43_syn_13));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1180)
  AL_MUX mux43_syn_16 (
    .i0(mux68_syn_6),
    .i1(text_addr_b4[2]),
    .sel(fg_b1_n),
    .o(mux43_syn_15));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1180)
  AL_MUX mux43_syn_18 (
    .i0(1'b0),
    .i1(text_addr_b4[3]),
    .sel(fg_b1_n),
    .o(mux43_syn_17));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1180)
  AL_MUX mux43_syn_22 (
    .i0(1'b0),
    .i1(gx_b6_n_syn_2),
    .sel(mux43_syn_26),
    .o(mux43_syn_21));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1180)
  and mux43_syn_25 (mux43_syn_26, fg_b1_n_syn_2, mux34_syn_24);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1180)
  binary_mux_s1_w1 mux43_syn_5 (
    .i0(1'b0),
    .i1(text_addr_b4[4]),
    .sel(fg_b1_n),
    .o(text_addr_b1[4]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1180)
  AL_MUX mux44_syn_10 (
    .i0(x[2]),
    .i1(gx_b6[2]),
    .sel(mux44_syn_14),
    .o(mux44_syn_9));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1180)
  AL_MUX mux44_syn_12 (
    .i0(1'b0),
    .i1(\x[3]_syn_2 ),
    .sel(fg_b1_n),
    .o(mux44_syn_11));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1180)
  and mux44_syn_13 (mux44_syn_14, fg_b1_n_syn_2, mux36_syn_37);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1180)
  AL_MUX mux44_syn_6 (
    .i0(x[0]),
    .i1(gx_b6[0]),
    .sel(mux44_syn_14),
    .o(mux44_syn_5));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1180)
  AL_MUX mux44_syn_8 (
    .i0(x[1]),
    .i1(gx_b6[1]),
    .sel(mux44_syn_14),
    .o(mux44_syn_7));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1180)
  AL_MUX mux45_syn_6 (
    .i0(y[0]),
    .i1(gy_b6[0]),
    .sel(mux44_syn_14),
    .o(mux45_syn_5));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1180)
  AL_MUX mux45_syn_8 (
    .i0(y[1]),
    .i1(gy_b6[1]),
    .sel(mux44_syn_14),
    .o(mux45_syn_7));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1180)
  AL_MUX mux47_syn_12 (
    .i0(mux43_syn_11),
    .i1(text_addr_b2[0]),
    .sel(fg_b_n),
    .o(mux47_syn_11));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1183)
  AL_MUX mux47_syn_14 (
    .i0(mux43_syn_13),
    .i1(text_addr_b2[1]),
    .sel(fg_b_n),
    .o(mux47_syn_13));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1183)
  AL_MUX mux47_syn_16 (
    .i0(mux43_syn_15),
    .i1(text_addr_b2[2]),
    .sel(fg_b_n),
    .o(mux47_syn_15));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1183)
  AL_MUX mux47_syn_18 (
    .i0(mux43_syn_17),
    .i1(text_addr_b2[3]),
    .sel(fg_b_n),
    .o(mux47_syn_17));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1183)
  AL_MUX mux47_syn_20 (
    .i0(fg_b1_n),
    .i1(text_addr_b2[5]),
    .sel(fg_b_n),
    .o(mux47_syn_19));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1183)
  AL_MUX mux47_syn_24 (
    .i0(mux43_syn_21),
    .i1(text_addr_b2[7]),
    .sel(fg_b_n),
    .o(mux47_syn_23));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1183)
  binary_mux_s1_w1 mux47_syn_5 (
    .i0(text_addr_b1[4]),
    .i1(text_addr_b2[4]),
    .sel(fg_b_n),
    .o(text_addr_b[4]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1183)
  AL_MUX mux47_syn_9 (
    .i0(1'b1),
    .i1(text_addr_b3[8]),
    .sel(al_140),
    .o(text_addr_b[8]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1183)
  AL_MUX mux48_syn_12 (
    .i0(mux44_syn_11),
    .i1(gx_b2[3]),
    .sel(fg_b_n),
    .o(mux48_syn_11));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1183)
  not mux4_syn_15 (mux4_syn_16, mux4_syn_10);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1147)
  AL_MUX mux4_syn_9 (
    .i0(bg_b10_n),
    .i1(1'b0),
    .sel(bg_b8_n),
    .o(mux4_syn_10));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1147)
  AL_MUX mux50_syn_15 (
    .i0(1'b1),
    .i1(mux41_syn_12),
    .sel(al_140),
    .o(mux50_syn_16));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1183)
  AL_MUX mux50_syn_3 (
    .i0(1'b0),
    .i1(mux41_syn_4),
    .sel(al_140),
    .o(mux50_syn_4));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1183)
  AL_MUX mux50_syn_7 (
    .i0(1'b0),
    .i1(mux41_syn_6),
    .sel(al_140),
    .o(mux50_syn_8));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1183)
  binary_mux_s1_w1 mux51_syn_10 (
    .i0(rgb[9]),
    .i1(mux34_syn_83),
    .sel(panel),
    .o(bg[9]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1132)
  binary_mux_s1_w1 mux51_syn_11 (
    .i0(rgb[10]),
    .i1(bg_b2[10]),
    .sel(panel),
    .o(bg[10]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1132)
  binary_mux_s1_w1 mux51_syn_12 (
    .i0(rgb[11]),
    .i1(bg_b2[11]),
    .sel(panel),
    .o(bg[11]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1132)
  binary_mux_s1_w1 mux51_syn_13 (
    .i0(rgb[12]),
    .i1(bg_b1[12]),
    .sel(panel),
    .o(bg[12]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1132)
  binary_mux_s1_w1 mux51_syn_14 (
    .i0(rgb[13]),
    .i1(bg_b1[13]),
    .sel(panel),
    .o(bg[13]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1132)
  binary_mux_s1_w1 mux51_syn_15 (
    .i0(rgb[14]),
    .i1(bg_b1[14]),
    .sel(panel),
    .o(bg[14]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1132)
  binary_mux_s1_w1 mux51_syn_16 (
    .i0(rgb[15]),
    .i1(bg_b2[15]),
    .sel(panel),
    .o(bg[15]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1132)
  binary_mux_s1_w1 mux51_syn_17 (
    .i0(rgb[16]),
    .i1(1'b0),
    .sel(panel),
    .o(bg[16]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1132)
  binary_mux_s1_w1 mux51_syn_19 (
    .i0(rgb[18]),
    .i1(bg_b2[18]),
    .sel(panel),
    .o(bg[18]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1132)
  binary_mux_s1_w1 mux51_syn_2 (
    .i0(rgb[1]),
    .i1(bg_b1[1]),
    .sel(panel),
    .o(bg[1]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1132)
  binary_mux_s1_w1 mux51_syn_20 (
    .i0(rgb[19]),
    .i1(bg_b2[19]),
    .sel(panel),
    .o(bg[19]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1132)
  binary_mux_s1_w1 mux51_syn_21 (
    .i0(rgb[20]),
    .i1(\bg_b2[7]_syn_2 ),
    .sel(panel),
    .o(bg[20]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1132)
  binary_mux_s1_w1 mux51_syn_23 (
    .i0(rgb[22]),
    .i1(bg_b2[15]),
    .sel(panel),
    .o(bg[22]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1132)
  binary_mux_s1_w1 mux51_syn_24 (
    .i0(rgb[23]),
    .i1(1'b0),
    .sel(panel),
    .o(bg[23]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1132)
  not mux51_syn_26 (mux51_syn_25, panel);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1132)
  AL_MUX mux51_syn_28 (
    .i0(1'b0),
    .i1(rgb[0]),
    .sel(mux51_syn_25),
    .o(mux51_syn_27));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1132)
  binary_mux_s1_w1 mux51_syn_3 (
    .i0(rgb[2]),
    .i1(bg_b2[2]),
    .sel(panel),
    .o(bg[2]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1132)
  AL_MUX mux51_syn_36 (
    .i0(bg_b1_n),
    .i1(rgb[6]),
    .sel(mux51_syn_25),
    .o(mux51_syn_35));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1132)
  binary_mux_s1_w1 mux51_syn_4 (
    .i0(rgb[3]),
    .i1(bg_b1[3]),
    .sel(panel),
    .o(bg[3]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1132)
  binary_mux_s1_w1 mux51_syn_5 (
    .i0(rgb[4]),
    .i1(bg_b1[4]),
    .sel(panel),
    .o(bg[4]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1132)
  AL_MUX mux51_syn_52 (
    .i0(bg_b1_n),
    .i1(rgb[17]),
    .sel(mux51_syn_25),
    .o(mux51_syn_51));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1132)
  AL_MUX mux51_syn_58 (
    .i0(bg_b1_n),
    .i1(rgb[21]),
    .sel(mux51_syn_25),
    .o(mux51_syn_57));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1132)
  binary_mux_s1_w1 mux51_syn_6 (
    .i0(rgb[5]),
    .i1(mux34_syn_85),
    .sel(panel),
    .o(bg[5]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1132)
  binary_mux_s1_w1 mux51_syn_8 (
    .i0(rgb[7]),
    .i1(bg_b2[7]),
    .sel(panel),
    .o(bg[7]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1132)
  binary_mux_s1_w1 mux51_syn_9 (
    .i0(rgb[8]),
    .i1(bg_b2[8]),
    .sel(panel),
    .o(bg[8]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1132)
  AL_MUX mux52_syn_26 (
    .i0(mux47_syn_17),
    .i1(1'b0),
    .sel(mux51_syn_25),
    .o(mux52_syn_25));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1132)
  AL_MUX mux52_syn_30 (
    .i0(mux47_syn_19),
    .i1(1'b0),
    .sel(mux51_syn_25),
    .o(mux52_syn_29));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1132)
  AL_MUX mux52_syn_38 (
    .i0(mux47_syn_23),
    .i1(1'b1),
    .sel(mux51_syn_25),
    .o(mux52_syn_37));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1132)
  and mux52_syn_45 (mux52_syn_46, panel, fg_b_n);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1132)
  binary_mux_s1_w1 mux52_syn_5 (
    .i0(1'b0),
    .i1(text_addr_b[4]),
    .sel(panel),
    .o(text_addr[4]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1132)
  binary_mux_s1_w1 mux52_syn_9 (
    .i0(1'b0),
    .i1(text_addr_b[8]),
    .sel(panel),
    .o(text_addr[8]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1132)
  AL_MUX mux53_syn_12 (
    .i0(1'b0),
    .i1(x[1]),
    .sel(mux52_syn_46),
    .o(mux53_syn_11));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1132)
  AL_MUX mux53_syn_16 (
    .i0(1'b0),
    .i1(x[2]),
    .sel(mux52_syn_46),
    .o(mux53_syn_15));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1132)
  AL_MUX mux53_syn_20 (
    .i0(mux48_syn_11),
    .i1(1'b0),
    .sel(mux51_syn_25),
    .o(mux53_syn_19));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1132)
  AL_MUX mux53_syn_8 (
    .i0(1'b0),
    .i1(x[0]),
    .sel(mux52_syn_46),
    .o(mux53_syn_7));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1132)
  AL_MUX mux54_syn_12 (
    .i0(1'b0),
    .i1(y[1]),
    .sel(mux52_syn_46),
    .o(mux54_syn_11));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1132)
  AL_MUX mux54_syn_16 (
    .i0(1'b0),
    .i1(y[2]),
    .sel(mux60_syn_27),
    .o(mux54_syn_15));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1132)
  AL_MUX mux54_syn_20 (
    .i0(1'b0),
    .i1(\y[3]_syn_2 ),
    .sel(mux60_syn_27),
    .o(mux54_syn_19));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1132)
  AL_MUX mux54_syn_8 (
    .i0(1'b0),
    .i1(y[0]),
    .sel(mux52_syn_46),
    .o(mux54_syn_7));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1132)
  binary_mux_s1_w1 mux5_syn_11 (
    .i0(1'b1),
    .i1(mux4_syn_10),
    .sel(bg_b6_n),
    .o(bg_b6[10]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1145)
  binary_mux_s1_w1 mux5_syn_12 (
    .i0(bg_b3_n),
    .i1(mux4_syn_10),
    .sel(bg_b6_n),
    .o(bg_b6[11]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1145)
  binary_mux_s1_w1 mux5_syn_14 (
    .i0(mux67_syn_18),
    .i1(mux4_syn_16),
    .sel(bg_b6_n),
    .o(bg_b6[13]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1145)
  binary_mux_s1_w1 mux5_syn_15 (
    .i0(bg_b3_n1),
    .i1(bg_b10_n),
    .sel(bg_b6_n),
    .o(bg_b6[14]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1145)
  binary_mux_s1_w1 mux5_syn_16 (
    .i0(bg_b3_n),
    .i1(bg_b8_n),
    .sel(bg_b6_n),
    .o(bg_b6[15]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1145)
  AL_MUX mux5_syn_25 (
    .i0(mux67_syn_18),
    .i1(bg_b10_n_syn_2),
    .sel(bg_b6_n),
    .o(mux5_syn_24));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1145)
  AL_MUX mux5_syn_27 (
    .i0(bg_b3_n1),
    .i1(mux4_syn_16),
    .sel(bg_b6_n),
    .o(mux5_syn_26));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1145)
  AL_MUX mux5_syn_29 (
    .i0(bg_b3_n1),
    .i1(bg_b10_n_syn_2),
    .sel(bg_b6_n),
    .o(mux5_syn_28));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1145)
  binary_mux_s1_w1 mux5_syn_3 (
    .i0(bg_b3_n_syn_2),
    .i1(1'b0),
    .sel(bg_b6_n),
    .o(bg_b6[2]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1145)
  AL_MUX mux5_syn_31 (
    .i0(bg_b3_n1),
    .i1(mux4_syn_10),
    .sel(bg_b6_n),
    .o(mux5_syn_30));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1145)
  binary_mux_s1_w1 mux5_syn_5 (
    .i0(mux67_syn_18),
    .i1(1'b0),
    .sel(bg_b6_n),
    .o(bg_b6[4]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1145)
  binary_mux_s1_w1 mux5_syn_8 (
    .i0(bg_b3_n),
    .i1(bg_b10_n),
    .sel(bg_b6_n),
    .o(bg_b6[7]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1145)
  AL_MUX mux60_syn_13 (
    .i0(1'b0),
    .i1(mux41_syn_12),
    .sel(panel),
    .o(mux60_syn_14));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1132)
  AL_MUX mux60_syn_15 (
    .i0(1'b0),
    .i1(mux50_syn_16),
    .sel(panel),
    .o(mux60_syn_16));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1132)
  AL_MUX mux60_syn_17 (
    .i0(1'b1),
    .i1(mux41_syn_4),
    .sel(panel),
    .o(mux60_syn_18));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1132)
  AL_MUX mux60_syn_19 (
    .i0(1'b1),
    .i1(al_140),
    .sel(panel),
    .o(mux60_syn_20));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1132)
  and mux60_syn_21 (mux60_syn_22, panel, bar_b_n);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1132)
  not mux60_syn_24 (mux60_syn_25, mux60_syn_22);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1132)
  not mux60_syn_26 (mux60_syn_27, mux60_syn_20);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1132)
  AL_MUX mux60_syn_3 (
    .i0(1'b1),
    .i1(mux50_syn_4),
    .sel(panel),
    .o(mux60_syn_4));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1132)
  AL_MUX mux60_syn_5 (
    .i0(1'b1),
    .i1(mux41_syn_6),
    .sel(panel),
    .o(mux60_syn_6));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1132)
  AL_MUX mux60_syn_7 (
    .i0(1'b1),
    .i1(mux50_syn_8),
    .sel(panel),
    .o(mux60_syn_8));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1132)
  AL_MUX mux60_syn_9 (
    .i0(1'b1),
    .i1(mux31_syn_14),
    .sel(mux60_syn_22),
    .o(mux60_syn_10));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1132)
  AL_MUX mux63_syn_1 (
    .i0(1'b0),
    .i1(\x[0]_syn_2 ),
    .sel(mux63_syn_12),
    .o(x_b[0]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1191)
  AL_MUX mux63_syn_10 (
    .i0(1'b0),
    .i1(x_b4[9]),
    .sel(mux63_syn_12),
    .o(x_b[9]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1191)
  and mux63_syn_11 (mux63_syn_12, vs, de);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1191)
  AL_MUX mux63_syn_2 (
    .i0(1'b0),
    .i1(x_b4[1]),
    .sel(mux63_syn_12),
    .o(x_b[1]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1191)
  AL_MUX mux63_syn_3 (
    .i0(1'b0),
    .i1(x_b4[2]),
    .sel(mux63_syn_12),
    .o(x_b[2]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1191)
  AL_MUX mux63_syn_4 (
    .i0(1'b0),
    .i1(x_b4[3]),
    .sel(mux63_syn_12),
    .o(x_b[3]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1191)
  AL_MUX mux63_syn_5 (
    .i0(1'b0),
    .i1(x_b4[4]),
    .sel(mux63_syn_12),
    .o(x_b[4]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1191)
  AL_MUX mux63_syn_6 (
    .i0(1'b0),
    .i1(x_b4[5]),
    .sel(mux63_syn_12),
    .o(x_b[5]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1191)
  AL_MUX mux63_syn_7 (
    .i0(1'b0),
    .i1(x_b4[6]),
    .sel(mux63_syn_12),
    .o(x_b[6]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1191)
  AL_MUX mux63_syn_8 (
    .i0(1'b0),
    .i1(x_b4[7]),
    .sel(mux63_syn_12),
    .o(x_b[7]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1191)
  AL_MUX mux63_syn_9 (
    .i0(1'b0),
    .i1(x_b4[8]),
    .sel(mux63_syn_12),
    .o(x_b[8]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1191)
  binary_mux_s1_w1 mux64_syn_12 (
    .i0(\y[0]_syn_2 ),
    .i1(1'b0),
    .sel(x_b_n),
    .o(y_b[0]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1191)
  binary_mux_s1_w1 mux64_syn_13 (
    .i0(y_b2[1]),
    .i1(1'b0),
    .sel(x_b_n),
    .o(y_b[1]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1191)
  binary_mux_s1_w1 mux64_syn_14 (
    .i0(y_b2[2]),
    .i1(1'b0),
    .sel(x_b_n),
    .o(y_b[2]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1191)
  binary_mux_s1_w1 mux64_syn_15 (
    .i0(y_b2[3]),
    .i1(1'b0),
    .sel(x_b_n),
    .o(y_b[3]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1191)
  binary_mux_s1_w1 mux64_syn_16 (
    .i0(y_b2[4]),
    .i1(1'b0),
    .sel(x_b_n),
    .o(y_b[4]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1191)
  binary_mux_s1_w1 mux64_syn_17 (
    .i0(y_b2[5]),
    .i1(1'b0),
    .sel(x_b_n),
    .o(y_b[5]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1191)
  binary_mux_s1_w1 mux64_syn_18 (
    .i0(y_b2[6]),
    .i1(1'b0),
    .sel(x_b_n),
    .o(y_b[6]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1191)
  binary_mux_s1_w1 mux64_syn_19 (
    .i0(y_b2[7]),
    .i1(1'b0),
    .sel(x_b_n),
    .o(y_b[7]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1191)
  binary_mux_s1_w1 mux64_syn_20 (
    .i0(y_b2[8]),
    .i1(1'b0),
    .sel(x_b_n),
    .o(y_b[8]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1191)
  binary_mux_s1_w1 mux64_syn_21 (
    .i0(y_b2[9]),
    .i1(1'b0),
    .sel(x_b_n),
    .o(y_b[9]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1191)
  binary_mux_s1_w1 mux64_syn_31 (
    .i0(y_b1_n),
    .i1(1'b1),
    .sel(x_b_n),
    .o(mux64_syn_2[9]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1191)
  binary_mux_s1_w1 mux65_syn_10 (
    .i0(bg2[9]),
    .i1(fg2[20]),
    .sel(rgb_out_b1_n),
    .o(rgb_out_b1[9]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1201)
  binary_mux_s1_w1 mux65_syn_12 (
    .i0(bg2[11]),
    .i1(fg2[11]),
    .sel(rgb_out_b1_n),
    .o(rgb_out_b1[11]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1201)
  binary_mux_s1_w1 mux65_syn_13 (
    .i0(bg2[12]),
    .i1(fg2[12]),
    .sel(rgb_out_b1_n),
    .o(rgb_out_b1[12]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1201)
  binary_mux_s1_w1 mux65_syn_14 (
    .i0(bg2[13]),
    .i1(fg2[13]),
    .sel(rgb_out_b1_n),
    .o(rgb_out_b1[13]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1201)
  binary_mux_s1_w1 mux65_syn_15 (
    .i0(bg2[14]),
    .i1(fg2[14]),
    .sel(rgb_out_b1_n),
    .o(rgb_out_b1[14]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1201)
  binary_mux_s1_w1 mux65_syn_16 (
    .i0(bg2[15]),
    .i1(fg2[15]),
    .sel(rgb_out_b1_n),
    .o(rgb_out_b1[15]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1201)
  binary_mux_s1_w1 mux65_syn_19 (
    .i0(bg2[18]),
    .i1(fg2[11]),
    .sel(rgb_out_b1_n),
    .o(rgb_out_b1[18]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1201)
  binary_mux_s1_w1 mux65_syn_2 (
    .i0(bg2[1]),
    .i1(fg2[1]),
    .sel(rgb_out_b1_n),
    .o(rgb_out_b1[1]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1201)
  binary_mux_s1_w1 mux65_syn_20 (
    .i0(bg2[19]),
    .i1(fg2[19]),
    .sel(rgb_out_b1_n),
    .o(rgb_out_b1[19]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1201)
  binary_mux_s1_w1 mux65_syn_21 (
    .i0(bg2[20]),
    .i1(fg2[20]),
    .sel(rgb_out_b1_n),
    .o(rgb_out_b1[20]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1201)
  binary_mux_s1_w1 mux65_syn_22 (
    .i0(bg2[21]),
    .i1(fg2[1]),
    .sel(rgb_out_b1_n),
    .o(rgb_out_b1[21]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1201)
  binary_mux_s1_w1 mux65_syn_23 (
    .i0(bg2[22]),
    .i1(fg2[14]),
    .sel(rgb_out_b1_n),
    .o(rgb_out_b1[22]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1201)
  binary_mux_s1_w1 mux65_syn_24 (
    .i0(bg2[23]),
    .i1(fg2[23]),
    .sel(rgb_out_b1_n),
    .o(rgb_out_b1[23]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1201)
  binary_mux_s1_w1 mux65_syn_4 (
    .i0(bg2[3]),
    .i1(fg2[23]),
    .sel(rgb_out_b1_n),
    .o(rgb_out_b1[3]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1201)
  binary_mux_s1_w1 mux65_syn_5 (
    .i0(bg2[4]),
    .i1(fg2[19]),
    .sel(rgb_out_b1_n),
    .o(rgb_out_b1[4]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1201)
  binary_mux_s1_w1 mux65_syn_6 (
    .i0(bg2[5]),
    .i1(fg2[23]),
    .sel(rgb_out_b1_n),
    .o(rgb_out_b1[5]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1201)
  binary_mux_s1_w1 mux65_syn_7 (
    .i0(bg2[6]),
    .i1(fg2[14]),
    .sel(rgb_out_b1_n),
    .o(rgb_out_b1[6]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1201)
  binary_mux_s1_w1 mux65_syn_8 (
    .i0(bg2[7]),
    .i1(fg2[15]),
    .sel(rgb_out_b1_n),
    .o(rgb_out_b1[7]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1201)
  binary_mux_s1_w1 mux65_syn_9 (
    .i0(bg2[8]),
    .i1(fg2[19]),
    .sel(rgb_out_b1_n),
    .o(rgb_out_b1[8]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1201)
  AL_MUX mux66_syn_1 (
    .i0(1'b0),
    .i1(bg2[0]),
    .sel(mux66_syn_26),
    .o(rgb_out[0]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1201)
  binary_mux_s1_w1 mux66_syn_10 (
    .i0(1'b0),
    .i1(rgb_out_b1[9]),
    .sel(de_out),
    .o(rgb_out[9]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1201)
  AL_MUX mux66_syn_11 (
    .i0(1'b0),
    .i1(bg2[10]),
    .sel(mux66_syn_26),
    .o(rgb_out[10]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1201)
  binary_mux_s1_w1 mux66_syn_12 (
    .i0(1'b0),
    .i1(rgb_out_b1[11]),
    .sel(de_out),
    .o(rgb_out[11]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1201)
  binary_mux_s1_w1 mux66_syn_13 (
    .i0(1'b0),
    .i1(rgb_out_b1[12]),
    .sel(de_out),
    .o(rgb_out[12]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1201)
  binary_mux_s1_w1 mux66_syn_14 (
    .i0(1'b0),
    .i1(rgb_out_b1[13]),
    .sel(de_out),
    .o(rgb_out[13]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1201)
  binary_mux_s1_w1 mux66_syn_15 (
    .i0(1'b0),
    .i1(rgb_out_b1[14]),
    .sel(de_out),
    .o(rgb_out[14]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1201)
  binary_mux_s1_w1 mux66_syn_16 (
    .i0(1'b0),
    .i1(rgb_out_b1[15]),
    .sel(de_out),
    .o(rgb_out[15]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1201)
  AL_MUX mux66_syn_17 (
    .i0(1'b0),
    .i1(bg2[16]),
    .sel(mux66_syn_26),
    .o(rgb_out[16]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1201)
  AL_MUX mux66_syn_18 (
    .i0(1'b0),
    .i1(bg2[17]),
    .sel(mux66_syn_26),
    .o(rgb_out[17]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1201)
  binary_mux_s1_w1 mux66_syn_19 (
    .i0(1'b0),
    .i1(rgb_out_b1[18]),
    .sel(de_out),
    .o(rgb_out[18]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1201)
  binary_mux_s1_w1 mux66_syn_2 (
    .i0(1'b0),
    .i1(rgb_out_b1[1]),
    .sel(de_out),
    .o(rgb_out[1]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1201)
  binary_mux_s1_w1 mux66_syn_20 (
    .i0(1'b0),
    .i1(rgb_out_b1[19]),
    .sel(de_out),
    .o(rgb_out[19]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1201)
  binary_mux_s1_w1 mux66_syn_21 (
    .i0(1'b0),
    .i1(rgb_out_b1[20]),
    .sel(de_out),
    .o(rgb_out[20]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1201)
  binary_mux_s1_w1 mux66_syn_22 (
    .i0(1'b0),
    .i1(rgb_out_b1[21]),
    .sel(de_out),
    .o(rgb_out[21]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1201)
  binary_mux_s1_w1 mux66_syn_23 (
    .i0(1'b0),
    .i1(rgb_out_b1[22]),
    .sel(de_out),
    .o(rgb_out[22]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1201)
  binary_mux_s1_w1 mux66_syn_24 (
    .i0(1'b0),
    .i1(rgb_out_b1[23]),
    .sel(de_out),
    .o(rgb_out[23]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1201)
  and mux66_syn_25 (mux66_syn_26, de_out, rgb_out_b1_n_syn_2);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1201)
  AL_MUX mux66_syn_3 (
    .i0(1'b0),
    .i1(bg2[2]),
    .sel(mux66_syn_26),
    .o(rgb_out[2]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1201)
  binary_mux_s1_w1 mux66_syn_4 (
    .i0(1'b0),
    .i1(rgb_out_b1[3]),
    .sel(de_out),
    .o(rgb_out[3]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1201)
  binary_mux_s1_w1 mux66_syn_5 (
    .i0(1'b0),
    .i1(rgb_out_b1[4]),
    .sel(de_out),
    .o(rgb_out[4]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1201)
  binary_mux_s1_w1 mux66_syn_6 (
    .i0(1'b0),
    .i1(rgb_out_b1[5]),
    .sel(de_out),
    .o(rgb_out[5]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1201)
  binary_mux_s1_w1 mux66_syn_7 (
    .i0(1'b0),
    .i1(rgb_out_b1[6]),
    .sel(de_out),
    .o(rgb_out[6]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1201)
  binary_mux_s1_w1 mux66_syn_8 (
    .i0(1'b0),
    .i1(rgb_out_b1[7]),
    .sel(de_out),
    .o(rgb_out[7]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1201)
  binary_mux_s1_w1 mux66_syn_9 (
    .i0(1'b0),
    .i1(rgb_out_b1[8]),
    .sel(de_out),
    .o(rgb_out[8]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1201)
  not mux67_syn_17 (mux67_syn_18, mux67_syn_8);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1135)
  AL_MUX mux67_syn_7 (
    .i0(bg_b3_n),
    .i1(1'b1),
    .sel(bg_b3_n1),
    .o(mux67_syn_8));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1135)
  AL_MUX mux68_syn_1 (
    .i0(1'b0),
    .i1(\x[5]_syn_2 ),
    .sel(gx_b6_n),
    .o(mux68_syn_2));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1136)
  AL_MUX mux68_syn_3 (
    .i0(1'b0),
    .i1(text_addr_b11[1]),
    .sel(gx_b6_n),
    .o(mux68_syn_4));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1136)
  AL_MUX mux68_syn_5 (
    .i0(1'b0),
    .i1(text_addr_b11[2]),
    .sel(gx_b6_n),
    .o(mux68_syn_6));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1136)
  binary_mux_s1_w1 mux69_syn_1 (
    .i0(1'b0),
    .i1(x[1]),
    .sel(gx_b6_n),
    .o(gx_b6[0]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1136)
  binary_mux_s1_w1 mux69_syn_2 (
    .i0(1'b0),
    .i1(x[2]),
    .sel(gx_b6_n),
    .o(gx_b6[1]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1136)
  binary_mux_s1_w1 mux69_syn_3 (
    .i0(1'b0),
    .i1(x[3]),
    .sel(gx_b6_n),
    .o(gx_b6[2]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1136)
  binary_mux_s1_w1 mux69_syn_4 (
    .i0(1'b0),
    .i1(x[4]),
    .sel(gx_b6_n),
    .o(gx_b6[3]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1136)
  binary_mux_s1_w1 mux6_syn_1 (
    .i0(tens_b2[0]),
    .i1(1'b1),
    .sel(tens_b1_n),
    .o(tens_b1[0]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(38)
  binary_mux_s1_w1 mux70_syn_1 (
    .i0(1'b0),
    .i1(y[1]),
    .sel(gx_b6_n),
    .o(gy_b6[0]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1136)
  binary_mux_s1_w1 mux70_syn_2 (
    .i0(1'b0),
    .i1(y[2]),
    .sel(gx_b6_n),
    .o(gy_b6[1]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1136)
  binary_mux_s1_w1 mux70_syn_3 (
    .i0(1'b0),
    .i1(y[3]),
    .sel(gx_b6_n),
    .o(gy_b6[2]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1136)
  binary_mux_s1_w1 mux70_syn_4 (
    .i0(1'b0),
    .i1(y[4]),
    .sel(gx_b6_n),
    .o(gy_b6[3]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1136)
  AL_MUX mux71_syn_8 (
    .i0(bg_b15[5]),
    .i1(y[5]),
    .sel(bar_b10_n),
    .o(mux71_syn_7));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1143)
  binary_mux_s1_w1 mux72_syn_1 (
    .i0(bar_b10_n),
    .i1(1'b0),
    .sel(bar_b10_n1),
    .o(bar_b10[0]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1142)
  AL_MUX mux73_syn_8 (
    .i0(mux71_syn_7),
    .i1(\bg_b15[5]_syn_2 ),
    .sel(bar_b10_n1),
    .o(mux73_syn_7));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1142)
  binary_mux_s1_w1 mux74_syn_1 (
    .i0(bar_b10[0]),
    .i1(1'b1),
    .sel(bar_b9_n),
    .o(bar_b9[0]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1141)
  binary_mux_s1_w1 mux74_syn_2 (
    .i0(bar_b10_n),
    .i1(1'b0),
    .sel(bar_b9_n),
    .o(bar_b9[1]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1141)
  AL_MUX mux75_syn_8 (
    .i0(1'b0),
    .i1(\y[5]_syn_2 ),
    .sel(bar_b9_n),
    .o(mux75_syn_7));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1141)
  binary_mux_s1_w1 mux76_syn_1 (
    .i0(bar_b9[0]),
    .i1(1'b0),
    .sel(bar_b5_n),
    .o(bar_b5[0]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1140)
  AL_MUX mux77_syn_5 (
    .i0(\y[4]_syn_2 ),
    .i1(y[4]),
    .sel(bar_b5[0]),
    .o(bg_b12[4]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1140)
  AL_MUX mux77_syn_8 (
    .i0(mux75_syn_7),
    .i1(bg_b15[5]),
    .sel(bar_b5_n),
    .o(mux77_syn_7));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1140)
  binary_mux_s1_w1 mux7_syn_1 (
    .i0(tens_b1[0]),
    .i1(1'b0),
    .sel(tens_b_n),
    .o(tens[0]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(38)
  binary_mux_s1_w1 mux7_syn_2 (
    .i0(tens_b2[1]),
    .i1(1'b1),
    .sel(tens_b_n),
    .o(tens[1]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(38)
  binary_mux_s1_w1 mux8_syn_1 (
    .i0(mux68_syn_2),
    .i1(text_addr_b15[0]),
    .sel(gx_b10_n),
    .o(text_addr_b12[0]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1149)
  binary_mux_s1_w1 mux8_syn_10 (
    .i0(gx_b6_n_syn_2),
    .i1(1'b0),
    .sel(gx_b10_n),
    .o(text_addr_b12[9]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1149)
  binary_mux_s1_w1 mux8_syn_2 (
    .i0(mux68_syn_4),
    .i1(text_addr_b15[1]),
    .sel(gx_b10_n),
    .o(text_addr_b12[1]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1149)
  binary_mux_s1_w1 mux8_syn_3 (
    .i0(mux68_syn_6),
    .i1(text_addr_b15[2]),
    .sel(gx_b10_n),
    .o(text_addr_b12[2]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1149)
  binary_mux_s1_w1 mux8_syn_6 (
    .i0(1'b0),
    .i1(text_addr_b15[5]),
    .sel(gx_b10_n),
    .o(text_addr_b12[5]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1149)
  binary_mux_s1_w1 mux8_syn_7 (
    .i0(1'b0),
    .i1(text_addr_b15[6]),
    .sel(gx_b10_n),
    .o(text_addr_b12[6]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1149)
  binary_mux_s1_w1 mux8_syn_8 (
    .i0(gx_b6_n_syn_2),
    .i1(text_addr_b15[7]),
    .sel(gx_b10_n),
    .o(text_addr_b12[7]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1149)
  AL_MUX mux9_syn_12 (
    .i0(gx_b6[3]),
    .i1(\x[3]_syn_2 ),
    .sel(gx_b10_n),
    .o(mux9_syn_11));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1149)
  ne_w8 neq0 (
    .i0(text_addr_b40),
    .i1(8'b00000000),
    .o(text_addr_b33_n18));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(28)
  ne_w8 neq1 (
    .i0(text_addr_b40),
    .i1(8'b01000000),
    .o(text_addr_b33_n19));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(28)
  ne_w8 neq2 (
    .i0(text_addr_b40),
    .i1(8'b01100000),
    .o(text_addr_b33_n15));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(28)
  ne_w8 neq3 (
    .i0(text_addr_b40),
    .i1(8'b10000000),
    .o(text_addr_b33_n12));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(28)
  ne_w8 neq4 (
    .i0(text_addr_b40),
    .i1(8'b11000000),
    .o(text_addr_b33_n8));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(28)
  and panel_i1 (panel, panel_n1, panel_n2);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(44)
  and panel_i2 (panel_n1, panel_n3, panel_n4);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(44)
  and panel_i3 (panel_n3, panel_n5, panel_n6);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(44)
  and panel_i4 (panel_n5, panel_n7, panel_n8);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(44)
  not \period_s[0]_syn_1  (\period_s[0]_syn_2 , period_s[0]);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  EG_LOGIC_BRAM #(
    //.FORCE_KEEP("OFF"),
    .INIT_FILE({"init_str:001101 101101 100110 101001 111101 011101 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 110010 111110 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 001110 000101 111110 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 100111 001011 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 100011 110001 011011 111011 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 ",
"000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000011 100111 110011 110001 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 010110 110001 001001 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 110001 001001 010010 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 100010 010110 100101 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 010101 010001 101100 00",
"1100 011100 101000 001111 000010 111100 010111 000000 000000 101011 010001 001111 010011 111010 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 010101 010001 101100 001100 011100 110000 001111 110110 000110 000000 000000 000000 000000 101011 010001 001111 011010 011110 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 010101 010001 101100 001100 011100 110000 001111 110011 110001 100001 101110 000011 100111 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000111 100111 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 110101 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 0000",
"00 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 110100 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 001010 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 111001 101010 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 110111 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 110110 000001 000000 000000 000000 000000 000000 000000",
" 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 011001 110111 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 100000 010000 110000 001000 101000 011000 111000 000100 100100 010100 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 0",
"00000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000",
"000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 000000 00000",
"0 000000"}),
    .ADDR_WIDTH_A(10),
    .ADDR_WIDTH_B(10),
    .BYTE_A(1),
    .BYTE_B(1),
    .BYTE_ENABLE(0),
    .DATA_DEPTH_A(1024),
    .DATA_DEPTH_B(1024),
    .DATA_WIDTH_A(6),
    .DATA_WIDTH_B(6),
    .DEBUGGABLE("NO"),
    .FILL_ALL("NONE"),
    .IMPLEMENT("9K"),
    .MODE("SP"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("NOREG"),
    .RESETMODE("ASYNC"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    ramread0_syn_5 (
    .addra({\text_addr[9]_syn_4 ,text_addr[8],\text_addr[7]_syn_4 ,\text_addr[6]_syn_4 ,\text_addr[5]_syn_4 ,text_addr[4],\text_addr[3]_syn_2 ,\text_addr[2]_syn_6 ,\text_addr[1]_syn_6 ,\text_addr[0]_syn_16 }),
    .addrb(10'b0000000000),
    .bea(1'b0),
    .beb(1'b0),
    .cea(1'b1),
    .ceb(1'b0),
    .clka(clk),
    .clkb(1'b0),
    .dia(6'b000000),
    .dib(6'b000000),
    .ocea(1'b1),
    .oceb(1'b0),
    .rsta(rst),
    .rstb(1'b0),
    .wea(1'b0),
    .web(1'b0),
    .doa(char_id[5:0]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1195)
  EG_LOGIC_BRAM #(
    //.FORCE_KEEP("OFF"),
    .INIT_FILE({"init_str:0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000000000111100 0000000000100110 0000000001000010 0000000001000010 0000000001000010 0000000001000010 0000000001000010 0000000001000010 0000000001100010 0000000000110100 0000000000011000 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000000000010000 0000000000011000 0000000000011110 0000000000011010 0000000000011000 0000000000011000 0000000000011000 0000000000011000 0000000000011000 0000000000011000 0000000000011000 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000000000111100 0000000001100110 0000000001000010 0000000001100000 0000000000100000 0000000000110000 0000000000010000 0000000000001000 0000000000000100 0000000001111110 000000000111",
"1110 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000000000111100 0000000001100110 0000000001000010 0000000001100000 0000000000110000 0000000000110000 0000000001100000 0000000001000000 0000000001000010 0000000000100110 0000000000011000 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000000000100000 0000000000110000 0000000000111000 0000000000101000 0000000000100100 0000000000100110 0000000000100010 0000000011111111 0000000000100000 0000000000100000 0000000000100000 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000000001111100 0000000000000110 0000000000000010 0000000000001010 0000000000111110 0000000001100010 0000000001000000 0000000001000000 0000000001100011 0000000000110110 0000000000011100 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000000000010000 0000000000011000 0000000000001000 0000000000001100 0000000000111110 0000000001000110 0000000011000010",
" 0000000011000010 0000000001000010 0000000001100110 0000000000111100 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000000001111110 0000000001000000 0000000001100000 0000000000100000 0000000000110000 0000000000010000 0000000000011000 0000000000001000 0000000000001000 0000000000001100 0000000000001100 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000000000111100 0000000001100010 0000000001000010 0000000001100010 0000000000111110 0000000000111110 0000000001000010 0000000001000011 0000000001000010 0000000001100110 0000000000111100 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000000000111100 0000000001100010 0000000001000011 0000000001000011 0000000001100011 0000000000110110 0000000000111100 0000000000010000 0000000000011000 0000000000001000 0000000000001100 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000000000100110 0000000000100101 0000000000010101 000",
"0000000010101 0000000000010110 0000000001101000 0000000001011000 0000000001010100 0000000001010100 0000000001010010 0000000001100010 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000000001111110 0000000000000010 0000000000000010 0000000000000010 0000000001111110 0000000001111110 0000000000000010 0000000000000010 0000000000000010 0000000001111110 0000000001111110 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000000001100010 0000000000100010 0000000000010010 0000000000011010 0000000000001110 0000000000011110 0000000000010010 0000000000110010 0000000000100010 0000000001100010 0000000011000010 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000000001000011 0000000001100010 0000000000100110 0000000000110100 0000000000011100 0000000000011000 0000000000011000 0000000000011000 0000000000011000 0000000000011000 0000000000011000 0000000000000000 0000000000000000 0000000000000000 0000000",
"000000000 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0111111111111110 0111111111111110 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0111111111111110 0000000010000000 0000000010000000 0000000010000000 0000000010000000 0000011010000000 0000110010000000 0001100010000000 0011000010000000 0000000010000000 0000000010000000 0000000010000000 0000000010000000 0000000000000000 0000000000000000 0111111111111110 0000000100000000 0000000010000000 0000000011000000 0000011011100000 0000110010100000 0001100010011000 0011000010001100 0010000010000110 0000000010000000 0000000010000000 0000000010000000 0000000010000000 0000000000000000 0000000000000000 0000000000000000 0000000110000000 0000000110000000 0000000110000000 0011111111111100 0010000110000100 0010000110000100 0010000110000100 0010000110000100 0011111111111100 0010000110000100 0000000110000000 0000000110000000 00000001100",
"00000 0000000110000000 0000000110000000 0000000000000000 0111111111111110 0000000000000000 0000111111110000 0000100000010000 0000111111110000 0000000000000000 0111111111111110 0111111111111110 0100000000000010 0000011111100000 0000011000100000 0100011000110000 0111111000011100 0000000000000100 0000000000000000 0000000000000000 0011111100011000 0000010111001000 0000010001001000 0000010001001100 0000010001001100 0111111111001010 0000010001001010 0000010001001000 0000110001001000 0000100101001000 0100100111001000 0101000111001000 0111001001001000 0000000000001000 0000000000000000 0000000000000000 0000110010000010 0000000011000110 0111111111001100 0000010001101000 0000010001100000 0011111111010000 0000010001000000 0000010001001000 0011111111001100 0000010001000100 0000010001000110 0111111111000010 0000000001000000 0000000001000000 0000000000000000 0000000000000000 0001010000000000 0011010000000000 0000010000000010 0011111111110110 0000010000011100 0010010111010000 0010010000010000 0001010111010000 000101010101110",
"0 0001110101010100 0000100101010110 0101110111010010 0101011000011010 0110001110001000 0000000000000000 0000000000000000 0000000110000000 0000000110000000 0001000110001100 0001000110001100 0001000110001100 0001000110001100 0001111111111100 0000000110000000 0010000110000100 0010000110000100 0010000110000100 0010000110000100 0011111111111100 0011111111111100 0010000000000000 0000000000000000 0000000000010000 0000000000010000 0000000000010000 0011111011111110 0010001010010000 0010001010010000 0010001010010000 0010001010011000 0010001010001000 0010001010001000 0010001010001000 0011111010001100 0010001011000100 0010001001100110 0000000000000000 0000000000000000 0000001001000000 0000110000100000 0001111111111000 0001000011000000 0111111111111110 0000010001100000 0000100100010000 0111000011001110 0010011000110010 0001000111000000 0000110001110000 0000001100000000 0000000011111100 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0111111111111110 0001100000000000 0001100000000000 0001100111111000 00",
"01100100001000 0001100100001000 0001100100001000 0001100100001000 0001100111111000 0001100100001000 0001100000001000 0001100000000000 0001111000000000 0000011000000000 0000000000000000 0001000100001000 0111111111001000 0100010001001000 0101010101001000 0101010101111110 0100010001001000 0111111111001000 0000000000001000 0011111110001000 0010000010111000 0011111110001110 0010000010000000 0011111110000000 0010000010000000 0000000000000000 0000000000000000 0001000000000000 0001000000000000 0001000001111110 0001000001000000 0111111111000000 0001000000100100 0001000100101100 0001000100111000 0001001000110000 0001001000110000 0001000001101000 0001000001001100 0001000000000110 0001110000000010 0000000000000000 0000000000000000 0001111111111000 0001000000001000 0001000000001000 0001111111111000 0010000000001000 0110000000001000 0011111111111000 0000110000000000 0000110000000000 0111111111111110 0000110000000000 0000110000010000 0000110000110000 0000111100000000 0000000000000000 0000000000000000 0000000110000000 000000",
"0110000000 0000000110000000 0000110110110000 0001000110011000 0110000110001000 0000000110000100 0000000110000110 0001100110000000 0000110110000000 0000011000000000 0000001100000000 0000000011100000 0000000000111100 0000000000000000 0000000000000000 0000000100000000 0011111111111100 0000100001000100 0000100001000100 0011111111110100 0000100001000100 0000111111000100 0000000000000100 0001111111110100 0000100011000100 0000010110000100 0000001100000110 0111110011100010 0100000000010000 0000000000000000 0000000000000000 0011111110000000 0010000010111110 0010000010110000 0011111110110000 0000010000111110 0000010000000110 0011111110000110 0010010010011110 0010010010010000 0011111110010000 0000010010010000 0010010000010000 0111110000010000 0100001111011100 0000000000000000 0000000000000000 0000000010001000 0001000010001000 0001111010001000 0000000110001000 0100000010111110 0110000010001000 0011111100001000 0011111110111000 0010000010001110 0010000010001010 0011111110001000 0010000010001000 0011111110001000 0010000010",
"001110 0000000010000000 0000000000000000 0000010000001000 0111111111001000 0100000011011110 0100011011001000 0000001000001000 0000001000001000 0111111111111000 0001000100001110 0001000110001010 0000101110001000 0000111000001000 0011111000001000 0110000111101100 0000000000000000 0000000000000000 0000000000000000 0011000000001000 0011111111001000 0011010010001000 0001010010011110 0111111111001000 0000110100001000 0001010110001000 0110010011011100 0111111111101110 0010010011001000 0011111111001000 0010010011001000 0010010011001000 0011111111001110 0010000011000000 0000000000000000 0000010000011000 0000001000010000 0111111011111110 0011001000001000 0011001100001000 0001001101111000 0001001001001000 0001010001001000 0001010001001000 0000110001001100 0000110001000100 0001011001000110 0110001111110010 0100000000000000 0000000000000000 0000000000000000 0000010000110000 0000010010110100 0000011011110000 0111111111111110 0010001000111000 0010001001111100 0011001110110110 0001001100010000 0001010011111110 00010100100010",
"00 0001110001001100 0000100001110000 0001011010110000 0110001100001100 0000000000000010 0000000000000000 0001111111111000 0001111111111000 0001100000001000 0001111111111000 0000000000000000 0111111111111110 0000000010001000 0001111111111000 0001001010001000 0001001011111000 0000110110001000 0001110011111110 0111001010000000 0000000000000000 0000000000000000 0000000000000000 0000000000001000 0011111110001000 0000000000001000 0000000000111110 0000000000111110 0111111111001000 0000010000011100 0000010000101100 0011010111101100 0010010110001010 0110010010001010 0100010011001000 0000010001001000 0000011100001000 0000000000000000 0000000000000000 0000000100000000 0000000100000100 0000000100000100 0010000100000100 0011100100000100 0000111101111100 0000001100000100 0000000100000100 0000000100000100 0000000100000100 0000000101000100 0110000101110100 0110001100011110 0011111000000100 0000000000000000 0000000000000000 0011111111111000 0011000110001000 0011000110001000 0011111111111000 0011000110001000 0011000110001000 0",
"011000110001000 0011111111111000 0011000110001100 0011000110001100 0011000110000100 0011000110000100 0001100110000110 0000000000000000 0000000000000000 0000000000000000 0000000000000100 0111111110000100 0000000000000110 0000000001111110 0011111100010010 0010000100010000 0010000100010000 0010000101111110 0011111100011000 0011000100011000 0011001100111000 0001001001101100 0001100000000100 0111111110000010 0000000000000000 0000000000000000 0000010001111000 0000010000010100 0011010100010000 0110010100010000 0100010101111110 0000010110011000 0010010010111000 0010010001011100 0011000001010100 0001100000010110 0000110000010010 0000011000010000 0000000111010000 0000000000010000 0000000000000000 0000000000000000 0011100000000000 0000011111111100 0000000110000000 0000100001000000 0000011000110000 0000001111111000 0000100011000000 0011000000110000 0111111111111100 0000000100000000 0000100100010000 0011000100001000 0110000100000100 0000000111000010 0000000000000000 0000000000000000 0000010000001000 0111111111001100 00000",
"01000100100 0000001000110010 0001000100011110 0011000110001000 0111111110001000 0000101000100100 0000101100011110 0000101100000000 0000100100100000 0100100110011110 0111100011000010 0000000001000000 0000000000000000 0000000000000000 0011111111111100 0010001001001100 0011111111111100 0000000110000000 0011111111111100 0001111111110000 0000100000010000 0000111111110000 0000100000010000 0000111111110000 0000111111110000 0000100000010000 0111111111111110 0000000000000000 0000000000000000 0000000000000000 0000000000000100 0000111110001100 0000100010011000 0000100010000000 0000100011000000 0111100001101110 0000000000001000 0001111111001000 0001000010001000 0000100110001000 0000110100101000 0000011000111000 0000111100011000 0111100011001000 0100000000100000 0000000000000000 0111111111000100 0000001000001100 0000001000001000 0011111111000000 0011001100000000 0011000100001110 0111111111101000 0000000000001000 0000000000001000 0011111110001000 0010000010111000 0010000010011000 0010000010001000 0011111110001000 001000001",
"0000000 0000000000000000 0000011000001000 0000101001111110 0001101100001000 0011000110000100 0110000011010100 0000000100010010 0011000101111110 0001110100010000 0000011100010000 0000000101111110 0010000100010110 0110000100010000 0011111100010000 0000000000010000 0000000000000000 0000000000000000 0011111111000100 0011000001001100 0011000001001000 0011111111000000 0011000001000000 0011111111000000 0000000001001110 0011001101001000 0001111001001000 0001110001001000 0011001111001000 0010000011001000 0000000000111100 0111111111100010 0000000000000010 0000000000000000 0000000000000000 0001111111111100 0000000110000000 0111111111111110 0000000110000000 0001111111111000 0001000110001000 0001111111111000 0001000110001000 0001111111111000 0000000110000000 0011111111111100 0000000110000000 0111111111111110 0000000000000000 0000000000000000 0001111111111000 0001111111111000 0001000000001000 0001111111111000 0111111111111110 0000000000000000 0001111111111000 0001111111111000 0001000110001000 0001111111111000 0001111111111",
"100 0000000110000000 0111111111111110 0000000000000000 0000000000000000 0000000000000000 0000000000110000 0000110000110000 0000011000110000 0000001100110000 0000000110110000 0000000010110000 0111111111111110 0000000100110000 0000001100110000 0000001000110000 0000010000110000 0001110110110000 0111100001110000 0010000000110000 0000000000000000 0000000000000000 0011111110011000 0010000000010000 0010000000000110 0010011111100110 0010010000100110 0010010000100110 0010011111100110 0010010000100110 0010010000100110 0010011111100110 0010000000000110 0010000000000110 0011000000000110 0000000000000000 0000000000000000 0000000000000000 0111111111011110 0000000000010010 0011111110010010 0010000010011010 0011111110011010 0000000000010010 0111111111110010 0101101001100010 0100101001110010 0101111101011010 0100010001000010 0100010001000010 0110000001000010 0000000000000000 0000000000000000 0000000000000000 0000001000011000 0001111111111110 0001100101111110 0000111110011000 0011110001111110 0010110000000000 1111111101111110 ",
"0010110001000010 0010110001111110 0011111101000010 0000110001111110 0000110001000010 0000011001100010 0000000000000000 0000000000000000 0000000000000000 0000000110000000 0011111111111100 0000110000110000 0000010000100000 0000011000100000 0111111111111110 0000000000000000 0001111111111000 0001100000011000 0001111111111000 0001100000011000 0001100000011000 0001111111111000 0001100000011000 0000000000000000 0000000000000000 0111111111000000 0000010000111110 0000010000001000 0011111110001000 0010000010001000 0010010010001000 0010010010001000 0010010010001000 0010010010111000 0010011010000110 0001101000000000 0011000110000000 0110000011100000 0000000000000000 0000000000000000 0000000000000000 0000000010000000 0000000110000000 0111111111111110 0000111111111000 0000100000010000 0000100000010000 0000111111111000 0111111111111110 0110000000000100 0110011111100100 0110010000100100 0110010000100100 0110011111100100 0111000000000100 0001000000000000 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000",
"000000000000 0000000000000000 0000000000000000 0000000000011000 0000000000011000 0000000000000000 0000000000000000 0000000000011000 0000000000011000 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000000000000000 0000000000000000 00000000",
"00000000"}),
    .ADDR_WIDTH_A(10),
    .ADDR_WIDTH_B(10),
    .BYTE_A(1),
    .BYTE_B(1),
    .BYTE_ENABLE(0),
    .DATA_DEPTH_A(1024),
    .DATA_DEPTH_B(1024),
    .DATA_WIDTH_A(16),
    .DATA_WIDTH_B(16),
    .DEBUGGABLE("NO"),
    .FILL_ALL("NONE"),
    .IMPLEMENT("9K"),
    .MODE("SP"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("NOREG"),
    .RESETMODE("ASYNC"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    ramread1_syn_4 (
    .addra({char_id[5:0],row1}),
    .addrb(10'b0000000000),
    .bea(1'b0),
    .beb(1'b0),
    .cea(1'b1),
    .ceb(1'b0),
    .clka(clk),
    .clkb(1'b0),
    .dia(16'b0000000000000000),
    .dib(16'b0000000000000000),
    .ocea(1'b1),
    .oceb(1'b0),
    .rsta(1'b0),
    .rstb(1'b0),
    .wea(1'b0),
    .web(1'b0),
    .doa(bits));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1199)
  not rgb_out_b1_n_syn_1 (rgb_out_b1_n_syn_2, rgb_out_b1_n);
  AL_DFF_X \row1_reg[0]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(\gy[0]_syn_2 ),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(row1[0]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_DFF_X \row1_reg[1]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(\gy[1]_syn_2 ),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(row1[1]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_DFF_X \row1_reg[2]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(\gy[2]_syn_2 ),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(row1[2]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_DFF_X \row1_reg[3]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(\gy[3]_syn_2 ),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(row1[3]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_MUX sel1_syn_39 (
    .i0(1'b0),
    .i1(volume[6]),
    .sel(sel1_syn_78),
    .o(sel1_syn_40));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1152)
  AL_MUX sel1_syn_41 (
    .i0(1'b0),
    .i1(sel7_syn_8[1]),
    .sel(sel1_syn_81),
    .o(sel1_syn_42));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1152)
  AL_MUX sel1_syn_43 (
    .i0(1'b0),
    .i1(sel7_syn_8[2]),
    .sel(sel1_syn_81),
    .o(sel1_syn_44));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1152)
  AL_MUX sel1_syn_45 (
    .i0(1'b0),
    .i1(sel7_syn_2[3]),
    .sel(\bar_b5[0]_syn_2 ),
    .o(sel1_syn_46));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1152)
  AL_MUX sel1_syn_47 (
    .i0(1'b0),
    .i1(sel7_syn_2[4]),
    .sel(\bar_b5[0]_syn_2 ),
    .o(sel1_syn_48));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1152)
  AL_MUX sel1_syn_51 (
    .i0(sel5_syn_2[0]),
    .i1(sel4_syn_2[0]),
    .sel(\bar_b5[0]_syn_2 ),
    .o(sel1_syn_52));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1152)
  AL_MUX sel1_syn_53 (
    .i0(sel5_syn_2[1]),
    .i1(sel4_syn_2[1]),
    .sel(\bar_b5[0]_syn_2 ),
    .o(sel1_syn_54));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1152)
  AL_MUX sel1_syn_55 (
    .i0(sel5_syn_2[2]),
    .i1(sel4_syn_2[2]),
    .sel(\bar_b5[0]_syn_2 ),
    .o(sel1_syn_56));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1152)
  AL_MUX sel1_syn_57 (
    .i0(sel5_syn_2[3]),
    .i1(sel4_syn_2[3]),
    .sel(\bar_b5[0]_syn_2 ),
    .o(sel1_syn_58));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1152)
  AL_MUX sel1_syn_59 (
    .i0(sel5_syn_2[4]),
    .i1(sel4_syn_2[4]),
    .sel(\bar_b5[0]_syn_2 ),
    .o(sel1_syn_60));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1152)
  binary_mux_s1_w1 sel1_syn_64 (
    .i0(1'b0),
    .i1(sel1_syn_11[3]),
    .sel(bar_b10_n),
    .o(sel1_syn_2[3]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1152)
  binary_mux_s1_w1 sel1_syn_65 (
    .i0(1'b0),
    .i1(sel1_syn_11[4]),
    .sel(bar_b10_n),
    .o(sel1_syn_2[4]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1152)
  binary_mux_s1_w1 sel1_syn_66 (
    .i0(1'b0),
    .i1(sel1_syn_11[5]),
    .sel(bar_b10_n),
    .o(sel1_syn_2[5]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1152)
  binary_mux_s1_w1 sel1_syn_67 (
    .i0(1'b0),
    .i1(sel1_syn_11[6]),
    .sel(bar_b10_n),
    .o(sel1_syn_2[6]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1152)
  binary_mux_s1_w1 sel1_syn_68 (
    .i0(1'b0),
    .i1(sel1_syn_11[7]),
    .sel(bar_b10_n),
    .o(sel1_syn_2[7]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1152)
  binary_mux_s1_w1 sel1_syn_72 (
    .i0(sel1_syn_40),
    .i1(sel1_syn_52),
    .sel(\bar_b9[1]_syn_2 ),
    .o(sel1_syn_11[3]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1152)
  binary_mux_s1_w1 sel1_syn_73 (
    .i0(sel1_syn_42),
    .i1(sel1_syn_54),
    .sel(\bar_b9[1]_syn_2 ),
    .o(sel1_syn_11[4]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1152)
  binary_mux_s1_w1 sel1_syn_74 (
    .i0(sel1_syn_44),
    .i1(sel1_syn_56),
    .sel(\bar_b9[1]_syn_2 ),
    .o(sel1_syn_11[5]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1152)
  binary_mux_s1_w1 sel1_syn_75 (
    .i0(sel1_syn_46),
    .i1(sel1_syn_58),
    .sel(\bar_b9[1]_syn_2 ),
    .o(sel1_syn_11[6]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1152)
  binary_mux_s1_w1 sel1_syn_76 (
    .i0(sel1_syn_48),
    .i1(sel1_syn_60),
    .sel(\bar_b9[1]_syn_2 ),
    .o(sel1_syn_11[7]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1152)
  and sel1_syn_77 (sel1_syn_78, \bar_b5[0]_syn_2 , sel7_syn_46);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1152)
  and sel1_syn_80 (sel1_syn_81, \bar_b5[0]_syn_2 , \volume[4]_syn_4 );  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1152)
  not sel2_syn_27 (sel2_syn_26, \slot_b2[2]_syn_14 );  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(27)
  AL_MUX sel2_syn_29 (
    .i0(text_addr_b33_n4),
    .i1(1'b0),
    .sel(x[4]),
    .o(sel2_syn_28));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(27)
  AL_MUX sel2_syn_31 (
    .i0(sel2_syn_28),
    .i1(text_addr_b33_n5),
    .sel(slot_b2[1]),
    .o(sel2_syn_30));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(27)
  AL_MUX sel2_syn_33 (
    .i0(sel2_syn_30),
    .i1(1'b0),
    .sel(sel2_syn_26),
    .o(sel2_syn_32));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(27)
  AL_MUX sel2_syn_39 (
    .i0(text_addr_b33_n3),
    .i1(text_addr_b33_n9),
    .sel(x[4]),
    .o(sel2_syn_38));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(27)
  AL_MUX sel2_syn_41 (
    .i0(sel2_syn_38),
    .i1(text_addr_b37[0]),
    .sel(slot_b2[1]),
    .o(sel2_syn_40));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(27)
  AL_MUX sel2_syn_43 (
    .i0(sel2_syn_40),
    .i1(1'b0),
    .sel(sel2_syn_26),
    .o(sel2_syn_42));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(27)
  AL_MUX sel4_syn_32 (
    .i0(1'b0),
    .i1(brightness[6]),
    .sel(sel4_syn_46),
    .o(sel4_syn_2[0]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(20)
  binary_mux_s1_w1 sel4_syn_33 (
    .i0(1'b0),
    .i1(sel4_syn_8[1]),
    .sel(\brightness[4]_syn_4 ),
    .o(sel4_syn_2[1]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(20)
  binary_mux_s1_w1 sel4_syn_34 (
    .i0(1'b0),
    .i1(sel4_syn_8[2]),
    .sel(\brightness[4]_syn_4 ),
    .o(sel4_syn_2[2]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(20)
  binary_mux_s1_w1 sel4_syn_35 (
    .i0(1'b1),
    .i1(sel4_syn_8[3]),
    .sel(\brightness[4]_syn_4 ),
    .o(sel4_syn_2[3]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(20)
  binary_mux_s1_w1 sel4_syn_36 (
    .i0(1'b1),
    .i1(sel4_syn_8[4]),
    .sel(\brightness[4]_syn_4 ),
    .o(sel4_syn_2[4]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(20)
  binary_mux_s2_w1 sel4_syn_38 (
    .i0(brightness[6]),
    .i1(1'b0),
    .i2(brightness[6]),
    .i3(1'b0),
    .sel({brightness[7],brightness[5]}),
    .o(sel4_syn_8[1]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(20)
  binary_mux_s2_w1 sel4_syn_39 (
    .i0(brightness[6]),
    .i1(1'b0),
    .i2(\brightness[6]_syn_6 ),
    .i3(1'b0),
    .sel({brightness[7],brightness[5]}),
    .o(sel4_syn_8[2]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(20)
  binary_mux_s2_w1 sel4_syn_40 (
    .i0(1'b0),
    .i1(1'b1),
    .i2(\brightness[6]_syn_6 ),
    .i3(1'b1),
    .sel({brightness[7],brightness[5]}),
    .o(sel4_syn_8[3]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(20)
  binary_mux_s2_w1 sel4_syn_41 (
    .i0(1'b0),
    .i1(\brightness[6]_syn_6 ),
    .i2(brightness[6]),
    .i3(1'b1),
    .sel({brightness[7],brightness[5]}),
    .o(sel4_syn_8[4]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(20)
  and sel4_syn_42 (sel4_syn_43, brightness[5], \brightness[7]_syn_16 );  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(20)
  and sel4_syn_45 (sel4_syn_46, \brightness[4]_syn_4 , sel4_syn_43);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(20)
  AL_MUX sel5_syn_32 (
    .i0(1'b0),
    .i1(contrast[6]),
    .sel(sel5_syn_46),
    .o(sel5_syn_2[0]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(20)
  binary_mux_s1_w1 sel5_syn_33 (
    .i0(1'b0),
    .i1(sel5_syn_8[1]),
    .sel(\contrast[4]_syn_4 ),
    .o(sel5_syn_2[1]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(20)
  binary_mux_s1_w1 sel5_syn_34 (
    .i0(1'b0),
    .i1(sel5_syn_8[2]),
    .sel(\contrast[4]_syn_4 ),
    .o(sel5_syn_2[2]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(20)
  binary_mux_s1_w1 sel5_syn_35 (
    .i0(1'b1),
    .i1(sel5_syn_8[3]),
    .sel(\contrast[4]_syn_4 ),
    .o(sel5_syn_2[3]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(20)
  binary_mux_s1_w1 sel5_syn_36 (
    .i0(1'b1),
    .i1(sel5_syn_8[4]),
    .sel(\contrast[4]_syn_4 ),
    .o(sel5_syn_2[4]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(20)
  binary_mux_s2_w1 sel5_syn_38 (
    .i0(contrast[6]),
    .i1(1'b0),
    .i2(contrast[6]),
    .i3(1'b0),
    .sel({contrast[7],contrast[5]}),
    .o(sel5_syn_8[1]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(20)
  binary_mux_s2_w1 sel5_syn_39 (
    .i0(contrast[6]),
    .i1(1'b0),
    .i2(\contrast[6]_syn_6 ),
    .i3(1'b0),
    .sel({contrast[7],contrast[5]}),
    .o(sel5_syn_8[2]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(20)
  binary_mux_s2_w1 sel5_syn_40 (
    .i0(1'b0),
    .i1(1'b1),
    .i2(\contrast[6]_syn_6 ),
    .i3(1'b1),
    .sel({contrast[7],contrast[5]}),
    .o(sel5_syn_8[3]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(20)
  binary_mux_s2_w1 sel5_syn_41 (
    .i0(1'b0),
    .i1(\contrast[6]_syn_6 ),
    .i2(contrast[6]),
    .i3(1'b1),
    .sel({contrast[7],contrast[5]}),
    .o(sel5_syn_8[4]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(20)
  and sel5_syn_42 (sel5_syn_43, contrast[5], \contrast[7]_syn_16 );  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(20)
  and sel5_syn_45 (sel5_syn_46, \contrast[4]_syn_4 , sel5_syn_43);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(20)
  binary_mux_s1_w1 sel7_syn_35 (
    .i0(1'b1),
    .i1(sel7_syn_8[3]),
    .sel(\volume[4]_syn_4 ),
    .o(sel7_syn_2[3]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(20)
  binary_mux_s1_w1 sel7_syn_36 (
    .i0(1'b1),
    .i1(sel7_syn_8[4]),
    .sel(\volume[4]_syn_4 ),
    .o(sel7_syn_2[4]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(20)
  binary_mux_s2_w1 sel7_syn_38 (
    .i0(volume[6]),
    .i1(1'b0),
    .i2(volume[6]),
    .i3(1'b0),
    .sel({volume[7],volume[5]}),
    .o(sel7_syn_8[1]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(20)
  binary_mux_s2_w1 sel7_syn_39 (
    .i0(volume[6]),
    .i1(1'b0),
    .i2(\volume[6]_syn_6 ),
    .i3(1'b0),
    .sel({volume[7],volume[5]}),
    .o(sel7_syn_8[2]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(20)
  binary_mux_s2_w1 sel7_syn_40 (
    .i0(1'b0),
    .i1(1'b1),
    .i2(\volume[6]_syn_6 ),
    .i3(1'b1),
    .sel({volume[7],volume[5]}),
    .o(sel7_syn_8[3]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(20)
  binary_mux_s2_w1 sel7_syn_41 (
    .i0(1'b0),
    .i1(\volume[6]_syn_6 ),
    .i2(volume[6]),
    .i3(1'b1),
    .sel({volume[7],volume[5]}),
    .o(sel7_syn_8[4]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(20)
  and sel7_syn_42 (sel7_syn_43, volume[5], \volume[7]_syn_16 );  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(20)
  and sel7_syn_45 (sel7_syn_46, \volume[4]_syn_4 , sel7_syn_43);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(20)
  binary_mux_s3_w1 sel8_syn_1 (
    .i0(1'b0),
    .i1(text_addr_b37[1]),
    .i2(text_addr_b37[0]),
    .i3(1'b0),
    .i4(1'b0),
    .i5(1'b0),
    .i6(1'b0),
    .i7(1'b0),
    .sel({slot_b2[2:1],\x[4]_syn_2 }),
    .o(text_addr_b28[2]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(27)
  binary_mux_s3_w1 sel8_syn_2 (
    .i0(1'b0),
    .i1(text_addr_b33_n8_syn_2),
    .i2(text_addr_b33_n15_syn_2),
    .i3(1'b0),
    .i4(1'b0),
    .i5(1'b0),
    .i6(1'b0),
    .i7(1'b0),
    .sel({slot_b2[2:1],\x[4]_syn_2 }),
    .o(text_addr_b28[3]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(27)
  or \slot_b2[2]_syn_13  (\slot_b2[2]_syn_14 , text_addr_b33_n, text_addr_b30_n, text_addr_b26_n);
  add_pu10_mu10_o11 sub0 (
    .i0(x),
    .i1(10'b0001101000),
    .o({text_addr_b19[10:9],open_n31,open_n32,text_addr_b15[2:0],open_n33,open_n34,open_n35,open_n36}));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1150)
  add_pu4_mu4_o4 sub1 (
    .i0(y[3:0]),
    .i1(4'b0100),
    .o({gy_b11[3],open_n37,open_n38,open_n39}));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1150)
  add_pu8_mu8_o8 sub11 (
    .i0(x[7:0]),
    .i1(8'b11100000),
    .o({text_addr_b11[2:1],open_n40,open_n41,open_n42,open_n43,open_n44,open_n45}));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1137)
  add_pu6_mu6_o6 sub13 (
    .i0(y[5:0]),
    .i1(6'b110000),
    .o({bg_b15[5],open_n46,open_n47,open_n48,open_n49,open_n50}));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1140)
  add_pu4_mu4_o4 sub2 (
    .i0(period_s[3:0]),
    .i1({ones_b1[0],tens[1:0],1'b0}),
    .o(ones[3:0]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(43)
  add_pu10_mu10_o11 sub3 (
    .i0(x),
    .i1(10'b0100000000),
    .o({bg_b11[10:9],open_n51,open_n52,open_n53,open_n54,open_n55,open_n56,open_n57,open_n58,open_n59}));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1160)
  add_pu7_mu7_o7 sub4 (
    .i0(x[6:0]),
    .i1(7'b1010000),
    .o({slot_b2[2:1],open_n60,open_n61,open_n62,open_n63,open_n64}));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  add_pu10_mu10_o11 sub5 (
    .i0(x),
    .i1(10'b0010111000),
    .o({text_addr_b10[10],open_n65,text_addr_b4[4:1],open_n66,open_n67,open_n68,open_n69,open_n70}));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1181)
  add_pu10_mu10_o10 sub8 (
    .i0(x),
    .i1({3'b001,footer_left[3],\footer_left[3]_syn_2 ,1'b1,footer_left[3],3'b000}),
    .o({text_addr_b6[9],text_addr_b2[4:0],gx_b2[3],open_n71,open_n72,open_n73}));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1184)
  not \tens[0]_syn_1  (\tens[0]_syn_2 , tens[0]);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(42)
  AL_MUX \text_addr[0]_syn_1  (
    .i0(mux47_syn_11),
    .i1(1'b0),
    .sel(mux51_syn_25),
    .o(\text_addr[0]_syn_2 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MUX \text_addr[0]_syn_12  (
    .i0(\text_addr[0]_syn_2 ),
    .i1(mux19_syn_11),
    .sel(\text_addr[0]_syn_7 ),
    .o(\text_addr[0]_syn_11 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MUX \text_addr[0]_syn_13  (
    .i0(sel2_syn_32),
    .i1(mux30_syn_45),
    .sel(al_130),
    .o(\text_addr[0]_syn_14 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MUX \text_addr[0]_syn_15  (
    .i0(\text_addr[0]_syn_14 ),
    .i1(\text_addr[0]_syn_11 ),
    .sel(al_132),
    .o(\text_addr[0]_syn_16 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  not \text_addr[0]_syn_8  (\text_addr[0]_syn_7 , al_22);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MUX \text_addr[1]_syn_1  (
    .i0(mux47_syn_13),
    .i1(1'b0),
    .sel(mux51_syn_25),
    .o(\text_addr[1]_syn_2 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MUX \text_addr[1]_syn_11  (
    .i0(sel2_syn_42),
    .i1(\text_addr[1]_syn_10 ),
    .sel(al_138),
    .o(\text_addr[1]_syn_12 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MUX \text_addr[1]_syn_5  (
    .i0(mux18_syn_13),
    .i1(\text_addr[1]_syn_12 ),
    .sel(al_22),
    .o(\text_addr[1]_syn_6 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MUX \text_addr[1]_syn_9  (
    .i0(mux30_syn_47),
    .i1(\text_addr[1]_syn_2 ),
    .sel(mux60_syn_25),
    .o(\text_addr[1]_syn_10 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MUX \text_addr[2]_syn_1  (
    .i0(mux47_syn_15),
    .i1(1'b0),
    .sel(mux51_syn_25),
    .o(\text_addr[2]_syn_2 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MUX \text_addr[2]_syn_3  (
    .i0(mux30_syn_21),
    .i1(\text_addr[2]_syn_2 ),
    .sel(mux60_syn_25),
    .o(\text_addr[2]_syn_4 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MUX \text_addr[2]_syn_5  (
    .i0(mux19_syn_13),
    .i1(\text_addr[2]_syn_4 ),
    .sel(al_22),
    .o(\text_addr[2]_syn_6 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MUX \text_addr[3]_syn_1  (
    .i0(mux30_syn_25),
    .i1(mux52_syn_25),
    .sel(mux60_syn_25),
    .o(\text_addr[3]_syn_2 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MUX \text_addr[5]_syn_1  (
    .i0(mux35_syn_29),
    .i1(mux52_syn_29),
    .sel(al_112),
    .o(\text_addr[5]_syn_2 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MUX \text_addr[5]_syn_3  (
    .i0(mux21_syn_29),
    .i1(\text_addr[5]_syn_2 ),
    .sel(al_68),
    .o(\text_addr[5]_syn_4 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MUX \text_addr[6]_syn_1  (
    .i0(mux30_syn_33),
    .i1(mux52_syn_46),
    .sel(mux60_syn_25),
    .o(\text_addr[6]_syn_2 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MUX \text_addr[6]_syn_3  (
    .i0(mux21_syn_33),
    .i1(\text_addr[6]_syn_2 ),
    .sel(al_102),
    .o(\text_addr[6]_syn_4 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MUX \text_addr[7]_syn_1  (
    .i0(mux30_syn_37),
    .i1(mux52_syn_37),
    .sel(mux60_syn_25),
    .o(\text_addr[7]_syn_2 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MUX \text_addr[7]_syn_3  (
    .i0(mux21_syn_37),
    .i1(\text_addr[7]_syn_2 ),
    .sel(al_102),
    .o(\text_addr[7]_syn_4 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MUX \text_addr[9]_syn_1  (
    .i0(mux30_syn_43),
    .i1(mux52_syn_37),
    .sel(mux60_syn_25),
    .o(\text_addr[9]_syn_2 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MUX \text_addr[9]_syn_3  (
    .i0(mux21_syn_41),
    .i1(\text_addr[9]_syn_2 ),
    .sel(al_102),
    .o(\text_addr[9]_syn_4 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  not \text_addr_b10[10]_syn_1  (\text_addr_b10[10]_syn_2 , text_addr_b10[10]);
  not \text_addr_b15[0]_syn_1  (\text_addr_b15[0]_syn_2 , text_addr_b15[0]);
  not \text_addr_b17[9]_syn_1  (\text_addr_b17[9]_syn_2 , text_addr_b17[9]);
  and text_addr_b17_i (text_addr_b17_n, bar_b1_n2, bar_b8_n);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1166)
  not \text_addr_b19[10]_syn_1  (\text_addr_b19[10]_syn_2 , text_addr_b19[10]);
  not text_addr_b22_n_syn_1 (text_addr_b22_n_syn_2, text_addr_b22_n);
  not text_addr_b26_n_syn_1 (text_addr_b26_n_syn_2, text_addr_b26_n);
  not text_addr_b30_n_syn_1 (text_addr_b30_n_syn_2, text_addr_b30_n);
  or text_addr_b33_i10 (text_addr_b33_n13, text_addr_b33_n16, text_addr_b33_n11_syn_2);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(29)
  and text_addr_b33_i11 (text_addr_b33_n14, text_addr_b33_n18, text_addr_b33_n19);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(28)
  or text_addr_b33_i12 (text_addr_b33_n16, text_addr_b33_n8_syn_2, text_addr_b33_n12_syn_2);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(29)
  or text_addr_b33_i2 (text_addr_b33_n3, text_addr_b33_n19_syn_2, text_addr_b33_n12_syn_2);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(29)
  or text_addr_b33_i3 (text_addr_b33_n4, text_addr_b33_n19_syn_2, text_addr_b33_n9);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(29)
  not text_addr_b33_i4 (text_addr_b33_n5, text_addr_b37[0]);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(31)
  not text_addr_b33_i7 (text_addr_b33_n9, text_addr_b33_n13);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(29)
  and text_addr_b33_i9 (text_addr_b33_n11, text_addr_b33_n14, text_addr_b33_n15);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(28)
  not text_addr_b33_n11_syn_1 (text_addr_b33_n11_syn_2, text_addr_b33_n11);
  not text_addr_b33_n12_syn_1 (text_addr_b33_n12_syn_2, text_addr_b33_n12);
  not text_addr_b33_n15_syn_1 (text_addr_b33_n15_syn_2, text_addr_b33_n15);
  not text_addr_b33_n19_syn_1 (text_addr_b33_n19_syn_2, text_addr_b33_n19);
  not text_addr_b33_n8_syn_1 (text_addr_b33_n8_syn_2, text_addr_b33_n8);
  and text_addr_b34_i (text_addr_b34_n, text_addr_b33_n, tens_b4_n);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1170)
  not text_addr_b34_n_syn_1 (text_addr_b34_n_syn_2, text_addr_b34_n);
  not text_addr_b36_n_syn_1 (text_addr_b36_n_syn_2, text_addr_b36_n);
  or text_addr_b37_i (text_addr_b37[1], text_addr_b33_n15_syn_2, text_addr_b33_n12_syn_2);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(29)
  or text_addr_b37_i1 (text_addr_b37[0], text_addr_b33_n19_syn_2, text_addr_b33_n8_syn_2);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(29)
  not \volume[0]_syn_1  (\volume[0]_syn_2 , volume[0]);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  not \volume[1]_syn_1  (\volume[1]_syn_2 , volume[1]);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  not \volume[2]_syn_1  (\volume[2]_syn_2 , volume[2]);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  not \volume[3]_syn_1  (\volume[3]_syn_2 , volume[3]);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  and \volume[4]_syn_1  (\volume[4]_syn_4 , \volume[4]_syn_3 , \volume[3]_syn_2 , \volume[2]_syn_2 , \volume[1]_syn_2 , \volume[0]_syn_2 );  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  not \volume[4]_syn_2  (\volume[4]_syn_3 , volume[4]);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  not \volume[6]_syn_5  (\volume[6]_syn_6 , volume[6]);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  not \volume[7]_syn_15  (\volume[7]_syn_16 , volume[7]);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  AL_DFF_X #(
    .INIT(1'b1))
    \vq_reg[0]  (
    .ar(1'b0),
    .as(rst),
    .clk(clk),
    .d(vs),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(vq[0]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_DFF_X #(
    .INIT(1'b1))
    \vq_reg[1]  (
    .ar(1'b0),
    .as(rst),
    .clk(clk),
    .d(vq[0]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(vs_out));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  not \x[0]_syn_1  (\x[0]_syn_2 , x[0]);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(7)
  not \x[3]_syn_1  (\x[3]_syn_2 , x[3]);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(7)
  not \x[4]_syn_1  (\x[4]_syn_2 , x[4]);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(7)
  not \x[5]_syn_1  (\x[5]_syn_2 , x[5]);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(7)
  not \x[8]_syn_1  (\x[8]_syn_2 , x[8]);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(7)
  not x_b_i (x_b_n, vs);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1191)
  AL_DFF_X \x_reg[0]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(x_b[0]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(x[0]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_DFF_X \x_reg[1]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(x_b[1]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(x[1]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_DFF_X \x_reg[2]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(x_b[2]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(x[2]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_DFF_X \x_reg[3]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(x_b[3]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(x[3]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_DFF_X \x_reg[4]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(x_b[4]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(x[4]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_DFF_X \x_reg[5]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(x_b[5]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(x[5]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_DFF_X \x_reg[6]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(x_b[6]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(x[6]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_DFF_X \x_reg[7]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(x_b[7]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(x[7]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_DFF_X \x_reg[8]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(x_b[8]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(x[8]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_DFF_X \x_reg[9]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(x_b[9]),
    .en(1'b1),
    .sr(1'b0),
    .ss(1'b0),
    .q(x[9]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  not \y[0]_syn_1  (\y[0]_syn_2 , y[0]);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(7)
  not \y[2]_syn_1  (\y[2]_syn_2 , y[2]);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(7)
  not \y[3]_syn_1  (\y[3]_syn_2 , y[3]);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(7)
  not \y[4]_syn_1  (\y[4]_syn_2 , y[4]);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(7)
  not \y[5]_syn_1  (\y[5]_syn_2 , y[5]);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(7)
  and y_b1_i (y_b1_n, deq[0], y_b1_n1);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1192)
  not y_b1_i1 (y_b1_n1, de);  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1192)
  AL_DFF_X \y_reg[0]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(y_b[0]),
    .en(mux64_syn_2[9]),
    .sr(1'b0),
    .ss(1'b0),
    .q(y[0]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_DFF_X \y_reg[1]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(y_b[1]),
    .en(mux64_syn_2[9]),
    .sr(1'b0),
    .ss(1'b0),
    .q(y[1]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_DFF_X \y_reg[2]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(y_b[2]),
    .en(mux64_syn_2[9]),
    .sr(1'b0),
    .ss(1'b0),
    .q(y[2]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_DFF_X \y_reg[3]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(y_b[3]),
    .en(mux64_syn_2[9]),
    .sr(1'b0),
    .ss(1'b0),
    .q(y[3]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_DFF_X \y_reg[4]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(y_b[4]),
    .en(mux64_syn_2[9]),
    .sr(1'b0),
    .ss(1'b0),
    .q(y[4]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_DFF_X \y_reg[5]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(y_b[5]),
    .en(mux64_syn_2[9]),
    .sr(1'b0),
    .ss(1'b0),
    .q(y[5]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_DFF_X \y_reg[6]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(y_b[6]),
    .en(mux64_syn_2[9]),
    .sr(1'b0),
    .ss(1'b0),
    .q(y[6]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_DFF_X \y_reg[7]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(y_b[7]),
    .en(mux64_syn_2[9]),
    .sr(1'b0),
    .ss(1'b0),
    .q(y[7]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_DFF_X \y_reg[8]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(y_b[8]),
    .en(mux64_syn_2[9]),
    .sr(1'b0),
    .ss(1'b0),
    .q(y[8]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)
  AL_DFF_X \y_reg[9]  (
    .ar(rst),
    .as(1'b0),
    .clk(clk),
    .d(y_b[9]),
    .en(mux64_syn_2[9]),
    .sr(1'b0),
    .ss(1'b0),
    .q(y[9]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1189)

endmodule 

module add_pu3_pu3_o3
  (
  i0,
  i1,
  o
  );

  input [2:0] i0;
  input [2:0] i1;
  output [2:0] o;

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

  assign net_a2 = i0[2];
  assign net_a1 = i0[1];
  assign net_a0 = i0[0];
  assign net_b2 = i1[2];
  assign net_b1 = i1[1];
  assign net_b0 = i1[0];
  assign o[2] = net_sum2;
  assign o[1] = net_sum1;
  assign o[0] = net_sum0;
  AL_FADD al_170 (
    .a(net_a0),
    .b(net_b0),
    .c(1'b0),
    .cout(net_cout0),
    .sum(net_sum0));
  AL_FADD al_171 (
    .a(net_a1),
    .b(net_b1),
    .c(net_cout0),
    .cout(net_cout1),
    .sum(net_sum1));
  AL_FADD al_172 (
    .a(net_a2),
    .b(net_b2),
    .c(net_cout1),
    .cout(net_cout2),
    .sum(net_sum2));

endmodule 

module add_pu1_pu1_o1
  (
  i0,
  i1,
  o
  );

  input i0;
  input i1;
  output o;

  wire net_a0;
  wire net_sum0;
  wire net_cout0;
  wire net_cin;

  assign net_a0 = i0;
  assign net_cin = i1;
  assign o = net_sum0;
  AL_FADD al_512 (
    .a(net_a0),
    .b(1'b0),
    .c(net_cin),
    .cout(net_cout0),
    .sum(net_sum0));

endmodule 

module add_pu2_pu2_o2
  (
  i0,
  i1,
  o
  );

  input [1:0] i0;
  input [1:0] i1;
  output [1:0] o;

  wire net_a0;
  wire net_b0;
  wire net_sum0;
  wire net_cout0;
  wire net_a1;
  wire net_b1;
  wire net_sum1;
  wire net_cout1;

  assign net_a1 = i0[1];
  assign net_a0 = i0[0];
  assign net_b1 = i1[1];
  assign net_b0 = i1[0];
  assign o[1] = net_sum1;
  assign o[0] = net_sum0;
  AL_FADD al_513 (
    .a(net_a0),
    .b(net_b0),
    .c(1'b0),
    .cout(net_cout0),
    .sum(net_sum0));
  AL_FADD al_514 (
    .a(net_a1),
    .b(net_b1),
    .c(net_cout0),
    .cout(net_cout1),
    .sum(net_sum1));

endmodule 

module add_pu4_pu4_o4
  (
  i0,
  i1,
  o
  );

  input [3:0] i0;
  input [3:0] i1;
  output [3:0] o;

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

  assign net_a3 = i0[3];
  assign net_a2 = i0[2];
  assign net_a1 = i0[1];
  assign net_a0 = i0[0];
  assign net_b3 = i1[3];
  assign net_b2 = i1[2];
  assign net_b1 = i1[1];
  assign net_b0 = i1[0];
  assign o[3] = net_sum3;
  assign o[2] = net_sum2;
  assign o[1] = net_sum1;
  assign o[0] = net_sum0;
  AL_FADD al_508 (
    .a(net_a0),
    .b(net_b0),
    .c(1'b0),
    .cout(net_cout0),
    .sum(net_sum0));
  AL_FADD al_509 (
    .a(net_a1),
    .b(net_b1),
    .c(net_cout0),
    .cout(net_cout1),
    .sum(net_sum1));
  AL_FADD al_510 (
    .a(net_a2),
    .b(net_b2),
    .c(net_cout1),
    .cout(net_cout2),
    .sum(net_sum2));
  AL_FADD al_511 (
    .a(net_a3),
    .b(net_b3),
    .c(net_cout2),
    .cout(net_cout3),
    .sum(net_sum3));

endmodule 

module add_pu10_pu10_o10
  (
  i0,
  i1,
  o
  );

  input [9:0] i0;
  input [9:0] i1;
  output [9:0] o;

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
  AL_FADD al_179 (
    .a(net_a0),
    .b(net_b0),
    .c(1'b0),
    .cout(net_cout0),
    .sum(net_sum0));
  AL_FADD al_180 (
    .a(net_a1),
    .b(net_b1),
    .c(net_cout0),
    .cout(net_cout1),
    .sum(net_sum1));
  AL_FADD al_181 (
    .a(net_a2),
    .b(net_b2),
    .c(net_cout1),
    .cout(net_cout2),
    .sum(net_sum2));
  AL_FADD al_182 (
    .a(net_a3),
    .b(net_b3),
    .c(net_cout2),
    .cout(net_cout3),
    .sum(net_sum3));
  AL_FADD al_183 (
    .a(net_a4),
    .b(net_b4),
    .c(net_cout3),
    .cout(net_cout4),
    .sum(net_sum4));
  AL_FADD al_184 (
    .a(net_a5),
    .b(net_b5),
    .c(net_cout4),
    .cout(net_cout5),
    .sum(net_sum5));
  AL_FADD al_185 (
    .a(net_a6),
    .b(net_b6),
    .c(net_cout5),
    .cout(net_cout6),
    .sum(net_sum6));
  AL_FADD al_186 (
    .a(net_a7),
    .b(net_b7),
    .c(net_cout6),
    .cout(net_cout7),
    .sum(net_sum7));
  AL_FADD al_187 (
    .a(net_a8),
    .b(net_b8),
    .c(net_cout7),
    .cout(net_cout8),
    .sum(net_sum8));
  AL_FADD al_188 (
    .a(net_a9),
    .b(net_b9),
    .c(net_cout8),
    .cout(net_cout9),
    .sum(net_sum9));

endmodule 

module eq_w3
  (
  i0,
  i1,
  o
  );

  input [2:0] i0;
  input [2:0] i1;
  output o;

  wire i0_syn_4;
  wire i0_syn_6;
  wire i0_syn_8;
  wire i0_syn_10;
  wire i0_syn_12;

  not al_189 (o, i0_syn_12);
  or i0_syn_11 (i0_syn_12, i0_syn_4, i0_syn_10);
  xor i0_syn_3 (i0_syn_4, i0[0], i1[0]);
  xor i0_syn_5 (i0_syn_6, i0[1], i1[1]);
  xor i0_syn_7 (i0_syn_8, i0[2], i1[2]);
  or i0_syn_9 (i0_syn_10, i0_syn_6, i0_syn_8);

endmodule 

module eq_w8
  (
  i0,
  i1,
  o
  );

  input [7:0] i0;
  input [7:0] i1;
  output o;

  wire i0_syn_14;
  wire i0_syn_16;
  wire i0_syn_18;
  wire i0_syn_20;
  wire i0_syn_22;
  wire i0_syn_24;
  wire i0_syn_26;
  wire i0_syn_28;
  wire i0_syn_30;
  wire i0_syn_32;
  wire i0_syn_34;
  wire i0_syn_36;
  wire i0_syn_38;
  wire i0_syn_40;
  wire i0_syn_42;

  not al_190 (o, i0_syn_42);
  xor i0_syn_13 (i0_syn_14, i0[0], i1[0]);
  xor i0_syn_15 (i0_syn_16, i0[1], i1[1]);
  xor i0_syn_17 (i0_syn_18, i0[2], i1[2]);
  xor i0_syn_19 (i0_syn_20, i0[3], i1[3]);
  xor i0_syn_21 (i0_syn_22, i0[4], i1[4]);
  xor i0_syn_23 (i0_syn_24, i0[5], i1[5]);
  xor i0_syn_25 (i0_syn_26, i0[6], i1[6]);
  xor i0_syn_27 (i0_syn_28, i0[7], i1[7]);
  or i0_syn_29 (i0_syn_30, i0_syn_14, i0_syn_16);
  or i0_syn_31 (i0_syn_32, i0_syn_18, i0_syn_20);
  or i0_syn_33 (i0_syn_34, i0_syn_30, i0_syn_32);
  or i0_syn_35 (i0_syn_36, i0_syn_22, i0_syn_24);
  or i0_syn_37 (i0_syn_38, i0_syn_26, i0_syn_28);
  or i0_syn_39 (i0_syn_40, i0_syn_36, i0_syn_38);
  or i0_syn_41 (i0_syn_42, i0_syn_34, i0_syn_40);

endmodule 

module eq_w2
  (
  i0,
  i1,
  o
  );

  input [1:0] i0;
  input [1:0] i1;
  output o;

  wire i0_syn_44;
  wire i0_syn_46;
  wire i0_syn_48;

  not al_191 (o, i0_syn_48);
  xor i0_syn_43 (i0_syn_44, i0[0], i1[0]);
  xor i0_syn_45 (i0_syn_46, i0[1], i1[1]);
  or i0_syn_47 (i0_syn_48, i0_syn_44, i0_syn_46);

endmodule 

module lt_u8_u8
  (
  ci,
  i0,
  i1,
  o
  );

  input ci;
  input [7:0] i0;
  input [7:0] i1;
  output o;

  wire net_cin;
  wire diff_0;
  wire a_0;
  wire b_0;
  wire o_0;
  wire diff_1;
  wire a_1;
  wire b_1;
  wire o_1;
  wire diff_2;
  wire a_2;
  wire b_2;
  wire o_2;
  wire diff_3;
  wire a_3;
  wire b_3;
  wire o_3;
  wire o_4;
  wire o_5;
  wire diff_4;
  wire a_4;
  wire b_4;
  wire diff_5;
  wire a_5;
  wire b_5;
  wire diff_6;
  wire a_6;
  wire b_6;
  wire o_6;
  wire diff_7;
  wire a_7;
  wire b_7;
  wire o_7;

  assign net_cin = ci;
  assign a_7 = i0[7];
  assign a_6 = i0[6];
  assign a_5 = i0[5];
  assign a_4 = i0[4];
  assign a_3 = i0[3];
  assign a_2 = i0[2];
  assign a_1 = i0[1];
  assign a_0 = i0[0];
  assign b_7 = i1[7];
  assign b_6 = i1[6];
  assign b_5 = i1[5];
  assign b_4 = i1[4];
  assign b_3 = i1[3];
  assign b_2 = i1[2];
  assign b_1 = i1[1];
  assign b_0 = i1[0];
  assign o = o_7;
  xor al_327 (diff_0, a_0, b_0);
  AL_MUX al_328 (
    .i0(net_cin),
    .i1(b_0),
    .sel(diff_0),
    .o(o_0));
  xor al_329 (diff_1, a_1, b_1);
  AL_MUX al_330 (
    .i0(o_0),
    .i1(b_1),
    .sel(diff_1),
    .o(o_1));
  xor al_331 (diff_2, a_2, b_2);
  AL_MUX al_332 (
    .i0(o_1),
    .i1(b_2),
    .sel(diff_2),
    .o(o_2));
  xor al_333 (diff_3, a_3, b_3);
  AL_MUX al_334 (
    .i0(o_2),
    .i1(b_3),
    .sel(diff_3),
    .o(o_3));
  xor al_335 (diff_4, a_4, b_4);
  AL_MUX al_336 (
    .i0(o_3),
    .i1(b_4),
    .sel(diff_4),
    .o(o_4));
  xor al_337 (diff_5, a_5, b_5);
  AL_MUX al_338 (
    .i0(o_4),
    .i1(b_5),
    .sel(diff_5),
    .o(o_5));
  xor al_339 (diff_6, a_6, b_6);
  AL_MUX al_340 (
    .i0(o_5),
    .i1(b_6),
    .sel(diff_6),
    .o(o_6));
  xor al_341 (diff_7, a_7, b_7);
  AL_MUX al_342 (
    .i0(o_6),
    .i1(b_7),
    .sel(diff_7),
    .o(o_7));

endmodule 

module lt_u6_u6
  (
  ci,
  i0,
  i1,
  o
  );

  input ci;
  input [5:0] i0;
  input [5:0] i1;
  output o;

  wire [5:0] al_228;
  wire o_0;
  wire o_1;
  wire o_2;
  wire o_3;
  wire o_4;

  xor al_234 (al_228[0], i0[0], i1[0]);
  xor al_235 (al_228[1], i0[1], i1[1]);
  xor al_236 (al_228[2], i0[2], i1[2]);
  xor al_237 (al_228[3], i0[3], i1[3]);
  xor al_238 (al_228[4], i0[4], i1[4]);
  xor al_239 (al_228[5], i0[5], i1[5]);
  AL_MUX al_240 (
    .i0(ci),
    .i1(i1[0]),
    .sel(al_228[0]),
    .o(o_0));
  AL_MUX al_241 (
    .i0(o_0),
    .i1(i1[1]),
    .sel(al_228[1]),
    .o(o_1));
  AL_MUX al_242 (
    .i0(o_1),
    .i1(i1[2]),
    .sel(al_228[2]),
    .o(o_2));
  AL_MUX al_243 (
    .i0(o_2),
    .i1(i1[3]),
    .sel(al_228[3]),
    .o(o_3));
  AL_MUX al_244 (
    .i0(o_3),
    .i1(i1[4]),
    .sel(al_228[4]),
    .o(o_4));
  AL_MUX al_245 (
    .i0(o_4),
    .i1(i1[5]),
    .sel(al_228[5]),
    .o(o));

endmodule 

module lt_u11_u11
  (
  ci,
  i0,
  i1,
  o
  );

  input ci;
  input [10:0] i0;
  input [10:0] i1;
  output o;

  wire [10:0] al_515;
  wire o_0;
  wire o_1;
  wire o_2;
  wire o_3;
  wire o_4;
  wire o_5;
  wire diff_6_10;
  wire less_6_10;
  wire less_6_10_syn_13;
  wire less_6_10_syn_16;
  wire less_6_10_syn_17;
  wire less_6_10_syn_20;
  wire less_6_10_syn_21;
  wire less_6_10_syn_24;
  wire less_6_10_syn_25;
  wire less_6_10_syn_28;
  wire less_6_10_syn_30;

  xor al_526 (al_515[0], i0[0], i1[0]);
  xor al_527 (al_515[1], i0[1], i1[1]);
  xor al_528 (al_515[2], i0[2], i1[2]);
  xor al_529 (al_515[3], i0[3], i1[3]);
  xor al_530 (al_515[4], i0[4], i1[4]);
  xor al_531 (al_515[5], i0[5], i1[5]);
  xor al_532 (al_515[6], i0[6], i1[6]);
  xor al_533 (al_515[7], i0[7], i1[7]);
  xor al_534 (al_515[8], i0[8], i1[8]);
  xor al_535 (al_515[9], i0[9], i1[9]);
  xor al_536 (al_515[10], i0[10], i1[10]);
  or al_537 (diff_6_10, al_515[6], al_515[7], al_515[8], al_515[9], al_515[10]);
  AL_MUX al_538 (
    .i0(ci),
    .i1(i1[0]),
    .sel(al_515[0]),
    .o(o_0));
  AL_MUX al_539 (
    .i0(o_0),
    .i1(i1[1]),
    .sel(al_515[1]),
    .o(o_1));
  AL_MUX al_540 (
    .i0(o_1),
    .i1(i1[2]),
    .sel(al_515[2]),
    .o(o_2));
  AL_MUX al_541 (
    .i0(o_2),
    .i1(i1[3]),
    .sel(al_515[3]),
    .o(o_3));
  AL_MUX al_542 (
    .i0(o_3),
    .i1(i1[4]),
    .sel(al_515[4]),
    .o(o_4));
  AL_MUX al_543 (
    .i0(o_4),
    .i1(i1[5]),
    .sel(al_515[5]),
    .o(o_5));
  AL_MUX al_544 (
    .i0(o_5),
    .i1(less_6_10),
    .sel(diff_6_10),
    .o(o));
  xor less_6_10_syn_10 (less_6_10_syn_30, i0[10], i1[10]);
  AL_MUX less_6_10_syn_11 (
    .i0(less_6_10_syn_28),
    .i1(i1[10]),
    .sel(less_6_10_syn_30),
    .o(less_6_10));
  xor less_6_10_syn_2 (less_6_10_syn_13, i0[6], i1[6]);
  AL_MUX less_6_10_syn_3 (
    .i0(1'b0),
    .i1(i1[6]),
    .sel(less_6_10_syn_13),
    .o(less_6_10_syn_16));
  xor less_6_10_syn_4 (less_6_10_syn_17, i0[7], i1[7]);
  AL_MUX less_6_10_syn_5 (
    .i0(less_6_10_syn_16),
    .i1(i1[7]),
    .sel(less_6_10_syn_17),
    .o(less_6_10_syn_20));
  xor less_6_10_syn_6 (less_6_10_syn_21, i0[8], i1[8]);
  AL_MUX less_6_10_syn_7 (
    .i0(less_6_10_syn_20),
    .i1(i1[8]),
    .sel(less_6_10_syn_21),
    .o(less_6_10_syn_24));
  xor less_6_10_syn_8 (less_6_10_syn_25, i0[9], i1[9]);
  AL_MUX less_6_10_syn_9 (
    .i0(less_6_10_syn_24),
    .i1(i1[9]),
    .sel(less_6_10_syn_25),
    .o(less_6_10_syn_28));

endmodule 

module lt_u4_u4
  (
  ci,
  i0,
  i1,
  o
  );

  input ci;
  input [3:0] i0;
  input [3:0] i1;
  output o;

  wire net_cin;
  wire diff_0;
  wire a_0;
  wire b_0;
  wire o_0;
  wire diff_1;
  wire a_1;
  wire b_1;
  wire o_1;
  wire diff_2;
  wire a_2;
  wire b_2;
  wire o_2;
  wire diff_3;
  wire a_3;
  wire b_3;
  wire o_3;

  assign net_cin = ci;
  assign a_3 = i0[3];
  assign a_2 = i0[2];
  assign a_1 = i0[1];
  assign a_0 = i0[0];
  assign b_3 = i1[3];
  assign b_2 = i1[2];
  assign b_1 = i1[1];
  assign b_0 = i1[0];
  assign o = o_3;
  xor al_213 (diff_0, a_0, b_0);
  AL_MUX al_214 (
    .i0(net_cin),
    .i1(b_0),
    .sel(diff_0),
    .o(o_0));
  xor al_215 (diff_1, a_1, b_1);
  AL_MUX al_216 (
    .i0(o_0),
    .i1(b_1),
    .sel(diff_1),
    .o(o_1));
  xor al_217 (diff_2, a_2, b_2);
  AL_MUX al_218 (
    .i0(o_1),
    .i1(b_2),
    .sel(diff_2),
    .o(o_2));
  xor al_219 (diff_3, a_3, b_3);
  AL_MUX al_220 (
    .i0(o_2),
    .i1(b_3),
    .sel(diff_3),
    .o(o_3));

endmodule 

module lt_u5_u5
  (
  ci,
  i0,
  i1,
  o
  );

  input ci;
  input [4:0] i0;
  input [4:0] i1;
  output o;

  wire net_cin;
  wire diff_0;
  wire a_0;
  wire b_0;
  wire o_0;
  wire diff_1;
  wire a_1;
  wire b_1;
  wire o_1;
  wire diff_2;
  wire a_2;
  wire b_2;
  wire o_2;
  wire diff_3;
  wire a_3;
  wire b_3;
  wire o_3;
  wire o_4;
  wire diff_4;
  wire a_4;
  wire b_4;

  assign net_cin = ci;
  assign a_4 = i0[4];
  assign a_3 = i0[3];
  assign a_2 = i0[2];
  assign a_1 = i0[1];
  assign a_0 = i0[0];
  assign b_4 = i1[4];
  assign b_3 = i1[3];
  assign b_2 = i1[2];
  assign b_1 = i1[1];
  assign b_0 = i1[0];
  assign o = o_4;
  xor al_344 (diff_0, a_0, b_0);
  AL_MUX al_345 (
    .i0(net_cin),
    .i1(b_0),
    .sel(diff_0),
    .o(o_0));
  xor al_346 (diff_1, a_1, b_1);
  AL_MUX al_347 (
    .i0(o_0),
    .i1(b_1),
    .sel(diff_1),
    .o(o_1));
  xor al_348 (diff_2, a_2, b_2);
  AL_MUX al_349 (
    .i0(o_1),
    .i1(b_2),
    .sel(diff_2),
    .o(o_2));
  xor al_350 (diff_3, a_3, b_3);
  AL_MUX al_351 (
    .i0(o_2),
    .i1(b_3),
    .sel(diff_3),
    .o(o_3));
  xor al_352 (diff_4, a_4, b_4);
  AL_MUX al_353 (
    .i0(o_3),
    .i1(b_4),
    .sel(diff_4),
    .o(o_4));

endmodule 

module lt_u7_u7
  (
  ci,
  i0,
  i1,
  o
  );

  input ci;
  input [6:0] i0;
  input [6:0] i1;
  output o;

  wire net_cin;
  wire diff_0;
  wire a_0;
  wire b_0;
  wire o_0;
  wire diff_1;
  wire a_1;
  wire b_1;
  wire o_1;
  wire diff_2;
  wire a_2;
  wire b_2;
  wire o_2;
  wire diff_3;
  wire a_3;
  wire b_3;
  wire o_3;
  wire o_4;
  wire o_5;
  wire diff_4;
  wire a_4;
  wire b_4;
  wire diff_5;
  wire a_5;
  wire b_5;
  wire diff_6;
  wire a_6;
  wire b_6;
  wire o_6;

  assign net_cin = ci;
  assign a_6 = i0[6];
  assign a_5 = i0[5];
  assign a_4 = i0[4];
  assign a_3 = i0[3];
  assign a_2 = i0[2];
  assign a_1 = i0[1];
  assign a_0 = i0[0];
  assign b_6 = i1[6];
  assign b_5 = i1[5];
  assign b_4 = i1[4];
  assign b_3 = i1[3];
  assign b_2 = i1[2];
  assign b_1 = i1[1];
  assign b_0 = i1[0];
  assign o = o_6;
  xor al_312 (diff_0, a_0, b_0);
  AL_MUX al_313 (
    .i0(net_cin),
    .i1(b_0),
    .sel(diff_0),
    .o(o_0));
  xor al_314 (diff_1, a_1, b_1);
  AL_MUX al_315 (
    .i0(o_0),
    .i1(b_1),
    .sel(diff_1),
    .o(o_1));
  xor al_316 (diff_2, a_2, b_2);
  AL_MUX al_317 (
    .i0(o_1),
    .i1(b_2),
    .sel(diff_2),
    .o(o_2));
  xor al_318 (diff_3, a_3, b_3);
  AL_MUX al_319 (
    .i0(o_2),
    .i1(b_3),
    .sel(diff_3),
    .o(o_3));
  xor al_320 (diff_4, a_4, b_4);
  AL_MUX al_321 (
    .i0(o_3),
    .i1(b_4),
    .sel(diff_4),
    .o(o_4));
  xor al_322 (diff_5, a_5, b_5);
  AL_MUX al_323 (
    .i0(o_4),
    .i1(b_5),
    .sel(diff_5),
    .o(o_5));
  xor al_324 (diff_6, a_6, b_6);
  AL_MUX al_325 (
    .i0(o_5),
    .i1(b_6),
    .sel(diff_6),
    .o(o_6));

endmodule 

module lt_u9_u9
  (
  ci,
  i0,
  i1,
  o
  );

  input ci;
  input [8:0] i0;
  input [8:0] i1;
  output o;

  wire [8:0] al_545;
  wire o_0;
  wire o_1;
  wire o_2;
  wire o_3;
  wire o_4;
  wire o_5;
  wire diff_6_8;
  wire less_6_8;
  wire less_6_8_syn_9;
  wire less_6_8_syn_12;
  wire less_6_8_syn_13;
  wire less_6_8_syn_16;
  wire less_6_8_syn_17;

  xor al_554 (al_545[0], i0[0], i1[0]);
  xor al_555 (al_545[1], i0[1], i1[1]);
  xor al_556 (al_545[2], i0[2], i1[2]);
  xor al_557 (al_545[3], i0[3], i1[3]);
  xor al_558 (al_545[4], i0[4], i1[4]);
  xor al_559 (al_545[5], i0[5], i1[5]);
  xor al_560 (al_545[6], i0[6], i1[6]);
  xor al_561 (al_545[7], i0[7], i1[7]);
  xor al_562 (al_545[8], i0[8], i1[8]);
  or al_563 (diff_6_8, al_545[6], al_545[7], al_545[8]);
  AL_MUX al_570 (
    .i0(ci),
    .i1(i1[0]),
    .sel(al_545[0]),
    .o(o_0));
  AL_MUX al_571 (
    .i0(o_0),
    .i1(i1[1]),
    .sel(al_545[1]),
    .o(o_1));
  AL_MUX al_572 (
    .i0(o_1),
    .i1(i1[2]),
    .sel(al_545[2]),
    .o(o_2));
  AL_MUX al_573 (
    .i0(o_2),
    .i1(i1[3]),
    .sel(al_545[3]),
    .o(o_3));
  AL_MUX al_574 (
    .i0(o_3),
    .i1(i1[4]),
    .sel(al_545[4]),
    .o(o_4));
  AL_MUX al_575 (
    .i0(o_4),
    .i1(i1[5]),
    .sel(al_545[5]),
    .o(o_5));
  AL_MUX al_576 (
    .i0(o_5),
    .i1(less_6_8),
    .sel(diff_6_8),
    .o(o));
  xor less_6_8_syn_2 (less_6_8_syn_9, i0[6], i1[6]);
  AL_MUX less_6_8_syn_3 (
    .i0(1'b0),
    .i1(i1[6]),
    .sel(less_6_8_syn_9),
    .o(less_6_8_syn_12));
  xor less_6_8_syn_4 (less_6_8_syn_13, i0[7], i1[7]);
  AL_MUX less_6_8_syn_5 (
    .i0(less_6_8_syn_12),
    .i1(i1[7]),
    .sel(less_6_8_syn_13),
    .o(less_6_8_syn_16));
  xor less_6_8_syn_6 (less_6_8_syn_17, i0[8], i1[8]);
  AL_MUX less_6_8_syn_7 (
    .i0(less_6_8_syn_16),
    .i1(i1[8]),
    .sel(less_6_8_syn_17),
    .o(less_6_8));

endmodule 

module lt_u10_u10
  (
  ci,
  i0,
  i1,
  o
  );

  input ci;
  input [9:0] i0;
  input [9:0] i1;
  output o;

  wire [9:0] al_192;
  wire diff_6_9;
  wire less_6_9;
  wire less_6_9_syn_11;
  wire less_6_9_syn_14;
  wire less_6_9_syn_15;
  wire less_6_9_syn_18;
  wire less_6_9_syn_19;
  wire less_6_9_syn_22;
  wire less_6_9_syn_23;
  wire o_0;
  wire o_1;
  wire o_2;
  wire o_3;
  wire o_4;
  wire o_5;

  xor al_202 (al_192[0], i0[0], i1[0]);
  xor al_203 (al_192[1], i0[1], i1[1]);
  xor al_204 (al_192[2], i0[2], i1[2]);
  xor al_205 (al_192[3], i0[3], i1[3]);
  xor al_206 (al_192[4], i0[4], i1[4]);
  xor al_207 (al_192[5], i0[5], i1[5]);
  xor al_208 (al_192[6], i0[6], i1[6]);
  xor al_209 (al_192[7], i0[7], i1[7]);
  xor al_210 (al_192[8], i0[8], i1[8]);
  xor al_211 (al_192[9], i0[9], i1[9]);
  or al_212 (diff_6_9, al_192[6], al_192[7], al_192[8], al_192[9]);
  AL_MUX al_221 (
    .i0(ci),
    .i1(i1[0]),
    .sel(al_192[0]),
    .o(o_0));
  AL_MUX al_222 (
    .i0(o_0),
    .i1(i1[1]),
    .sel(al_192[1]),
    .o(o_1));
  AL_MUX al_223 (
    .i0(o_1),
    .i1(i1[2]),
    .sel(al_192[2]),
    .o(o_2));
  AL_MUX al_224 (
    .i0(o_2),
    .i1(i1[3]),
    .sel(al_192[3]),
    .o(o_3));
  AL_MUX al_225 (
    .i0(o_3),
    .i1(i1[4]),
    .sel(al_192[4]),
    .o(o_4));
  AL_MUX al_226 (
    .i0(o_4),
    .i1(i1[5]),
    .sel(al_192[5]),
    .o(o_5));
  AL_MUX al_227 (
    .i0(o_5),
    .i1(less_6_9),
    .sel(diff_6_9),
    .o(o));
  xor less_6_9_syn_2 (less_6_9_syn_11, i0[6], i1[6]);
  AL_MUX less_6_9_syn_3 (
    .i0(1'b0),
    .i1(i1[6]),
    .sel(less_6_9_syn_11),
    .o(less_6_9_syn_14));
  xor less_6_9_syn_4 (less_6_9_syn_15, i0[7], i1[7]);
  AL_MUX less_6_9_syn_5 (
    .i0(less_6_9_syn_14),
    .i1(i1[7]),
    .sel(less_6_9_syn_15),
    .o(less_6_9_syn_18));
  xor less_6_9_syn_6 (less_6_9_syn_19, i0[8], i1[8]);
  AL_MUX less_6_9_syn_7 (
    .i0(less_6_9_syn_18),
    .i1(i1[8]),
    .sel(less_6_9_syn_19),
    .o(less_6_9_syn_22));
  xor less_6_9_syn_8 (less_6_9_syn_23, i0[9], i1[9]);
  AL_MUX less_6_9_syn_9 (
    .i0(less_6_9_syn_22),
    .i1(i1[9]),
    .sel(less_6_9_syn_23),
    .o(less_6_9));

endmodule 

module lt_u3_u3
  (
  ci,
  i0,
  i1,
  o
  );

  input ci;
  input [2:0] i0;
  input [2:0] i1;
  output o;

  wire net_cin;
  wire diff_0;
  wire a_0;
  wire b_0;
  wire o_0;
  wire diff_1;
  wire a_1;
  wire b_1;
  wire o_1;
  wire diff_2;
  wire a_2;
  wire b_2;
  wire o_2;

  assign net_cin = ci;
  assign a_2 = i0[2];
  assign a_1 = i0[1];
  assign a_0 = i0[0];
  assign b_2 = i1[2];
  assign b_1 = i1[1];
  assign b_0 = i1[0];
  assign o = o_2;
  xor al_564 (diff_0, a_0, b_0);
  AL_MUX al_565 (
    .i0(net_cin),
    .i1(b_0),
    .sel(diff_0),
    .o(o_0));
  xor al_566 (diff_1, a_1, b_1);
  AL_MUX al_567 (
    .i0(o_0),
    .i1(b_1),
    .sel(diff_1),
    .o(o_1));
  xor al_568 (diff_2, a_2, b_2);
  AL_MUX al_569 (
    .i0(o_1),
    .i1(b_2),
    .sel(diff_2),
    .o(o_2));

endmodule 

module lt_u2_u2
  (
  ci,
  i0,
  i1,
  o
  );

  input ci;
  input [1:0] i0;
  input [1:0] i1;
  output o;

  wire [1:0] al_577;
  wire o_0;

  xor al_579 (al_577[0], i0[0], i1[0]);
  xor al_580 (al_577[1], i0[1], i1[1]);
  AL_MUX al_581 (
    .i0(ci),
    .i1(i1[0]),
    .sel(al_577[0]),
    .o(o_0));
  AL_MUX al_582 (
    .i0(o_0),
    .i1(i1[1]),
    .sel(al_577[1]),
    .o(o));

endmodule 

module binary_mux_s4_w1
  (
  i0,
  i1,
  i10,
  i11,
  i12,
  i13,
  i14,
  i15,
  i2,
  i3,
  i4,
  i5,
  i6,
  i7,
  i8,
  i9,
  sel,
  o
  );

  input i0;
  input i1;
  input i10;
  input i11;
  input i12;
  input i13;
  input i14;
  input i15;
  input i2;
  input i3;
  input i4;
  input i5;
  input i6;
  input i7;
  input i8;
  input i9;
  input [3:0] sel;
  output o;

  wire  al_364;
  wire  al_365;
  wire  al_366;
  wire  al_367;
  wire  al_368;
  wire  al_369;
  wire  al_370;
  wire  al_371;
  wire  al_372;
  wire  al_373;
  wire  al_374;
  wire  al_375;
  wire  al_376;
  wire  al_377;

  AL_MUX al_378 (
    .i0(al_364),
    .i1(al_365),
    .sel(sel[3]),
    .o(o));
  AL_MUX al_379 (
    .i0(al_366),
    .i1(al_367),
    .sel(sel[2]),
    .o(al_364));
  AL_MUX al_380 (
    .i0(al_368),
    .i1(al_369),
    .sel(sel[2]),
    .o(al_365));
  AL_MUX al_381 (
    .i0(al_370),
    .i1(al_371),
    .sel(sel[1]),
    .o(al_366));
  AL_MUX al_382 (
    .i0(al_372),
    .i1(al_373),
    .sel(sel[1]),
    .o(al_367));
  AL_MUX al_383 (
    .i0(al_374),
    .i1(al_375),
    .sel(sel[1]),
    .o(al_368));
  AL_MUX al_384 (
    .i0(al_376),
    .i1(al_377),
    .sel(sel[1]),
    .o(al_369));
  AL_MUX al_385 (
    .i0(i0),
    .i1(i1),
    .sel(sel[0]),
    .o(al_370));
  AL_MUX al_386 (
    .i0(i2),
    .i1(i3),
    .sel(sel[0]),
    .o(al_371));
  AL_MUX al_387 (
    .i0(i4),
    .i1(i5),
    .sel(sel[0]),
    .o(al_372));
  AL_MUX al_388 (
    .i0(i6),
    .i1(i7),
    .sel(sel[0]),
    .o(al_373));
  AL_MUX al_389 (
    .i0(i8),
    .i1(i9),
    .sel(sel[0]),
    .o(al_374));
  AL_MUX al_390 (
    .i0(i10),
    .i1(i11),
    .sel(sel[0]),
    .o(al_375));
  AL_MUX al_391 (
    .i0(i12),
    .i1(i13),
    .sel(sel[0]),
    .o(al_376));
  AL_MUX al_392 (
    .i0(i14),
    .i1(i15),
    .sel(sel[0]),
    .o(al_377));

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


  AL_MUX al_393 (
    .i0(i0),
    .i1(i1),
    .sel(sel),
    .o(o));

endmodule 

module ne_w8
  (
  i0,
  i1,
  o
  );

  input [7:0] i0;
  input [7:0] i1;
  output o;

  wire [7:0] al_394;

  or al_402 (o, al_394[0], al_394[1], al_394[2], al_394[3], al_394[4], al_394[5], al_394[6], al_394[7]);
  xor al_403 (al_394[0], i0[0], i1[0]);
  xor al_404 (al_394[1], i0[1], i1[1]);
  xor al_405 (al_394[2], i0[2], i1[2]);
  xor al_406 (al_394[3], i0[3], i1[3]);
  xor al_407 (al_394[4], i0[4], i1[4]);
  xor al_408 (al_394[5], i0[5], i1[5]);
  xor al_409 (al_394[6], i0[6], i1[6]);
  xor al_410 (al_394[7], i0[7], i1[7]);

endmodule 

module binary_mux_s2_w1
  (
  i0,
  i1,
  i2,
  i3,
  sel,
  o
  );

  input i0;
  input i1;
  input i2;
  input i3;
  input [1:0] sel;
  output o;

  wire  al_411;
  wire  al_412;

  AL_MUX al_413 (
    .i0(al_411),
    .i1(al_412),
    .sel(sel[1]),
    .o(o));
  AL_MUX al_414 (
    .i0(i0),
    .i1(i1),
    .sel(sel[0]),
    .o(al_411));
  AL_MUX al_415 (
    .i0(i2),
    .i1(i3),
    .sel(sel[0]),
    .o(al_412));

endmodule 

module binary_mux_s3_w1
  (
  i0,
  i1,
  i2,
  i3,
  i4,
  i5,
  i6,
  i7,
  sel,
  o
  );

  input i0;
  input i1;
  input i2;
  input i3;
  input i4;
  input i5;
  input i6;
  input i7;
  input [2:0] sel;
  output o;

  wire  al_426;
  wire  al_427;
  wire  al_428;
  wire  al_429;
  wire  al_430;
  wire  al_431;

  AL_MUX al_432 (
    .i0(al_426),
    .i1(al_427),
    .sel(sel[2]),
    .o(o));
  AL_MUX al_433 (
    .i0(al_428),
    .i1(al_429),
    .sel(sel[1]),
    .o(al_426));
  AL_MUX al_434 (
    .i0(al_430),
    .i1(al_431),
    .sel(sel[1]),
    .o(al_427));
  AL_MUX al_435 (
    .i0(i0),
    .i1(i1),
    .sel(sel[0]),
    .o(al_428));
  AL_MUX al_436 (
    .i0(i2),
    .i1(i3),
    .sel(sel[0]),
    .o(al_429));
  AL_MUX al_437 (
    .i0(i4),
    .i1(i5),
    .sel(sel[0]),
    .o(al_430));
  AL_MUX al_438 (
    .i0(i6),
    .i1(i7),
    .sel(sel[0]),
    .o(al_431));

endmodule 

module add_pu10_mu10_o11
  (
  i0,
  i1,
  o
  );

  input [9:0] i0;
  input [9:0] i1;
  output [10:0] o;

  wire net_a0;
  wire net_b0;
  wire net_nb0;
  wire net_sum0;
  wire net_cout0;
  wire net_a1;
  wire net_b1;
  wire net_nb1;
  wire net_sum1;
  wire net_cout1;
  wire net_a2;
  wire net_b2;
  wire net_nb2;
  wire net_sum2;
  wire net_cout2;
  wire net_a3;
  wire net_b3;
  wire net_nb3;
  wire net_sum3;
  wire net_cout3;
  wire net_a4;
  wire net_b4;
  wire net_nb4;
  wire net_sum4;
  wire net_cout4;
  wire net_a5;
  wire net_b5;
  wire net_nb5;
  wire net_sum5;
  wire net_cout5;
  wire net_ncout;
  wire net_a6;
  wire net_b6;
  wire net_nb6;
  wire net_sum6;
  wire net_cout6;
  wire net_a7;
  wire net_b7;
  wire net_nb7;
  wire net_sum7;
  wire net_cout7;
  wire net_a8;
  wire net_b8;
  wire net_nb8;
  wire net_sum8;
  wire net_cout8;
  wire net_a9;
  wire net_b9;
  wire net_nb9;
  wire net_sum9;
  wire net_cout9;

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
  assign o[10] = net_ncout;
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
  AL_FADD al_107 (
    .a(net_a0),
    .b(net_nb0),
    .c(1'b1),
    .cout(net_cout0),
    .sum(net_sum0));
  AL_FADD al_108 (
    .a(net_a1),
    .b(net_nb1),
    .c(net_cout0),
    .cout(net_cout1),
    .sum(net_sum1));
  AL_FADD al_109 (
    .a(net_a2),
    .b(net_nb2),
    .c(net_cout1),
    .cout(net_cout2),
    .sum(net_sum2));
  AL_FADD al_110 (
    .a(net_a3),
    .b(net_nb3),
    .c(net_cout2),
    .cout(net_cout3),
    .sum(net_sum3));
  AL_FADD al_111 (
    .a(net_a4),
    .b(net_nb4),
    .c(net_cout3),
    .cout(net_cout4),
    .sum(net_sum4));
  AL_FADD al_112 (
    .a(net_a5),
    .b(net_nb5),
    .c(net_cout4),
    .cout(net_cout5),
    .sum(net_sum5));
  AL_FADD al_113 (
    .a(net_a6),
    .b(net_nb6),
    .c(net_cout5),
    .cout(net_cout6),
    .sum(net_sum6));
  AL_FADD al_114 (
    .a(net_a7),
    .b(net_nb7),
    .c(net_cout6),
    .cout(net_cout7),
    .sum(net_sum7));
  AL_FADD al_115 (
    .a(net_a8),
    .b(net_nb8),
    .c(net_cout7),
    .cout(net_cout8),
    .sum(net_sum8));
  AL_FADD al_116 (
    .a(net_a9),
    .b(net_nb9),
    .c(net_cout8),
    .cout(net_cout9),
    .sum(net_sum9));
  not al_117 (net_nb0, net_b0);
  not al_118 (net_nb1, net_b1);
  not al_119 (net_nb2, net_b2);
  not al_120 (net_nb3, net_b3);
  not al_121 (net_nb4, net_b4);
  not al_122 (net_nb5, net_b5);
  not al_123 (net_nb6, net_b6);
  not al_124 (net_nb7, net_b7);
  not al_125 (net_nb8, net_b8);
  not al_126 (net_nb9, net_b9);
  not al_127 (net_ncout, net_cout9);

endmodule 

module add_pu4_mu4_o4
  (
  i0,
  i1,
  o
  );

  input [3:0] i0;
  input [3:0] i1;
  output [3:0] o;

  wire net_a0;
  wire net_b0;
  wire net_nb0;
  wire net_sum0;
  wire net_cout0;
  wire net_a1;
  wire net_b1;
  wire net_nb1;
  wire net_sum1;
  wire net_cout1;
  wire net_a2;
  wire net_b2;
  wire net_nb2;
  wire net_sum2;
  wire net_cout2;
  wire net_a3;
  wire net_b3;
  wire net_nb3;
  wire net_sum3;
  wire net_cout3;

  assign net_a3 = i0[3];
  assign net_a2 = i0[2];
  assign net_a1 = i0[1];
  assign net_a0 = i0[0];
  assign net_b3 = i1[3];
  assign net_b2 = i1[2];
  assign net_b1 = i1[1];
  assign net_b0 = i1[0];
  assign o[3] = net_sum3;
  assign o[2] = net_sum2;
  assign o[1] = net_sum1;
  assign o[0] = net_sum0;
  AL_FADD al_140 (
    .a(net_a0),
    .b(net_nb0),
    .c(1'b1),
    .cout(net_cout0),
    .sum(net_sum0));
  AL_FADD al_141 (
    .a(net_a1),
    .b(net_nb1),
    .c(net_cout0),
    .cout(net_cout1),
    .sum(net_sum1));
  AL_FADD al_142 (
    .a(net_a2),
    .b(net_nb2),
    .c(net_cout1),
    .cout(net_cout2),
    .sum(net_sum2));
  AL_FADD al_143 (
    .a(net_a3),
    .b(net_nb3),
    .c(net_cout2),
    .cout(net_cout3),
    .sum(net_sum3));
  not al_144 (net_nb0, net_b0);
  not al_145 (net_nb1, net_b1);
  not al_146 (net_nb2, net_b2);
  not al_147 (net_nb3, net_b3);

endmodule 

module add_pu8_mu8_o8
  (
  i0,
  i1,
  o
  );

  input [7:0] i0;
  input [7:0] i1;
  output [7:0] o;

  wire net_a0;
  wire net_b0;
  wire net_nb0;
  wire net_sum0;
  wire net_cout0;
  wire net_a1;
  wire net_b1;
  wire net_nb1;
  wire net_sum1;
  wire net_cout1;
  wire net_a2;
  wire net_b2;
  wire net_nb2;
  wire net_sum2;
  wire net_cout2;
  wire net_a3;
  wire net_b3;
  wire net_nb3;
  wire net_sum3;
  wire net_cout3;
  wire net_a4;
  wire net_b4;
  wire net_nb4;
  wire net_sum4;
  wire net_cout4;
  wire net_a5;
  wire net_b5;
  wire net_nb5;
  wire net_sum5;
  wire net_cout5;
  wire net_a6;
  wire net_b6;
  wire net_nb6;
  wire net_sum6;
  wire net_cout6;
  wire net_a7;
  wire net_b7;
  wire net_nb7;
  wire net_sum7;
  wire net_cout7;

  assign net_a7 = i0[7];
  assign net_a6 = i0[6];
  assign net_a5 = i0[5];
  assign net_a4 = i0[4];
  assign net_a3 = i0[3];
  assign net_a2 = i0[2];
  assign net_a1 = i0[1];
  assign net_a0 = i0[0];
  assign net_b7 = i1[7];
  assign net_b6 = i1[6];
  assign net_b5 = i1[5];
  assign net_b4 = i1[4];
  assign net_b3 = i1[3];
  assign net_b2 = i1[2];
  assign net_b1 = i1[1];
  assign net_b0 = i1[0];
  assign o[7] = net_sum7;
  assign o[6] = net_sum6;
  assign o[5] = net_sum5;
  assign o[4] = net_sum4;
  assign o[3] = net_sum3;
  assign o[2] = net_sum2;
  assign o[1] = net_sum1;
  assign o[0] = net_sum0;
  AL_FADD al_492 (
    .a(net_a0),
    .b(net_nb0),
    .c(1'b1),
    .cout(net_cout0),
    .sum(net_sum0));
  AL_FADD al_493 (
    .a(net_a1),
    .b(net_nb1),
    .c(net_cout0),
    .cout(net_cout1),
    .sum(net_sum1));
  AL_FADD al_494 (
    .a(net_a2),
    .b(net_nb2),
    .c(net_cout1),
    .cout(net_cout2),
    .sum(net_sum2));
  AL_FADD al_495 (
    .a(net_a3),
    .b(net_nb3),
    .c(net_cout2),
    .cout(net_cout3),
    .sum(net_sum3));
  AL_FADD al_496 (
    .a(net_a4),
    .b(net_nb4),
    .c(net_cout3),
    .cout(net_cout4),
    .sum(net_sum4));
  AL_FADD al_497 (
    .a(net_a5),
    .b(net_nb5),
    .c(net_cout4),
    .cout(net_cout5),
    .sum(net_sum5));
  AL_FADD al_498 (
    .a(net_a6),
    .b(net_nb6),
    .c(net_cout5),
    .cout(net_cout6),
    .sum(net_sum6));
  AL_FADD al_499 (
    .a(net_a7),
    .b(net_nb7),
    .c(net_cout6),
    .cout(net_cout7),
    .sum(net_sum7));
  not al_500 (net_nb0, net_b0);
  not al_501 (net_nb1, net_b1);
  not al_502 (net_nb2, net_b2);
  not al_503 (net_nb3, net_b3);
  not al_504 (net_nb4, net_b4);
  not al_505 (net_nb5, net_b5);
  not al_506 (net_nb6, net_b6);
  not al_507 (net_nb7, net_b7);

endmodule 

module add_pu6_mu6_o6
  (
  i0,
  i1,
  o
  );

  input [5:0] i0;
  input [5:0] i1;
  output [5:0] o;

  wire net_a0;
  wire net_b0;
  wire net_nb0;
  wire net_sum0;
  wire net_cout0;
  wire net_a1;
  wire net_b1;
  wire net_nb1;
  wire net_sum1;
  wire net_cout1;
  wire net_a2;
  wire net_b2;
  wire net_nb2;
  wire net_sum2;
  wire net_cout2;
  wire net_a3;
  wire net_b3;
  wire net_nb3;
  wire net_sum3;
  wire net_cout3;
  wire net_a4;
  wire net_b4;
  wire net_nb4;
  wire net_sum4;
  wire net_cout4;
  wire net_a5;
  wire net_b5;
  wire net_nb5;
  wire net_sum5;
  wire net_cout5;

  assign net_a5 = i0[5];
  assign net_a4 = i0[4];
  assign net_a3 = i0[3];
  assign net_a2 = i0[2];
  assign net_a1 = i0[1];
  assign net_a0 = i0[0];
  assign net_b5 = i1[5];
  assign net_b4 = i1[4];
  assign net_b3 = i1[3];
  assign net_b2 = i1[2];
  assign net_b1 = i1[1];
  assign net_b0 = i1[0];
  assign o[5] = net_sum5;
  assign o[4] = net_sum4;
  assign o[3] = net_sum3;
  assign o[2] = net_sum2;
  assign o[1] = net_sum1;
  assign o[0] = net_sum0;
  AL_FADD al_128 (
    .a(net_a0),
    .b(net_nb0),
    .c(1'b1),
    .cout(net_cout0),
    .sum(net_sum0));
  AL_FADD al_129 (
    .a(net_a1),
    .b(net_nb1),
    .c(net_cout0),
    .cout(net_cout1),
    .sum(net_sum1));
  AL_FADD al_130 (
    .a(net_a2),
    .b(net_nb2),
    .c(net_cout1),
    .cout(net_cout2),
    .sum(net_sum2));
  AL_FADD al_131 (
    .a(net_a3),
    .b(net_nb3),
    .c(net_cout2),
    .cout(net_cout3),
    .sum(net_sum3));
  AL_FADD al_132 (
    .a(net_a4),
    .b(net_nb4),
    .c(net_cout3),
    .cout(net_cout4),
    .sum(net_sum4));
  AL_FADD al_133 (
    .a(net_a5),
    .b(net_nb5),
    .c(net_cout4),
    .cout(net_cout5),
    .sum(net_sum5));
  not al_134 (net_nb0, net_b0);
  not al_135 (net_nb1, net_b1);
  not al_136 (net_nb2, net_b2);
  not al_137 (net_nb3, net_b3);
  not al_138 (net_nb4, net_b4);
  not al_139 (net_nb5, net_b5);

endmodule 

module add_pu7_mu7_o7
  (
  i0,
  i1,
  o
  );

  input [6:0] i0;
  input [6:0] i1;
  output [6:0] o;

  wire net_a0;
  wire net_b0;
  wire net_nb0;
  wire net_sum0;
  wire net_cout0;
  wire net_a1;
  wire net_b1;
  wire net_nb1;
  wire net_sum1;
  wire net_cout1;
  wire net_a2;
  wire net_b2;
  wire net_nb2;
  wire net_sum2;
  wire net_cout2;
  wire net_a3;
  wire net_b3;
  wire net_nb3;
  wire net_sum3;
  wire net_cout3;
  wire net_a4;
  wire net_b4;
  wire net_nb4;
  wire net_sum4;
  wire net_cout4;
  wire net_a5;
  wire net_b5;
  wire net_nb5;
  wire net_sum5;
  wire net_cout5;
  wire net_a6;
  wire net_b6;
  wire net_nb6;
  wire net_sum6;
  wire net_cout6;

  assign net_a6 = i0[6];
  assign net_a5 = i0[5];
  assign net_a4 = i0[4];
  assign net_a3 = i0[3];
  assign net_a2 = i0[2];
  assign net_a1 = i0[1];
  assign net_a0 = i0[0];
  assign net_b6 = i1[6];
  assign net_b5 = i1[5];
  assign net_b4 = i1[4];
  assign net_b3 = i1[3];
  assign net_b2 = i1[2];
  assign net_b1 = i1[1];
  assign net_b0 = i1[0];
  assign o[6] = net_sum6;
  assign o[5] = net_sum5;
  assign o[4] = net_sum4;
  assign o[3] = net_sum3;
  assign o[2] = net_sum2;
  assign o[1] = net_sum1;
  assign o[0] = net_sum0;
  AL_FADD al_153 (
    .a(net_a0),
    .b(net_nb0),
    .c(1'b1),
    .cout(net_cout0),
    .sum(net_sum0));
  AL_FADD al_154 (
    .a(net_a1),
    .b(net_nb1),
    .c(net_cout0),
    .cout(net_cout1),
    .sum(net_sum1));
  AL_FADD al_155 (
    .a(net_a2),
    .b(net_nb2),
    .c(net_cout1),
    .cout(net_cout2),
    .sum(net_sum2));
  AL_FADD al_156 (
    .a(net_a3),
    .b(net_nb3),
    .c(net_cout2),
    .cout(net_cout3),
    .sum(net_sum3));
  AL_FADD al_157 (
    .a(net_a4),
    .b(net_nb4),
    .c(net_cout3),
    .cout(net_cout4),
    .sum(net_sum4));
  AL_FADD al_158 (
    .a(net_a5),
    .b(net_nb5),
    .c(net_cout4),
    .cout(net_cout5),
    .sum(net_sum5));
  AL_FADD al_159 (
    .a(net_a6),
    .b(net_nb6),
    .c(net_cout5),
    .cout(net_cout6),
    .sum(net_sum6));
  not al_160 (net_nb0, net_b0);
  not al_161 (net_nb1, net_b1);
  not al_162 (net_nb2, net_b2);
  not al_163 (net_nb3, net_b3);
  not al_164 (net_nb4, net_b4);
  not al_165 (net_nb5, net_b5);
  not al_166 (net_nb6, net_b6);

endmodule 

module add_pu10_mu10_o10
  (
  i0,
  i1,
  o
  );

  input [9:0] i0;
  input [9:0] i1;
  output [9:0] o;

  wire net_a0;
  wire net_b0;
  wire net_nb0;
  wire net_sum0;
  wire net_cout0;
  wire net_a1;
  wire net_b1;
  wire net_nb1;
  wire net_sum1;
  wire net_cout1;
  wire net_a2;
  wire net_b2;
  wire net_nb2;
  wire net_sum2;
  wire net_cout2;
  wire net_a3;
  wire net_b3;
  wire net_nb3;
  wire net_sum3;
  wire net_cout3;
  wire net_a4;
  wire net_b4;
  wire net_nb4;
  wire net_sum4;
  wire net_cout4;
  wire net_a5;
  wire net_b5;
  wire net_nb5;
  wire net_sum5;
  wire net_cout5;
  wire net_a6;
  wire net_b6;
  wire net_nb6;
  wire net_sum6;
  wire net_cout6;
  wire net_a7;
  wire net_b7;
  wire net_nb7;
  wire net_sum7;
  wire net_cout7;
  wire net_a8;
  wire net_b8;
  wire net_nb8;
  wire net_sum8;
  wire net_cout8;
  wire net_a9;
  wire net_b9;
  wire net_nb9;
  wire net_sum9;
  wire net_cout9;

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
  AL_FADD al_472 (
    .a(net_a0),
    .b(net_nb0),
    .c(1'b1),
    .cout(net_cout0),
    .sum(net_sum0));
  AL_FADD al_473 (
    .a(net_a1),
    .b(net_nb1),
    .c(net_cout0),
    .cout(net_cout1),
    .sum(net_sum1));
  AL_FADD al_474 (
    .a(net_a2),
    .b(net_nb2),
    .c(net_cout1),
    .cout(net_cout2),
    .sum(net_sum2));
  AL_FADD al_475 (
    .a(net_a3),
    .b(net_nb3),
    .c(net_cout2),
    .cout(net_cout3),
    .sum(net_sum3));
  AL_FADD al_476 (
    .a(net_a4),
    .b(net_nb4),
    .c(net_cout3),
    .cout(net_cout4),
    .sum(net_sum4));
  AL_FADD al_477 (
    .a(net_a5),
    .b(net_nb5),
    .c(net_cout4),
    .cout(net_cout5),
    .sum(net_sum5));
  AL_FADD al_478 (
    .a(net_a6),
    .b(net_nb6),
    .c(net_cout5),
    .cout(net_cout6),
    .sum(net_sum6));
  AL_FADD al_479 (
    .a(net_a7),
    .b(net_nb7),
    .c(net_cout6),
    .cout(net_cout7),
    .sum(net_sum7));
  AL_FADD al_480 (
    .a(net_a8),
    .b(net_nb8),
    .c(net_cout7),
    .cout(net_cout8),
    .sum(net_sum8));
  AL_FADD al_481 (
    .a(net_a9),
    .b(net_nb9),
    .c(net_cout8),
    .cout(net_cout9),
    .sum(net_sum9));
  not al_482 (net_nb0, net_b0);
  not al_483 (net_nb1, net_b1);
  not al_484 (net_nb2, net_b2);
  not al_485 (net_nb3, net_b3);
  not al_486 (net_nb4, net_b4);
  not al_487 (net_nb5, net_b5);
  not al_488 (net_nb6, net_b6);
  not al_489 (net_nb7, net_b7);
  not al_490 (net_nb8, net_b8);
  not al_491 (net_nb9, net_b9);

endmodule 


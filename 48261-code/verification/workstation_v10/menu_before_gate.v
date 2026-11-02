// Verilog netlist created by Tang Dynasty v6.2.168116
// Wed Oct 28 17:01:25 2026

`timescale 1ns / 1ps
module media_menu_overlay  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(2)
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

  wire [23:0] bg;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  wire [23:0] bg1;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(9)
  wire [23:0] bg2;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(9)
  wire [5:0] bg_b12;
  wire [22:0] bg_b2;
  wire [15:0] bits;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(11)
  wire [15:0] bits_b;
  wire [6:0] char_id;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(11)
  wire [3:0] col1;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(10)
  wire [3:0] col2;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(10)
  wire [1:0] deq;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(8)
  wire [23:0] fg1;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(9)
  wire [23:0] fg2;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(9)
  wire [9:0] footer_left;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(15)
  wire  mux0_syn_18;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1166)
  wire  mux0_syn_20;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1166)
  wire [9:0] mux68_syn_2;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1158)
  wire  ramread1_syn_619;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire  ramread1_syn_672;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire  ramread1_syn_725;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire  ramread1_syn_831;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire  ramread1_syn_881;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire  ramread1_syn_882;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire  ramread1_syn_933;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire  ramread1_syn_934;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire [3:0] row1;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(10)
  wire [4:0] sel1_syn_2;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(20)
  wire [4:0] sel2_syn_2;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(20)
  wire [7:0] sel6_syn_2;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1117)
  wire [7:0] sub0_syn_3;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1115)
  wire [1:0] sub1_syn_4;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1115)
  wire [2:0] sub2_syn_3;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1125)
  wire [2:0] sub3_syn_4;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1127)
  wire [7:0] sub4_syn_3;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1148)
  wire [6:0] sub7_syn_4;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1151)
  wire [9:0] text_addr;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire [9:0] text_addr_b12;
  wire [9:0] text_addr_b15;
  wire [1:0] vq;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(8)
  wire [9:0] x;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(7)
  wire [9:0] x_b;
  wire [9:0] x_b4;
  wire [9:0] y;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(7)
  wire [9:0] y_b;
  wire [9:0] y_b2;
  wire add8_syn_54;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1159)
  wire add8_syn_58;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1159)
  wire add9_syn_54;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1159)
  wire add9_syn_58;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1159)
  wire eq25_syn_17;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1111)
  wire eq5_syn_19;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1096)
  wire lt0_syn_6;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(22)
  wire lt0_syn_10;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(22)
  wire lt0_syn_14;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(22)
  wire lt0_syn_18;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(22)
  wire lt1_syn_6;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1112)
  wire lt1_syn_10;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1112)
  wire lt1_syn_14;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1112)
  wire lt1_syn_18;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1112)
  wire lt10_syn_5;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1124)
  wire lt10_syn_9;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1124)
  wire lt10_syn_13;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1124)
  wire lt11_syn_6;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1125)
  wire lt11_syn_10;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1125)
  wire lt11_syn_14;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1125)
  wire lt11_syn_18;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1125)
  wire lt11_syn_22;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1125)
  wire lt11_syn_26;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1125)
  wire lt12_syn_6;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1126)
  wire lt12_syn_10;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1126)
  wire lt12_syn_14;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1126)
  wire lt14_syn_6;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1099)
  wire lt14_syn_10;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1099)
  wire lt14_syn_14;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1099)
  wire lt14_syn_18;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1099)
  wire lt14_syn_22;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1099)
  wire lt15_syn_6;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1099)
  wire lt15_syn_10;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1099)
  wire lt15_syn_14;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1099)
  wire lt15_syn_18;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1099)
  wire lt15_syn_22;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1099)
  wire lt18_syn_6;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1099)
  wire lt18_syn_10;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1099)
  wire lt18_syn_14;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1099)
  wire lt18_syn_18;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1099)
  wire lt18_syn_22;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1099)
  wire lt19_syn_6;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1099)
  wire lt19_syn_10;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1099)
  wire lt19_syn_14;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1099)
  wire lt19_syn_18;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1099)
  wire lt19_syn_22;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1099)
  wire lt21_syn_5;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1135)
  wire lt21_syn_9;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1135)
  wire lt21_syn_13;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1135)
  wire lt21_syn_17;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1135)
  wire lt22_syn_6;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1100)
  wire lt22_syn_10;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1100)
  wire lt22_syn_14;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1100)
  wire lt22_syn_18;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1100)
  wire lt23_syn_6;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1100)
  wire lt23_syn_10;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1100)
  wire lt23_syn_14;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1100)
  wire lt23_syn_18;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1100)
  wire lt23_syn_22;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1100)
  wire lt24_syn_6;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1100)
  wire lt24_syn_10;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1100)
  wire lt24_syn_14;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1100)
  wire lt24_syn_18;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1100)
  wire lt25_syn_6;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1146)
  wire lt25_syn_10;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1146)
  wire lt25_syn_14;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1146)
  wire lt25_syn_18;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1146)
  wire lt26_syn_6;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1146)
  wire lt26_syn_10;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1146)
  wire lt26_syn_14;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1146)
  wire lt26_syn_18;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1146)
  wire lt26_syn_22;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1146)
  wire lt27_syn_6;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1100)
  wire lt27_syn_10;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1100)
  wire lt27_syn_14;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1100)
  wire lt27_syn_18;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1100)
  wire lt28_syn_6;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1147)
  wire lt28_syn_10;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1147)
  wire lt28_syn_14;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1147)
  wire lt28_syn_18;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1147)
  wire lt29_syn_6;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1147)
  wire lt29_syn_10;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1147)
  wire lt29_syn_14;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1147)
  wire lt29_syn_18;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1147)
  wire lt3_syn_6;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1114)
  wire lt3_syn_10;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1114)
  wire lt3_syn_14;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1114)
  wire lt3_syn_18;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1114)
  wire lt31_syn_6;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1147)
  wire lt31_syn_10;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1147)
  wire lt31_syn_14;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1147)
  wire lt31_syn_18;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1147)
  wire lt32_syn_6;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1150)
  wire lt32_syn_10;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1150)
  wire lt32_syn_14;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1150)
  wire lt32_syn_18;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1150)
  wire lt33_syn_6;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1150)
  wire lt33_syn_10;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1150)
  wire lt33_syn_14;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1150)
  wire lt33_syn_18;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1150)
  wire lt34_syn_5;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1150)
  wire lt34_syn_9;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1150)
  wire lt34_syn_13;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1150)
  wire lt34_syn_17;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1150)
  wire lt34_syn_21;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1150)
  wire lt36_syn_6;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1150)
  wire lt36_syn_10;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1150)
  wire lt36_syn_14;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1150)
  wire lt36_syn_18;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1150)
  wire lt36_syn_22;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1150)
  wire lt38_syn_28;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1101)
  wire lt41_syn_6;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1104)
  wire lt41_syn_10;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1104)
  wire lt41_syn_14;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1104)
  wire lt45_syn_6;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1106)
  wire lt45_syn_10;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1106)
  wire lt45_syn_14;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1106)
  wire lt47_syn_6;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1108)
  wire lt47_syn_10;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1108)
  wire lt47_syn_14;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1108)
  wire lt48_syn_6;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(22)
  wire lt48_syn_10;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(22)
  wire lt48_syn_14;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(22)
  wire lt48_syn_18;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(22)
  wire lt9_syn_5;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1124)
  wire lt9_syn_9;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1124)
  wire lt9_syn_13;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1124)
  wire mux45_syn_18;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1100)
  wire mux55_syn_68;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1097)
  wire mux64_syn_4;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1097)
  wire mux64_syn_6;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1097)
  wire mux64_syn_8;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1097)
  wire mux64_syn_10;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1097)
  wire mux64_syn_14;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1097)
  wire mux64_syn_16;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1097)
  wire mux64_syn_18;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1097)
  wire mux70_syn_18;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire mux70_syn_96;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire mux70_syn_98;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_27;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_29;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_31;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_33;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_35;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_37;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_39;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_41;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_43;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_45;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_47;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_52;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_54;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_56;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_58;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_60;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_62;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_64;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_66;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_68;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_70;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_72;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_77;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_79;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_81;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_83;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_85;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_87;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_89;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_91;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_93;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_95;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_97;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_102;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_104;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_106;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_108;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_110;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_112;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_114;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_116;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_118;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_120;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_122;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_125;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_127;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_129;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_131;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_133;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_135;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_137;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_139;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_141;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_143;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_145;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_147;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_152;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_154;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_156;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_158;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_160;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_162;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_164;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_166;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_168;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_170;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_172;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_177;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_179;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_181;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_183;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_185;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_187;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_189;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_191;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_193;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_195;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_197;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_200;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_202;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_204;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_206;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_208;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_210;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_212;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_214;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_216;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_218;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_220;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_222;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_224;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_227;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_229;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_231;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_233;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_235;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_237;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_239;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_241;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_243;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_245;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_247;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_249;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_251;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_253;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_255;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_258;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_260;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_262;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_264;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_266;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_268;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_270;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_272;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_274;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_276;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_278;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_280;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_282;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_284;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_286;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_289;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_291;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_293;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_295;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_297;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_299;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_301;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_303;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_305;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_307;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_309;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_311;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_313;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_315;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_317;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_319;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_322;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_324;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_326;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_328;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_330;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_332;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_334;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_336;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_338;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_340;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_342;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_344;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_346;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_348;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_350;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_355;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_357;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_359;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_361;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_363;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_365;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_367;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_369;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_371;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_373;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_375;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_377;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_379;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_381;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_383;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_386;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_388;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_390;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_392;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_394;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_396;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_398;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_400;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_402;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_404;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_406;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_408;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_410;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_412;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire ramread1_syn_414;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  wire sel6_syn_60;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1117)
  wire sel6_syn_137;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1117)
  wire sel6_syn_139;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1117)
  wire sel6_syn_141;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1117)
  wire sel6_syn_143;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1117)
  wire sel6_syn_146;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1117)
  wire sel6_syn_149;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1117)
  wire sel6_syn_151;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1117)
  wire sel6_syn_154;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1117)
  wire sel6_syn_159;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1117)
  wire sel6_syn_161;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1117)
  wire sel6_syn_164;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1117)
  wire sel6_syn_166;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1117)
  wire sel6_syn_168;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1117)
  wire sel6_syn_171;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1117)
  wire sel6_syn_173;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1117)
  wire sel6_syn_175;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1117)
  wire sub0_syn_52;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1115)
  wire sub0_syn_56;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1115)
  wire sub4_syn_51;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1148)
  wire sub4_syn_55;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1148)
  wire sub7_syn_47;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1151)
  wire audio_available_dup_1;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  wire audio_busy_dup_1;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  wire bar_b10_n;
  wire bar_b10_n1;
  wire bar_b1_n1;
  wire bar_b1_n2;
  wire bar_b5_n;
  wire bar_b9_n;
  wire bar_b_n1;
  wire \bg[22]_syn_2 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  wire \bg[21]_syn_2 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  wire \bg[21]_syn_4 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  wire \bg[20]_syn_2 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  wire \bg[20]_syn_4 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  wire \bg[20]_syn_6 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  wire \bg[18]_syn_2 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  wire \bg[17]_syn_2 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  wire \bg[17]_syn_4 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  wire \bg[13]_syn_4 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  wire \bg[13]_syn_6 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  wire \bg[12]_syn_2 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  wire \bg[12]_syn_4 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  wire \bg[11]_syn_3 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  wire \bg[6]_syn_2 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  wire \bg[6]_syn_4 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  wire \bg[6]_syn_6 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  wire \bg[4]_syn_2 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  wire \bg[4]_syn_4 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  wire \bg[4]_syn_6 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  wire \bg[1]_syn_2 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  wire \bg[1]_syn_5 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  wire \bg[1]_syn_7 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  wire \bg[1]_syn_9 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  wire \bg[1]_syn_11 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  wire \bg[1]_syn_13 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  wire \bg[1]_syn_17 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  wire \bg[1]_syn_19 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  wire \bg[1]_syn_21 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  wire \bg[0]_syn_2 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  wire \bg[0]_syn_4 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  wire \bg[0]_syn_6 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  wire bg_b10_n;
  wire bg_b1_n2;
  wire bg_b1_n4;
  wire bg_b1_n5;
  wire bg_b1_n6;
  wire bg_b3_n_syn_2;
  wire bg_b3_n10;
  wire bg_b3_n11;
  wire bg_b3_n3;
  wire bg_b3_n6;
  wire bg_b3_n8;
  wire bg_b3_n9;
  wire bg_b4_n2;
  wire bg_b4_n4;
  wire bg_b6_n1;
  wire bg_b7_n;
  wire bg_b8_n1;
  wire \brightness[7]_dup_31 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  wire \brightness[6]_dup_11 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  wire \brightness[5]_dup_9 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  wire \brightness[4]_dup_9 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  wire \brightness[3]_dup_5 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  wire \brightness[2]_dup_5 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  wire \brightness[1]_dup_5 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  wire \brightness[0]_dup_5 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  wire clk_dup_1;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(3)
  wire \contrast[7]_dup_21 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  wire \contrast[6]_dup_7 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  wire \contrast[5]_dup_5 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  wire \contrast[4]_dup_5 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  wire \contrast[3]_dup_3 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  wire \contrast[2]_dup_3 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  wire \contrast[1]_dup_3 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  wire \contrast[0]_dup_3 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  wire de_dup_3;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(3)
  wire de_out_dup_3;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)
  wire direct_n10;
  wire direct_n12;
  wire direct_n19;
  wire direct_n20;
  wire direct_n29;
  wire direct_n30;
  wire direct_n41;
  wire direct_n44;
  wire direct_n47;
  wire direct_n6;
  wire \field[2]_dup_1 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(3)
  wire \field[1]_dup_1 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(3)
  wire \field[0]_dup_1 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(3)
  wire \gx[3]_syn_2 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \gx[3]_syn_6 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \gx[3]_syn_8 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \gx[3]_syn_10 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \gx[2]_syn_2 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \gx[2]_syn_7 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \gx[2]_syn_10 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \gx[2]_syn_13 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \gx[2]_syn_15 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \gx[2]_syn_17 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \gx[2]_syn_19 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \gx[2]_syn_21 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \gx[2]_syn_23 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \gx[2]_syn_26 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \gx[2]_syn_28 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \gx[2]_syn_30 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \gx[2]_syn_32 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \gx[2]_syn_34 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \gx[2]_syn_36 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \gx[2]_syn_38 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \gx[2]_syn_40 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \gx[2]_syn_42 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \gx[2]_syn_44 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \gx[2]_syn_46 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \gx[2]_syn_48 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \gx[1]_syn_2 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \gx[0]_syn_2 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \gy[3]_syn_2 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \gy[3]_syn_5 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \gy[3]_syn_7 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \gy[3]_syn_9 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \gy[2]_syn_2 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \gy[2]_syn_4 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \gy[2]_syn_6 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \gy[1]_syn_2 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \gy[0]_syn_2 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \mode[1]_dup_1 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(3)
  wire \mode[0]_dup_1 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(3)
  wire \bits_b[15]_syn_2 ;
  wire \bits_b[15]_syn_4 ;
  wire \bits_b[15]_syn_6 ;
  wire \bits_b[15]_syn_8 ;
  wire \bits_b[15]_syn_10 ;
  wire \bits_b[15]_syn_12 ;
  wire \bits_b[15]_syn_14 ;
  wire \bits_b[14]_syn_2 ;
  wire \bits_b[14]_syn_4 ;
  wire \bits_b[14]_syn_6 ;
  wire \bits_b[14]_syn_8 ;
  wire \bits_b[14]_syn_10 ;
  wire \bits_b[14]_syn_12 ;
  wire \bits_b[14]_syn_14 ;
  wire \bits_b[14]_syn_16 ;
  wire \bits_b[13]_syn_2 ;
  wire \bits_b[13]_syn_4 ;
  wire \bits_b[13]_syn_6 ;
  wire \bits_b[13]_syn_8 ;
  wire \bits_b[13]_syn_10 ;
  wire \bits_b[13]_syn_12 ;
  wire \bits_b[13]_syn_14 ;
  wire \bits_b[13]_syn_16 ;
  wire \bits_b[12]_syn_2 ;
  wire \bits_b[12]_syn_4 ;
  wire \bits_b[12]_syn_6 ;
  wire \bits_b[12]_syn_8 ;
  wire \bits_b[12]_syn_10 ;
  wire \bits_b[12]_syn_12 ;
  wire \bits_b[12]_syn_14 ;
  wire \bits_b[12]_syn_16 ;
  wire \bits_b[12]_syn_18 ;
  wire \bits_b[11]_syn_2 ;
  wire \bits_b[11]_syn_4 ;
  wire \bits_b[11]_syn_6 ;
  wire \bits_b[11]_syn_8 ;
  wire \bits_b[11]_syn_10 ;
  wire \bits_b[11]_syn_12 ;
  wire \bits_b[11]_syn_14 ;
  wire \bits_b[11]_syn_16 ;
  wire \bits_b[11]_syn_18 ;
  wire \bits_b[11]_syn_20 ;
  wire \bits_b[10]_syn_2 ;
  wire \bits_b[10]_syn_4 ;
  wire \bits_b[10]_syn_6 ;
  wire \bits_b[10]_syn_8 ;
  wire \bits_b[10]_syn_10 ;
  wire \bits_b[10]_syn_12 ;
  wire \bits_b[10]_syn_14 ;
  wire \bits_b[10]_syn_16 ;
  wire \bits_b[9]_syn_2 ;
  wire \bits_b[9]_syn_4 ;
  wire \bits_b[9]_syn_6 ;
  wire \bits_b[9]_syn_8 ;
  wire \bits_b[9]_syn_10 ;
  wire \bits_b[9]_syn_13 ;
  wire \bits_b[9]_syn_15 ;
  wire \bits_b[9]_syn_17 ;
  wire \bits_b[9]_syn_19 ;
  wire \bits_b[8]_syn_2 ;
  wire \bits_b[8]_syn_4 ;
  wire \bits_b[8]_syn_6 ;
  wire \bits_b[8]_syn_8 ;
  wire \bits_b[8]_syn_11 ;
  wire \bits_b[8]_syn_13 ;
  wire \bits_b[8]_syn_16 ;
  wire \bits_b[7]_syn_2 ;
  wire \bits_b[7]_syn_4 ;
  wire \bits_b[7]_syn_6 ;
  wire \bits_b[7]_syn_8 ;
  wire \bits_b[7]_syn_10 ;
  wire \bits_b[7]_syn_12 ;
  wire \bits_b[7]_syn_15 ;
  wire \bits_b[6]_syn_2 ;
  wire \bits_b[6]_syn_4 ;
  wire \bits_b[6]_syn_6 ;
  wire \bits_b[6]_syn_8 ;
  wire \bits_b[6]_syn_10 ;
  wire \bits_b[6]_syn_12 ;
  wire \bits_b[5]_syn_2 ;
  wire \bits_b[5]_syn_4 ;
  wire \bits_b[5]_syn_6 ;
  wire \bits_b[5]_syn_8 ;
  wire \bits_b[5]_syn_10 ;
  wire \bits_b[5]_syn_13 ;
  wire \bits_b[4]_syn_2 ;
  wire \bits_b[4]_syn_4 ;
  wire \bits_b[4]_syn_6 ;
  wire \bits_b[4]_syn_9 ;
  wire \bits_b[4]_syn_11 ;
  wire \bits_b[3]_syn_2 ;
  wire \bits_b[3]_syn_4 ;
  wire \bits_b[3]_syn_6 ;
  wire \bits_b[3]_syn_8 ;
  wire \bits_b[3]_syn_10 ;
  wire \bits_b[3]_syn_13 ;
  wire \bits_b[2]_syn_2 ;
  wire \bits_b[2]_syn_4 ;
  wire \bits_b[2]_syn_6 ;
  wire \bits_b[2]_syn_8 ;
  wire \bits_b[2]_syn_10 ;
  wire \bits_b[2]_syn_12 ;
  wire \bits_b[1]_syn_2 ;
  wire \bits_b[1]_syn_4 ;
  wire \bits_b[1]_syn_6 ;
  wire \bits_b[1]_syn_8 ;
  wire \bits_b[1]_syn_10 ;
  wire \bits_b[1]_syn_12 ;
  wire \bg_b12[5]_syn_2 ;
  wire panel_n2;
  wire panel_n4;
  wire \rgb[23]_dup_1 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(3)
  wire \rgb[22]_dup_1 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(3)
  wire \rgb[21]_dup_1 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(3)
  wire \rgb[20]_dup_1 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(3)
  wire \rgb[19]_dup_1 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(3)
  wire \rgb[18]_dup_1 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(3)
  wire \rgb[17]_dup_1 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(3)
  wire \rgb[16]_dup_1 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(3)
  wire \rgb[15]_dup_1 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(3)
  wire \rgb[14]_dup_1 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(3)
  wire \rgb[13]_dup_1 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(3)
  wire \rgb[12]_dup_1 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(3)
  wire \rgb[11]_dup_1 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(3)
  wire \rgb[10]_dup_1 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(3)
  wire \rgb[9]_dup_1 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(3)
  wire \rgb[8]_dup_1 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(3)
  wire \rgb[7]_dup_1 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(3)
  wire \rgb[6]_dup_1 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(3)
  wire \rgb[5]_dup_1 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(3)
  wire \rgb[4]_dup_1 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(3)
  wire \rgb[3]_dup_1 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(3)
  wire \rgb[2]_dup_1 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(3)
  wire \rgb[1]_dup_1 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(3)
  wire \rgb[0]_dup_1 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(3)
  wire \rgb_out[23]_dup_1 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)
  wire \rgb_out[22]_dup_1 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)
  wire \rgb_out[21]_dup_1 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)
  wire \rgb_out[20]_dup_1 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)
  wire \rgb_out[19]_dup_1 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)
  wire \rgb_out[18]_dup_1 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)
  wire \rgb_out[17]_dup_1 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)
  wire \rgb_out[17]_syn_4 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)
  wire \rgb_out[17]_syn_6 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)
  wire \rgb_out[17]_syn_8 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)
  wire \rgb_out[17]_syn_10 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)
  wire \rgb_out[17]_syn_12 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)
  wire \rgb_out[17]_syn_15 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)
  wire \rgb_out[17]_syn_18 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)
  wire \rgb_out[16]_dup_1 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)
  wire \rgb_out[15]_dup_1 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)
  wire \rgb_out[14]_dup_1 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)
  wire \rgb_out[13]_dup_1 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)
  wire \rgb_out[12]_dup_1 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)
  wire \rgb_out[11]_dup_1 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)
  wire \rgb_out[10]_dup_1 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)
  wire \rgb_out[9]_dup_1 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)
  wire \rgb_out[8]_dup_1 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)
  wire \rgb_out[7]_dup_1 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)
  wire \rgb_out[6]_dup_1 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)
  wire \rgb_out[5]_dup_1 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)
  wire \rgb_out[4]_dup_1 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)
  wire \rgb_out[3]_dup_1 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)
  wire \rgb_out[2]_dup_1 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)
  wire \rgb_out[1]_dup_1 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)
  wire \rgb_out[0]_dup_1 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)
  wire rgb_out_b1_n_syn_2;
  wire rst_dup_1;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(3)
  wire \text_addr[8]_syn_2 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \text_addr[8]_syn_4 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \text_addr[7]_syn_2 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \text_addr[7]_syn_4 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \text_addr[7]_syn_6 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \text_addr[7]_syn_8 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \text_addr[7]_syn_10 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \text_addr[7]_syn_13 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \text_addr[7]_syn_15 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \text_addr[7]_syn_17 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \text_addr[7]_syn_19 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \text_addr[6]_syn_12 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \text_addr[6]_syn_14 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \text_addr[6]_syn_16 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \text_addr[6]_syn_18 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \text_addr[6]_syn_21 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \text_addr[6]_syn_23 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \text_addr[6]_syn_25 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \text_addr[6]_syn_27 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \text_addr[6]_syn_29 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \text_addr[6]_syn_31 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \text_addr[6]_syn_34 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \text_addr[6]_syn_36 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \text_addr[6]_syn_38 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \text_addr[6]_syn_40 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \text_addr[6]_syn_42 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \text_addr[6]_syn_44 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \text_addr[6]_syn_46 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \text_addr[6]_syn_48 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \text_addr[6]_syn_50 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \text_addr[6]_syn_52 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \text_addr[6]_syn_54 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \text_addr[5]_syn_4 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \text_addr[5]_syn_7 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \text_addr[5]_syn_9 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \text_addr[5]_syn_11 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \text_addr[5]_syn_13 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \text_addr[5]_syn_15 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \text_addr[5]_syn_18 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \text_addr[5]_syn_20 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \text_addr[5]_syn_22 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \text_addr[5]_syn_24 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \text_addr[5]_syn_26 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \text_addr[5]_syn_28 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \text_addr[5]_syn_30 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \text_addr[5]_syn_32 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \text_addr[2]_syn_4 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \text_addr[2]_syn_6 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \text_addr[2]_syn_8 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \text_addr[2]_syn_10 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \text_addr[2]_syn_13 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \text_addr[2]_syn_15 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \text_addr[2]_syn_17 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \text_addr[1]_syn_4 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \text_addr[1]_syn_6 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \text_addr[1]_syn_8 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \text_addr[1]_syn_10 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \text_addr[1]_syn_12 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \text_addr[1]_syn_14 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \text_addr[1]_syn_16 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \text_addr[1]_syn_18 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \text_addr[1]_syn_20 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \text_addr[1]_syn_22 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \text_addr[1]_syn_24 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \text_addr[1]_syn_26 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \text_addr[0]_syn_4 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \text_addr[0]_syn_6 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \text_addr[0]_syn_8 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \text_addr[0]_syn_10 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \text_addr[0]_syn_12 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire \text_addr[0]_syn_14 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  wire text_addr_b30_n;
  wire \volume[7]_dup_31 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  wire \volume[6]_dup_11 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  wire \volume[5]_dup_9 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  wire \volume[4]_dup_9 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  wire \volume[3]_dup_5 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  wire \volume[2]_dup_5 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  wire \volume[1]_dup_5 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  wire \volume[0]_dup_5 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  wire vs_dup_3;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(3)
  wire \x[8]_syn_2 ;  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(7)

  EG_PHY_LSLICE #(
    //.MACRO("add8_syn_62"),
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
    add8_syn_62 (
    .a({x[1],1'b0}),
    .b({x[2],x[0]}),
    .c(2'b00),
    .d(2'b01),
    .e(2'b01),
    .f({x_b4[1],open_n17}),
    .fco(add8_syn_54),
    .fx({x_b4[2],open_n18}));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1159)
  EG_PHY_LSLICE #(
    //.MACRO("add8_syn_62"),
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
    add8_syn_63 (
    .a({x[5],x[3]}),
    .b({x[6],x[4]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(add8_syn_54),
    .f({x_b4[5],x_b4[3]}),
    .fco(add8_syn_58),
    .fx({x_b4[6],x_b4[4]}));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1159)
  EG_PHY_LSLICE #(
    //.MACRO("add8_syn_62"),
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
    add8_syn_64 (
    .a({x[9],x[7]}),
    .b({open_n39,x[8]}),
    .c(2'b00),
    .d(2'b00),
    .e({open_n42,1'b0}),
    .fci(add8_syn_58),
    .f({x_b4[9],x_b4[7]}),
    .fx({open_n58,x_b4[8]}));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1159)
  EG_PHY_LSLICE #(
    //.MACRO("add9_syn_62"),
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
    add9_syn_62 (
    .a({y[1],1'b0}),
    .b({y[2],y[0]}),
    .c(2'b00),
    .d(2'b01),
    .e(2'b01),
    .f({y_b2[1],open_n78}),
    .fco(add9_syn_54),
    .fx({y_b2[2],open_n79}));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1159)
  EG_PHY_LSLICE #(
    //.MACRO("add9_syn_62"),
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
    add9_syn_63 (
    .a({y[5],y[3]}),
    .b({y[6],y[4]}),
    .c(2'b00),
    .d(2'b00),
    .e(2'b00),
    .fci(add9_syn_54),
    .f({y_b2[5],y_b2[3]}),
    .fco(add9_syn_58),
    .fx({y_b2[6],y_b2[4]}));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1159)
  EG_PHY_LSLICE #(
    //.MACRO("add9_syn_62"),
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
    add9_syn_64 (
    .a({y[9],y[7]}),
    .b({open_n100,y[8]}),
    .c(2'b00),
    .d(2'b00),
    .e({open_n103,1'b0}),
    .fci(add9_syn_58),
    .f({y_b2[9],y_b2[7]}),
    .fx({open_n119,y_b2[8]}));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1159)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    audio_available_syn_2 (
    .ipad(audio_available),
    .di(audio_available_dup_1));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    audio_busy_syn_2 (
    .ipad(audio_busy),
    .di(audio_busy_dup_1));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \bg1_reg[0]  (
    .clk(clk_dup_1),
    .d(\bg[0]_syn_2 ),
    .sr(rst_dup_1),
    .q(bg1[0]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \bg1_reg[10]  (
    .clk(clk_dup_1),
    .d(bg[10]),
    .sr(rst_dup_1),
    .q(bg1[10]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \bg1_reg[11]  (
    .clk(clk_dup_1),
    .d(bg[11]),
    .sr(rst_dup_1),
    .q(bg1[11]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \bg1_reg[12]  (
    .clk(clk_dup_1),
    .d(bg[12]),
    .sr(rst_dup_1),
    .q(bg1[12]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \bg1_reg[13]  (
    .clk(clk_dup_1),
    .d(bg[13]),
    .sr(rst_dup_1),
    .q(bg1[13]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \bg1_reg[14]  (
    .clk(clk_dup_1),
    .d(bg[14]),
    .sr(rst_dup_1),
    .q(bg1[14]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \bg1_reg[15]  (
    .clk(clk_dup_1),
    .d(bg[15]),
    .sr(rst_dup_1),
    .q(bg1[15]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \bg1_reg[16]  (
    .clk(clk_dup_1),
    .d(bg[16]),
    .sr(rst_dup_1),
    .q(bg1[16]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \bg1_reg[17]  (
    .clk(clk_dup_1),
    .d(\bg[17]_syn_2 ),
    .sr(rst_dup_1),
    .q(bg1[17]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \bg1_reg[18]  (
    .clk(clk_dup_1),
    .d(bg[18]),
    .sr(rst_dup_1),
    .q(bg1[18]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \bg1_reg[19]  (
    .clk(clk_dup_1),
    .d(bg[19]),
    .sr(rst_dup_1),
    .q(bg1[19]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \bg1_reg[1]  (
    .clk(clk_dup_1),
    .d(bg[1]),
    .sr(rst_dup_1),
    .q(bg1[1]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \bg1_reg[20]  (
    .clk(clk_dup_1),
    .d(bg[20]),
    .sr(rst_dup_1),
    .q(bg1[20]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \bg1_reg[21]  (
    .clk(clk_dup_1),
    .d(\bg[21]_syn_2 ),
    .sr(rst_dup_1),
    .q(bg1[21]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \bg1_reg[22]  (
    .clk(clk_dup_1),
    .d(bg[22]),
    .sr(rst_dup_1),
    .q(bg1[22]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \bg1_reg[23]  (
    .clk(clk_dup_1),
    .d(bg[23]),
    .sr(rst_dup_1),
    .q(bg1[23]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \bg1_reg[2]  (
    .clk(clk_dup_1),
    .d(bg[2]),
    .sr(rst_dup_1),
    .q(bg1[2]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \bg1_reg[3]  (
    .clk(clk_dup_1),
    .d(bg[3]),
    .sr(rst_dup_1),
    .q(bg1[3]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \bg1_reg[4]  (
    .clk(clk_dup_1),
    .d(bg[4]),
    .sr(rst_dup_1),
    .q(bg1[4]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \bg1_reg[5]  (
    .clk(clk_dup_1),
    .d(bg[5]),
    .sr(rst_dup_1),
    .q(bg1[5]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \bg1_reg[6]  (
    .clk(clk_dup_1),
    .d(\bg[6]_syn_2 ),
    .sr(rst_dup_1),
    .q(bg1[6]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \bg1_reg[7]  (
    .clk(clk_dup_1),
    .d(bg[7]),
    .sr(rst_dup_1),
    .q(bg1[7]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \bg1_reg[8]  (
    .clk(clk_dup_1),
    .d(bg[8]),
    .sr(rst_dup_1),
    .q(bg1[8]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \bg1_reg[9]  (
    .clk(clk_dup_1),
    .d(bg[9]),
    .sr(rst_dup_1),
    .q(bg1[9]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \bg2_reg[0]  (
    .clk(clk_dup_1),
    .d(bg1[0]),
    .sr(rst_dup_1),
    .q(bg2[0]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \bg2_reg[10]  (
    .clk(clk_dup_1),
    .d(bg1[10]),
    .sr(rst_dup_1),
    .q(bg2[10]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \bg2_reg[11]  (
    .clk(clk_dup_1),
    .d(bg1[11]),
    .sr(rst_dup_1),
    .q(bg2[11]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \bg2_reg[12]  (
    .clk(clk_dup_1),
    .d(bg1[12]),
    .sr(rst_dup_1),
    .q(bg2[12]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \bg2_reg[13]  (
    .clk(clk_dup_1),
    .d(bg1[13]),
    .sr(rst_dup_1),
    .q(bg2[13]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \bg2_reg[14]  (
    .clk(clk_dup_1),
    .d(bg1[14]),
    .sr(rst_dup_1),
    .q(bg2[14]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \bg2_reg[15]  (
    .clk(clk_dup_1),
    .d(bg1[15]),
    .sr(rst_dup_1),
    .q(bg2[15]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \bg2_reg[16]  (
    .clk(clk_dup_1),
    .d(bg1[16]),
    .sr(rst_dup_1),
    .q(bg2[16]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \bg2_reg[17]  (
    .clk(clk_dup_1),
    .d(bg1[17]),
    .sr(rst_dup_1),
    .q(bg2[17]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \bg2_reg[18]  (
    .clk(clk_dup_1),
    .d(bg1[18]),
    .sr(rst_dup_1),
    .q(bg2[18]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \bg2_reg[19]  (
    .clk(clk_dup_1),
    .d(bg1[19]),
    .sr(rst_dup_1),
    .q(bg2[19]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \bg2_reg[1]  (
    .clk(clk_dup_1),
    .d(bg1[1]),
    .sr(rst_dup_1),
    .q(bg2[1]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \bg2_reg[20]  (
    .clk(clk_dup_1),
    .d(bg1[20]),
    .sr(rst_dup_1),
    .q(bg2[20]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \bg2_reg[21]  (
    .clk(clk_dup_1),
    .d(bg1[21]),
    .sr(rst_dup_1),
    .q(bg2[21]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \bg2_reg[22]  (
    .clk(clk_dup_1),
    .d(bg1[22]),
    .sr(rst_dup_1),
    .q(bg2[22]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \bg2_reg[23]  (
    .clk(clk_dup_1),
    .d(bg1[23]),
    .sr(rst_dup_1),
    .q(bg2[23]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \bg2_reg[2]  (
    .clk(clk_dup_1),
    .d(bg1[2]),
    .sr(rst_dup_1),
    .q(bg2[2]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \bg2_reg[3]  (
    .clk(clk_dup_1),
    .d(bg1[3]),
    .sr(rst_dup_1),
    .q(bg2[3]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \bg2_reg[4]  (
    .clk(clk_dup_1),
    .d(bg1[4]),
    .sr(rst_dup_1),
    .q(bg2[4]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \bg2_reg[5]  (
    .clk(clk_dup_1),
    .d(bg1[5]),
    .sr(rst_dup_1),
    .q(bg2[5]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \bg2_reg[6]  (
    .clk(clk_dup_1),
    .d(bg1[6]),
    .sr(rst_dup_1),
    .q(bg2[6]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \bg2_reg[7]  (
    .clk(clk_dup_1),
    .d(bg1[7]),
    .sr(rst_dup_1),
    .q(bg2[7]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \bg2_reg[8]  (
    .clk(clk_dup_1),
    .d(bg1[8]),
    .sr(rst_dup_1),
    .q(bg2[8]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \bg2_reg[9]  (
    .clk(clk_dup_1),
    .d(bg1[9]),
    .sr(rst_dup_1),
    .q(bg2[9]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_LUT5 #(
    .EQN("(B*~(~E*~(~D*~(C)*~(A)+~D*C*~(A)+~(~D)*C*A+~D*C*A)))"),
    .INIT(32'hcccc80c4))
    \bg[0]_syn_3  (
    .a(\bg[1]_syn_9 ),
    .b(\bg[20]_syn_2 ),
    .c(bg_b10_n),
    .d(mux45_syn_18),
    .e(\bg[1]_syn_13 ),
    .o(\bg[0]_syn_4 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  AL_MAP_LUT3 #(
    .EQN("(A*~(~C*~B))"),
    .INIT(8'ha8))
    \bg[0]_syn_5  (
    .a(\bg[1]_syn_5 ),
    .b(mux45_syn_18),
    .c(\gx[2]_syn_26 ),
    .o(\bg[0]_syn_6 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  AL_MAP_LUT4 #(
    .EQN("~(~(D*~C)*~(B*~A))"),
    .INIT(16'h4f44))
    \bg[0]_syn_7  (
    .a(\bg[0]_syn_4 ),
    .b(\bg[0]_syn_6 ),
    .c(\gx[2]_syn_17 ),
    .d(\rgb[0]_dup_1 ),
    .o(\bg[0]_syn_2 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  AL_MAP_LUT4 #(
    .EQN("(D*~((~B*~A))*~(C)+D*(~B*~A)*~(C)+~(D)*(~B*~A)*C+D*(~B*~A)*C)"),
    .INIT(16'h1f10))
    \bg[10]_syn_1  (
    .a(\bg[11]_syn_3 ),
    .b(\bg[1]_syn_17 ),
    .c(\gx[2]_syn_17 ),
    .d(\rgb[10]_dup_1 ),
    .o(bg[10]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  AL_MAP_LUT3 #(
    .EQN("(C*~(B*A))"),
    .INIT(8'h70))
    \bg[11]_syn_1  (
    .a(\bg[1]_syn_9 ),
    .b(\gx[2]_syn_26 ),
    .c(bg_b3_n_syn_2),
    .o(bg_b2[2]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  AL_MAP_LUT3 #(
    .EQN("(C*~B*A)"),
    .INIT(8'h20))
    \bg[11]_syn_2  (
    .a(\bg[1]_syn_9 ),
    .b(\bg[13]_syn_4 ),
    .c(\gx[2]_syn_26 ),
    .o(\bg[11]_syn_3 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  AL_MAP_LUT5 #(
    .EQN("(E*~((~C*~B*~A))*~(D)+E*(~C*~B*~A)*~(D)+~(E)*(~C*~B*~A)*D+E*(~C*~B*~A)*D)"),
    .INIT(32'h01ff0100))
    \bg[11]_syn_4  (
    .a(bg_b2[2]),
    .b(\bg[11]_syn_3 ),
    .c(\bg[1]_syn_17 ),
    .d(\gx[2]_syn_17 ),
    .e(\rgb[11]_dup_1 ),
    .o(bg[11]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  AL_MAP_LUT4 #(
    .EQN("(C*~B*(D@A))"),
    .INIT(16'h1020))
    \bg[12]_syn_1  (
    .a(\bg[1]_syn_2 ),
    .b(eq25_syn_17),
    .c(bg_b8_n1),
    .d(\field[0]_dup_1 ),
    .o(\bg[12]_syn_2 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  AL_MAP_LUT2 #(
    .EQN("(~B*~A)"),
    .INIT(4'h1))
    \bg[12]_syn_3  (
    .a(\gx[2]_syn_17 ),
    .b(\rgb[12]_dup_1 ),
    .o(\bg[12]_syn_4 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  AL_MAP_LUT5 #(
    .EQN("(~C*~(B*(~E*~(D)*~(A)+~E*D*~(A)+~(~E)*D*A+~E*D*A)))"),
    .INIT(32'h070f030b))
    \bg[12]_syn_5  (
    .a(\bg[4]_syn_2 ),
    .b(\bg[1]_syn_5 ),
    .c(\bg[12]_syn_4 ),
    .d(\bg[12]_syn_2 ),
    .e(\bg[1]_syn_7 ),
    .o(bg[12]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*~A)"),
    .INIT(16'h0001))
    \bg[13]_syn_1  (
    .a(bg_b3_n8),
    .b(bg_b3_n9),
    .c(bg_b3_n6),
    .d(bg_b3_n3),
    .o(bg_b3_n_syn_2));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    \bg[13]_syn_2  (
    .a(\bg[1]_syn_7 ),
    .b(bg_b3_n_syn_2),
    .o(mux45_syn_18));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  AL_MAP_LUT4 #(
    .EQN("(~C*~B*(D@A))"),
    .INIT(16'h0102))
    \bg[13]_syn_3  (
    .a(\bg[1]_syn_2 ),
    .b(eq25_syn_17),
    .c(bg_b8_n1),
    .d(\field[0]_dup_1 ),
    .o(\bg[13]_syn_4 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  AL_MAP_LUT5 #(
    .EQN("(~(A)*~(B)*~(C)*~(D)*~(E)+A*~(B)*~(C)*~(D)*~(E)+~(A)*B*~(C)*~(D)*~(E)+A*B*~(C)*~(D)*~(E)+~(A)*~(B)*~(C)*D*~(E)+A*~(B)*~(C)*D*~(E)+~(A)*B*~(C)*D*~(E)+A*B*~(C)*D*~(E)+~(A)*~(B)*~(C)*~(D)*E+~(A)*B*~(C)*~(D)*E+A*B*~(C)*~(D)*E+A*B*C*~(D)*E+~(A)*~(B)*~(C)*D*E+A*~(B)*~(C)*D*E+~(A)*B*~(C)*D*E+A*B*~(C)*D*E+~(A)*~(B)*C*D*E+A*~(B)*C*D*E+~(A)*B*C*D*E+A*B*C*D*E)"),
    .INIT(32'hff8d0f0f))
    \bg[13]_syn_5  (
    .a(\bg[1]_syn_9 ),
    .b(\bg[13]_syn_4 ),
    .c(mux45_syn_18),
    .d(\bg[1]_syn_13 ),
    .e(\gx[2]_syn_26 ),
    .o(\bg[13]_syn_6 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  AL_MAP_LUT4 #(
    .EQN("~(~(D*~C)*~(B*~A))"),
    .INIT(16'h4f44))
    \bg[13]_syn_7  (
    .a(\bg[13]_syn_6 ),
    .b(\bg[1]_syn_5 ),
    .c(\gx[2]_syn_17 ),
    .d(\rgb[13]_dup_1 ),
    .o(bg[13]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  AL_MAP_LUT4 #(
    .EQN("(~(~D*~C)*~(B*~A))"),
    .INIT(16'hbbb0))
    \bg[14]_syn_1  (
    .a(\bg[1]_syn_19 ),
    .b(\bg[1]_syn_5 ),
    .c(\gx[2]_syn_17 ),
    .d(\rgb[14]_dup_1 ),
    .o(bg[14]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  AL_MAP_LUT4 #(
    .EQN("(~(~D*~C)*~(B*~A))"),
    .INIT(16'hbbb0))
    \bg[15]_syn_1  (
    .a(\bg[22]_syn_2 ),
    .b(\bg[20]_syn_4 ),
    .c(\gx[2]_syn_17 ),
    .d(\rgb[15]_dup_1 ),
    .o(bg[15]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    \bg[16]_syn_1  (
    .a(\gx[2]_syn_17 ),
    .b(\rgb[16]_dup_1 ),
    .o(bg[16]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  AL_MAP_LUT5 #(
    .EQN("(B*~(~D*~(~E*~(C)*~(A)+~E*C*~(A)+~(~E)*C*A+~E*C*A)))"),
    .INIT(32'hcc80ccc4))
    \bg[17]_syn_3  (
    .a(\bg[1]_syn_9 ),
    .b(\bg[20]_syn_2 ),
    .c(bg_b10_n),
    .d(\bg[1]_syn_13 ),
    .e(\bg[1]_syn_7 ),
    .o(\bg[17]_syn_4 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  AL_MAP_LUT5 #(
    .EQN("(~(~E*~D)*~(B*~(~C*~A)))"),
    .INIT(32'h37373700))
    \bg[17]_syn_5  (
    .a(\bg[17]_syn_4 ),
    .b(\bg[1]_syn_5 ),
    .c(\bg[6]_syn_4 ),
    .d(\gx[2]_syn_17 ),
    .e(\rgb[17]_dup_1 ),
    .o(\bg[17]_syn_2 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  AL_MAP_LUT5 #(
    .EQN("(~(A)*~(B)*~(C)*~(D)*~(E)+A*~(B)*~(C)*~(D)*~(E)+~(A)*B*~(C)*~(D)*~(E)+A*B*~(C)*~(D)*~(E)+~(A)*~(B)*C*~(D)*~(E)+A*~(B)*C*~(D)*~(E)+A*~(B)*C*D*~(E)+~(A)*~(B)*~(C)*~(D)*E+A*~(B)*~(C)*~(D)*E+~(A)*B*~(C)*~(D)*E+A*B*~(C)*~(D)*E+~(A)*~(B)*C*~(D)*E+A*~(B)*C*~(D)*E+~(A)*B*C*~(D)*E+A*B*C*~(D)*E+A*~(B)*C*D*E+~(A)*B*C*D*E+A*B*C*D*E)"),
    .INIT(32'he0ff203f))
    \bg[18]_syn_1  (
    .a(\bg[1]_syn_9 ),
    .b(\bg[1]_syn_13 ),
    .c(\gx[2]_syn_26 ),
    .d(bg_b3_n_syn_2),
    .e(bg_b7_n),
    .o(\bg[18]_syn_2 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  AL_MAP_LUT3 #(
    .EQN("~(~C*~(A)*~(B)+~C*A*~(B)+~(~C)*A*B+~C*A*B)"),
    .INIT(8'h74))
    \bg[18]_syn_3  (
    .a(\bg[18]_syn_2 ),
    .b(\gx[2]_syn_17 ),
    .c(\rgb[18]_dup_1 ),
    .o(bg[18]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  AL_MAP_LUT5 #(
    .EQN("(E*~((~D*~B*A))*~(C)+E*(~D*~B*A)*~(C)+~(E)*(~D*~B*A)*C+E*(~D*~B*A)*C)"),
    .INIT(32'h0f2f0020))
    \bg[19]_syn_1  (
    .a(\bg[4]_syn_2 ),
    .b(bg_b10_n),
    .c(\gx[2]_syn_17 ),
    .d(\bg[1]_syn_13 ),
    .e(\rgb[19]_dup_1 ),
    .o(bg[19]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  AL_MAP_LUT4 #(
    .EQN("(~(A)*~(B)*~(C)*~(D)+A*~(B)*~(C)*~(D)+~(A)*B*~(C)*~(D)+A*B*~(C)*~(D)+~(A)*B*C*~(D)+~(A)*B*~(C)*D+A*B*~(C)*D+~(A)*B*C*D)"),
    .INIT(16'h4c4f))
    \bg[1]_syn_1  (
    .a(\gx[2]_syn_10 ),
    .b(bar_b10_n1),
    .c(bar_b9_n),
    .d(bar_b10_n),
    .o(\bg[1]_syn_2 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  AL_MAP_LUT3 #(
    .EQN("(C*~(B*A))"),
    .INIT(8'h70))
    \bg[1]_syn_10  (
    .a(x[6]),
    .b(x[7]),
    .c(x[8]),
    .o(\bg[1]_syn_11 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  AL_MAP_LUT4 #(
    .EQN("(D*C*B*A)"),
    .INIT(16'h8000))
    \bg[1]_syn_12  (
    .a(\bg[1]_syn_11 ),
    .b(bar_b10_n1),
    .c(bg_b4_n2),
    .d(bg_b4_n4),
    .o(\bg[1]_syn_13 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  AL_MAP_LUT4 #(
    .EQN("(~(A)*~(B)*~(C)*~(D)+A*~(B)*~(C)*~(D)+~(A)*B*~(C)*~(D)+~(A)*B*C*~(D)+A*B*C*~(D)+~(A)*~(B)*~(C)*D+A*~(B)*~(C)*D+A*B*~(C)*D+~(A)*~(B)*C*D+A*~(B)*C*D+~(A)*B*C*D+A*B*C*D)"),
    .INIT(16'hfbc7))
    \bg[1]_syn_14  (
    .a(bar_b9_n),
    .b(bar_b10_n),
    .c(\field[2]_dup_1 ),
    .d(\field[1]_dup_1 ),
    .o(eq25_syn_17));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  AL_MAP_LUT3 #(
    .EQN("(~B*(C@A))"),
    .INIT(8'h12))
    \bg[1]_syn_15  (
    .a(\bg[1]_syn_2 ),
    .b(eq25_syn_17),
    .c(\field[0]_dup_1 ),
    .o(bg_b10_n));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    \bg[1]_syn_16  (
    .a(\bg[1]_syn_13 ),
    .b(\gx[2]_syn_26 ),
    .o(\bg[1]_syn_17 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  AL_MAP_LUT5 #(
    .EQN("(A*B*~(C)*D*~(E)+~(A)*~(B)*C*D*~(E)+A*~(B)*C*D*~(E)+~(A)*B*C*D*~(E)+A*B*C*D*~(E)+~(A)*~(B)*~(C)*~(D)*E+A*~(B)*~(C)*~(D)*E+~(A)*B*~(C)*~(D)*E+A*B*~(C)*~(D)*E+~(A)*~(B)*C*~(D)*E+A*~(B)*C*~(D)*E+~(A)*B*C*~(D)*E+A*B*C*~(D)*E+~(A)*~(B)*~(C)*D*E+~(A)*B*~(C)*D*E+A*B*~(C)*D*E+~(A)*~(B)*C*D*E+A*~(B)*C*D*E+~(A)*B*C*D*E+A*B*C*D*E)"),
    .INIT(32'hfdfff800))
    \bg[1]_syn_18  (
    .a(\bg[1]_syn_9 ),
    .b(bg_b10_n),
    .c(\bg[1]_syn_13 ),
    .d(\gx[2]_syn_26 ),
    .e(\bg[1]_syn_7 ),
    .o(\bg[1]_syn_19 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  AL_MAP_LUT5 #(
    .EQN("(~(E*~C)*~(~D*B*A))"),
    .INIT(32'hf070ff77))
    \bg[1]_syn_20  (
    .a(\bg[1]_syn_5 ),
    .b(\bg[1]_syn_17 ),
    .c(\gx[2]_syn_17 ),
    .d(bg_b7_n),
    .e(\rgb[1]_dup_1 ),
    .o(\bg[1]_syn_21 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  AL_MAP_LUT3 #(
    .EQN("~(B*~(C*~A))"),
    .INIT(8'h73))
    \bg[1]_syn_22  (
    .a(\bg[1]_syn_19 ),
    .b(\bg[1]_syn_21 ),
    .c(\bg[1]_syn_5 ),
    .o(bg[1]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    \bg[1]_syn_3  (
    .a(bg_b1_n4),
    .b(bg_b1_n2),
    .o(bg_b6_n1));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  AL_MAP_LUT4 #(
    .EQN("(A*~(D*C*B))"),
    .INIT(16'h2aaa))
    \bg[1]_syn_4  (
    .a(\gx[2]_syn_17 ),
    .b(bg_b6_n1),
    .c(bg_b1_n5),
    .d(bg_b1_n6),
    .o(\bg[1]_syn_5 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  AL_MAP_LUT3 #(
    .EQN("(C*B*A)"),
    .INIT(8'h80))
    \bg[1]_syn_6  (
    .a(bg_b6_n1),
    .b(bg_b3_n10),
    .c(bg_b3_n11),
    .o(\bg[1]_syn_7 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  AL_MAP_LUT5 #(
    .EQN("(C*~(A*~(~D*~(E@B))))"),
    .INIT(32'h50d05070))
    \bg[1]_syn_8  (
    .a(\bg_b12[5]_syn_2 ),
    .b(\bg[1]_syn_2 ),
    .c(bg_b6_n1),
    .d(y[3]),
    .e(y[4]),
    .o(\bg[1]_syn_9 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  AL_MAP_LUT3 #(
    .EQN("(B*~(~C*A))"),
    .INIT(8'hc4))
    \bg[20]_syn_1  (
    .a(\bg[1]_syn_13 ),
    .b(\gx[2]_syn_26 ),
    .c(bg_b7_n),
    .o(\bg[20]_syn_2 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  AL_MAP_LUT3 #(
    .EQN("(A*~(~C*~B))"),
    .INIT(8'ha8))
    \bg[20]_syn_3  (
    .a(\gx[2]_syn_17 ),
    .b(\gx[2]_syn_26 ),
    .c(bg_b3_n_syn_2),
    .o(\bg[20]_syn_4 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  AL_MAP_LUT4 #(
    .EQN("(~C*~(~D*~(B)*~(A)+~D*B*~(A)+~(~D)*B*A+~D*B*A))"),
    .INIT(16'h0702))
    \bg[20]_syn_5  (
    .a(\bg[1]_syn_9 ),
    .b(bg_b10_n),
    .c(\bg[1]_syn_13 ),
    .d(bg_b3_n_syn_2),
    .o(\bg[20]_syn_6 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  AL_MAP_LUT5 #(
    .EQN("~(~(E*~D)*~(B*~(C*~A)))"),
    .INIT(32'h8cff8c8c))
    \bg[20]_syn_7  (
    .a(\bg[20]_syn_6 ),
    .b(\bg[20]_syn_4 ),
    .c(\bg[20]_syn_2 ),
    .d(\gx[2]_syn_17 ),
    .e(\rgb[20]_dup_1 ),
    .o(bg[20]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  AL_MAP_LUT5 #(
    .EQN("(B*~(~D*(E*~(C)*~(A)+E*C*~(A)+~(E)*C*A+E*C*A)))"),
    .INIT(32'hcc08cc4c))
    \bg[21]_syn_3  (
    .a(\bg[1]_syn_9 ),
    .b(\bg[20]_syn_2 ),
    .c(\bg[13]_syn_4 ),
    .d(\bg[1]_syn_13 ),
    .e(\bg[1]_syn_7 ),
    .o(\bg[21]_syn_4 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  AL_MAP_LUT5 #(
    .EQN("(~(~E*~D)*~(B*~(~C*~A)))"),
    .INIT(32'h37373700))
    \bg[21]_syn_5  (
    .a(\bg[21]_syn_4 ),
    .b(\bg[1]_syn_5 ),
    .c(\bg[6]_syn_4 ),
    .d(\gx[2]_syn_17 ),
    .e(\rgb[21]_dup_1 ),
    .o(\bg[21]_syn_2 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  AL_MAP_LUT5 #(
    .EQN("(B*~(~D*~(~E*~(C)*~(A)+~E*C*~(A)+~(~E)*C*A+~E*C*A)))"),
    .INIT(32'hcc80ccc4))
    \bg[22]_syn_1  (
    .a(\bg[1]_syn_9 ),
    .b(\bg[20]_syn_2 ),
    .c(\bg[12]_syn_2 ),
    .d(\bg[1]_syn_13 ),
    .e(bg_b3_n_syn_2),
    .o(\bg[22]_syn_2 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  AL_MAP_LUT4 #(
    .EQN("(~(~D*~C)*~(B*~A))"),
    .INIT(16'hbbb0))
    \bg[22]_syn_3  (
    .a(\bg[22]_syn_2 ),
    .b(\bg[20]_syn_4 ),
    .c(\gx[2]_syn_17 ),
    .d(\rgb[22]_dup_1 ),
    .o(bg[22]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    \bg[23]_syn_1  (
    .a(\gx[2]_syn_17 ),
    .b(\rgb[23]_dup_1 ),
    .o(bg[23]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  AL_MAP_LUT3 #(
    .EQN("(C*~(A)*~(B)+C*A*~(B)+~(C)*A*B+C*A*B)"),
    .INIT(8'hb8))
    \bg[2]_syn_1  (
    .a(bg_b2[2]),
    .b(\gx[2]_syn_17 ),
    .c(\rgb[2]_dup_1 ),
    .o(bg[2]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  AL_MAP_LUT4 #(
    .EQN("(~(~D*~C)*~(B*A))"),
    .INIT(16'h7770))
    \bg[3]_syn_1  (
    .a(\bg[1]_syn_5 ),
    .b(mux45_syn_18),
    .c(\gx[2]_syn_17 ),
    .d(\rgb[3]_dup_1 ),
    .o(bg[3]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    \bg[4]_syn_1  (
    .a(\bg[1]_syn_9 ),
    .b(\gx[2]_syn_26 ),
    .o(\bg[4]_syn_2 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  AL_MAP_LUT4 #(
    .EQN("(A*~(~D*C*B))"),
    .INIT(16'haa2a))
    \bg[4]_syn_3  (
    .a(\bg[1]_syn_5 ),
    .b(\bg[1]_syn_13 ),
    .c(\gx[2]_syn_26 ),
    .d(bg_b7_n),
    .o(\bg[4]_syn_4 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    \bg[4]_syn_5  (
    .a(\gx[2]_syn_17 ),
    .b(\rgb[4]_dup_1 ),
    .o(\bg[4]_syn_6 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  AL_MAP_LUT5 #(
    .EQN("~(~D*~(B*~(~C*~(E*~A))))"),
    .INIT(32'hffc4ffc0))
    \bg[4]_syn_7  (
    .a(\bg[4]_syn_2 ),
    .b(\bg[4]_syn_4 ),
    .c(\bg[1]_syn_17 ),
    .d(\bg[4]_syn_6 ),
    .e(mux45_syn_18),
    .o(bg[4]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  AL_MAP_LUT4 #(
    .EQN("~(~D*~((~C*A))*~(B)+~D*(~C*A)*~(B)+~(~D)*(~C*A)*B+~D*(~C*A)*B)"),
    .INIT(16'hf7c4))
    \bg[5]_syn_1  (
    .a(\bg[4]_syn_2 ),
    .b(\gx[2]_syn_17 ),
    .c(\bg[1]_syn_13 ),
    .d(\rgb[5]_dup_1 ),
    .o(bg[5]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  AL_MAP_LUT2 #(
    .EQN("(~B*~A)"),
    .INIT(4'h1))
    \bg[6]_syn_3  (
    .a(\gx[2]_syn_26 ),
    .b(\bg[1]_syn_7 ),
    .o(\bg[6]_syn_4 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  AL_MAP_LUT5 #(
    .EQN("(B*~(~D*~(~E*~(C)*~(A)+~E*C*~(A)+~(~E)*C*A+~E*C*A)))"),
    .INIT(32'hcc80ccc4))
    \bg[6]_syn_5  (
    .a(\bg[1]_syn_9 ),
    .b(\bg[20]_syn_2 ),
    .c(\bg[13]_syn_4 ),
    .d(\bg[1]_syn_13 ),
    .e(\bg[1]_syn_7 ),
    .o(\bg[6]_syn_6 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  AL_MAP_LUT5 #(
    .EQN("(~(~E*~D)*~(B*~(~C*~A)))"),
    .INIT(32'h37373700))
    \bg[6]_syn_7  (
    .a(\bg[6]_syn_6 ),
    .b(\bg[1]_syn_5 ),
    .c(\bg[6]_syn_4 ),
    .d(\gx[2]_syn_17 ),
    .e(\rgb[6]_dup_1 ),
    .o(\bg[6]_syn_2 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  AL_MAP_LUT5 #(
    .EQN("(~(~E*~D)*~(B*~(C*~A)))"),
    .INIT(32'h73737300))
    \bg[7]_syn_1  (
    .a(\bg[20]_syn_6 ),
    .b(\bg[20]_syn_4 ),
    .c(\bg[20]_syn_2 ),
    .d(\gx[2]_syn_17 ),
    .e(\rgb[7]_dup_1 ),
    .o(bg[7]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  AL_MAP_LUT5 #(
    .EQN("(E*~((~D*B*A))*~(C)+E*(~D*B*A)*~(C)+~(E)*(~D*B*A)*C+E*(~D*B*A)*C)"),
    .INIT(32'h0f8f0080))
    \bg[8]_syn_1  (
    .a(\bg[4]_syn_2 ),
    .b(\bg[13]_syn_4 ),
    .c(\gx[2]_syn_17 ),
    .d(\bg[1]_syn_13 ),
    .e(\rgb[8]_dup_1 ),
    .o(bg[8]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  AL_MAP_LUT3 #(
    .EQN("~(~C*~(A)*~(B)+~C*A*~(B)+~(~C)*A*B+~C*A*B)"),
    .INIT(8'h74))
    \bg[9]_syn_1  (
    .a(\bg[4]_syn_2 ),
    .b(\gx[2]_syn_17 ),
    .c(\rgb[9]_dup_1 ),
    .o(bg[9]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(14)
  AL_MAP_LUT2 #(
    .EQN("(B@A)"),
    .INIT(4'h6))
    \bg_b12[4]_syn_1  (
    .a(\bg[1]_syn_2 ),
    .b(y[4]),
    .o(bg_b12[4]));
  AL_MAP_LUT4 #(
    .EQN("(~(A)*B*~(C)*~(D)+A*~(B)*C*~(D)+~(A)*B*C*~(D)+~(A)*B*~(C)*D+A*B*~(C)*D+A*~(B)*C*D+~(A)*B*C*D+A*B*C*D)"),
    .INIT(16'hec64))
    \bits_b[10]_syn_1  (
    .a(char_id[3]),
    .b(char_id[2]),
    .c(ramread1_syn_278),
    .d(ramread1_syn_280),
    .o(\bits_b[10]_syn_2 ));
  AL_MAP_LUT5 #(
    .EQN("(~B*(A*C*~(D)*~(E)+~(A)*~(C)*D*~(E)+A*C*D*~(E)+A*~(C)*~(D)*E+A*C*~(D)*E+~(A)*~(C)*D*E+A*~(C)*D*E+A*C*D*E))"),
    .INIT(32'h23222120))
    \bits_b[10]_syn_11  (
    .a(\bits_b[10]_syn_10 ),
    .b(char_id[5]),
    .c(char_id[3]),
    .d(ramread1_syn_266),
    .e(ramread1_syn_268),
    .o(\bits_b[10]_syn_12 ));
  AL_MAP_LUT4 #(
    .EQN("(~(A)*B*~(C)*~(D)+A*~(B)*C*~(D)+~(A)*B*C*~(D)+~(A)*B*~(C)*D+A*B*~(C)*D+A*~(B)*C*D+~(A)*B*C*D+A*B*C*D)"),
    .INIT(16'hec64))
    \bits_b[10]_syn_13  (
    .a(char_id[3]),
    .b(char_id[2]),
    .c(ramread1_syn_262),
    .d(ramread1_syn_264),
    .o(\bits_b[10]_syn_14 ));
  AL_MAP_LUT5 #(
    .EQN("(~B*(~(A)*~(C)*~(D)*~(E)+A*~(C)*~(D)*~(E)+~(A)*C*~(D)*~(E)+A*~(C)*D*~(E)+~(A)*C*D*~(E)+~(A)*~(C)*~(D)*E+~(A)*C*~(D)*E+~(A)*C*D*E))"),
    .INIT(32'h10111213))
    \bits_b[10]_syn_15  (
    .a(\bits_b[10]_syn_14 ),
    .b(char_id[5]),
    .c(char_id[3]),
    .d(ramread1_syn_258),
    .e(ramread1_syn_260),
    .o(\bits_b[10]_syn_16 ));
  AL_MAP_LUT4 #(
    .EQN("(~D*(~C*~(B)*~(A)+~C*B*~(A)+~(~C)*B*A+~C*B*A))"),
    .INIT(16'h008d))
    \bits_b[10]_syn_17  (
    .a(\bits_b[10]_syn_8 ),
    .b(\bits_b[10]_syn_12 ),
    .c(\bits_b[10]_syn_16 ),
    .d(char_id[6]),
    .o(bits_b[10]));
  AL_MAP_LUT5 #(
    .EQN("(B*(~(A)*~(C)*~(D)*~(E)+A*~(C)*~(D)*~(E)+~(A)*C*~(D)*~(E)+A*~(C)*D*~(E)+~(A)*C*D*~(E)+~(A)*~(C)*~(D)*E+~(A)*C*~(D)*E+~(A)*C*D*E))"),
    .INIT(32'h4044484c))
    \bits_b[10]_syn_3  (
    .a(\bits_b[10]_syn_2 ),
    .b(char_id[5]),
    .c(char_id[3]),
    .d(ramread1_syn_274),
    .e(ramread1_syn_276),
    .o(\bits_b[10]_syn_4 ));
  AL_MAP_LUT5 #(
    .EQN("(~(A)*~(B)*~(C)*~(D)*~(E)+A*~(B)*~(C)*~(D)*~(E)+~(A)*B*~(C)*~(D)*~(E)+A*B*~(C)*~(D)*~(E)+A*~(B)*C*~(D)*~(E)+~(A)*B*C*~(D)*~(E)+A*B*C*~(D)*~(E)+~(A)*~(B)*~(C)*D*~(E)+A*~(B)*~(C)*D*~(E)+A*B*~(C)*D*~(E)+A*~(B)*C*D*~(E)+A*B*C*D*~(E)+~(A)*~(B)*~(C)*~(D)*E+~(A)*B*~(C)*~(D)*E+A*B*~(C)*~(D)*E+~(A)*B*C*~(D)*E+A*B*C*~(D)*E+~(A)*~(B)*~(C)*D*E+A*B*~(C)*D*E+A*B*C*D*E)"),
    .INIT(32'h89cdabef))
    \bits_b[10]_syn_5  (
    .a(char_id[3]),
    .b(char_id[2]),
    .c(ramread1_syn_282),
    .d(ramread1_syn_284),
    .e(ramread1_syn_286),
    .o(\bits_b[10]_syn_6 ));
  AL_MAP_LUT4 #(
    .EQN("~(~A*~((C*~B))*~(D)+~A*(C*~B)*~(D)+~(~A)*(C*~B)*D+~A*(C*~B)*D)"),
    .INIT(16'hcfaa))
    \bits_b[10]_syn_7  (
    .a(\bits_b[10]_syn_4 ),
    .b(\bits_b[10]_syn_6 ),
    .c(char_id[5]),
    .d(char_id[4]),
    .o(\bits_b[10]_syn_8 ));
  AL_MAP_LUT4 #(
    .EQN("(~(A)*B*~(C)*~(D)+A*~(B)*C*~(D)+~(A)*B*C*~(D)+~(A)*B*~(C)*D+A*B*~(C)*D+A*~(B)*C*D+~(A)*B*C*D+A*B*C*D)"),
    .INIT(16'hec64))
    \bits_b[10]_syn_9  (
    .a(char_id[3]),
    .b(char_id[2]),
    .c(ramread1_syn_270),
    .d(ramread1_syn_272),
    .o(\bits_b[10]_syn_10 ));
  AL_MAP_LUT2 #(
    .EQN("(~B*~A)"),
    .INIT(4'h1))
    \bits_b[11]_syn_1  (
    .a(char_id[3]),
    .b(char_id[2]),
    .o(\bits_b[11]_syn_2 ));
  AL_MAP_LUT4 #(
    .EQN("~(~A*~((D*~B))*~(C)+~A*(D*~B)*~(C)+~(~A)*(D*~B)*C+~A*(D*~B)*C)"),
    .INIT(16'hcafa))
    \bits_b[11]_syn_11  (
    .a(\bits_b[11]_syn_6 ),
    .b(\bits_b[11]_syn_10 ),
    .c(char_id[5]),
    .d(char_id[4]),
    .o(\bits_b[11]_syn_12 ));
  AL_MAP_LUT4 #(
    .EQN("(~(A)*B*~(C)*~(D)+A*~(B)*C*~(D)+~(A)*B*C*~(D)+~(A)*B*~(C)*D+A*B*~(C)*D+A*~(B)*C*D+~(A)*B*C*D+A*B*C*D)"),
    .INIT(16'hec64))
    \bits_b[11]_syn_13  (
    .a(char_id[3]),
    .b(char_id[2]),
    .c(ramread1_syn_293),
    .d(ramread1_syn_295),
    .o(\bits_b[11]_syn_14 ));
  AL_MAP_LUT5 #(
    .EQN("(~B*(~(A)*~(C)*~(D)*~(E)+A*~(C)*~(D)*~(E)+~(A)*C*~(D)*~(E)+A*~(C)*D*~(E)+~(A)*C*D*~(E)+~(A)*~(C)*~(D)*E+~(A)*C*~(D)*E+~(A)*C*D*E))"),
    .INIT(32'h10111213))
    \bits_b[11]_syn_15  (
    .a(\bits_b[11]_syn_14 ),
    .b(char_id[4]),
    .c(char_id[3]),
    .d(ramread1_syn_289),
    .e(ramread1_syn_291),
    .o(\bits_b[11]_syn_16 ));
  AL_MAP_LUT4 #(
    .EQN("(A*~(B)*~(C)*~(D)+A*B*~(C)*~(D)+A*~(B)*C*~(D)+A*B*C*~(D)+A*B*~(C)*D+~(A)*~(B)*C*D+~(A)*B*C*D+A*B*C*D)"),
    .INIT(16'hd8aa))
    \bits_b[11]_syn_17  (
    .a(char_id[2]),
    .b(ramread1_syn_311),
    .c(ramread1_syn_309),
    .d(char_id[3]),
    .o(\bits_b[11]_syn_18 ));
  AL_MAP_LUT4 #(
    .EQN("(~(A)*~(B)*~(C)*~(D)+~(A)*B*~(C)*~(D)+~(A)*~(B)*C*~(D)+A*~(B)*C*~(D)+~(A)*~(B)*~(C)*D+A*~(B)*~(C)*D+~(A)*B*~(C)*D+A*B*~(C)*D)"),
    .INIT(16'h0f35))
    \bits_b[11]_syn_19  (
    .a(ramread1_syn_305),
    .b(ramread1_syn_307),
    .c(\bits_b[11]_syn_18 ),
    .d(char_id[3]),
    .o(\bits_b[11]_syn_20 ));
  AL_MAP_LUT5 #(
    .EQN("(~D*(~B*~((~E*~C))*~(A)+~B*(~E*~C)*~(A)+~(~B)*(~E*~C)*A+~B*(~E*~C)*A))"),
    .INIT(32'h0011001b))
    \bits_b[11]_syn_21  (
    .a(\bits_b[11]_syn_12 ),
    .b(\bits_b[11]_syn_16 ),
    .c(\bits_b[11]_syn_20 ),
    .d(char_id[6]),
    .e(char_id[4]),
    .o(bits_b[11]));
  AL_MAP_LUT5 #(
    .EQN("(~(A)*~(B)*~(C)*~(D)*~(E)+A*~(B)*~(C)*~(D)*~(E)+~(A)*B*~(C)*~(D)*~(E)+A*B*~(C)*~(D)*~(E)+~(A)*~(B)*C*~(D)*~(E)+A*~(B)*C*~(D)*~(E)+A*B*C*~(D)*~(E)+~(A)*~(B)*~(C)*D*~(E)+~(A)*B*~(C)*D*~(E)+A*B*~(C)*D*~(E)+~(A)*~(B)*C*D*~(E)+A*B*C*D*~(E)+~(A)*~(B)*~(C)*~(D)*E+A*~(B)*~(C)*~(D)*E+~(A)*B*~(C)*~(D)*E+~(A)*~(B)*C*~(D)*E+A*~(B)*C*~(D)*E+~(A)*~(B)*~(C)*D*E+~(A)*B*~(C)*D*E+~(A)*~(B)*C*D*E)"),
    .INIT(32'h15379dbf))
    \bits_b[11]_syn_3  (
    .a(char_id[3]),
    .b(char_id[2]),
    .c(ramread1_syn_299),
    .d(ramread1_syn_301),
    .e(ramread1_syn_303),
    .o(\bits_b[11]_syn_4 ));
  AL_MAP_LUT4 #(
    .EQN("(C*A*~(D*B))"),
    .INIT(16'h20a0))
    \bits_b[11]_syn_5  (
    .a(\bits_b[11]_syn_4 ),
    .b(\bits_b[11]_syn_2 ),
    .c(char_id[4]),
    .d(ramread1_syn_297),
    .o(\bits_b[11]_syn_6 ));
  AL_MAP_LUT4 #(
    .EQN("(A*~(B)*~(C)*~(D)+A*B*~(C)*~(D)+A*~(B)*C*~(D)+A*B*C*~(D)+A*B*~(C)*D+~(A)*~(B)*C*D+~(A)*B*C*D+A*B*C*D)"),
    .INIT(16'hd8aa))
    \bits_b[11]_syn_7  (
    .a(char_id[2]),
    .b(ramread1_syn_319),
    .c(ramread1_syn_317),
    .d(char_id[3]),
    .o(\bits_b[11]_syn_8 ));
  AL_MAP_LUT4 #(
    .EQN("(~(A)*~(B)*~(C)*~(D)+~(A)*B*~(C)*~(D)+~(A)*~(B)*C*~(D)+A*~(B)*C*~(D)+~(A)*~(B)*~(C)*D+A*~(B)*~(C)*D+~(A)*B*~(C)*D+A*B*~(C)*D)"),
    .INIT(16'h0f35))
    \bits_b[11]_syn_9  (
    .a(ramread1_syn_313),
    .b(ramread1_syn_315),
    .c(\bits_b[11]_syn_8 ),
    .d(char_id[3]),
    .o(\bits_b[11]_syn_10 ));
  AL_MAP_LUT4 #(
    .EQN("(~(A)*B*~(C)*~(D)+A*~(B)*C*~(D)+~(A)*B*C*~(D)+~(A)*B*~(C)*D+A*B*~(C)*D+A*~(B)*C*D+~(A)*B*C*D+A*B*C*D)"),
    .INIT(16'hec64))
    \bits_b[12]_syn_1  (
    .a(char_id[3]),
    .b(char_id[2]),
    .c(ramread1_syn_326),
    .d(ramread1_syn_328),
    .o(\bits_b[12]_syn_2 ));
  AL_MAP_LUT4 #(
    .EQN("(~(A)*B*~(C)*~(D)+A*~(B)*C*~(D)+~(A)*B*C*~(D)+~(A)*B*~(C)*D+A*B*~(C)*D+A*~(B)*C*D+~(A)*B*C*D+A*B*C*D)"),
    .INIT(16'hec64))
    \bits_b[12]_syn_11  (
    .a(char_id[3]),
    .b(char_id[2]),
    .c(ramread1_syn_342),
    .d(ramread1_syn_344),
    .o(\bits_b[12]_syn_12 ));
  AL_MAP_LUT5 #(
    .EQN("(B*(~(A)*~(C)*~(D)*~(E)+A*~(C)*~(D)*~(E)+~(A)*C*~(D)*~(E)+A*~(C)*D*~(E)+~(A)*C*D*~(E)+~(A)*~(C)*~(D)*E+~(A)*C*~(D)*E+~(A)*C*D*E))"),
    .INIT(32'h4044484c))
    \bits_b[12]_syn_13  (
    .a(\bits_b[12]_syn_12 ),
    .b(char_id[5]),
    .c(char_id[3]),
    .d(ramread1_syn_338),
    .e(ramread1_syn_340),
    .o(\bits_b[12]_syn_14 ));
  AL_MAP_LUT4 #(
    .EQN("(A*B*~(C)*~(D)+~(A)*~(B)*C*~(D)+A*B*C*~(D)+A*~(B)*~(C)*D+A*B*~(C)*D+~(A)*~(B)*C*D+A*~(B)*C*D+A*B*C*D)"),
    .INIT(16'hba98))
    \bits_b[12]_syn_15  (
    .a(char_id[3]),
    .b(char_id[2]),
    .c(ramread1_syn_346),
    .d(ramread1_syn_350),
    .o(\bits_b[12]_syn_16 ));
  AL_MAP_LUT5 #(
    .EQN("(B*(A*~(C)*~(D)*~(E)+A*~(C)*D*~(E)+A*C*D*~(E)+A*~(C)*~(D)*E+~(A)*C*~(D)*E+A*~(C)*D*E+~(A)*C*D*E+A*C*D*E))"),
    .INIT(32'hc8488808))
    \bits_b[12]_syn_17  (
    .a(\bits_b[12]_syn_16 ),
    .b(char_id[5]),
    .c(char_id[2]),
    .d(ramread1_syn_319),
    .e(ramread1_syn_348),
    .o(\bits_b[12]_syn_18 ));
  AL_MAP_LUT4 #(
    .EQN("(~D*(~B*~(C)*~(A)+~B*C*~(A)+~(~B)*C*A+~B*C*A))"),
    .INIT(16'h00b1))
    \bits_b[12]_syn_19  (
    .a(\bits_b[12]_syn_10 ),
    .b(\bits_b[12]_syn_14 ),
    .c(\bits_b[12]_syn_18 ),
    .d(char_id[6]),
    .o(bits_b[12]));
  AL_MAP_LUT5 #(
    .EQN("(~B*(~(A)*~(C)*~(D)*~(E)+A*~(C)*~(D)*~(E)+~(A)*C*~(D)*~(E)+A*~(C)*D*~(E)+~(A)*C*D*~(E)+~(A)*~(C)*~(D)*E+~(A)*C*~(D)*E+~(A)*C*D*E))"),
    .INIT(32'h10111213))
    \bits_b[12]_syn_3  (
    .a(\bits_b[12]_syn_2 ),
    .b(char_id[5]),
    .c(char_id[3]),
    .d(ramread1_syn_322),
    .e(ramread1_syn_324),
    .o(\bits_b[12]_syn_4 ));
  AL_MAP_LUT4 #(
    .EQN("(A*~(B)*~(C)*~(D)+A*B*~(C)*~(D)+A*~(B)*C*~(D)+A*B*C*~(D)+A*B*~(C)*D+~(A)*~(B)*C*D+~(A)*B*C*D+A*B*C*D)"),
    .INIT(16'hd8aa))
    \bits_b[12]_syn_5  (
    .a(char_id[2]),
    .b(ramread1_syn_336),
    .c(ramread1_syn_334),
    .d(char_id[3]),
    .o(\bits_b[12]_syn_6 ));
  AL_MAP_LUT4 #(
    .EQN("(~(A)*~(B)*~(C)*~(D)+~(A)*B*~(C)*~(D)+~(A)*~(B)*C*~(D)+A*~(B)*C*~(D)+~(A)*~(B)*~(C)*D+A*~(B)*~(C)*D+~(A)*B*~(C)*D+A*B*~(C)*D)"),
    .INIT(16'h0f35))
    \bits_b[12]_syn_7  (
    .a(ramread1_syn_330),
    .b(ramread1_syn_332),
    .c(\bits_b[12]_syn_6 ),
    .d(char_id[3]),
    .o(\bits_b[12]_syn_8 ));
  AL_MAP_LUT4 #(
    .EQN("~(~A*~((~C*~B))*~(D)+~A*(~C*~B)*~(D)+~(~A)*(~C*~B)*D+~A*(~C*~B)*D)"),
    .INIT(16'hfcaa))
    \bits_b[12]_syn_9  (
    .a(\bits_b[12]_syn_4 ),
    .b(\bits_b[12]_syn_8 ),
    .c(char_id[5]),
    .d(char_id[4]),
    .o(\bits_b[12]_syn_10 ));
  AL_MAP_LUT4 #(
    .EQN("(~(A)*B*~(C)*~(D)+A*~(B)*C*~(D)+~(A)*B*C*~(D)+~(A)*B*~(C)*D+A*B*~(C)*D+A*~(B)*C*D+~(A)*B*C*D+A*B*C*D)"),
    .INIT(16'hec64))
    \bits_b[13]_syn_1  (
    .a(char_id[3]),
    .b(char_id[2]),
    .c(ramread1_syn_367),
    .d(ramread1_syn_369),
    .o(\bits_b[13]_syn_2 ));
  AL_MAP_LUT5 #(
    .EQN("(~B*(~(A)*~(C)*~(D)*~(E)+A*~(C)*~(D)*~(E)+~(A)*C*~(D)*~(E)+A*~(C)*D*~(E)+~(A)*C*D*~(E)+~(A)*~(C)*~(D)*E+~(A)*C*~(D)*E+~(A)*C*D*E))"),
    .INIT(32'h10111213))
    \bits_b[13]_syn_11  (
    .a(\bits_b[13]_syn_10 ),
    .b(char_id[4]),
    .c(char_id[3]),
    .d(ramread1_syn_355),
    .e(ramread1_syn_357),
    .o(\bits_b[13]_syn_12 ));
  AL_MAP_LUT4 #(
    .EQN("(A*~(B)*~(C)*~(D)+A*B*~(C)*~(D)+A*~(B)*C*~(D)+A*B*C*~(D)+A*B*~(C)*D+~(A)*~(B)*C*D+~(A)*B*C*D+A*B*C*D)"),
    .INIT(16'hd8aa))
    \bits_b[13]_syn_13  (
    .a(char_id[2]),
    .b(ramread1_syn_377),
    .c(ramread1_syn_375),
    .d(char_id[3]),
    .o(\bits_b[13]_syn_14 ));
  AL_MAP_LUT4 #(
    .EQN("(~(A)*~(B)*~(C)*~(D)+~(A)*B*~(C)*~(D)+~(A)*~(B)*C*~(D)+A*~(B)*C*~(D)+~(A)*~(B)*~(C)*D+A*~(B)*~(C)*D+~(A)*B*~(C)*D+A*B*~(C)*D)"),
    .INIT(16'h0f35))
    \bits_b[13]_syn_15  (
    .a(ramread1_syn_371),
    .b(ramread1_syn_373),
    .c(\bits_b[13]_syn_14 ),
    .d(char_id[3]),
    .o(\bits_b[13]_syn_16 ));
  AL_MAP_LUT5 #(
    .EQN("(~D*(~B*~((~E*~C))*~(A)+~B*(~E*~C)*~(A)+~(~B)*(~E*~C)*A+~B*(~E*~C)*A))"),
    .INIT(32'h0011001b))
    \bits_b[13]_syn_17  (
    .a(\bits_b[13]_syn_8 ),
    .b(\bits_b[13]_syn_12 ),
    .c(\bits_b[13]_syn_16 ),
    .d(char_id[6]),
    .e(char_id[4]),
    .o(bits_b[13]));
  AL_MAP_LUT5 #(
    .EQN("(B*(~(A)*~(C)*~(D)*~(E)+A*~(C)*~(D)*~(E)+~(A)*C*~(D)*~(E)+A*~(C)*D*~(E)+~(A)*C*D*~(E)+~(A)*~(C)*~(D)*E+~(A)*C*~(D)*E+~(A)*C*D*E))"),
    .INIT(32'h4044484c))
    \bits_b[13]_syn_3  (
    .a(\bits_b[13]_syn_2 ),
    .b(char_id[4]),
    .c(char_id[3]),
    .d(ramread1_syn_363),
    .e(ramread1_syn_365),
    .o(\bits_b[13]_syn_4 ));
  AL_MAP_LUT5 #(
    .EQN("(~(A)*~(B)*~(C)*~(D)*~(E)+A*~(B)*~(C)*~(D)*~(E)+~(A)*B*~(C)*~(D)*~(E)+A*B*~(C)*~(D)*~(E)+A*~(B)*C*~(D)*~(E)+~(A)*B*C*~(D)*~(E)+A*B*C*~(D)*~(E)+~(A)*~(B)*~(C)*D*~(E)+A*~(B)*~(C)*D*~(E)+A*B*~(C)*D*~(E)+A*~(B)*C*D*~(E)+A*B*C*D*~(E)+~(A)*~(B)*~(C)*~(D)*E+~(A)*B*~(C)*~(D)*E+A*B*~(C)*~(D)*E+~(A)*B*C*~(D)*E+A*B*C*~(D)*E+~(A)*~(B)*~(C)*D*E+A*B*~(C)*D*E+A*B*C*D*E)"),
    .INIT(32'h89cdabef))
    \bits_b[13]_syn_5  (
    .a(char_id[3]),
    .b(char_id[2]),
    .c(ramread1_syn_379),
    .d(ramread1_syn_381),
    .e(ramread1_syn_383),
    .o(\bits_b[13]_syn_6 ));
  AL_MAP_LUT4 #(
    .EQN("~(~A*~((D*~B))*~(C)+~A*(D*~B)*~(C)+~(~A)*(D*~B)*C+~A*(D*~B)*C)"),
    .INIT(16'hcafa))
    \bits_b[13]_syn_7  (
    .a(\bits_b[13]_syn_4 ),
    .b(\bits_b[13]_syn_6 ),
    .c(char_id[5]),
    .d(char_id[4]),
    .o(\bits_b[13]_syn_8 ));
  AL_MAP_LUT4 #(
    .EQN("(~(A)*B*~(C)*~(D)+A*~(B)*C*~(D)+~(A)*B*C*~(D)+~(A)*B*~(C)*D+A*B*~(C)*D+A*~(B)*C*D+~(A)*B*C*D+A*B*C*D)"),
    .INIT(16'hec64))
    \bits_b[13]_syn_9  (
    .a(char_id[3]),
    .b(char_id[2]),
    .c(ramread1_syn_359),
    .d(ramread1_syn_361),
    .o(\bits_b[13]_syn_10 ));
  AL_MAP_LUT4 #(
    .EQN("(~(A)*B*~(C)*~(D)+A*~(B)*C*~(D)+~(A)*B*C*~(D)+~(A)*B*~(C)*D+A*B*~(C)*D+A*~(B)*C*D+~(A)*B*C*D+A*B*C*D)"),
    .INIT(16'hec64))
    \bits_b[14]_syn_1  (
    .a(char_id[3]),
    .b(char_id[2]),
    .c(ramread1_syn_398),
    .d(ramread1_syn_400),
    .o(\bits_b[14]_syn_2 ));
  AL_MAP_LUT5 #(
    .EQN("(~B*(~(A)*~(C)*~(D)*~(E)+A*~(C)*~(D)*~(E)+~(A)*C*~(D)*~(E)+A*~(C)*D*~(E)+~(A)*C*D*~(E)+~(A)*~(C)*~(D)*E+~(A)*C*~(D)*E+~(A)*C*D*E))"),
    .INIT(32'h10111213))
    \bits_b[14]_syn_11  (
    .a(\bits_b[14]_syn_10 ),
    .b(char_id[4]),
    .c(char_id[3]),
    .d(ramread1_syn_386),
    .e(ramread1_syn_388),
    .o(\bits_b[14]_syn_12 ));
  AL_MAP_LUT4 #(
    .EQN("(A*~(B)*~(C)*~(D)+A*B*~(C)*~(D)+A*~(B)*C*~(D)+A*B*C*~(D)+A*B*~(C)*D+~(A)*~(B)*C*D+~(A)*B*C*D+A*B*C*D)"),
    .INIT(16'hd8aa))
    \bits_b[14]_syn_13  (
    .a(char_id[2]),
    .b(ramread1_syn_408),
    .c(ramread1_syn_406),
    .d(char_id[3]),
    .o(\bits_b[14]_syn_14 ));
  AL_MAP_LUT4 #(
    .EQN("(~(A)*~(B)*~(C)*~(D)+~(A)*B*~(C)*~(D)+~(A)*~(B)*C*~(D)+A*~(B)*C*~(D)+~(A)*~(B)*~(C)*D+A*~(B)*~(C)*D+~(A)*B*~(C)*D+A*B*~(C)*D)"),
    .INIT(16'h0f35))
    \bits_b[14]_syn_15  (
    .a(ramread1_syn_402),
    .b(ramread1_syn_404),
    .c(\bits_b[14]_syn_14 ),
    .d(char_id[3]),
    .o(\bits_b[14]_syn_16 ));
  AL_MAP_LUT5 #(
    .EQN("(~D*(~B*~((~E*~C))*~(A)+~B*(~E*~C)*~(A)+~(~B)*(~E*~C)*A+~B*(~E*~C)*A))"),
    .INIT(32'h0011001b))
    \bits_b[14]_syn_17  (
    .a(\bits_b[14]_syn_8 ),
    .b(\bits_b[14]_syn_12 ),
    .c(\bits_b[14]_syn_16 ),
    .d(char_id[6]),
    .e(char_id[4]),
    .o(bits_b[14]));
  AL_MAP_LUT5 #(
    .EQN("(B*(~(A)*~(C)*~(D)*~(E)+A*~(C)*~(D)*~(E)+~(A)*C*~(D)*~(E)+A*~(C)*D*~(E)+~(A)*C*D*~(E)+~(A)*~(C)*~(D)*E+~(A)*C*~(D)*E+~(A)*C*D*E))"),
    .INIT(32'h4044484c))
    \bits_b[14]_syn_3  (
    .a(\bits_b[14]_syn_2 ),
    .b(char_id[4]),
    .c(char_id[3]),
    .d(ramread1_syn_394),
    .e(ramread1_syn_396),
    .o(\bits_b[14]_syn_4 ));
  AL_MAP_LUT5 #(
    .EQN("(~(A)*~(B)*~(C)*~(D)*~(E)+A*~(B)*~(C)*~(D)*~(E)+~(A)*B*~(C)*~(D)*~(E)+A*B*~(C)*~(D)*~(E)+A*~(B)*C*~(D)*~(E)+~(A)*B*C*~(D)*~(E)+A*B*C*~(D)*~(E)+~(A)*~(B)*~(C)*D*~(E)+A*~(B)*~(C)*D*~(E)+A*B*~(C)*D*~(E)+A*~(B)*C*D*~(E)+A*B*C*D*~(E)+~(A)*~(B)*~(C)*~(D)*E+~(A)*B*~(C)*~(D)*E+A*B*~(C)*~(D)*E+~(A)*B*C*~(D)*E+A*B*C*~(D)*E+~(A)*~(B)*~(C)*D*E+A*B*~(C)*D*E+A*B*C*D*E)"),
    .INIT(32'h89cdabef))
    \bits_b[14]_syn_5  (
    .a(char_id[3]),
    .b(char_id[2]),
    .c(ramread1_syn_410),
    .d(ramread1_syn_412),
    .e(ramread1_syn_414),
    .o(\bits_b[14]_syn_6 ));
  AL_MAP_LUT4 #(
    .EQN("~(~A*~((D*~B))*~(C)+~A*(D*~B)*~(C)+~(~A)*(D*~B)*C+~A*(D*~B)*C)"),
    .INIT(16'hcafa))
    \bits_b[14]_syn_7  (
    .a(\bits_b[14]_syn_4 ),
    .b(\bits_b[14]_syn_6 ),
    .c(char_id[5]),
    .d(char_id[4]),
    .o(\bits_b[14]_syn_8 ));
  AL_MAP_LUT4 #(
    .EQN("(~(A)*B*~(C)*~(D)+A*~(B)*C*~(D)+~(A)*B*C*~(D)+~(A)*B*~(C)*D+A*B*~(C)*D+A*~(B)*C*D+~(A)*B*C*D+A*B*C*D)"),
    .INIT(16'hec64))
    \bits_b[14]_syn_9  (
    .a(char_id[3]),
    .b(char_id[2]),
    .c(ramread1_syn_390),
    .d(ramread1_syn_392),
    .o(\bits_b[14]_syn_10 ));
  AL_MAP_LUT5 #(
    .EQN("(B*~(~(~D*~C)*~(E*A)))"),
    .INIT(32'h888c000c))
    \bits_b[15]_syn_1  (
    .a(char_id[3]),
    .b(char_id[1]),
    .c(row1[1]),
    .d(row1[2]),
    .e(row1[3]),
    .o(\bits_b[15]_syn_2 ));
  AL_MAP_LUT5 #(
    .EQN("(A*~(B)*~(C)*~((~E*~D))+~(A)*B*~(C)*~((~E*~D))+A*B*~(C)*~((~E*~D))+A*~(B)*C*~((~E*~D))+~(A)*B*C*~((~E*~D))+~(A)*B*~(C)*(~E*~D)+A*B*~(C)*(~E*~D)+A*~(B)*C*(~E*~D)+~(A)*B*C*(~E*~D))"),
    .INIT(32'h6e6e6e6c))
    \bits_b[15]_syn_11  (
    .a(char_id[3]),
    .b(char_id[2]),
    .c(char_id[0]),
    .d(row1[0]),
    .e(row1[2]),
    .o(\bits_b[15]_syn_12 ));
  AL_MAP_LUT4 #(
    .EQN("(~(~D*~C)*~(B*~A))"),
    .INIT(16'hbbb0))
    \bits_b[15]_syn_13  (
    .a(char_id[2]),
    .b(char_id[1]),
    .c(row1[0]),
    .d(row1[2]),
    .o(\bits_b[15]_syn_14 ));
  AL_MAP_LUT4 #(
    .EQN("(~D*C*B*A)"),
    .INIT(16'h0080))
    \bits_b[15]_syn_15  (
    .a(\bits_b[15]_syn_6 ),
    .b(\bits_b[15]_syn_10 ),
    .c(\bits_b[15]_syn_12 ),
    .d(\bits_b[15]_syn_14 ),
    .o(bits_b[15]));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(D*~(C*B)))"),
    .INIT(16'h4055))
    \bits_b[15]_syn_3  (
    .a(char_id[3]),
    .b(char_id[1]),
    .c(char_id[0]),
    .d(row1[3]),
    .o(\bits_b[15]_syn_4 ));
  AL_MAP_LUT5 #(
    .EQN("(~E*~D*~C*~B*~A)"),
    .INIT(32'h00000001))
    \bits_b[15]_syn_5  (
    .a(\bits_b[15]_syn_2 ),
    .b(\bits_b[15]_syn_4 ),
    .c(char_id[6]),
    .d(char_id[5]),
    .e(char_id[4]),
    .o(\bits_b[15]_syn_6 ));
  AL_MAP_LUT4 #(
    .EQN("(~A*~(D*~C*B))"),
    .INIT(16'h5155))
    \bits_b[15]_syn_7  (
    .a(char_id[1]),
    .b(char_id[0]),
    .c(row1[1]),
    .d(row1[3]),
    .o(\bits_b[15]_syn_8 ));
  AL_MAP_LUT5 #(
    .EQN("(~A*~(E*~(~D*~(C*B))))"),
    .INIT(32'h00155555))
    \bits_b[15]_syn_9  (
    .a(\bits_b[15]_syn_8 ),
    .b(char_id[0]),
    .c(row1[0]),
    .d(row1[1]),
    .e(row1[2]),
    .o(\bits_b[15]_syn_10 ));
  AL_MAP_LUT4 #(
    .EQN("(A*~(B)*~(C)*~(D)+A*B*~(C)*~(D)+A*~(B)*C*~(D)+A*B*C*~(D)+A*B*~(C)*D+~(A)*~(B)*C*D+~(A)*B*C*D+A*B*C*D)"),
    .INIT(16'hd8aa))
    \bits_b[1]_syn_1  (
    .a(char_id[2]),
    .b(ramread1_syn_41),
    .c(ramread1_syn_39),
    .d(char_id[3]),
    .o(\bits_b[1]_syn_2 ));
  AL_MAP_LUT4 #(
    .EQN("(C*A*~(D*B))"),
    .INIT(16'h20a0))
    \bits_b[1]_syn_11  (
    .a(\bits_b[1]_syn_10 ),
    .b(\bits_b[11]_syn_2 ),
    .c(char_id[4]),
    .d(ramread1_syn_27),
    .o(\bits_b[1]_syn_12 ));
  AL_MAP_LUT4 #(
    .EQN("(~D*~(~A*~(C*~B)))"),
    .INIT(16'h00ba))
    \bits_b[1]_syn_13  (
    .a(\bits_b[1]_syn_8 ),
    .b(\bits_b[1]_syn_12 ),
    .c(\bits_b[7]_syn_2 ),
    .d(char_id[6]),
    .o(bits_b[1]));
  AL_MAP_LUT4 #(
    .EQN("(~(A)*~(B)*~(C)*~(D)+~(A)*B*~(C)*~(D)+~(A)*~(B)*C*~(D)+A*~(B)*C*~(D)+~(A)*~(B)*~(C)*D+A*~(B)*~(C)*D+~(A)*B*~(C)*D+A*B*~(C)*D)"),
    .INIT(16'h0f35))
    \bits_b[1]_syn_3  (
    .a(ramread1_syn_35),
    .b(ramread1_syn_37),
    .c(\bits_b[1]_syn_2 ),
    .d(char_id[3]),
    .o(\bits_b[1]_syn_4 ));
  AL_MAP_LUT5 #(
    .EQN("(~(A)*~(B)*~(C)*~(D)*~(E)+A*~(B)*~(C)*~(D)*~(E)+~(A)*B*~(C)*~(D)*~(E)+A*B*~(C)*~(D)*~(E)+A*~(B)*C*~(D)*~(E)+~(A)*B*C*~(D)*~(E)+A*B*C*~(D)*~(E)+~(A)*~(B)*~(C)*D*~(E)+A*~(B)*~(C)*D*~(E)+A*B*~(C)*D*~(E)+A*~(B)*C*D*~(E)+A*B*C*D*~(E)+~(A)*~(B)*~(C)*~(D)*E+~(A)*B*~(C)*~(D)*E+A*B*~(C)*~(D)*E+~(A)*B*C*~(D)*E+A*B*C*~(D)*E+~(A)*~(B)*~(C)*D*E+A*B*~(C)*D*E+A*B*C*D*E)"),
    .INIT(32'h89cdabef))
    \bits_b[1]_syn_5  (
    .a(char_id[3]),
    .b(char_id[2]),
    .c(ramread1_syn_43),
    .d(ramread1_syn_45),
    .e(ramread1_syn_47),
    .o(\bits_b[1]_syn_6 ));
  AL_MAP_LUT4 #(
    .EQN("(C*~(A*~(B)*~(D)+A*B*~(D)+~(A)*B*D+A*B*D))"),
    .INIT(16'h3050))
    \bits_b[1]_syn_7  (
    .a(\bits_b[1]_syn_4 ),
    .b(\bits_b[1]_syn_6 ),
    .c(char_id[5]),
    .d(char_id[4]),
    .o(\bits_b[1]_syn_8 ));
  AL_MAP_LUT5 #(
    .EQN("(~(A)*~(B)*~(C)*~(D)*~(E)+A*~(B)*~(C)*~(D)*~(E)+~(A)*B*~(C)*~(D)*~(E)+A*B*~(C)*~(D)*~(E)+~(A)*~(B)*C*~(D)*~(E)+A*~(B)*C*~(D)*~(E)+A*B*C*~(D)*~(E)+~(A)*~(B)*~(C)*D*~(E)+~(A)*B*~(C)*D*~(E)+A*B*~(C)*D*~(E)+~(A)*~(B)*C*D*~(E)+A*B*C*D*~(E)+~(A)*~(B)*~(C)*~(D)*E+A*~(B)*~(C)*~(D)*E+~(A)*B*~(C)*~(D)*E+~(A)*~(B)*C*~(D)*E+A*~(B)*C*~(D)*E+~(A)*~(B)*~(C)*D*E+~(A)*B*~(C)*D*E+~(A)*~(B)*C*D*E)"),
    .INIT(32'h15379dbf))
    \bits_b[1]_syn_9  (
    .a(char_id[3]),
    .b(char_id[2]),
    .c(ramread1_syn_29),
    .d(ramread1_syn_31),
    .e(ramread1_syn_33),
    .o(\bits_b[1]_syn_10 ));
  AL_MAP_LUT5 #(
    .EQN("(~(A)*~(B)*~(C)*~(D)*~(E)+A*~(B)*~(C)*~(D)*~(E)+~(A)*B*~(C)*~(D)*~(E)+A*B*~(C)*~(D)*~(E)+~(A)*~(B)*C*~(D)*~(E)+A*~(B)*C*~(D)*~(E)+A*B*C*~(D)*~(E)+~(A)*~(B)*~(C)*D*~(E)+~(A)*B*~(C)*D*~(E)+A*B*~(C)*D*~(E)+~(A)*~(B)*C*D*~(E)+A*B*C*D*~(E)+~(A)*~(B)*~(C)*~(D)*E+A*~(B)*~(C)*~(D)*E+~(A)*B*~(C)*~(D)*E+~(A)*~(B)*C*~(D)*E+A*~(B)*C*~(D)*E+~(A)*~(B)*~(C)*D*E+~(A)*B*~(C)*D*E+~(A)*~(B)*C*D*E)"),
    .INIT(32'h15379dbf))
    \bits_b[2]_syn_1  (
    .a(char_id[3]),
    .b(char_id[2]),
    .c(ramread1_syn_54),
    .d(ramread1_syn_56),
    .e(ramread1_syn_58),
    .o(\bits_b[2]_syn_2 ));
  AL_MAP_LUT5 #(
    .EQN("(~(A)*~(B)*~(C)*~(D)*~(E)+A*~(B)*~(C)*~(D)*~(E)+~(A)*B*~(C)*~(D)*~(E)+A*B*~(C)*~(D)*~(E)+A*~(B)*C*~(D)*~(E)+~(A)*B*C*~(D)*~(E)+A*B*C*~(D)*~(E)+~(A)*~(B)*~(C)*D*~(E)+A*~(B)*~(C)*D*~(E)+A*B*~(C)*D*~(E)+A*~(B)*C*D*~(E)+A*B*C*D*~(E)+~(A)*~(B)*~(C)*~(D)*E+~(A)*B*~(C)*~(D)*E+A*B*~(C)*~(D)*E+~(A)*B*C*~(D)*E+A*B*C*~(D)*E+~(A)*~(B)*~(C)*D*E+A*B*~(C)*D*E+A*B*C*D*E)"),
    .INIT(32'h89cdabef))
    \bits_b[2]_syn_11  (
    .a(char_id[3]),
    .b(char_id[2]),
    .c(ramread1_syn_68),
    .d(ramread1_syn_70),
    .e(ramread1_syn_72),
    .o(\bits_b[2]_syn_12 ));
  AL_MAP_LUT4 #(
    .EQN("(~D*~(A*~(C*~B)))"),
    .INIT(16'h0075))
    \bits_b[2]_syn_13  (
    .a(\bits_b[2]_syn_10 ),
    .b(\bits_b[2]_syn_12 ),
    .c(\bits_b[9]_syn_2 ),
    .d(char_id[6]),
    .o(bits_b[2]));
  AL_MAP_LUT4 #(
    .EQN("(C*A*~(D*B))"),
    .INIT(16'h20a0))
    \bits_b[2]_syn_3  (
    .a(\bits_b[2]_syn_2 ),
    .b(\bits_b[11]_syn_2 ),
    .c(char_id[4]),
    .d(ramread1_syn_52),
    .o(\bits_b[2]_syn_4 ));
  AL_MAP_LUT4 #(
    .EQN("(A*~(B)*~(C)*~(D)+A*B*~(C)*~(D)+A*~(B)*C*~(D)+A*B*C*~(D)+A*B*~(C)*D+~(A)*~(B)*C*D+~(A)*B*C*D+A*B*C*D)"),
    .INIT(16'hd8aa))
    \bits_b[2]_syn_5  (
    .a(char_id[2]),
    .b(ramread1_syn_66),
    .c(ramread1_syn_64),
    .d(char_id[3]),
    .o(\bits_b[2]_syn_6 ));
  AL_MAP_LUT4 #(
    .EQN("(~(A)*~(B)*~(C)*~(D)+~(A)*B*~(C)*~(D)+~(A)*~(B)*C*~(D)+A*~(B)*C*~(D)+~(A)*~(B)*~(C)*D+A*~(B)*~(C)*D+~(A)*B*~(C)*D+A*B*~(C)*D)"),
    .INIT(16'h0f35))
    \bits_b[2]_syn_7  (
    .a(ramread1_syn_60),
    .b(ramread1_syn_62),
    .c(\bits_b[2]_syn_6 ),
    .d(char_id[3]),
    .o(\bits_b[2]_syn_8 ));
  AL_MAP_LUT4 #(
    .EQN("(~(D*~B)*~(C*~A))"),
    .INIT(16'h8caf))
    \bits_b[2]_syn_9  (
    .a(\bits_b[2]_syn_4 ),
    .b(\bits_b[2]_syn_8 ),
    .c(\bits_b[7]_syn_2 ),
    .d(\bits_b[9]_syn_4 ),
    .o(\bits_b[2]_syn_10 ));
  AL_MAP_LUT4 #(
    .EQN("(A*~(B)*~(C)*~(D)+A*B*~(C)*~(D)+A*~(B)*C*~(D)+A*B*C*~(D)+A*B*~(C)*D+~(A)*~(B)*C*D+~(A)*B*C*D+A*B*C*D)"),
    .INIT(16'hd8aa))
    \bits_b[3]_syn_1  (
    .a(char_id[2]),
    .b(ramread1_syn_91),
    .c(ramread1_syn_89),
    .d(char_id[3]),
    .o(\bits_b[3]_syn_2 ));
  AL_MAP_LUT4 #(
    .EQN("(A*~(B)*~(C)*~(D)+A*B*~(C)*~(D)+~(A)*B*C*~(D)+A*B*C*~(D)+~(A)*~(B)*C*D+A*~(B)*C*D+~(A)*B*C*D+A*B*C*D)"),
    .INIT(16'hf0ca))
    \bits_b[3]_syn_11  (
    .a(ramread1_syn_77),
    .b(ramread1_syn_79),
    .c(\bits_b[3]_syn_10 ),
    .d(char_id[3]),
    .o(ramread1_syn_619));
  AL_MAP_LUT3 #(
    .EQN("(B*~(C*~A))"),
    .INIT(8'h8c))
    \bits_b[3]_syn_12  (
    .a(ramread1_syn_619),
    .b(\bits_b[7]_syn_2 ),
    .c(char_id[4]),
    .o(\bits_b[3]_syn_13 ));
  AL_MAP_LUT4 #(
    .EQN("(~C*~(~B*~(D*~A)))"),
    .INIT(16'h0d0c))
    \bits_b[3]_syn_14  (
    .a(\bits_b[3]_syn_8 ),
    .b(\bits_b[3]_syn_13 ),
    .c(char_id[6]),
    .d(char_id[5]),
    .o(bits_b[3]));
  AL_MAP_LUT4 #(
    .EQN("(~(A)*~(B)*~(C)*~(D)+~(A)*B*~(C)*~(D)+~(A)*~(B)*C*~(D)+A*~(B)*C*~(D)+~(A)*~(B)*~(C)*D+A*~(B)*~(C)*D+~(A)*B*~(C)*D+A*B*~(C)*D)"),
    .INIT(16'h0f35))
    \bits_b[3]_syn_3  (
    .a(ramread1_syn_85),
    .b(ramread1_syn_87),
    .c(\bits_b[3]_syn_2 ),
    .d(char_id[3]),
    .o(\bits_b[3]_syn_4 ));
  AL_MAP_LUT4 #(
    .EQN("~(~A*~((D*~C))*~(B)+~A*(D*~C)*~(B)+~(~A)*(D*~C)*B+~A*(D*~C)*B)"),
    .INIT(16'he2ee))
    \bits_b[3]_syn_5  (
    .a(\bits_b[3]_syn_4 ),
    .b(char_id[4]),
    .c(char_id[2]),
    .d(ramread1_syn_97),
    .o(\bits_b[3]_syn_6 ));
  AL_MAP_LUT5 #(
    .EQN("~(~A*~((D*~(E)*~(C)+D*E*~(C)+~(D)*E*C+D*E*C))*~(B)+~A*(D*~(E)*~(C)+D*E*~(C)+~(D)*E*C+D*E*C)*~(B)+~(~A)*(D*~(E)*~(C)+D*E*~(C)+~(D)*E*C+D*E*C)*B+~A*(D*~(E)*~(C)+D*E*~(C)+~(D)*E*C+D*E*C)*B)"),
    .INIT(32'h222ee2ee))
    \bits_b[3]_syn_7  (
    .a(\bits_b[3]_syn_6 ),
    .b(\bits_b[8]_syn_2 ),
    .c(char_id[2]),
    .d(ramread1_syn_93),
    .e(ramread1_syn_95),
    .o(\bits_b[3]_syn_8 ));
  AL_MAP_LUT4 #(
    .EQN("(A*~(B)*~(C)*~(D)+A*B*~(C)*~(D)+A*~(B)*C*~(D)+A*B*C*~(D)+A*B*~(C)*D+~(A)*~(B)*C*D+~(A)*B*C*D+A*B*C*D)"),
    .INIT(16'hd8aa))
    \bits_b[3]_syn_9  (
    .a(char_id[2]),
    .b(ramread1_syn_83),
    .c(ramread1_syn_81),
    .d(char_id[3]),
    .o(\bits_b[3]_syn_10 ));
  AL_MAP_LUT4 #(
    .EQN("(A*~(B)*~(C)*~(D)+A*B*~(C)*~(D)+A*~(B)*C*~(D)+A*B*C*~(D)+A*B*~(C)*D+~(A)*~(B)*C*D+~(A)*B*C*D+A*B*C*D)"),
    .INIT(16'hd8aa))
    \bits_b[4]_syn_1  (
    .a(char_id[2]),
    .b(ramread1_syn_116),
    .c(ramread1_syn_114),
    .d(char_id[3]),
    .o(\bits_b[4]_syn_2 ));
  AL_MAP_LUT5 #(
    .EQN("(~(A)*~(B)*~(C)*~(D)*~(E)+A*~(B)*~(C)*~(D)*~(E)+~(A)*B*~(C)*~(D)*~(E)+A*B*~(C)*~(D)*~(E)+A*~(B)*C*~(D)*~(E)+~(A)*B*C*~(D)*~(E)+A*B*C*~(D)*~(E)+~(A)*~(B)*~(C)*D*~(E)+A*~(B)*~(C)*D*~(E)+A*B*~(C)*D*~(E)+A*~(B)*C*D*~(E)+A*B*C*D*~(E)+~(A)*~(B)*~(C)*~(D)*E+~(A)*B*~(C)*~(D)*E+A*B*~(C)*~(D)*E+~(A)*B*C*~(D)*E+A*B*C*~(D)*E+~(A)*~(B)*~(C)*D*E+A*B*~(C)*D*E+A*B*C*D*E)"),
    .INIT(32'h89cdabef))
    \bits_b[4]_syn_10  (
    .a(char_id[3]),
    .b(char_id[2]),
    .c(ramread1_syn_118),
    .d(ramread1_syn_120),
    .e(ramread1_syn_122),
    .o(\bits_b[4]_syn_11 ));
  AL_MAP_LUT4 #(
    .EQN("(~D*~(A*~(C*~B)))"),
    .INIT(16'h0075))
    \bits_b[4]_syn_12  (
    .a(\bits_b[4]_syn_9 ),
    .b(\bits_b[4]_syn_11 ),
    .c(\bits_b[9]_syn_2 ),
    .d(char_id[6]),
    .o(bits_b[4]));
  AL_MAP_LUT4 #(
    .EQN("(~(A)*~(B)*~(C)*~(D)+~(A)*B*~(C)*~(D)+~(A)*~(B)*C*~(D)+A*~(B)*C*~(D)+~(A)*~(B)*~(C)*D+A*~(B)*~(C)*D+~(A)*B*~(C)*D+A*B*~(C)*D)"),
    .INIT(16'h0f35))
    \bits_b[4]_syn_3  (
    .a(ramread1_syn_110),
    .b(ramread1_syn_112),
    .c(\bits_b[4]_syn_2 ),
    .d(char_id[3]),
    .o(\bits_b[4]_syn_4 ));
  AL_MAP_LUT4 #(
    .EQN("(A*~(B)*~(C)*~(D)+A*B*~(C)*~(D)+A*~(B)*C*~(D)+A*B*C*~(D)+A*B*~(C)*D+~(A)*~(B)*C*D+~(A)*B*C*D+A*B*C*D)"),
    .INIT(16'hd8aa))
    \bits_b[4]_syn_5  (
    .a(char_id[2]),
    .b(ramread1_syn_108),
    .c(ramread1_syn_106),
    .d(char_id[3]),
    .o(\bits_b[4]_syn_6 ));
  AL_MAP_LUT4 #(
    .EQN("(A*~(B)*~(C)*~(D)+A*B*~(C)*~(D)+~(A)*B*C*~(D)+A*B*C*~(D)+~(A)*~(B)*C*D+A*~(B)*C*D+~(A)*B*C*D+A*B*C*D)"),
    .INIT(16'hf0ca))
    \bits_b[4]_syn_7  (
    .a(ramread1_syn_102),
    .b(ramread1_syn_104),
    .c(\bits_b[4]_syn_6 ),
    .d(char_id[3]),
    .o(ramread1_syn_672));
  AL_MAP_LUT5 #(
    .EQN("(~(B)*~(C)*~((D*~A))*~(E)+B*~(C)*~((D*~A))*~(E)+~(B)*~(C)*~((D*~A))*E+B*~(C)*~((D*~A))*E+~(B)*C*~((D*~A))*E+~(B)*~(C)*(D*~A)*E+B*~(C)*(D*~A)*E+~(B)*C*(D*~A)*E)"),
    .INIT(32'h3f3f0a0f))
    \bits_b[4]_syn_8  (
    .a(\bits_b[4]_syn_4 ),
    .b(ramread1_syn_672),
    .c(\bits_b[7]_syn_2 ),
    .d(char_id[5]),
    .e(char_id[4]),
    .o(\bits_b[4]_syn_9 ));
  AL_MAP_LUT4 #(
    .EQN("(A*~(B)*~(C)*~(D)+A*B*~(C)*~(D)+A*~(B)*C*~(D)+A*B*C*~(D)+A*B*~(C)*D+~(A)*~(B)*C*D+~(A)*B*C*D+A*B*C*D)"),
    .INIT(16'hd8aa))
    \bits_b[5]_syn_1  (
    .a(char_id[2]),
    .b(ramread1_syn_141),
    .c(ramread1_syn_139),
    .d(char_id[3]),
    .o(\bits_b[5]_syn_2 ));
  AL_MAP_LUT4 #(
    .EQN("(A*~(B)*~(C)*~(D)+A*B*~(C)*~(D)+~(A)*B*C*~(D)+A*B*C*~(D)+~(A)*~(B)*C*D+A*~(B)*C*D+~(A)*B*C*D+A*B*C*D)"),
    .INIT(16'hf0ca))
    \bits_b[5]_syn_11  (
    .a(ramread1_syn_127),
    .b(ramread1_syn_129),
    .c(\bits_b[5]_syn_10 ),
    .d(char_id[3]),
    .o(ramread1_syn_725));
  AL_MAP_LUT3 #(
    .EQN("(B*~(C*~A))"),
    .INIT(8'h8c))
    \bits_b[5]_syn_12  (
    .a(ramread1_syn_725),
    .b(\bits_b[7]_syn_2 ),
    .c(char_id[4]),
    .o(\bits_b[5]_syn_13 ));
  AL_MAP_LUT4 #(
    .EQN("(~C*~(~B*~(D*~A)))"),
    .INIT(16'h0d0c))
    \bits_b[5]_syn_14  (
    .a(\bits_b[5]_syn_8 ),
    .b(\bits_b[5]_syn_13 ),
    .c(char_id[6]),
    .d(char_id[5]),
    .o(bits_b[5]));
  AL_MAP_LUT4 #(
    .EQN("(~(A)*~(B)*~(C)*~(D)+~(A)*B*~(C)*~(D)+~(A)*~(B)*C*~(D)+A*~(B)*C*~(D)+~(A)*~(B)*~(C)*D+A*~(B)*~(C)*D+~(A)*B*~(C)*D+A*B*~(C)*D)"),
    .INIT(16'h0f35))
    \bits_b[5]_syn_3  (
    .a(ramread1_syn_135),
    .b(ramread1_syn_137),
    .c(\bits_b[5]_syn_2 ),
    .d(char_id[3]),
    .o(\bits_b[5]_syn_4 ));
  AL_MAP_LUT4 #(
    .EQN("~(~A*~((D*~C))*~(B)+~A*(D*~C)*~(B)+~(~A)*(D*~C)*B+~A*(D*~C)*B)"),
    .INIT(16'he2ee))
    \bits_b[5]_syn_5  (
    .a(\bits_b[5]_syn_4 ),
    .b(char_id[4]),
    .c(char_id[2]),
    .d(ramread1_syn_147),
    .o(\bits_b[5]_syn_6 ));
  AL_MAP_LUT5 #(
    .EQN("~(~A*~((D*~(E)*~(C)+D*E*~(C)+~(D)*E*C+D*E*C))*~(B)+~A*(D*~(E)*~(C)+D*E*~(C)+~(D)*E*C+D*E*C)*~(B)+~(~A)*(D*~(E)*~(C)+D*E*~(C)+~(D)*E*C+D*E*C)*B+~A*(D*~(E)*~(C)+D*E*~(C)+~(D)*E*C+D*E*C)*B)"),
    .INIT(32'h222ee2ee))
    \bits_b[5]_syn_7  (
    .a(\bits_b[5]_syn_6 ),
    .b(\bits_b[8]_syn_2 ),
    .c(char_id[2]),
    .d(ramread1_syn_143),
    .e(ramread1_syn_145),
    .o(\bits_b[5]_syn_8 ));
  AL_MAP_LUT4 #(
    .EQN("(A*~(B)*~(C)*~(D)+A*B*~(C)*~(D)+A*~(B)*C*~(D)+A*B*C*~(D)+A*B*~(C)*D+~(A)*~(B)*C*D+~(A)*B*C*D+A*B*C*D)"),
    .INIT(16'hd8aa))
    \bits_b[5]_syn_9  (
    .a(char_id[2]),
    .b(ramread1_syn_133),
    .c(ramread1_syn_131),
    .d(char_id[3]),
    .o(\bits_b[5]_syn_10 ));
  AL_MAP_LUT5 #(
    .EQN("(~(A)*~(B)*~(C)*~(D)*~(E)+A*~(B)*~(C)*~(D)*~(E)+~(A)*B*~(C)*~(D)*~(E)+A*B*~(C)*~(D)*~(E)+~(A)*~(B)*C*~(D)*~(E)+A*~(B)*C*~(D)*~(E)+A*B*C*~(D)*~(E)+~(A)*~(B)*~(C)*D*~(E)+~(A)*B*~(C)*D*~(E)+A*B*~(C)*D*~(E)+~(A)*~(B)*C*D*~(E)+A*B*C*D*~(E)+~(A)*~(B)*~(C)*~(D)*E+A*~(B)*~(C)*~(D)*E+~(A)*B*~(C)*~(D)*E+~(A)*~(B)*C*~(D)*E+A*~(B)*C*~(D)*E+~(A)*~(B)*~(C)*D*E+~(A)*B*~(C)*D*E+~(A)*~(B)*C*D*E)"),
    .INIT(32'h15379dbf))
    \bits_b[6]_syn_1  (
    .a(char_id[3]),
    .b(char_id[2]),
    .c(ramread1_syn_154),
    .d(ramread1_syn_156),
    .e(ramread1_syn_158),
    .o(\bits_b[6]_syn_2 ));
  AL_MAP_LUT5 #(
    .EQN("(~(A)*~(B)*~(C)*~(D)*~(E)+A*~(B)*~(C)*~(D)*~(E)+~(A)*B*~(C)*~(D)*~(E)+A*B*~(C)*~(D)*~(E)+A*~(B)*C*~(D)*~(E)+~(A)*B*C*~(D)*~(E)+A*B*C*~(D)*~(E)+~(A)*~(B)*~(C)*D*~(E)+A*~(B)*~(C)*D*~(E)+A*B*~(C)*D*~(E)+A*~(B)*C*D*~(E)+A*B*C*D*~(E)+~(A)*~(B)*~(C)*~(D)*E+~(A)*B*~(C)*~(D)*E+A*B*~(C)*~(D)*E+~(A)*B*C*~(D)*E+A*B*C*~(D)*E+~(A)*~(B)*~(C)*D*E+A*B*~(C)*D*E+A*B*C*D*E)"),
    .INIT(32'h89cdabef))
    \bits_b[6]_syn_11  (
    .a(char_id[3]),
    .b(char_id[2]),
    .c(ramread1_syn_168),
    .d(ramread1_syn_170),
    .e(ramread1_syn_172),
    .o(\bits_b[6]_syn_12 ));
  AL_MAP_LUT4 #(
    .EQN("(~D*~(A*~(C*~B)))"),
    .INIT(16'h0075))
    \bits_b[6]_syn_13  (
    .a(\bits_b[6]_syn_10 ),
    .b(\bits_b[6]_syn_12 ),
    .c(\bits_b[9]_syn_2 ),
    .d(char_id[6]),
    .o(bits_b[6]));
  AL_MAP_LUT4 #(
    .EQN("(C*A*~(D*B))"),
    .INIT(16'h20a0))
    \bits_b[6]_syn_3  (
    .a(\bits_b[6]_syn_2 ),
    .b(\bits_b[11]_syn_2 ),
    .c(char_id[4]),
    .d(ramread1_syn_152),
    .o(\bits_b[6]_syn_4 ));
  AL_MAP_LUT4 #(
    .EQN("(A*~(B)*~(C)*~(D)+A*B*~(C)*~(D)+A*~(B)*C*~(D)+A*B*C*~(D)+A*B*~(C)*D+~(A)*~(B)*C*D+~(A)*B*C*D+A*B*C*D)"),
    .INIT(16'hd8aa))
    \bits_b[6]_syn_5  (
    .a(char_id[2]),
    .b(ramread1_syn_166),
    .c(ramread1_syn_164),
    .d(char_id[3]),
    .o(\bits_b[6]_syn_6 ));
  AL_MAP_LUT4 #(
    .EQN("(~(A)*~(B)*~(C)*~(D)+~(A)*B*~(C)*~(D)+~(A)*~(B)*C*~(D)+A*~(B)*C*~(D)+~(A)*~(B)*~(C)*D+A*~(B)*~(C)*D+~(A)*B*~(C)*D+A*B*~(C)*D)"),
    .INIT(16'h0f35))
    \bits_b[6]_syn_7  (
    .a(ramread1_syn_160),
    .b(ramread1_syn_162),
    .c(\bits_b[6]_syn_6 ),
    .d(char_id[3]),
    .o(\bits_b[6]_syn_8 ));
  AL_MAP_LUT4 #(
    .EQN("(~(D*~B)*~(C*~A))"),
    .INIT(16'h8caf))
    \bits_b[6]_syn_9  (
    .a(\bits_b[6]_syn_4 ),
    .b(\bits_b[6]_syn_8 ),
    .c(\bits_b[7]_syn_2 ),
    .d(\bits_b[9]_syn_4 ),
    .o(\bits_b[6]_syn_10 ));
  AL_MAP_LUT5 #(
    .EQN("(~A*~(~B*~(E*D*C)))"),
    .INIT(32'h54444444))
    \bits_b[7]_syn_1  (
    .a(char_id[5]),
    .b(char_id[4]),
    .c(char_id[3]),
    .d(char_id[2]),
    .e(ramread1_syn_125),
    .o(\bits_b[7]_syn_2 ));
  AL_MAP_LUT4 #(
    .EQN("(A*~(B)*~(C)*~(D)+A*B*~(C)*~(D)+A*~(B)*C*~(D)+A*B*C*~(D)+A*B*~(C)*D+~(A)*~(B)*C*D+~(A)*B*C*D+A*B*C*D)"),
    .INIT(16'hd8aa))
    \bits_b[7]_syn_11  (
    .a(char_id[2]),
    .b(ramread1_syn_183),
    .c(ramread1_syn_181),
    .d(char_id[3]),
    .o(\bits_b[7]_syn_12 ));
  AL_MAP_LUT4 #(
    .EQN("(A*~(B)*~(C)*~(D)+A*B*~(C)*~(D)+~(A)*B*C*~(D)+A*B*C*~(D)+~(A)*~(B)*C*D+A*~(B)*C*D+~(A)*B*C*D+A*B*C*D)"),
    .INIT(16'hf0ca))
    \bits_b[7]_syn_13  (
    .a(ramread1_syn_177),
    .b(ramread1_syn_179),
    .c(\bits_b[7]_syn_12 ),
    .d(char_id[3]),
    .o(ramread1_syn_831));
  AL_MAP_LUT3 #(
    .EQN("(B*~(C*~A))"),
    .INIT(8'h8c))
    \bits_b[7]_syn_14  (
    .a(ramread1_syn_831),
    .b(\bits_b[7]_syn_2 ),
    .c(char_id[4]),
    .o(\bits_b[7]_syn_15 ));
  AL_MAP_LUT4 #(
    .EQN("(~C*~(~B*~(D*~A)))"),
    .INIT(16'h0d0c))
    \bits_b[7]_syn_16  (
    .a(\bits_b[7]_syn_10 ),
    .b(\bits_b[7]_syn_15 ),
    .c(char_id[6]),
    .d(char_id[5]),
    .o(bits_b[7]));
  AL_MAP_LUT4 #(
    .EQN("(A*~(B)*~(C)*~(D)+A*B*~(C)*~(D)+A*~(B)*C*~(D)+A*B*C*~(D)+A*B*~(C)*D+~(A)*~(B)*C*D+~(A)*B*C*D+A*B*C*D)"),
    .INIT(16'hd8aa))
    \bits_b[7]_syn_3  (
    .a(char_id[2]),
    .b(ramread1_syn_191),
    .c(ramread1_syn_189),
    .d(char_id[3]),
    .o(\bits_b[7]_syn_4 ));
  AL_MAP_LUT4 #(
    .EQN("(~(A)*~(B)*~(C)*~(D)+~(A)*B*~(C)*~(D)+~(A)*~(B)*C*~(D)+A*~(B)*C*~(D)+~(A)*~(B)*~(C)*D+A*~(B)*~(C)*D+~(A)*B*~(C)*D+A*B*~(C)*D)"),
    .INIT(16'h0f35))
    \bits_b[7]_syn_5  (
    .a(ramread1_syn_185),
    .b(ramread1_syn_187),
    .c(\bits_b[7]_syn_4 ),
    .d(char_id[3]),
    .o(\bits_b[7]_syn_6 ));
  AL_MAP_LUT4 #(
    .EQN("~(~A*~((D*~C))*~(B)+~A*(D*~C)*~(B)+~(~A)*(D*~C)*B+~A*(D*~C)*B)"),
    .INIT(16'he2ee))
    \bits_b[7]_syn_7  (
    .a(\bits_b[7]_syn_6 ),
    .b(char_id[4]),
    .c(char_id[2]),
    .d(ramread1_syn_197),
    .o(\bits_b[7]_syn_8 ));
  AL_MAP_LUT5 #(
    .EQN("~(~A*~((D*~(E)*~(C)+D*E*~(C)+~(D)*E*C+D*E*C))*~(B)+~A*(D*~(E)*~(C)+D*E*~(C)+~(D)*E*C+D*E*C)*~(B)+~(~A)*(D*~(E)*~(C)+D*E*~(C)+~(D)*E*C+D*E*C)*B+~A*(D*~(E)*~(C)+D*E*~(C)+~(D)*E*C+D*E*C)*B)"),
    .INIT(32'h222ee2ee))
    \bits_b[7]_syn_9  (
    .a(\bits_b[7]_syn_8 ),
    .b(\bits_b[8]_syn_2 ),
    .c(char_id[2]),
    .d(ramread1_syn_193),
    .e(ramread1_syn_195),
    .o(\bits_b[7]_syn_10 ));
  AL_MAP_LUT2 #(
    .EQN("(~B*A)"),
    .INIT(4'h2))
    \bits_b[8]_syn_1  (
    .a(char_id[4]),
    .b(char_id[3]),
    .o(\bits_b[8]_syn_2 ));
  AL_MAP_LUT4 #(
    .EQN("(A*~(B)*~(C)*~(D)+A*B*~(C)*~(D)+A*~(B)*C*~(D)+A*B*C*~(D)+A*B*~(C)*D+~(A)*~(B)*C*D+~(A)*B*C*D+A*B*C*D)"),
    .INIT(16'hd8aa))
    \bits_b[8]_syn_10  (
    .a(char_id[2]),
    .b(ramread1_syn_210),
    .c(ramread1_syn_208),
    .d(char_id[3]),
    .o(\bits_b[8]_syn_11 ));
  AL_MAP_LUT4 #(
    .EQN("(~(A)*~(B)*~(C)*~(D)+~(A)*B*~(C)*~(D)+~(A)*~(B)*C*~(D)+A*~(B)*C*~(D)+~(A)*~(B)*~(C)*D+A*~(B)*~(C)*D+~(A)*B*~(C)*D+A*B*~(C)*D)"),
    .INIT(16'h0f35))
    \bits_b[8]_syn_12  (
    .a(ramread1_syn_204),
    .b(ramread1_syn_206),
    .c(\bits_b[8]_syn_11 ),
    .d(char_id[3]),
    .o(\bits_b[8]_syn_13 ));
  AL_MAP_LUT4 #(
    .EQN("(B*(C*~(D)*~(A)+C*D*~(A)+~(C)*D*A+C*D*A))"),
    .INIT(16'hc840))
    \bits_b[8]_syn_14  (
    .a(char_id[3]),
    .b(char_id[2]),
    .c(ramread1_syn_200),
    .d(ramread1_syn_202),
    .o(ramread1_syn_882));
  AL_MAP_LUT3 #(
    .EQN("(~B*~(A)*~(C)+~B*A*~(C)+~(~B)*A*C+~B*A*C)"),
    .INIT(8'ha3))
    \bits_b[8]_syn_15  (
    .a(\bits_b[8]_syn_13 ),
    .b(ramread1_syn_882),
    .c(char_id[4]),
    .o(\bits_b[8]_syn_16 ));
  AL_MAP_LUT4 #(
    .EQN("(~C*(~B*~(A)*~(D)+~B*A*~(D)+~(~B)*A*D+~B*A*D))"),
    .INIT(16'h0a03))
    \bits_b[8]_syn_17  (
    .a(ramread1_syn_881),
    .b(\bits_b[8]_syn_16 ),
    .c(char_id[6]),
    .d(char_id[5]),
    .o(bits_b[8]));
  AL_MAP_LUT4 #(
    .EQN("(A*~(B)*~(C)*~(D)+A*B*~(C)*~(D)+A*~(B)*C*~(D)+A*B*C*~(D)+A*B*~(C)*D+~(A)*~(B)*C*D+~(A)*B*C*D+A*B*C*D)"),
    .INIT(16'hd8aa))
    \bits_b[8]_syn_3  (
    .a(char_id[2]),
    .b(ramread1_syn_218),
    .c(ramread1_syn_216),
    .d(char_id[3]),
    .o(\bits_b[8]_syn_4 ));
  AL_MAP_LUT4 #(
    .EQN("(~(A)*~(B)*~(C)*~(D)+~(A)*B*~(C)*~(D)+~(A)*~(B)*C*~(D)+A*~(B)*C*~(D)+~(A)*~(B)*~(C)*D+A*~(B)*~(C)*D+~(A)*B*~(C)*D+A*B*~(C)*D)"),
    .INIT(16'h0f35))
    \bits_b[8]_syn_5  (
    .a(ramread1_syn_212),
    .b(ramread1_syn_214),
    .c(\bits_b[8]_syn_4 ),
    .d(char_id[3]),
    .o(\bits_b[8]_syn_6 ));
  AL_MAP_LUT4 #(
    .EQN("~(~A*~((D*~C))*~(B)+~A*(D*~C)*~(B)+~(~A)*(D*~C)*B+~A*(D*~C)*B)"),
    .INIT(16'he2ee))
    \bits_b[8]_syn_7  (
    .a(\bits_b[8]_syn_6 ),
    .b(char_id[4]),
    .c(char_id[2]),
    .d(ramread1_syn_224),
    .o(\bits_b[8]_syn_8 ));
  AL_MAP_LUT5 #(
    .EQN("(~A*~((D*~(E)*~(C)+D*E*~(C)+~(D)*E*C+D*E*C))*~(B)+~A*(D*~(E)*~(C)+D*E*~(C)+~(D)*E*C+D*E*C)*~(B)+~(~A)*(D*~(E)*~(C)+D*E*~(C)+~(D)*E*C+D*E*C)*B+~A*(D*~(E)*~(C)+D*E*~(C)+~(D)*E*C+D*E*C)*B)"),
    .INIT(32'hddd11d11))
    \bits_b[8]_syn_9  (
    .a(\bits_b[8]_syn_8 ),
    .b(\bits_b[8]_syn_2 ),
    .c(char_id[2]),
    .d(ramread1_syn_220),
    .e(ramread1_syn_222),
    .o(ramread1_syn_881));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    \bits_b[9]_syn_1  (
    .a(char_id[5]),
    .b(char_id[4]),
    .o(\bits_b[9]_syn_2 ));
  AL_MAP_LUT4 #(
    .EQN("(A*~(B)*~(C)*~(D)+A*B*~(C)*~(D)+~(A)*B*C*~(D)+A*B*C*~(D)+~(A)*~(B)*C*D+A*~(B)*C*D+~(A)*B*C*D+A*B*C*D)"),
    .INIT(16'hf0ca))
    \bits_b[9]_syn_11  (
    .a(ramread1_syn_235),
    .b(ramread1_syn_237),
    .c(\bits_b[9]_syn_10 ),
    .d(char_id[3]),
    .o(ramread1_syn_933));
  AL_MAP_LUT4 #(
    .EQN("(~C*~(~A*~(B)*~(D)+~A*B*~(D)+~(~A)*B*D+~A*B*D))"),
    .INIT(16'h030a))
    \bits_b[9]_syn_12  (
    .a(\bits_b[9]_syn_8 ),
    .b(ramread1_syn_933),
    .c(char_id[5]),
    .d(char_id[4]),
    .o(\bits_b[9]_syn_13 ));
  AL_MAP_LUT3 #(
    .EQN("~(B*~(C)*~(A)+B*C*~(A)+~(B)*C*A+B*C*A)"),
    .INIT(8'h1b))
    \bits_b[9]_syn_14  (
    .a(char_id[2]),
    .b(ramread1_syn_251),
    .c(ramread1_syn_253),
    .o(\bits_b[9]_syn_15 ));
  AL_MAP_LUT5 #(
    .EQN("(B*~(~A*~((E*~D))*~(C)+~A*(E*~D)*~(C)+~(~A)*(E*~D)*C+~A*(E*~D)*C))"),
    .INIT(32'hc808c8c8))
    \bits_b[9]_syn_16  (
    .a(\bits_b[9]_syn_15 ),
    .b(\bits_b[9]_syn_2 ),
    .c(char_id[3]),
    .d(char_id[2]),
    .e(ramread1_syn_255),
    .o(\bits_b[9]_syn_17 ));
  AL_MAP_LUT4 #(
    .EQN("(A*~(B)*~(C)*~(D)+A*B*~(C)*~(D)+A*~(B)*C*~(D)+A*B*C*~(D)+A*B*~(C)*D+~(A)*~(B)*C*D+~(A)*B*C*D+A*B*C*D)"),
    .INIT(16'hd8aa))
    \bits_b[9]_syn_18  (
    .a(char_id[2]),
    .b(ramread1_syn_249),
    .c(ramread1_syn_247),
    .d(char_id[3]),
    .o(\bits_b[9]_syn_19 ));
  AL_MAP_LUT4 #(
    .EQN("(A*~(B)*~(C)*~(D)+A*B*~(C)*~(D)+~(A)*B*C*~(D)+A*B*C*~(D)+~(A)*~(B)*C*D+A*~(B)*C*D+~(A)*B*C*D+A*B*C*D)"),
    .INIT(16'hf0ca))
    \bits_b[9]_syn_20  (
    .a(ramread1_syn_243),
    .b(ramread1_syn_245),
    .c(\bits_b[9]_syn_19 ),
    .d(char_id[3]),
    .o(ramread1_syn_934));
  AL_MAP_LUT5 #(
    .EQN("(~E*~B*~A*~(D*~C))"),
    .INIT(32'h00001011))
    \bits_b[9]_syn_21  (
    .a(\bits_b[9]_syn_13 ),
    .b(\bits_b[9]_syn_17 ),
    .c(ramread1_syn_934),
    .d(\bits_b[9]_syn_4 ),
    .e(char_id[6]),
    .o(bits_b[9]));
  AL_MAP_LUT2 #(
    .EQN("(~B*A)"),
    .INIT(4'h2))
    \bits_b[9]_syn_3  (
    .a(char_id[5]),
    .b(char_id[4]),
    .o(\bits_b[9]_syn_4 ));
  AL_MAP_LUT4 #(
    .EQN("(A*~(B)*~(C)*~(D)+A*B*~(C)*~(D)+A*~(B)*C*~(D)+A*B*C*~(D)+A*B*~(C)*D+~(A)*~(B)*C*D+~(A)*B*C*D+A*B*C*D)"),
    .INIT(16'hd8aa))
    \bits_b[9]_syn_5  (
    .a(char_id[2]),
    .b(ramread1_syn_233),
    .c(ramread1_syn_231),
    .d(char_id[3]),
    .o(\bits_b[9]_syn_6 ));
  AL_MAP_LUT4 #(
    .EQN("(~(A)*~(B)*~(C)*~(D)+~(A)*B*~(C)*~(D)+~(A)*~(B)*C*~(D)+A*~(B)*C*~(D)+~(A)*~(B)*~(C)*D+A*~(B)*~(C)*D+~(A)*B*~(C)*D+A*B*~(C)*D)"),
    .INIT(16'h0f35))
    \bits_b[9]_syn_7  (
    .a(ramread1_syn_227),
    .b(ramread1_syn_229),
    .c(\bits_b[9]_syn_6 ),
    .d(char_id[3]),
    .o(\bits_b[9]_syn_8 ));
  AL_MAP_LUT4 #(
    .EQN("(A*~(B)*~(C)*~(D)+A*B*~(C)*~(D)+A*~(B)*C*~(D)+A*B*C*~(D)+A*B*~(C)*D+~(A)*~(B)*C*D+~(A)*B*C*D+A*B*C*D)"),
    .INIT(16'hd8aa))
    \bits_b[9]_syn_9  (
    .a(char_id[2]),
    .b(ramread1_syn_241),
    .c(ramread1_syn_239),
    .d(char_id[3]),
    .o(\bits_b[9]_syn_10 ));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \bits_reg[0]  (
    .clk(clk_dup_1),
    .d(mux70_syn_18),
    .sr(rst_dup_1),
    .q(bits[0]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \bits_reg[10]  (
    .clk(clk_dup_1),
    .d(bits_b[10]),
    .sr(rst_dup_1),
    .q(bits[10]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \bits_reg[11]  (
    .clk(clk_dup_1),
    .d(bits_b[11]),
    .sr(rst_dup_1),
    .q(bits[11]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \bits_reg[12]  (
    .clk(clk_dup_1),
    .d(bits_b[12]),
    .sr(rst_dup_1),
    .q(bits[12]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \bits_reg[13]  (
    .clk(clk_dup_1),
    .d(bits_b[13]),
    .sr(rst_dup_1),
    .q(bits[13]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \bits_reg[14]  (
    .clk(clk_dup_1),
    .d(bits_b[14]),
    .sr(rst_dup_1),
    .q(bits[14]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \bits_reg[15]  (
    .clk(clk_dup_1),
    .d(bits_b[15]),
    .sr(rst_dup_1),
    .q(bits[15]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \bits_reg[1]  (
    .clk(clk_dup_1),
    .d(bits_b[1]),
    .sr(rst_dup_1),
    .q(bits[1]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \bits_reg[2]  (
    .clk(clk_dup_1),
    .d(bits_b[2]),
    .sr(rst_dup_1),
    .q(bits[2]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \bits_reg[3]  (
    .clk(clk_dup_1),
    .d(bits_b[3]),
    .sr(rst_dup_1),
    .q(bits[3]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \bits_reg[4]  (
    .clk(clk_dup_1),
    .d(bits_b[4]),
    .sr(rst_dup_1),
    .q(bits[4]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \bits_reg[5]  (
    .clk(clk_dup_1),
    .d(bits_b[5]),
    .sr(rst_dup_1),
    .q(bits[5]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \bits_reg[6]  (
    .clk(clk_dup_1),
    .d(bits_b[6]),
    .sr(rst_dup_1),
    .q(bits[6]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \bits_reg[7]  (
    .clk(clk_dup_1),
    .d(bits_b[7]),
    .sr(rst_dup_1),
    .q(bits[7]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \bits_reg[8]  (
    .clk(clk_dup_1),
    .d(bits_b[8]),
    .sr(rst_dup_1),
    .q(bits[8]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \bits_reg[9]  (
    .clk(clk_dup_1),
    .d(bits_b[9]),
    .sr(rst_dup_1),
    .q(bits[9]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    \brightness[0]_syn_6  (
    .ipad(brightness[0]),
    .di(\brightness[0]_dup_5 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    \brightness[1]_syn_6  (
    .ipad(brightness[1]),
    .di(\brightness[1]_dup_5 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    \brightness[2]_syn_6  (
    .ipad(brightness[2]),
    .di(\brightness[2]_dup_5 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    \brightness[3]_syn_6  (
    .ipad(brightness[3]),
    .di(\brightness[3]_dup_5 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    \brightness[4]_syn_10  (
    .ipad(brightness[4]),
    .di(\brightness[4]_dup_9 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    \brightness[5]_syn_10  (
    .ipad(brightness[5]),
    .di(\brightness[5]_dup_9 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    \brightness[6]_syn_12  (
    .ipad(brightness[6]),
    .di(\brightness[6]_dup_11 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    \brightness[7]_syn_32  (
    .ipad(brightness[7]),
    .di(\brightness[7]_dup_31 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    clk_syn_2 (
    .ipad(clk),
    .di(clk_dup_1));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(3)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \col1_reg[0]  (
    .clk(clk_dup_1),
    .d(\gx[0]_syn_2 ),
    .sr(rst_dup_1),
    .q(col1[0]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \col1_reg[1]  (
    .clk(clk_dup_1),
    .d(\gx[1]_syn_2 ),
    .sr(rst_dup_1),
    .q(col1[1]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \col1_reg[2]  (
    .clk(clk_dup_1),
    .d(\gx[2]_syn_2 ),
    .sr(rst_dup_1),
    .q(col1[2]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \col1_reg[3]  (
    .clk(clk_dup_1),
    .d(\gx[3]_syn_2 ),
    .sr(rst_dup_1),
    .q(col1[3]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \col2_reg[0]  (
    .clk(clk_dup_1),
    .d(col1[0]),
    .sr(rst_dup_1),
    .q(col2[0]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \col2_reg[1]  (
    .clk(clk_dup_1),
    .d(col1[1]),
    .sr(rst_dup_1),
    .q(col2[1]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \col2_reg[2]  (
    .clk(clk_dup_1),
    .d(col1[2]),
    .sr(rst_dup_1),
    .q(col2[2]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \col2_reg[3]  (
    .clk(clk_dup_1),
    .d(col1[3]),
    .sr(rst_dup_1),
    .q(col2[3]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  EG_PHY_CONFIG #(
    .DONE_PERSISTN("ENABLE"),
    .INIT_PERSISTN("ENABLE"),
    .JTAG_PERSISTN("DISABLE"),
    .PROGRAMN_PERSISTN("DISABLE"))
    config_inst ();
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    \contrast[0]_syn_4  (
    .ipad(contrast[0]),
    .di(\contrast[0]_dup_3 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    \contrast[1]_syn_4  (
    .ipad(contrast[1]),
    .di(\contrast[1]_dup_3 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    \contrast[2]_syn_4  (
    .ipad(contrast[2]),
    .di(\contrast[2]_dup_3 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    \contrast[3]_syn_4  (
    .ipad(contrast[3]),
    .di(\contrast[3]_dup_3 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    \contrast[4]_syn_6  (
    .ipad(contrast[4]),
    .di(\contrast[4]_dup_5 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    \contrast[5]_syn_6  (
    .ipad(contrast[5]),
    .di(\contrast[5]_dup_5 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    \contrast[6]_syn_8  (
    .ipad(contrast[6]),
    .di(\contrast[6]_dup_7 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    \contrast[7]_syn_22  (
    .ipad(contrast[7]),
    .di(\contrast[7]_dup_21 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
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
    .SRMODE("ASYNC"),
    .TSMUX("0"))
    de_out_syn_4 (
    .do({open_n565,open_n566,open_n567,deq[0]}),
    .osclk(clk_dup_1),
    .rst(rst_dup_1),
    .opad(de_out));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)
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
    .SRMODE("ASYNC"),
    .TSMUX("1"))
    de_syn_4 (
    .ipad(de),
    .ipclk(clk_dup_1),
    .rst(rst_dup_1),
    .di(de_dup_3),
    .diq({open_n588,open_n589,open_n590,deq[0]}));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(3)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \deq_reg[1]  (
    .clk(clk_dup_1),
    .d(deq[0]),
    .sr(rst_dup_1),
    .q(de_out_dup_3));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_LUT1 #(
    .EQN("(~A)"),
    .INIT(2'h1))
    eq5_syn_20 (
    .a(footer_left[3]),
    .o(eq5_syn_19));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1096)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \fg1_reg[11]  (
    .clk(clk_dup_1),
    .d(mux64_syn_16),
    .sr(rst_dup_1),
    .q(fg1[11]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \fg1_reg[12]  (
    .clk(clk_dup_1),
    .d(mux64_syn_18),
    .sr(rst_dup_1),
    .q(fg1[12]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \fg1_reg[13]  (
    .clk(clk_dup_1),
    .d(mux55_syn_68),
    .sr(rst_dup_1),
    .q(fg1[13]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \fg1_reg[14]  (
    .clk(clk_dup_1),
    .d(mux64_syn_10),
    .sr(rst_dup_1),
    .q(fg1[14]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \fg1_reg[15]  (
    .clk(clk_dup_1),
    .d(1'b1),
    .sr(rst_dup_1),
    .q(fg1[15]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \fg1_reg[19]  (
    .clk(clk_dup_1),
    .d(mux64_syn_8),
    .sr(rst_dup_1),
    .q(fg1[19]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \fg1_reg[1]  (
    .clk(clk_dup_1),
    .d(mux64_syn_4),
    .sr(rst_dup_1),
    .q(fg1[1]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \fg1_reg[20]  (
    .clk(clk_dup_1),
    .d(mux64_syn_14),
    .sr(rst_dup_1),
    .q(fg1[20]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \fg1_reg[23]  (
    .clk(clk_dup_1),
    .d(mux64_syn_6),
    .sr(rst_dup_1),
    .q(fg1[23]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \fg2_reg[11]  (
    .clk(clk_dup_1),
    .d(fg1[11]),
    .sr(rst_dup_1),
    .q(fg2[11]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \fg2_reg[12]  (
    .clk(clk_dup_1),
    .d(fg1[12]),
    .sr(rst_dup_1),
    .q(fg2[12]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \fg2_reg[13]  (
    .clk(clk_dup_1),
    .d(fg1[13]),
    .sr(rst_dup_1),
    .q(fg2[13]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \fg2_reg[14]  (
    .clk(clk_dup_1),
    .d(fg1[14]),
    .sr(rst_dup_1),
    .q(fg2[14]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \fg2_reg[15]  (
    .clk(clk_dup_1),
    .d(fg1[15]),
    .sr(rst_dup_1),
    .q(fg2[15]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \fg2_reg[19]  (
    .clk(clk_dup_1),
    .d(fg1[19]),
    .sr(rst_dup_1),
    .q(fg2[19]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \fg2_reg[1]  (
    .clk(clk_dup_1),
    .d(fg1[1]),
    .sr(rst_dup_1),
    .q(fg2[1]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \fg2_reg[20]  (
    .clk(clk_dup_1),
    .d(fg1[20]),
    .sr(rst_dup_1),
    .q(fg2[20]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \fg2_reg[23]  (
    .clk(clk_dup_1),
    .d(fg1[23]),
    .sr(rst_dup_1),
    .q(fg2[23]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    \field[0]_syn_2  (
    .ipad(field[0]),
    .di(\field[0]_dup_1 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(3)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    \field[1]_syn_2  (
    .ipad(field[1]),
    .di(\field[1]_dup_1 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(3)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    \field[2]_syn_2  (
    .ipad(field[2]),
    .di(\field[2]_dup_1 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(3)
  AL_MAP_LUT5 #(
    .EQN("~(C*(D*~((E*B))*~(A)+D*(E*B)*~(A)+~(D)*(E*B)*A+D*(E*B)*A))"),
    .INIT(32'h2f7fafff))
    \gx[0]_syn_5  (
    .a(\gx[2]_syn_48 ),
    .b(\gx[2]_syn_46 ),
    .c(\gx[2]_syn_17 ),
    .d(x[0]),
    .e(x[1]),
    .o(\gx[0]_syn_2 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT5 #(
    .EQN("~(C*(D*~((E*B))*~(A)+D*(E*B)*~(A)+~(D)*(E*B)*A+D*(E*B)*A))"),
    .INIT(32'h2f7fafff))
    \gx[1]_syn_5  (
    .a(\gx[2]_syn_48 ),
    .b(\gx[2]_syn_46 ),
    .c(\gx[2]_syn_17 ),
    .d(x[1]),
    .e(x[2]),
    .o(\gx[1]_syn_2 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT2 #(
    .EQN("(~B*~A)"),
    .INIT(4'h1))
    \gx[2]_syn_11  (
    .a(y[8]),
    .b(y[9]),
    .o(bar_b10_n1));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT4 #(
    .EQN("(~D*C*B*A)"),
    .INIT(16'h0080))
    \gx[2]_syn_12  (
    .a(panel_n2),
    .b(panel_n4),
    .c(\mode[1]_dup_1 ),
    .d(\mode[0]_dup_1 ),
    .o(\gx[2]_syn_13 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT3 #(
    .EQN("(~C*~B*~A)"),
    .INIT(8'h01))
    \gx[2]_syn_14  (
    .a(x[6]),
    .b(x[7]),
    .c(x[8]),
    .o(\gx[2]_syn_15 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT3 #(
    .EQN("(A*~(C@B))"),
    .INIT(8'h82))
    \gx[2]_syn_16  (
    .a(\gx[2]_syn_13 ),
    .b(\gx[2]_syn_15 ),
    .c(x[9]),
    .o(\gx[2]_syn_17 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT4 #(
    .EQN("(D*C*B*A)"),
    .INIT(16'h8000))
    \gx[2]_syn_18  (
    .a(direct_n19),
    .b(direct_n20),
    .c(direct_n12),
    .d(direct_n6),
    .o(\gx[2]_syn_19 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT4 #(
    .EQN("(~D*C*B*A)"),
    .INIT(16'h0080))
    \gx[2]_syn_20  (
    .a(direct_n29),
    .b(direct_n30),
    .c(direct_n10),
    .d(sub4_syn_3[7]),
    .o(\gx[2]_syn_21 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT2 #(
    .EQN("(~B*~A)"),
    .INIT(4'h1))
    \gx[2]_syn_22  (
    .a(\gx[2]_syn_19 ),
    .b(\gx[2]_syn_21 ),
    .o(\gx[2]_syn_23 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT3 #(
    .EQN("(~C*~(B*A))"),
    .INIT(8'h07))
    \gx[2]_syn_24  (
    .a(y[5]),
    .b(y[6]),
    .c(y[7]),
    .o(lt38_syn_28));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT4 #(
    .EQN("(~D*B*~(C*~A))"),
    .INIT(16'h008c))
    \gx[2]_syn_25  (
    .a(lt38_syn_28),
    .b(bar_b_n1),
    .c(y[8]),
    .d(y[9]),
    .o(\gx[2]_syn_26 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT3 #(
    .EQN("~(C@(~B*~A))"),
    .INIT(8'h1e))
    \gx[2]_syn_27  (
    .a(y[2]),
    .b(y[3]),
    .c(y[4]),
    .o(\gx[2]_syn_28 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT5 #(
    .EQN("(B@(~(A)*~(C)*D*~(E)+A*~(C)*D*~(E)+A*C*D*~(E)+~(A)*~(C)*~(D)*E+A*~(C)*~(D)*E+~(A)*~(C)*D*E+A*~(C)*D*E+A*C*D*E))"),
    .INIT(32'h63c363cc))
    \gx[2]_syn_29  (
    .a(\gx[2]_syn_10 ),
    .b(\gx[2]_syn_28 ),
    .c(bar_b10_n1),
    .d(bar_b9_n),
    .e(bar_b10_n),
    .o(\gx[2]_syn_30 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT3 #(
    .EQN("(A*~(C*B))"),
    .INIT(8'h2a))
    \gx[2]_syn_31  (
    .a(direct_n44),
    .b(x[9]),
    .c(x[5]),
    .o(\gx[2]_syn_32 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT3 #(
    .EQN("(C*~B*~A)"),
    .INIT(8'h10))
    \gx[2]_syn_33  (
    .a(\bg_b12[5]_syn_2 ),
    .b(\gx[2]_syn_30 ),
    .c(\gx[2]_syn_32 ),
    .o(\gx[2]_syn_34 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT5 #(
    .EQN("(~(A)*B*~(C)*~(D)*~(E)+A*B*~(C)*~(D)*~(E)+~(A)*~(B)*C*~(D)*~(E)+A*~(B)*C*~(D)*~(E)+A*B*C*~(D)*~(E)+~(A)*B*~(C)*D*~(E)+A*B*~(C)*D*~(E)+~(A)*~(B)*C*D*~(E)+A*~(B)*C*D*~(E)+A*B*C*D*~(E)+~(A)*~(B)*~(C)*~(D)*E+A*~(B)*~(C)*~(D)*E+~(A)*~(B)*C*~(D)*E+A*~(B)*C*~(D)*E+~(A)*B*C*~(D)*E+A*B*C*~(D)*E+~(A)*~(B)*C*D*E+A*~(B)*C*D*E+~(A)*B*C*D*E+A*B*C*D*E)"),
    .INIT(32'hf0f3bcbc))
    \gx[2]_syn_35  (
    .a(\gx[2]_syn_10 ),
    .b(bar_b10_n1),
    .c(bar_b9_n),
    .d(bar_b10_n),
    .e(y[4]),
    .o(\gx[2]_syn_36 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT5 #(
    .EQN("(~D*C*~A*~(E@B))"),
    .INIT(32'h00400010))
    \gx[2]_syn_37  (
    .a(\gx[2]_syn_30 ),
    .b(\gx[2]_syn_36 ),
    .c(direct_n47),
    .d(sub0_syn_3[7]),
    .e(y[5]),
    .o(\gx[2]_syn_38 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT3 #(
    .EQN("(~C*~B*A)"),
    .INIT(8'h02))
    \gx[2]_syn_39  (
    .a(y[6]),
    .b(y[8]),
    .c(y[9]),
    .o(\gx[2]_syn_40 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT4 #(
    .EQN("(~D*~(C*B*A))"),
    .INIT(16'h007f))
    \gx[2]_syn_41  (
    .a(x[5]),
    .b(x[6]),
    .c(x[7]),
    .d(x[8]),
    .o(\gx[2]_syn_42 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT4 #(
    .EQN("(D*C*~(~B*~A))"),
    .INIT(16'he000))
    \gx[2]_syn_43  (
    .a(x[5]),
    .b(x[6]),
    .c(x[7]),
    .d(x[8]),
    .o(\gx[2]_syn_44 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT4 #(
    .EQN("(D*~C*~B*A)"),
    .INIT(16'h0200))
    \gx[2]_syn_45  (
    .a(\gx[2]_syn_40 ),
    .b(\gx[2]_syn_42 ),
    .c(\gx[2]_syn_44 ),
    .d(lt38_syn_28),
    .o(\gx[2]_syn_46 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT4 #(
    .EQN("(C*~(D*~(~B*~A)))"),
    .INIT(16'h10f0))
    \gx[2]_syn_47  (
    .a(\gx[2]_syn_34 ),
    .b(\gx[2]_syn_38 ),
    .c(\gx[2]_syn_23 ),
    .d(\gx[2]_syn_26 ),
    .o(\gx[2]_syn_48 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT5 #(
    .EQN("~(C*(D*~((E*B))*~(A)+D*(E*B)*~(A)+~(D)*(E*B)*A+D*(E*B)*A))"),
    .INIT(32'h2f7fafff))
    \gx[2]_syn_49  (
    .a(\gx[2]_syn_48 ),
    .b(\gx[2]_syn_46 ),
    .c(\gx[2]_syn_17 ),
    .d(x[2]),
    .e(x[3]),
    .o(\gx[2]_syn_2 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT5 #(
    .EQN("(~E*~D*~(C*~(~B*~A)))"),
    .INIT(32'h0000001f))
    \gx[2]_syn_5  (
    .a(y[5]),
    .b(y[6]),
    .c(y[7]),
    .d(y[8]),
    .e(y[9]),
    .o(bar_b5_n));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT4 #(
    .EQN("(~(A)*~(B)*~((~D*~C))+A*~(B)*~((~D*~C))+A*B*~((~D*~C))+~(A)*B*(~D*~C)+A*B*(~D*~C))"),
    .INIT(16'hbbbc))
    \gx[2]_syn_6  (
    .a(bar_b10_n),
    .b(y[4]),
    .c(y[8]),
    .d(y[9]),
    .o(\gx[2]_syn_7 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT4 #(
    .EQN("(D@(~(A)*~(B)*~(C)+A*~(B)*~(C)+~(A)*~(B)*C+~(A)*B*C+A*B*C))"),
    .INIT(16'h2cd3))
    \gx[2]_syn_8  (
    .a(bar_b5_n),
    .b(\gx[2]_syn_7 ),
    .c(bar_b9_n),
    .d(y[5]),
    .o(\bg_b12[5]_syn_2 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT3 #(
    .EQN("(C*~(~B*~A))"),
    .INIT(8'he0))
    \gx[2]_syn_9  (
    .a(y[5]),
    .b(y[6]),
    .c(y[7]),
    .o(\gx[2]_syn_10 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT5 #(
    .EQN("(~E*~(D*~B*~(~C*~A)))"),
    .INIT(32'h0000cdff))
    \gx[3]_syn_11  (
    .a(\gy[2]_syn_4 ),
    .b(\gx[3]_syn_6 ),
    .c(\gx[3]_syn_8 ),
    .d(\gy[3]_syn_5 ),
    .e(\gx[3]_syn_10 ),
    .o(\gx[3]_syn_2 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT4 #(
    .EQN("(C*(A*~(B)*~(D)+A*B*~(D)+~(A)*B*D))"),
    .INIT(16'h40a0))
    \gx[3]_syn_5  (
    .a(\gx[2]_syn_34 ),
    .b(\gx[2]_syn_38 ),
    .c(\gx[2]_syn_26 ),
    .d(x[3]),
    .o(\gx[3]_syn_6 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    \gx[3]_syn_7  (
    .a(\gx[2]_syn_46 ),
    .b(x[4]),
    .o(\gx[3]_syn_8 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT5 #(
    .EQN("(A*((~E*C)*~(D)*~(B)+(~E*C)*D*~(B)+~((~E*C))*D*B+(~E*C)*D*B))"),
    .INIT(32'h8800a820))
    \gx[3]_syn_9  (
    .a(\gx[2]_syn_17 ),
    .b(\gx[2]_syn_19 ),
    .c(\gx[2]_syn_21 ),
    .d(sub7_syn_4[0]),
    .e(x[3]),
    .o(\gx[3]_syn_10 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT5 #(
    .EQN("(C*(D*~((E*B))*~(A)+D*(E*B)*~(A)+~(D)*(E*B)*A+D*(E*B)*A))"),
    .INIT(32'hd0805000))
    \gy[0]_syn_3  (
    .a(\gx[2]_syn_48 ),
    .b(\gx[2]_syn_46 ),
    .c(\gx[2]_syn_17 ),
    .d(y[0]),
    .e(y[1]),
    .o(\gy[0]_syn_2 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT5 #(
    .EQN("(C*(D*~((E*B))*~(A)+D*(E*B)*~(A)+~(D)*(E*B)*A+D*(E*B)*A))"),
    .INIT(32'hd0805000))
    \gy[1]_syn_3  (
    .a(\gx[2]_syn_48 ),
    .b(\gx[2]_syn_46 ),
    .c(\gx[2]_syn_17 ),
    .d(y[1]),
    .e(y[2]),
    .o(\gy[1]_syn_2 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT3 #(
    .EQN("(C*~(~B*~A))"),
    .INIT(8'he0))
    \gy[2]_syn_3  (
    .a(\gx[2]_syn_34 ),
    .b(\gx[2]_syn_38 ),
    .c(\gx[2]_syn_26 ),
    .o(\gy[2]_syn_4 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    \gy[2]_syn_5  (
    .a(\gx[2]_syn_46 ),
    .b(y[3]),
    .o(\gy[2]_syn_6 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT5 #(
    .EQN("(D*(A*~(B)*C*~(E)+~(A)*B*C*~(E)+A*B*C*~(E)+~(A)*~(B)*~(C)*E+A*~(B)*~(C)*E+~(A)*B*~(C)*E+A*B*~(C)*E+~(A)*B*C*E))"),
    .INIT(32'h4f00e000))
    \gy[2]_syn_7  (
    .a(\gy[2]_syn_4 ),
    .b(\gy[2]_syn_6 ),
    .c(\gx[2]_syn_23 ),
    .d(\gx[2]_syn_17 ),
    .e(y[2]),
    .o(\gy[2]_syn_2 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT2 #(
    .EQN("~(B@A)"),
    .INIT(4'h9))
    \gy[3]_syn_10  (
    .a(y[2]),
    .b(y[3]),
    .o(sub1_syn_4[1]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT5 #(
    .EQN("~(~B*~(D*(C*~(E)*~(A)+C*E*~(A)+~(C)*E*A+C*E*A)))"),
    .INIT(32'hfeccdccc))
    \gy[3]_syn_11  (
    .a(\gy[2]_syn_4 ),
    .b(\gy[3]_syn_7 ),
    .c(\gy[3]_syn_9 ),
    .d(\gy[3]_syn_5 ),
    .e(sub1_syn_4[1]),
    .o(\gy[3]_syn_2 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT2 #(
    .EQN("~(B*~A)"),
    .INIT(4'hb))
    \gy[3]_syn_3  (
    .a(\gx[2]_syn_23 ),
    .b(\gx[2]_syn_17 ),
    .o(mux55_syn_68));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    \gy[3]_syn_4  (
    .a(\gx[2]_syn_23 ),
    .b(\gx[2]_syn_17 ),
    .o(\gy[3]_syn_5 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT2 #(
    .EQN("(~B*~A)"),
    .INIT(4'h1))
    \gy[3]_syn_6  (
    .a(mux55_syn_68),
    .b(y[3]),
    .o(\gy[3]_syn_7 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    \gy[3]_syn_8  (
    .a(\gx[2]_syn_46 ),
    .b(y[4]),
    .o(\gy[3]_syn_9 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  EG_PHY_MSLICE #(
    //.MACRO("lt0_syn_30"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt0_syn_30 (
    .a({y[3],1'b0}),
    .b({1'b1,open_n663}),
    .fco(lt0_syn_6));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(22)
  EG_PHY_MSLICE #(
    //.MACRO("lt0_syn_30"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt0_syn_33 (
    .a(y[5:4]),
    .b(2'b11),
    .fci(lt0_syn_6),
    .fco(lt0_syn_10));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(22)
  EG_PHY_MSLICE #(
    //.MACRO("lt0_syn_30"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt0_syn_36 (
    .a(y[7:6]),
    .b(2'b10),
    .fci(lt0_syn_10),
    .fco(lt0_syn_14));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(22)
  EG_PHY_MSLICE #(
    //.MACRO("lt0_syn_30"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt0_syn_39 (
    .a(y[9:8]),
    .b(2'b01),
    .fci(lt0_syn_14),
    .fco(lt0_syn_18));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(22)
  EG_PHY_MSLICE #(
    //.MACRO("lt0_syn_30"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt0_syn_41 (
    .a({open_n761,1'b0}),
    .b({open_n762,1'b1}),
    .fci(lt0_syn_18),
    .f({open_n781,panel_n2}));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(22)
  EG_PHY_MSLICE #(
    //.MACRO("lt10_syn_26"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt10_syn_26 (
    .a({y[0],1'b0}),
    .b({1'b1,open_n787}),
    .fco(lt10_syn_5));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1124)
  EG_PHY_MSLICE #(
    //.MACRO("lt10_syn_26"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt10_syn_29 (
    .a(y[2:1]),
    .b(2'b11),
    .fci(lt10_syn_5),
    .fco(lt10_syn_9));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1124)
  EG_PHY_MSLICE #(
    //.MACRO("lt10_syn_26"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt10_syn_32 (
    .a({bg_b12[4],y[3]}),
    .b(2'b10),
    .fci(lt10_syn_9),
    .fco(lt10_syn_13));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1124)
  EG_PHY_MSLICE #(
    //.MACRO("lt10_syn_26"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt10_syn_35 (
    .a({1'b0,\bg_b12[5]_syn_2 }),
    .b(2'b10),
    .fci(lt10_syn_13),
    .f({bg_b4_n2,open_n879}));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1124)
  EG_PHY_MSLICE #(
    //.MACRO("lt11_syn_42"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt11_syn_42 (
    .a({x[0],1'b0}),
    .b({1'b0,open_n885}),
    .fco(lt11_syn_6));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1125)
  EG_PHY_MSLICE #(
    //.MACRO("lt11_syn_42"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt11_syn_45 (
    .a(x[2:1]),
    .b(2'b00),
    .fci(lt11_syn_6),
    .fco(lt11_syn_10));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1125)
  EG_PHY_MSLICE #(
    //.MACRO("lt11_syn_42"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt11_syn_48 (
    .a(x[4:3]),
    .b(sel6_syn_2[4:3]),
    .fci(lt11_syn_10),
    .fco(lt11_syn_14));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1125)
  EG_PHY_MSLICE #(
    //.MACRO("lt11_syn_42"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt11_syn_51 (
    .a(x[6:5]),
    .b(sel6_syn_2[6:5]),
    .fci(lt11_syn_14),
    .fco(lt11_syn_18));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1125)
  EG_PHY_MSLICE #(
    //.MACRO("lt11_syn_42"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt11_syn_54 (
    .a({\x[8]_syn_2 ,x[7]}),
    .b({1'b0,sel6_syn_2[7]}),
    .fci(lt11_syn_18),
    .fco(lt11_syn_22));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1125)
  EG_PHY_MSLICE #(
    //.MACRO("lt11_syn_42"),
    //.R_POSITION("X0Y2Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt11_syn_57 (
    .a(sub2_syn_3[2:1]),
    .b(2'b00),
    .fci(lt11_syn_22),
    .fco(lt11_syn_26));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1125)
  EG_PHY_MSLICE #(
    //.MACRO("lt11_syn_42"),
    //.R_POSITION("X0Y3Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt11_syn_59 (
    .a({open_n1031,1'b0}),
    .b({open_n1032,1'b1}),
    .fci(lt11_syn_26),
    .f({open_n1051,bg_b7_n}));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1125)
  EG_PHY_MSLICE #(
    //.MACRO("lt12_syn_27"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt12_syn_27 (
    .a(2'b11),
    .b({x[4],open_n1057}),
    .fco(lt12_syn_6));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1126)
  EG_PHY_MSLICE #(
    //.MACRO("lt12_syn_27"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt12_syn_30 (
    .a(2'b10),
    .b(x[6:5]),
    .fci(lt12_syn_6),
    .fco(lt12_syn_10));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1126)
  EG_PHY_MSLICE #(
    //.MACRO("lt12_syn_27"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt12_syn_33 (
    .a(2'b11),
    .b(x[8:7]),
    .fci(lt12_syn_10),
    .fco(lt12_syn_14));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1126)
  EG_PHY_MSLICE #(
    //.MACRO("lt12_syn_27"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt12_syn_36 (
    .a(2'b00),
    .b({1'b1,x[9]}),
    .fci(lt12_syn_14),
    .f({direct_n44,open_n1149}));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1126)
  EG_PHY_MSLICE #(
    //.MACRO("lt14_syn_36"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt14_syn_36 (
    .a({x[1],1'b0}),
    .b({1'b1,open_n1155}),
    .fco(lt14_syn_6));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1099)
  EG_PHY_MSLICE #(
    //.MACRO("lt14_syn_36"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt14_syn_39 (
    .a(x[3:2]),
    .b(2'b00),
    .fci(lt14_syn_6),
    .fco(lt14_syn_10));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1099)
  EG_PHY_MSLICE #(
    //.MACRO("lt14_syn_36"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt14_syn_42 (
    .a(x[5:4]),
    .b(2'b00),
    .fci(lt14_syn_10),
    .fco(lt14_syn_14));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1099)
  EG_PHY_MSLICE #(
    //.MACRO("lt14_syn_36"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt14_syn_45 (
    .a(x[7:6]),
    .b(2'b01),
    .fci(lt14_syn_14),
    .fco(lt14_syn_18));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1099)
  EG_PHY_MSLICE #(
    //.MACRO("lt14_syn_36"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt14_syn_48 (
    .a(x[9:8]),
    .b(2'b00),
    .fci(lt14_syn_18),
    .fco(lt14_syn_22));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1099)
  EG_PHY_MSLICE #(
    //.MACRO("lt14_syn_36"),
    //.R_POSITION("X0Y2Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt14_syn_50 (
    .a({open_n1277,1'b0}),
    .b({open_n1278,1'b1}),
    .fci(lt14_syn_22),
    .f({open_n1297,bg_b3_n8}));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1099)
  EG_PHY_MSLICE #(
    //.MACRO("lt15_syn_36"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt15_syn_36 (
    .a(2'b11),
    .b({x[1],open_n1303}),
    .fco(lt15_syn_6));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1099)
  EG_PHY_MSLICE #(
    //.MACRO("lt15_syn_36"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt15_syn_39 (
    .a(2'b11),
    .b(x[3:2]),
    .fci(lt15_syn_6),
    .fco(lt15_syn_10));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1099)
  EG_PHY_MSLICE #(
    //.MACRO("lt15_syn_36"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt15_syn_42 (
    .a(2'b11),
    .b(x[5:4]),
    .fci(lt15_syn_10),
    .fco(lt15_syn_14));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1099)
  EG_PHY_MSLICE #(
    //.MACRO("lt15_syn_36"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt15_syn_45 (
    .a(2'b00),
    .b(x[7:6]),
    .fci(lt15_syn_14),
    .fco(lt15_syn_18));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1099)
  EG_PHY_MSLICE #(
    //.MACRO("lt15_syn_36"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt15_syn_48 (
    .a(2'b10),
    .b(x[9:8]),
    .fci(lt15_syn_18),
    .fco(lt15_syn_22));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1099)
  EG_PHY_MSLICE #(
    //.MACRO("lt15_syn_36"),
    //.R_POSITION("X0Y2Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt15_syn_50 (
    .a({open_n1425,1'b0}),
    .b({open_n1426,1'b1}),
    .fci(lt15_syn_22),
    .f({open_n1445,bg_b3_n9}));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1099)
  EG_PHY_MSLICE #(
    //.MACRO("lt18_syn_36"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt18_syn_36 (
    .a({y[1],1'b0}),
    .b({1'b1,open_n1451}),
    .fco(lt18_syn_6));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1099)
  EG_PHY_MSLICE #(
    //.MACRO("lt18_syn_36"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt18_syn_39 (
    .a(y[3:2]),
    .b(2'b10),
    .fci(lt18_syn_6),
    .fco(lt18_syn_10));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1099)
  EG_PHY_MSLICE #(
    //.MACRO("lt18_syn_36"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt18_syn_42 (
    .a(y[5:4]),
    .b(2'b10),
    .fci(lt18_syn_10),
    .fco(lt18_syn_14));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1099)
  EG_PHY_MSLICE #(
    //.MACRO("lt18_syn_36"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt18_syn_45 (
    .a(y[7:6]),
    .b(2'b00),
    .fci(lt18_syn_14),
    .fco(lt18_syn_18));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1099)
  EG_PHY_MSLICE #(
    //.MACRO("lt18_syn_36"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt18_syn_48 (
    .a(y[9:8]),
    .b(2'b00),
    .fci(lt18_syn_18),
    .fco(lt18_syn_22));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1099)
  EG_PHY_MSLICE #(
    //.MACRO("lt18_syn_36"),
    //.R_POSITION("X0Y2Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt18_syn_50 (
    .a({open_n1573,1'b0}),
    .b({open_n1574,1'b1}),
    .fci(lt18_syn_22),
    .f({open_n1593,bg_b3_n6}));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1099)
  EG_PHY_MSLICE #(
    //.MACRO("lt19_syn_36"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt19_syn_36 (
    .a(2'b11),
    .b({y[1],open_n1599}),
    .fco(lt19_syn_6));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1099)
  EG_PHY_MSLICE #(
    //.MACRO("lt19_syn_36"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt19_syn_39 (
    .a(2'b01),
    .b(y[3:2]),
    .fci(lt19_syn_6),
    .fco(lt19_syn_10));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1099)
  EG_PHY_MSLICE #(
    //.MACRO("lt19_syn_36"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt19_syn_42 (
    .a(2'b11),
    .b(y[5:4]),
    .fci(lt19_syn_10),
    .fco(lt19_syn_14));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1099)
  EG_PHY_MSLICE #(
    //.MACRO("lt19_syn_36"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt19_syn_45 (
    .a(2'b10),
    .b(y[7:6]),
    .fci(lt19_syn_14),
    .fco(lt19_syn_18));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1099)
  EG_PHY_MSLICE #(
    //.MACRO("lt19_syn_36"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt19_syn_48 (
    .a(2'b01),
    .b(y[9:8]),
    .fci(lt19_syn_18),
    .fco(lt19_syn_22));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1099)
  EG_PHY_MSLICE #(
    //.MACRO("lt19_syn_36"),
    //.R_POSITION("X0Y2Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt19_syn_50 (
    .a({open_n1721,1'b0}),
    .b({open_n1722,1'b1}),
    .fci(lt19_syn_22),
    .f({open_n1741,bg_b3_n3}));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1099)
  EG_PHY_MSLICE #(
    //.MACRO("lt1_syn_33"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt1_syn_33 (
    .a({x[2],1'b0}),
    .b({1'b1,open_n1747}),
    .fco(lt1_syn_6));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1112)
  EG_PHY_MSLICE #(
    //.MACRO("lt1_syn_33"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt1_syn_36 (
    .a(x[4:3]),
    .b(2'b11),
    .fci(lt1_syn_6),
    .fco(lt1_syn_10));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1112)
  EG_PHY_MSLICE #(
    //.MACRO("lt1_syn_33"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt1_syn_39 (
    .a(x[6:5]),
    .b(2'b10),
    .fci(lt1_syn_10),
    .fco(lt1_syn_14));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1112)
  EG_PHY_MSLICE #(
    //.MACRO("lt1_syn_33"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt1_syn_42 (
    .a(x[8:7]),
    .b(2'b00),
    .fci(lt1_syn_14),
    .fco(lt1_syn_18));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1112)
  EG_PHY_MSLICE #(
    //.MACRO("lt1_syn_33"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt1_syn_45 (
    .a({1'b0,x[9]}),
    .b(2'b10),
    .fci(lt1_syn_18),
    .f({bg_b8_n1,open_n1863}));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1112)
  EG_PHY_MSLICE #(
    //.MACRO("lt21_syn_32"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt21_syn_32 (
    .a({\contrast[0]_dup_3 ,1'b1}),
    .b({1'b0,open_n1869}),
    .fco(lt21_syn_5));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1135)
  EG_PHY_MSLICE #(
    //.MACRO("lt21_syn_32"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt21_syn_35 (
    .a({\contrast[2]_dup_3 ,\contrast[1]_dup_3 }),
    .b(2'b00),
    .fci(lt21_syn_5),
    .fco(lt21_syn_9));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1135)
  EG_PHY_MSLICE #(
    //.MACRO("lt21_syn_32"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt21_syn_38 (
    .a({\contrast[4]_dup_5 ,\contrast[3]_dup_3 }),
    .b(2'b00),
    .fci(lt21_syn_9),
    .fco(lt21_syn_13));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1135)
  EG_PHY_MSLICE #(
    //.MACRO("lt21_syn_32"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt21_syn_41 (
    .a({\contrast[6]_dup_7 ,\contrast[5]_dup_5 }),
    .b(2'b10),
    .fci(lt21_syn_13),
    .fco(lt21_syn_17));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1135)
  EG_PHY_MSLICE #(
    //.MACRO("lt21_syn_32"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt21_syn_44 (
    .a({1'b0,\contrast[7]_dup_21 }),
    .b(2'b11),
    .fci(lt21_syn_17),
    .f({text_addr_b30_n,open_n1985}));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1135)
  EG_PHY_MSLICE #(
    //.MACRO("lt22_syn_33"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt22_syn_33 (
    .a(2'b11),
    .b({y[2],open_n1991}),
    .fco(lt22_syn_6));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1100)
  EG_PHY_MSLICE #(
    //.MACRO("lt22_syn_33"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt22_syn_36 (
    .a(2'b00),
    .b(y[4:3]),
    .fci(lt22_syn_6),
    .fco(lt22_syn_10));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1100)
  EG_PHY_MSLICE #(
    //.MACRO("lt22_syn_33"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt22_syn_39 (
    .a(2'b11),
    .b(y[6:5]),
    .fci(lt22_syn_10),
    .fco(lt22_syn_14));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1100)
  EG_PHY_MSLICE #(
    //.MACRO("lt22_syn_33"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt22_syn_42 (
    .a(2'b00),
    .b(y[8:7]),
    .fci(lt22_syn_14),
    .fco(lt22_syn_18));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1100)
  EG_PHY_MSLICE #(
    //.MACRO("lt22_syn_33"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt22_syn_45 (
    .a(2'b00),
    .b({1'b1,y[9]}),
    .fci(lt22_syn_18),
    .f({bg_b3_n10,open_n2107}));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1100)
  EG_PHY_MSLICE #(
    //.MACRO("lt23_syn_36"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt23_syn_36 (
    .a({y[1],1'b0}),
    .b({1'b1,open_n2113}),
    .fco(lt23_syn_6));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1100)
  EG_PHY_MSLICE #(
    //.MACRO("lt23_syn_36"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt23_syn_39 (
    .a(y[3:2]),
    .b(2'b01),
    .fci(lt23_syn_6),
    .fco(lt23_syn_10));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1100)
  EG_PHY_MSLICE #(
    //.MACRO("lt23_syn_36"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt23_syn_42 (
    .a(y[5:4]),
    .b(2'b10),
    .fci(lt23_syn_10),
    .fco(lt23_syn_14));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1100)
  EG_PHY_MSLICE #(
    //.MACRO("lt23_syn_36"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt23_syn_45 (
    .a(y[7:6]),
    .b(2'b01),
    .fci(lt23_syn_14),
    .fco(lt23_syn_18));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1100)
  EG_PHY_MSLICE #(
    //.MACRO("lt23_syn_36"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt23_syn_48 (
    .a(y[9:8]),
    .b(2'b00),
    .fci(lt23_syn_18),
    .fco(lt23_syn_22));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1100)
  EG_PHY_MSLICE #(
    //.MACRO("lt23_syn_36"),
    //.R_POSITION("X0Y2Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt23_syn_50 (
    .a({open_n2235,1'b0}),
    .b({open_n2236,1'b1}),
    .fci(lt23_syn_22),
    .f({open_n2255,bg_b3_n11}));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1100)
  EG_PHY_MSLICE #(
    //.MACRO("lt24_syn_30"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt24_syn_30 (
    .a(2'b11),
    .b({x[3],open_n2261}),
    .fco(lt24_syn_6));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1100)
  EG_PHY_MSLICE #(
    //.MACRO("lt24_syn_30"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt24_syn_33 (
    .a(2'b01),
    .b(x[5:4]),
    .fci(lt24_syn_6),
    .fco(lt24_syn_10));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1100)
  EG_PHY_MSLICE #(
    //.MACRO("lt24_syn_30"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt24_syn_36 (
    .a(2'b01),
    .b(x[7:6]),
    .fci(lt24_syn_10),
    .fco(lt24_syn_14));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1100)
  EG_PHY_MSLICE #(
    //.MACRO("lt24_syn_30"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt24_syn_39 (
    .a(2'b00),
    .b(x[9:8]),
    .fci(lt24_syn_14),
    .fco(lt24_syn_18));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1100)
  EG_PHY_MSLICE #(
    //.MACRO("lt24_syn_30"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt24_syn_41 (
    .a({open_n2359,1'b0}),
    .b({open_n2360,1'b1}),
    .fci(lt24_syn_18),
    .f({open_n2379,bg_b1_n4}));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1100)
  EG_PHY_MSLICE #(
    //.MACRO("lt25_syn_30"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt25_syn_30 (
    .a(2'b11),
    .b({y[3],open_n2385}),
    .fco(lt25_syn_6));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1146)
  EG_PHY_MSLICE #(
    //.MACRO("lt25_syn_30"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt25_syn_33 (
    .a(2'b10),
    .b(y[5:4]),
    .fci(lt25_syn_6),
    .fco(lt25_syn_10));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1146)
  EG_PHY_MSLICE #(
    //.MACRO("lt25_syn_30"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt25_syn_36 (
    .a(2'b01),
    .b(y[7:6]),
    .fci(lt25_syn_10),
    .fco(lt25_syn_14));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1146)
  EG_PHY_MSLICE #(
    //.MACRO("lt25_syn_30"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt25_syn_39 (
    .a(2'b01),
    .b(y[9:8]),
    .fci(lt25_syn_14),
    .fco(lt25_syn_18));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1146)
  EG_PHY_MSLICE #(
    //.MACRO("lt25_syn_30"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt25_syn_41 (
    .a({open_n2483,1'b0}),
    .b({open_n2484,1'b1}),
    .fci(lt25_syn_18),
    .f({open_n2503,bg_b1_n5}));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1146)
  EG_PHY_MSLICE #(
    //.MACRO("lt26_syn_36"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt26_syn_36 (
    .a({y[1],1'b0}),
    .b({1'b1,open_n2509}),
    .fco(lt26_syn_6));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1146)
  EG_PHY_MSLICE #(
    //.MACRO("lt26_syn_36"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt26_syn_39 (
    .a(y[3:2]),
    .b(2'b10),
    .fci(lt26_syn_6),
    .fco(lt26_syn_10));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1146)
  EG_PHY_MSLICE #(
    //.MACRO("lt26_syn_36"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt26_syn_42 (
    .a(y[5:4]),
    .b(2'b10),
    .fci(lt26_syn_10),
    .fco(lt26_syn_14));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1146)
  EG_PHY_MSLICE #(
    //.MACRO("lt26_syn_36"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt26_syn_45 (
    .a(y[7:6]),
    .b(2'b01),
    .fci(lt26_syn_14),
    .fco(lt26_syn_18));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1146)
  EG_PHY_MSLICE #(
    //.MACRO("lt26_syn_36"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt26_syn_48 (
    .a(y[9:8]),
    .b(2'b01),
    .fci(lt26_syn_18),
    .fco(lt26_syn_22));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1146)
  EG_PHY_MSLICE #(
    //.MACRO("lt26_syn_36"),
    //.R_POSITION("X0Y2Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt26_syn_50 (
    .a({open_n2631,1'b0}),
    .b({open_n2632,1'b1}),
    .fci(lt26_syn_22),
    .f({open_n2651,bg_b1_n6}));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1146)
  EG_PHY_MSLICE #(
    //.MACRO("lt27_syn_30"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt27_syn_30 (
    .a({x[3],1'b0}),
    .b({1'b1,open_n2657}),
    .fco(lt27_syn_6));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1100)
  EG_PHY_MSLICE #(
    //.MACRO("lt27_syn_30"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt27_syn_33 (
    .a(x[5:4]),
    .b(2'b10),
    .fci(lt27_syn_6),
    .fco(lt27_syn_10));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1100)
  EG_PHY_MSLICE #(
    //.MACRO("lt27_syn_30"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt27_syn_36 (
    .a(x[7:6]),
    .b(2'b00),
    .fci(lt27_syn_10),
    .fco(lt27_syn_14));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1100)
  EG_PHY_MSLICE #(
    //.MACRO("lt27_syn_30"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt27_syn_39 (
    .a(x[9:8]),
    .b(2'b10),
    .fci(lt27_syn_14),
    .fco(lt27_syn_18));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1100)
  EG_PHY_MSLICE #(
    //.MACRO("lt27_syn_30"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt27_syn_41 (
    .a({open_n2755,1'b0}),
    .b({open_n2756,1'b1}),
    .fci(lt27_syn_18),
    .f({open_n2775,bg_b1_n2}));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1100)
  EG_PHY_MSLICE #(
    //.MACRO("lt28_syn_30"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt28_syn_30 (
    .a(2'b11),
    .b({y[3],open_n2781}),
    .fco(lt28_syn_6));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1147)
  EG_PHY_MSLICE #(
    //.MACRO("lt28_syn_30"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt28_syn_33 (
    .a(2'b11),
    .b(y[5:4]),
    .fci(lt28_syn_6),
    .fco(lt28_syn_10));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1147)
  EG_PHY_MSLICE #(
    //.MACRO("lt28_syn_30"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt28_syn_36 (
    .a(2'b01),
    .b(y[7:6]),
    .fci(lt28_syn_10),
    .fco(lt28_syn_14));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1147)
  EG_PHY_MSLICE #(
    //.MACRO("lt28_syn_30"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt28_syn_39 (
    .a(2'b01),
    .b(y[9:8]),
    .fci(lt28_syn_14),
    .fco(lt28_syn_18));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1147)
  EG_PHY_MSLICE #(
    //.MACRO("lt28_syn_30"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt28_syn_41 (
    .a({open_n2879,1'b0}),
    .b({open_n2880,1'b1}),
    .fci(lt28_syn_18),
    .f({open_n2899,direct_n29}));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1147)
  EG_PHY_MSLICE #(
    //.MACRO("lt29_syn_30"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt29_syn_30 (
    .a({y[3],1'b0}),
    .b({1'b1,open_n2905}),
    .fco(lt29_syn_6));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1147)
  EG_PHY_MSLICE #(
    //.MACRO("lt29_syn_30"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt29_syn_33 (
    .a(y[5:4]),
    .b(2'b00),
    .fci(lt29_syn_6),
    .fco(lt29_syn_10));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1147)
  EG_PHY_MSLICE #(
    //.MACRO("lt29_syn_30"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt29_syn_36 (
    .a(y[7:6]),
    .b(2'b10),
    .fci(lt29_syn_10),
    .fco(lt29_syn_14));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1147)
  EG_PHY_MSLICE #(
    //.MACRO("lt29_syn_30"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt29_syn_39 (
    .a(y[9:8]),
    .b(2'b01),
    .fci(lt29_syn_14),
    .fco(lt29_syn_18));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1147)
  EG_PHY_MSLICE #(
    //.MACRO("lt29_syn_30"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt29_syn_41 (
    .a({open_n3003,1'b0}),
    .b({open_n3004,1'b1}),
    .fci(lt29_syn_18),
    .f({open_n3023,direct_n30}));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1147)
  EG_PHY_MSLICE #(
    //.MACRO("lt31_syn_30"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt31_syn_30 (
    .a({x[3],1'b0}),
    .b({1'b1,open_n3029}),
    .fco(lt31_syn_6));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1147)
  EG_PHY_MSLICE #(
    //.MACRO("lt31_syn_30"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt31_syn_33 (
    .a(x[5:4]),
    .b(2'b00),
    .fci(lt31_syn_6),
    .fco(lt31_syn_10));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1147)
  EG_PHY_MSLICE #(
    //.MACRO("lt31_syn_30"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt31_syn_36 (
    .a(x[7:6]),
    .b(2'b11),
    .fci(lt31_syn_10),
    .fco(lt31_syn_14));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1147)
  EG_PHY_MSLICE #(
    //.MACRO("lt31_syn_30"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt31_syn_39 (
    .a(x[9:8]),
    .b(2'b01),
    .fci(lt31_syn_14),
    .fco(lt31_syn_18));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1147)
  EG_PHY_MSLICE #(
    //.MACRO("lt31_syn_30"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt31_syn_41 (
    .a({open_n3127,1'b0}),
    .b({open_n3128,1'b1}),
    .fci(lt31_syn_18),
    .f({open_n3147,direct_n10}));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1147)
  EG_PHY_MSLICE #(
    //.MACRO("lt32_syn_30"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt32_syn_30 (
    .a(2'b11),
    .b({y[3],open_n3153}),
    .fco(lt32_syn_6));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1150)
  EG_PHY_MSLICE #(
    //.MACRO("lt32_syn_30"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt32_syn_33 (
    .a(2'b01),
    .b(y[5:4]),
    .fci(lt32_syn_6),
    .fco(lt32_syn_10));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1150)
  EG_PHY_MSLICE #(
    //.MACRO("lt32_syn_30"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt32_syn_36 (
    .a(2'b10),
    .b(y[7:6]),
    .fci(lt32_syn_10),
    .fco(lt32_syn_14));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1150)
  EG_PHY_MSLICE #(
    //.MACRO("lt32_syn_30"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt32_syn_39 (
    .a(2'b01),
    .b(y[9:8]),
    .fci(lt32_syn_14),
    .fco(lt32_syn_18));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1150)
  EG_PHY_MSLICE #(
    //.MACRO("lt32_syn_30"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt32_syn_41 (
    .a({open_n3251,1'b0}),
    .b({open_n3252,1'b1}),
    .fci(lt32_syn_18),
    .f({open_n3271,direct_n19}));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1150)
  EG_PHY_MSLICE #(
    //.MACRO("lt33_syn_30"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt33_syn_30 (
    .a({y[3],1'b0}),
    .b({1'b1,open_n3277}),
    .fco(lt33_syn_6));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1150)
  EG_PHY_MSLICE #(
    //.MACRO("lt33_syn_30"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt33_syn_33 (
    .a(y[5:4]),
    .b(2'b10),
    .fci(lt33_syn_6),
    .fco(lt33_syn_10));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1150)
  EG_PHY_MSLICE #(
    //.MACRO("lt33_syn_30"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt33_syn_36 (
    .a(y[7:6]),
    .b(2'b10),
    .fci(lt33_syn_10),
    .fco(lt33_syn_14));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1150)
  EG_PHY_MSLICE #(
    //.MACRO("lt33_syn_30"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt33_syn_39 (
    .a(y[9:8]),
    .b(2'b01),
    .fci(lt33_syn_14),
    .fco(lt33_syn_18));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1150)
  EG_PHY_MSLICE #(
    //.MACRO("lt33_syn_30"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt33_syn_41 (
    .a({open_n3375,1'b0}),
    .b({open_n3376,1'b1}),
    .fci(lt33_syn_18),
    .f({open_n3395,direct_n20}));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1150)
  EG_PHY_MSLICE #(
    //.MACRO("lt34_syn_38"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt34_syn_38 (
    .a(2'b01),
    .b({x[0],open_n3401}),
    .fco(lt34_syn_5));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1150)
  EG_PHY_MSLICE #(
    //.MACRO("lt34_syn_38"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt34_syn_41 (
    .a(2'b00),
    .b(x[2:1]),
    .fci(lt34_syn_5),
    .fco(lt34_syn_9));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1150)
  EG_PHY_MSLICE #(
    //.MACRO("lt34_syn_38"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt34_syn_44 (
    .a({1'b1,footer_left[3]}),
    .b(x[4:3]),
    .fci(lt34_syn_9),
    .fco(lt34_syn_13));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1150)
  EG_PHY_MSLICE #(
    //.MACRO("lt34_syn_38"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt34_syn_47 (
    .a({footer_left[3],eq5_syn_19}),
    .b(x[6:5]),
    .fci(lt34_syn_13),
    .fco(lt34_syn_17));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1150)
  EG_PHY_MSLICE #(
    //.MACRO("lt34_syn_38"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt34_syn_50 (
    .a(2'b01),
    .b(x[8:7]),
    .fci(lt34_syn_17),
    .fco(lt34_syn_21));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1150)
  EG_PHY_MSLICE #(
    //.MACRO("lt34_syn_38"),
    //.R_POSITION("X0Y2Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt34_syn_53 (
    .a(2'b00),
    .b({1'b1,x[9]}),
    .fci(lt34_syn_21),
    .f({direct_n12,open_n3541}));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1150)
  EG_PHY_MSLICE #(
    //.MACRO("lt36_syn_39"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt36_syn_39 (
    .a({x[0],1'b0}),
    .b({1'b0,open_n3547}),
    .fco(lt36_syn_6));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1150)
  EG_PHY_MSLICE #(
    //.MACRO("lt36_syn_39"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt36_syn_42 (
    .a(x[2:1]),
    .b(2'b00),
    .fci(lt36_syn_6),
    .fco(lt36_syn_10));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1150)
  EG_PHY_MSLICE #(
    //.MACRO("lt36_syn_39"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt36_syn_45 (
    .a(x[4:3]),
    .b({eq5_syn_19,footer_left[3]}),
    .fci(lt36_syn_10),
    .fco(lt36_syn_14));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1150)
  EG_PHY_MSLICE #(
    //.MACRO("lt36_syn_39"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt36_syn_48 (
    .a(x[6:5]),
    .b({eq5_syn_19,footer_left[3]}),
    .fci(lt36_syn_14),
    .fco(lt36_syn_18));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1150)
  EG_PHY_MSLICE #(
    //.MACRO("lt36_syn_39"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt36_syn_51 (
    .a(x[8:7]),
    .b(2'b11),
    .fci(lt36_syn_18),
    .fco(lt36_syn_22));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1150)
  EG_PHY_MSLICE #(
    //.MACRO("lt36_syn_39"),
    //.R_POSITION("X0Y2Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt36_syn_54 (
    .a({1'b0,x[9]}),
    .b(2'b10),
    .fci(lt36_syn_22),
    .f({direct_n6,open_n3687}));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1150)
  EG_PHY_MSLICE #(
    //.MACRO("lt3_syn_30"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt3_syn_30 (
    .a({x[3],1'b0}),
    .b({1'b1,open_n3693}),
    .fco(lt3_syn_6));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1114)
  EG_PHY_MSLICE #(
    //.MACRO("lt3_syn_30"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt3_syn_33 (
    .a(x[5:4]),
    .b(2'b10),
    .fci(lt3_syn_6),
    .fco(lt3_syn_10));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1114)
  EG_PHY_MSLICE #(
    //.MACRO("lt3_syn_30"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt3_syn_36 (
    .a(x[7:6]),
    .b(2'b11),
    .fci(lt3_syn_10),
    .fco(lt3_syn_14));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1114)
  EG_PHY_MSLICE #(
    //.MACRO("lt3_syn_30"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt3_syn_39 (
    .a(x[9:8]),
    .b(2'b00),
    .fci(lt3_syn_14),
    .fco(lt3_syn_18));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1114)
  EG_PHY_MSLICE #(
    //.MACRO("lt3_syn_30"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt3_syn_41 (
    .a({open_n3791,1'b0}),
    .b({open_n3792,1'b1}),
    .fci(lt3_syn_18),
    .f({open_n3811,direct_n47}));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1114)
  EG_PHY_MSLICE #(
    //.MACRO("lt41_syn_27"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt41_syn_27 (
    .a(2'b11),
    .b({y[4],open_n3817}),
    .fco(lt41_syn_6));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1104)
  EG_PHY_MSLICE #(
    //.MACRO("lt41_syn_27"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt41_syn_30 (
    .a(2'b11),
    .b(y[6:5]),
    .fci(lt41_syn_6),
    .fco(lt41_syn_10));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1104)
  EG_PHY_MSLICE #(
    //.MACRO("lt41_syn_27"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt41_syn_33 (
    .a(2'b00),
    .b(y[8:7]),
    .fci(lt41_syn_10),
    .fco(lt41_syn_14));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1104)
  EG_PHY_MSLICE #(
    //.MACRO("lt41_syn_27"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt41_syn_36 (
    .a(2'b00),
    .b({1'b1,y[9]}),
    .fci(lt41_syn_14),
    .f({bar_b_n1,open_n3909}));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1104)
  EG_PHY_MSLICE #(
    //.MACRO("lt45_syn_27"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt45_syn_27 (
    .a({y[4],1'b0}),
    .b({1'b1,open_n3915}),
    .fco(lt45_syn_6));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1106)
  EG_PHY_MSLICE #(
    //.MACRO("lt45_syn_27"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt45_syn_30 (
    .a(y[6:5]),
    .b(2'b10),
    .fci(lt45_syn_6),
    .fco(lt45_syn_10));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1106)
  EG_PHY_MSLICE #(
    //.MACRO("lt45_syn_27"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt45_syn_33 (
    .a(y[8:7]),
    .b(2'b01),
    .fci(lt45_syn_10),
    .fco(lt45_syn_14));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1106)
  EG_PHY_MSLICE #(
    //.MACRO("lt45_syn_27"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt45_syn_36 (
    .a({1'b0,y[9]}),
    .b(2'b10),
    .fci(lt45_syn_14),
    .f({bar_b9_n,open_n4007}));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1106)
  EG_PHY_MSLICE #(
    //.MACRO("lt47_syn_27"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt47_syn_27 (
    .a({y[4],1'b0}),
    .b({1'b1,open_n4013}),
    .fco(lt47_syn_6));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1108)
  EG_PHY_MSLICE #(
    //.MACRO("lt47_syn_27"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt47_syn_30 (
    .a(y[6:5]),
    .b(2'b01),
    .fci(lt47_syn_6),
    .fco(lt47_syn_10));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1108)
  EG_PHY_MSLICE #(
    //.MACRO("lt47_syn_27"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt47_syn_33 (
    .a(y[8:7]),
    .b(2'b10),
    .fci(lt47_syn_10),
    .fco(lt47_syn_14));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1108)
  EG_PHY_MSLICE #(
    //.MACRO("lt47_syn_27"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt47_syn_36 (
    .a({1'b0,y[9]}),
    .b(2'b10),
    .fci(lt47_syn_14),
    .f({bar_b10_n,open_n4105}));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1108)
  EG_PHY_MSLICE #(
    //.MACRO("lt48_syn_30"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt48_syn_30 (
    .a(2'b11),
    .b({y[3],open_n4111}),
    .fco(lt48_syn_6));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(22)
  EG_PHY_MSLICE #(
    //.MACRO("lt48_syn_30"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt48_syn_33 (
    .a(2'b10),
    .b(y[5:4]),
    .fci(lt48_syn_6),
    .fco(lt48_syn_10));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(22)
  EG_PHY_MSLICE #(
    //.MACRO("lt48_syn_30"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt48_syn_36 (
    .a(2'b00),
    .b(y[7:6]),
    .fci(lt48_syn_10),
    .fco(lt48_syn_14));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(22)
  EG_PHY_MSLICE #(
    //.MACRO("lt48_syn_30"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt48_syn_39 (
    .a(2'b00),
    .b(y[9:8]),
    .fci(lt48_syn_14),
    .fco(lt48_syn_18));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(22)
  EG_PHY_MSLICE #(
    //.MACRO("lt48_syn_30"),
    //.R_POSITION("X0Y2Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt48_syn_41 (
    .a({open_n4209,1'b0}),
    .b({open_n4210,1'b1}),
    .fci(lt48_syn_18),
    .f({open_n4229,panel_n4}));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(22)
  EG_PHY_MSLICE #(
    //.MACRO("lt9_syn_26"),
    //.R_POSITION("X0Y0Z0"),
    .ALUTYPE("A_LE_B_CARRY"),
    .INIT_LUT0(16'b0000000000001010),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt9_syn_26 (
    .a(2'b11),
    .b({y[0],open_n4235}),
    .fco(lt9_syn_5));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1124)
  EG_PHY_MSLICE #(
    //.MACRO("lt9_syn_26"),
    //.R_POSITION("X0Y0Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt9_syn_29 (
    .a(2'b10),
    .b(y[2:1]),
    .fci(lt9_syn_5),
    .fco(lt9_syn_9));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1124)
  EG_PHY_MSLICE #(
    //.MACRO("lt9_syn_26"),
    //.R_POSITION("X0Y1Z0"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt9_syn_32 (
    .a(2'b01),
    .b({bg_b12[4],y[3]}),
    .fci(lt9_syn_9),
    .fco(lt9_syn_13));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1124)
  EG_PHY_MSLICE #(
    //.MACRO("lt9_syn_26"),
    //.R_POSITION("X0Y1Z1"),
    .ALUTYPE("A_LE_B"),
    .INIT_LUT0(16'b1001100110011100),
    .INIT_LUT1(16'b1001100110011100),
    .MODE("RIPPLE"))
    lt9_syn_35 (
    .a(2'b00),
    .b({1'b1,\bg_b12[5]_syn_2 }),
    .fci(lt9_syn_13),
    .f({bg_b4_n4,open_n4327}));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1124)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    \mode[0]_syn_2  (
    .ipad(mode[0]),
    .di(\mode[0]_dup_1 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(3)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    \mode[1]_syn_2  (
    .ipad(mode[1]),
    .di(\mode[1]_dup_1 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(3)
  AL_MAP_LUT3 #(
    .EQN("~(~C*B*A)"),
    .INIT(8'hf7))
    mux64_syn_24 (
    .a(\gx[2]_syn_34 ),
    .b(\text_addr[6]_syn_31 ),
    .c(bar_b10_n),
    .o(mux64_syn_18));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1097)
  AL_MAP_LUT3 #(
    .EQN("(~A*~(~C*B))"),
    .INIT(8'h51))
    mux64_syn_25 (
    .a(mux64_syn_18),
    .b(audio_available_dup_1),
    .c(audio_busy_dup_1),
    .o(mux64_syn_14));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1097)
  AL_MAP_LUT3 #(
    .EQN("~(~C*B*~A)"),
    .INIT(8'hfb))
    mux64_syn_26 (
    .a(mux64_syn_18),
    .b(audio_available_dup_1),
    .c(audio_busy_dup_1),
    .o(mux64_syn_6));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1097)
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    mux64_syn_27 (
    .a(mux64_syn_18),
    .b(mux55_syn_68),
    .o(mux64_syn_4));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1097)
  AL_MAP_LUT4 #(
    .EQN("~(B*~(~A*~(~D*C)))"),
    .INIT(16'h7737))
    mux64_syn_28 (
    .a(mux64_syn_18),
    .b(mux55_syn_68),
    .c(audio_available_dup_1),
    .d(audio_busy_dup_1),
    .o(mux64_syn_16));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1097)
  AL_MAP_LUT4 #(
    .EQN("(B*~(~D*C*~A))"),
    .INIT(16'hcc8c))
    mux64_syn_29 (
    .a(mux64_syn_18),
    .b(mux55_syn_68),
    .c(audio_available_dup_1),
    .d(audio_busy_dup_1),
    .o(mux64_syn_8));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1097)
  AL_MAP_LUT1 #(
    .EQN("(~A)"),
    .INIT(2'h1))
    mux64_syn_30 (
    .a(mux64_syn_14),
    .o(mux64_syn_10));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1097)
  AL_MAP_LUT3 #(
    .EQN("~(C*~(B*~A))"),
    .INIT(8'h4f))
    mux68_syn_87 (
    .a(de_dup_3),
    .b(deq[0]),
    .c(vs_dup_3),
    .o(mux68_syn_2[9]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1158)
  AL_MAP_LUT4 #(
    .EQN("(D*C*~B*~A)"),
    .INIT(16'h1000))
    mux70_syn_95 (
    .a(char_id[6]),
    .b(char_id[1]),
    .c(row1[1]),
    .d(row1[2]),
    .o(mux70_syn_96));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*A)"),
    .INIT(16'h0002))
    mux70_syn_97 (
    .a(char_id[3]),
    .b(char_id[2]),
    .c(char_id[0]),
    .d(row1[0]),
    .o(mux70_syn_98));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT4 #(
    .EQN("(~D*C*B*A)"),
    .INIT(16'h0080))
    mux70_syn_99 (
    .a(mux70_syn_96),
    .b(mux70_syn_98),
    .c(\bits_b[9]_syn_2 ),
    .d(row1[3]),
    .o(mux70_syn_18));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  // address_offset=0;data_offset=0;depth=1024;width=7;num_section=1;width_per_section=7;section_size=7;working_depth=1024;working_width=9;working_numbyte=1;mode_ecc=0;address_step=1;bytes_in_per_section=1;
  // ramread0_syn_4_1024x7
  EG_PHY_BRAM #(
    .CEAMUX("1"),
    .CEBMUX("0"),
    .CSA0("1"),
    .CSA1("1"),
    .CSA2("1"),
    .CSB0("1"),
    .CSB1("1"),
    .CSB2("1"),
    .DATA_WIDTH_A("9"),
    .DATA_WIDTH_B("9"),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h00000000000000000000000000000000000000000000000000002E2F25192D2C),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000001F13),
    .INIT_02(256'h00000000000000000000000000000000000000000000000000000000001F281C),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000003439),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000037362331),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000023333930),
    .INIT_06(256'h000000000000000000000000000000000000000000000000000000000024231A),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000122423),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000291A11),
    .INIT_09(256'h00000000000000000000000000000017323C223500003A0F103C050E0C0D222A),
    .INIT_0A(256'h00000000000000000000000000001E163C223500000000181B3C030E0C0D222A),
    .INIT_0B(256'h0000000000000000000000000000000000000039301D2123333C030E0C0D222A),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000003938),
    .INIT_0D(256'h000000000000000000000000000000000000000000000000000000000000002B),
    .INIT_0E(256'h000000000000000000000000000000000000000000000000000000000000000B),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000014),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000001527),
    .INIT_11(256'h000000000000000000000000000000000000000000000000000000000000003B),
    .INIT_12(256'h000000000000000000000000000000000000000000000000000000000000201B),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000003B26),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .MODE("SP8K"),
    .OCEAMUX("1"),
    .OCEBMUX("0"),
    .REGMODE_A("NOREG"),
    .REGMODE_B("NOREG"),
    .RESETMODE("ASYNC"),
    .RSTBMUX("0"),
    .WEAMUX("0"),
    .WEBMUX("0"),
    .WRITEMODE_A("NORMAL"),
    .WRITEMODE_B("NORMAL"))
    ramread0_syn_5 (
    .addra({text_addr[9],\text_addr[8]_syn_2 ,\text_addr[7]_syn_2 ,\text_addr[6]_syn_12 ,\text_addr[5]_syn_4 ,text_addr[4:3],\text_addr[2]_syn_4 ,\text_addr[1]_syn_4 ,\text_addr[0]_syn_4 ,3'b111}),
    .clka(clk_dup_1),
    .dia({open_n4389,open_n4390,7'b0000000}),
    .rsta(rst_dup_1),
    .doa({open_n4405,open_n4406,char_id}));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(A*~B*~C*~D*~E*~F+A*B*C*~D*~E*~F+~A*~B*~C*D*~E*~F+~A*~B*~C*~D*E*~F+A*~B*C*~D*E*~F+~A*B*C*~D*E*~F+A*B*~C*~D*~E*F+~A*~B*~C*D*~E*F+~A*~B*~C*~D*E*F+~A*B*~C*~D*E*F+A*B*~C*~D*E*F+~A*~B*C*~D*E*F+~A*B*C*~D*E*F+A*B*C*~D*E*F+~A*~B*C*D*E*F)"),
    .INIT(64'b0001000011011101000000010000100000000000011000010000000110000010))
    ramread1_syn_101 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_102));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*~B*~C*~D*~E*~F+A*~B*C*~D*~E*~F+~A*~B*~C*D*~E*~F+A*~B*~C*D*~E*~F+~A*B*~C*D*~E*~F+~A*~B*~C*~D*E*~F+~A*B*~C*~D*E*~F+A*~B*C*~D*E*~F+~A*~B*~C*D*E*~F+A*B*~C*D*E*~F+A*B*~C*~D*~E*F+A*~B*~C*D*~E*F+~A*B*~C*D*~E*F+A*B*~C*D*~E*F+~A*B*C*~D*E*F+~A*~B*C*D*E*F+A*~B*C*D*E*F)"),
    .INIT(64'b0011000001000000000011100000100000001001001001010000011100100001))
    ramread1_syn_103 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_104));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(A*B*~C*~D*~E*~F+A*B*~C*D*~E*~F+A*~B*~C*~D*E*~F+~A*B*~C*~D*E*~F+~A*~B*C*~D*E*~F+~A*B*C*~D*E*~F+~A*B*~C*D*E*~F+A*~B*~C*~D*~E*F+~A*B*~C*~D*~E*F+A*B*~C*~D*~E*F+~A*~B*C*~D*~E*F+A*~B*C*~D*~E*F+~A*B*C*~D*~E*F+A*B*C*~D*~E*F+~A*~B*~C*D*~E*F+A*~B*~C*D*~E*F+~A*B*~C*D*~E*F+A*B*~C*D*~E*F+~A*~B*C*D*~E*F+A*~B*C*D*~E*F+A*~B*~C*~D*E*F+~A*B*C*~D*E*F+~A*~B*~C*D*E*F+~A*B*~C*D*E*F+~A*~B*C*D*E*F)"),
    .INIT(64'b0001010101000010001111111111111000000100010101100000100000001000))
    ramread1_syn_105 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_106));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*~B*C*~D*~E*~F+A*~B*C*D*~E*~F+~A*~B*~C*~D*E*~F+A*B*~C*~D*E*~F+~A*B*C*~D*E*~F+A*B*C*~D*E*~F+~A*~B*~C*D*E*~F+A*~B*~C*D*E*~F+~A*B*~C*D*E*~F+A*B*~C*D*E*~F+~A*~B*C*D*E*~F+A*~B*C*D*E*~F+A*B*~C*~D*~E*F+~A*~B*~C*D*~E*F+A*~B*~C*D*~E*F+A*~B*~C*~D*E*F+~A*B*~C*~D*E*F+A*B*~C*~D*E*F+~A*~B*C*~D*E*F+A*~B*C*~D*E*F+~A*B*C*~D*E*F+~A*~B*~C*D*E*F+A*~B*~C*D*E*F+~A*~B*C*D*E*F)"),
    .INIT(64'b0001001101111110000000110000100000111111110010010010000000010000))
    ramread1_syn_107 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_108));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*~B*~C*~D*~E*~F+A*B*~C*~D*~E*~F+~A*B*C*~D*~E*~F+A*~B*~C*D*~E*~F+~A*~B*C*D*~E*~F+~A*B*~C*~D*E*~F+~A*B*C*~D*E*~F+A*B*C*~D*E*~F+~A*B*~C*D*E*~F+~A*~B*C*D*E*~F+A*~B*~C*~D*~E*F+~A*B*C*~D*~E*F+A*~B*~C*D*~E*F+~A*B*~C*D*~E*F+A*B*~C*D*~E*F+A*~B*~C*~D*E*F+~A*~B*C*~D*E*F+A*~B*C*~D*E*F+~A*~B*~C*D*E*F+~A*B*~C*D*E*F+A*~B*C*D*E*F)"),
    .INIT(64'b0010010100110010000011100100001000010100110001000001001001001001))
    ramread1_syn_109 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_110));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*B*~C*~D*~E*~F+A*~B*~C*D*~E*~F+~A*B*~C*D*~E*~F+A*B*~C*~D*E*~F+~A*B*~C*D*E*~F+A*B*~C*D*E*~F+~A*~B*~C*~D*~E*F+A*~B*~C*~D*~E*F+~A*B*~C*~D*~E*F+A*B*~C*~D*~E*F+A*~B*C*~D*~E*F+A*B*C*~D*~E*F+~A*B*~C*D*~E*F+A*B*~C*D*~E*F+A*~B*~C*~D*E*F+A*~B*C*~D*E*F)"),
    .INIT(64'b0000000000100010000011001010111100001100000010000000011000000100))
    ramread1_syn_111 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_112));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*~B*C*~D*~E*~F+A*~B*C*~D*~E*~F+A*~B*C*D*~E*~F+~A*~B*~C*~D*E*~F+A*B*~C*~D*E*~F+A*B*C*~D*E*~F+~A*~B*C*D*E*~F+A*~B*~C*~D*~E*F+~A*~B*C*~D*~E*F+~A*~B*~C*D*~E*F+~A*~B*C*D*~E*F+A*~B*C*D*~E*F+A*~B*~C*D*E*F+~A*B*~C*D*E*F)"),
    .INIT(64'b0000011000000000001100010001001000010000100010010010000000110000))
    ramread1_syn_113 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_114));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*~B*~C*~D*~E*~F+A*B*~C*~D*~E*~F+~A*B*C*~D*~E*~F+~A*~B*~C*D*~E*~F+~A*B*~C*D*~E*~F+A*~B*~C*~D*E*~F+~A*B*C*~D*E*~F+A*B*C*~D*E*~F+~A*~B*~C*D*E*~F+A*~B*~C*D*E*~F+~A*B*~C*D*E*~F+A*B*~C*D*E*~F+~A*~B*C*D*E*~F+~A*~B*~C*~D*~E*F+~A*B*~C*~D*~E*F+~A*~B*C*~D*~E*F+A*~B*C*~D*~E*F+~A*B*C*~D*~E*F+A*B*C*~D*~E*F+~A*~B*~C*D*~E*F+A*~B*~C*D*~E*F+~A*B*~C*D*~E*F+A*B*~C*D*~E*F+~A*~B*C*D*~E*F+A*~B*~C*~D*E*F+~A*B*~C*~D*E*F+A*B*~C*~D*E*F+~A*~B*C*~D*E*F+A*~B*C*~D*E*F+A*B*C*~D*E*F+A*~B*~C*D*E*F+~A*B*~C*D*E*F+~A*~B*C*D*E*F+A*~B*C*D*E*F)"),
    .INIT(64'b0011011010111110000111111111010100011111110000100000010101001001))
    ramread1_syn_115 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_116));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*~B*~C*~D*~E*~F+A*B*~C*~D*~E*~F+~A*B*C*~D*~E*~F+A*~B*~C*D*~E*~F+A*~B*C*D*~E*~F+A*~B*~C*~D*E*~F+~A*B*~C*~D*E*~F+A*B*C*~D*E*~F+~A*~B*C*D*E*~F+~A*~B*~C*~D*~E*F+A*B*~C*~D*~E*F+A*~B*C*~D*~E*F+~A*~B*~C*D*~E*F+A*~B*~C*D*~E*F+A*~B*C*D*~E*F+A*~B*~C*~D*E*F+A*B*~C*~D*E*F+A*~B*C*~D*E*F+A*B*C*~D*E*F+A*~B*~C*D*E*F+A*B*~C*D*E*F+A*~B*C*D*E*F)"),
    .INIT(64'b0010101010101010001000110010100100010000100001100010001001001001))
    ramread1_syn_117 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_118));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*~B*~C*~D*~E*~F+A*~B*~C*~D*~E*~F+A*B*~C*~D*~E*~F+~A*~B*C*~D*~E*~F+~A*B*C*~D*~E*~F+A*B*C*~D*~E*~F+A*~B*~C*D*~E*~F+~A*B*~C*D*~E*~F+~A*~B*C*D*~E*~F+A*~B*~C*~D*E*~F+~A*B*C*~D*E*~F+A*B*~C*D*E*~F+~A*~B*C*D*E*~F+~A*~B*~C*~D*~E*F+~A*~B*~C*~D*E*F+~A*B*~C*~D*E*F+~A*~B*C*~D*E*F+~A*B*C*~D*E*F+A*B*C*~D*E*F+~A*~B*~C*D*E*F+A*~B*~C*D*E*F)"),
    .INIT(64'b0000001111010101000000000000000100011000010000100001011011011011))
    ramread1_syn_119 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_120));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(A*~B*~C*~D*~E*~F+~A*B*~C*~D*~E*~F+A*B*~C*~D*~E*~F+~A*~B*C*~D*~E*~F+A*~B*C*~D*~E*~F+~A*B*C*~D*~E*~F+A*B*C*~D*~E*~F+~A*~B*~C*D*~E*~F+A*~B*~C*D*~E*~F+~A*B*~C*D*~E*~F+A*B*~C*D*~E*~F+A*~B*~C*~D*E*~F+~A*B*~C*~D*E*~F+A*~B*C*~D*E*~F+A*B*C*~D*E*~F+~A*~B*~C*D*E*~F+A*~B*~C*D*E*~F+~A*B*~C*D*E*~F+A*B*~C*D*E*~F+~A*~B*C*D*E*~F+A*~B*C*D*E*~F+~A*~B*~C*~D*~E*F+A*B*~C*~D*~E*F+~A*B*~C*D*~E*F+~A*B*~C*~D*E*F+A*B*~C*~D*E*F+~A*~B*C*~D*E*F+A*~B*C*~D*E*F+~A*B*C*~D*E*F+A*B*C*~D*E*F)"),
    .INIT(64'b0000000011111100000001000000100100111111101001100000111111111110))
    ramread1_syn_121 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_122));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*B*C*~D*E*F+A*B*C*~D*E*F)"),
    .INIT(64'b0000000011000000000000000000000000000000000000000000000000000000))
    ramread1_syn_124 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_125));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(A*~B*~C*~D*~E*~F+~A*B*C*~D*~E*~F+A*B*C*~D*~E*~F+~A*~B*~C*~D*E*~F+~A*~B*C*~D*E*~F+A*~B*C*~D*E*~F+A*B*~C*~D*~E*F+~A*~B*~C*D*~E*F+~A*~B*~C*~D*E*F+~A*B*~C*~D*E*F+~A*~B*C*~D*E*F+~A*B*C*~D*E*F+A*B*C*~D*E*F+A*~B*~C*D*E*F+~A*B*~C*D*E*F+A*B*~C*D*E*F+~A*~B*C*D*E*F)"),
    .INIT(64'b0001111011010101000000010000100000000000001100010000000011000010))
    ramread1_syn_126 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_127));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*~B*~C*~D*~E*~F+A*~B*~C*~D*~E*~F+~A*B*~C*~D*~E*~F+A*B*~C*~D*~E*~F+~A*~B*C*~D*~E*~F+A*~B*C*~D*~E*~F+~A*B*C*~D*~E*~F+A*B*C*~D*~E*~F+~A*~B*~C*D*~E*~F+~A*~B*~C*~D*E*~F+~A*B*~C*~D*E*~F+A*B*~C*~D*E*~F+~A*~B*C*~D*E*~F+A*~B*C*~D*E*~F+~A*B*C*~D*E*~F+A*B*C*~D*E*~F+~A*~B*~C*D*E*~F+A*~B*~C*D*E*~F+~A*B*~C*D*E*~F+A*B*~C*D*E*~F+~A*~B*~C*~D*~E*F+A*~B*~C*~D*~E*F+~A*B*~C*~D*~E*F+A*B*~C*~D*~E*F+~A*~B*C*~D*~E*F+A*~B*C*~D*~E*F+~A*B*C*~D*~E*F+A*B*C*~D*~E*F+~A*~B*~C*D*~E*F+A*~B*~C*D*~E*F+A*B*~C*D*~E*F+~A*~B*C*D*~E*F+~A*B*C*~D*E*F+~A*~B*C*D*E*F+A*~B*C*D*E*F)"),
    .INIT(64'b0011000001000000000110111111111100001111111111010000000111111111))
    ramread1_syn_128 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_129));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(A*B*~C*~D*~E*~F+A*B*~C*D*~E*~F+A*~B*~C*~D*E*~F+~A*B*~C*~D*E*~F+~A*~B*C*~D*E*~F+A*~B*C*~D*E*~F+~A*~B*~C*D*E*~F+~A*B*~C*D*E*~F+A*~B*~C*~D*~E*F+A*~B*C*D*~E*F+~A*B*C*D*~E*F+A*~B*~C*~D*E*F+~A*B*~C*~D*E*F+A*B*~C*~D*E*F+~A*~B*C*~D*E*F+A*~B*C*~D*E*F+~A*B*C*~D*E*F+~A*~B*~C*D*E*F+~A*B*~C*D*E*F+~A*~B*C*D*E*F)"),
    .INIT(64'b0001010101111110011000000000001000000101001101100000100000001000))
    ramread1_syn_130 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_131));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*~B*C*~D*~E*~F+A*~B*C*D*~E*~F+~A*~B*~C*~D*E*~F+A*B*~C*~D*E*~F+~A*B*C*~D*E*~F+A*B*C*~D*E*~F+~A*~B*~C*D*E*~F+A*~B*~C*D*E*~F+~A*B*~C*D*E*~F+A*B*~C*D*E*~F+~A*~B*C*D*E*~F+A*~B*C*D*E*~F+A*B*~C*~D*~E*F+A*~B*~C*D*~E*F+~A*B*~C*D*~E*F+A*~B*~C*~D*E*F+~A*~B*C*~D*E*F+~A*B*C*~D*E*F+~A*~B*~C*D*E*F+~A*B*~C*D*E*F+~A*~B*C*D*E*F)"),
    .INIT(64'b0001010101010010000001100000100000111111110010010010000000010000))
    ramread1_syn_132 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_133));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*~B*~C*~D*~E*~F+A*B*~C*~D*~E*~F+~A*~B*C*~D*~E*~F+A*~B*C*~D*~E*~F+~A*B*C*~D*~E*~F+A*B*C*~D*~E*~F+~A*~B*~C*D*~E*~F+A*~B*~C*D*~E*~F+~A*B*~C*D*~E*~F+A*B*~C*D*~E*~F+~A*~B*C*D*~E*~F+~A*B*~C*~D*E*~F+~A*B*C*~D*E*~F+A*B*C*~D*E*~F+~A*B*~C*D*E*~F+~A*~B*C*D*E*~F+~A*~B*~C*~D*~E*F+A*~B*~C*~D*~E*F+A*B*~C*~D*~E*F+~A*B*C*~D*~E*F+~A*B*~C*D*~E*F+A*B*~C*D*~E*F+A*~B*~C*~D*E*F+~A*B*~C*~D*E*F+A*B*~C*~D*E*F+~A*~B*C*~D*E*F+A*~B*C*~D*E*F+~A*B*C*~D*E*F+A*B*C*~D*E*F+~A*~B*~C*D*E*F+A*~B*~C*D*E*F+~A*B*~C*D*E*F+A*B*~C*D*E*F+~A*~B*C*D*E*F+A*~B*C*D*E*F)"),
    .INIT(64'b0011111111111110000011000100101100010100110001000001111111111001))
    ramread1_syn_134 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_135));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*~B*~C*~D*~E*~F+~A*B*~C*~D*~E*~F+A*B*C*~D*~E*~F+~A*~B*~C*D*~E*~F+A*~B*~C*D*~E*~F+~A*B*~C*D*~E*~F+A*B*~C*D*~E*~F+~A*~B*~C*~D*E*~F+A*~B*~C*~D*E*~F+~A*B*~C*~D*E*~F+A*B*~C*~D*E*~F+~A*~B*~C*D*E*~F+A*~B*~C*D*E*~F+~A*B*~C*D*E*~F+~A*~B*C*D*E*~F+~A*~B*~C*~D*~E*F+A*~B*~C*~D*~E*F+A*B*~C*~D*~E*F+A*~B*C*~D*~E*F+A*B*C*~D*~E*F+~A*B*~C*D*~E*F+A*B*~C*D*~E*F+A*~B*~C*~D*E*F+A*~B*C*~D*E*F+~A*B*C*~D*E*F+A*B*C*~D*E*F+~A*~B*~C*D*E*F+A*~B*~C*D*E*F+~A*B*~C*D*E*F+A*B*~C*D*E*F+~A*~B*C*D*E*F+A*~B*C*D*E*F)"),
    .INIT(64'b0011111111100010000011001010101100010111000011110000111110000101))
    ramread1_syn_136 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_137));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(A*~B*C*~D*~E*~F+A*~B*C*D*~E*~F+~A*~B*~C*~D*E*~F+A*B*~C*~D*E*~F+A*B*C*~D*E*~F+A*~B*~C*~D*~E*F+~A*~B*C*~D*~E*F+~A*~B*~C*D*~E*F+A*~B*C*D*~E*F+~A*~B*~C*~D*E*F+A*~B*~C*~D*E*F+~A*B*~C*~D*E*F+A*B*~C*~D*E*F+~A*~B*C*~D*E*F+A*~B*C*~D*E*F+~A*B*C*~D*E*F+A*B*C*~D*E*F+~A*B*~C*D*E*F+A*B*~C*D*E*F)"),
    .INIT(64'b0000110011111111001000010001001000000000100010010010000000100000))
    ramread1_syn_138 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_139));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(A*~B*~C*~D*~E*~F+~A*~B*C*~D*~E*~F+~A*~B*~C*D*~E*~F+~A*~B*~C*~D*E*~F+A*~B*~C*~D*E*~F+~A*B*C*~D*E*~F+~A*~B*~C*~D*~E*F+~A*B*~C*~D*~E*F+~A*~B*C*~D*~E*F+A*~B*C*~D*~E*F+A*B*C*~D*~E*F+A*~B*~C*D*~E*F+~A*B*~C*D*~E*F+~A*~B*C*D*~E*F+A*~B*~C*~D*E*F+A*B*C*~D*E*F+~A*B*~C*D*E*F+A*B*~C*D*E*F+~A*~B*C*D*E*F)"),
    .INIT(64'b0001110010000010000101101011010100000000010000110000000100010010))
    ramread1_syn_140 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_141));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*~B*~C*~D*~E*~F+A*B*~C*~D*~E*~F+~A*B*C*~D*~E*~F+A*~B*~C*D*~E*~F+A*~B*C*D*~E*~F+~A*~B*~C*~D*E*~F+A*B*C*~D*E*~F+~A*~B*~C*D*E*~F+~A*~B*C*D*E*~F+~A*~B*~C*~D*~E*F+A*B*~C*~D*~E*F+A*~B*C*~D*~E*F+~A*~B*~C*D*~E*F+A*~B*~C*D*~E*F+A*~B*C*D*~E*F+A*~B*~C*~D*E*F+A*B*~C*~D*E*F+A*~B*C*~D*E*F+A*B*C*~D*E*F+A*~B*~C*D*E*F+A*B*~C*D*E*F+A*~B*C*D*E*F)"),
    .INIT(64'b0010101010101010001000110010100100010001100000010010001001001001))
    ramread1_syn_142 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_143));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*~B*~C*~D*~E*~F+A*~B*~C*~D*~E*~F+A*B*~C*~D*~E*~F+~A*~B*C*~D*~E*~F+~A*B*C*~D*~E*~F+A*B*C*~D*~E*~F+A*~B*~C*D*~E*~F+~A*B*~C*D*~E*~F+~A*~B*C*D*~E*~F+A*~B*~C*~D*E*~F+~A*B*~C*~D*E*~F+~A*B*C*~D*E*~F+~A*B*~C*D*E*~F+A*B*~C*D*E*~F+~A*~B*~C*~D*~E*F+A*B*~C*~D*~E*F+~A*~B*C*~D*~E*F+A*~B*C*~D*~E*F+~A*B*C*~D*~E*F+A*B*C*~D*~E*F+~A*~B*~C*D*~E*F+A*~B*~C*D*~E*F+~A*~B*~C*~D*E*F+~A*B*~C*~D*E*F+~A*~B*C*~D*E*F+~A*B*C*~D*E*F+A*~B*~C*D*E*F+~A*B*~C*D*E*F+A*B*~C*D*E*F)"),
    .INIT(64'b0000111001010101000000111111100100001100010001100001011011011011))
    ramread1_syn_144 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_145));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(A*~B*~C*~D*~E*~F+A*B*~C*~D*~E*~F+~A*~B*C*~D*~E*~F+A*~B*C*~D*~E*~F+~A*B*C*~D*~E*~F+A*B*C*~D*~E*~F+~A*~B*~C*D*~E*~F+A*~B*~C*D*~E*~F+~A*B*~C*D*~E*~F+A*B*~C*D*~E*~F+~A*~B*C*D*~E*~F+A*~B*~C*~D*E*~F+~A*B*~C*~D*E*~F+A*B*~C*~D*E*~F+~A*~B*C*~D*E*~F+A*~B*C*~D*E*~F+A*B*C*~D*E*~F+A*~B*~C*D*E*~F+~A*~B*C*D*E*~F+~A*~B*~C*~D*~E*F+A*~B*~C*~D*~E*F+~A*B*~C*~D*~E*F+A*B*~C*~D*~E*F+A*~B*C*~D*~E*F+~A*B*C*~D*~E*F+A*B*C*~D*~E*F+~A*~B*~C*D*~E*F+A*~B*~C*D*~E*F+~A*B*~C*~D*E*F+A*B*~C*~D*E*F+~A*B*C*~D*E*F+A*B*C*~D*E*F+A*~B*~C*D*E*F+~A*B*~C*D*E*F+A*B*~C*D*E*F+~A*~B*C*D*E*F)"),
    .INIT(64'b0001111011001100000000111110111100010010101111100001111111111010))
    ramread1_syn_146 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_147));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(A*~B*~C*~D*~E*~F+~A*B*C*~D*~E*~F+~A*~B*~C*~D*E*~F+~A*~B*C*~D*E*~F+A*B*~C*~D*~E*F+~A*~B*~C*D*~E*F+~A*~B*~C*~D*E*F+~A*B*~C*~D*E*F+~A*~B*C*~D*E*F+~A*B*C*~D*E*F+A*B*C*~D*E*F+A*~B*~C*D*E*F+~A*B*~C*D*E*F+A*B*~C*D*E*F+~A*~B*C*D*E*F)"),
    .INIT(64'b0001111011010101000000010000100000000000000100010000000001000010))
    ramread1_syn_151 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_152));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*~B*~C*~D*~E*~F+A*~B*C*~D*~E*~F+~A*~B*C*D*~E*~F+~A*B*~C*~D*E*~F+A*~B*C*~D*E*~F+~A*~B*~C*D*E*~F+A*B*~C*D*E*~F+A*B*~C*~D*~E*F+~A*~B*C*D*~E*F+A*~B*C*D*~E*F+~A*B*C*~D*E*F+~A*~B*C*D*E*F+A*~B*C*D*E*F)"),
    .INIT(64'b0011000001000000001100000000100000001001001001000001000000100001))
    ramread1_syn_153 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_154));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(A*B*~C*~D*~E*~F+~A*~B*C*~D*~E*~F+A*~B*C*~D*~E*~F+~A*B*C*~D*~E*~F+A*B*C*~D*~E*~F+~A*~B*~C*D*~E*~F+A*~B*~C*D*~E*~F+~A*B*~C*D*~E*~F+A*B*~C*D*~E*~F+~A*~B*C*D*~E*~F+A*~B*C*D*~E*~F+~A*~B*~C*~D*E*~F+~A*B*~C*~D*E*~F+~A*~B*C*~D*E*~F+~A*~B*~C*D*E*~F+A*B*~C*D*E*~F+A*~B*~C*~D*~E*F+A*~B*C*D*~E*F+~A*B*C*D*~E*F+A*~B*~C*~D*E*F+~A*B*C*~D*E*F+~A*~B*~C*D*E*F+~A*B*~C*D*E*F+~A*~B*C*D*E*F)"),
    .INIT(64'b0001010101000010011000000000001000001001000101010011111111111000))
    ramread1_syn_155 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_156));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*~B*C*~D*~E*~F+~A*~B*~C*D*~E*~F+A*~B*~C*D*~E*~F+~A*~B*~C*~D*E*~F+A*B*~C*~D*E*~F+~A*B*C*~D*E*~F+A*~B*~C*D*E*~F+A*~B*C*D*E*~F+~A*B*~C*D*~E*F+A*B*~C*D*~E*F+A*~B*~C*~D*E*F+~A*~B*C*~D*E*F+~A*B*C*~D*E*F+~A*~B*~C*D*E*F+A*B*~C*D*E*F)"),
    .INIT(64'b0000100101010010000011000000000000100010010010010000001100010000))
    ramread1_syn_157 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_158));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*~B*~C*~D*~E*~F+A*B*~C*~D*~E*~F+~A*B*C*~D*~E*~F+A*~B*~C*D*~E*~F+A*~B*C*D*~E*~F+~A*B*~C*~D*E*~F+~A*B*C*~D*E*~F+A*B*C*~D*E*~F+~A*B*~C*D*E*~F+~A*~B*C*D*E*~F+A*~B*~C*~D*~E*F+A*B*~C*~D*~E*F+~A*~B*C*~D*~E*F+A*~B*C*~D*~E*F+~A*B*C*~D*~E*F+A*~B*~C*D*~E*F+~A*B*~C*D*~E*F+A*B*~C*D*~E*F+A*~B*~C*~D*E*F+~A*~B*C*~D*E*F+~A*~B*~C*D*E*F+~A*B*~C*D*E*F+A*~B*C*D*E*F)"),
    .INIT(64'b0010010100010010000011100111101000010100110001000010001001001001))
    ramread1_syn_159 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_160));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(A*~B*~C*~D*~E*~F+~A*B*~C*~D*~E*~F+A*B*~C*~D*~E*~F+~A*~B*C*~D*~E*~F+A*~B*C*~D*~E*~F+~A*B*C*~D*~E*~F+A*B*~C*D*~E*~F+~A*~B*C*D*~E*~F+~A*B*~C*~D*E*~F+A*B*~C*~D*E*~F+~A*~B*C*~D*E*~F+A*~B*C*~D*E*~F+~A*B*C*~D*E*~F+A*B*C*~D*E*~F+~A*~B*C*D*E*~F+A*~B*C*D*E*~F+~A*~B*~C*~D*~E*F+A*~B*~C*~D*~E*F+A*B*~C*~D*~E*F+A*~B*C*~D*~E*F+A*B*C*~D*~E*F+~A*~B*~C*D*~E*F+A*~B*~C*D*~E*F+~A*~B*C*D*~E*F+A*~B*~C*~D*E*F+A*~B*C*~D*E*F+A*~B*C*D*E*F)"),
    .INIT(64'b0010000000100010000100111010101100110000111111000001100001111110))
    ramread1_syn_161 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_162));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(A*~B*C*~D*~E*~F+~A*B*C*~D*~E*~F+~A*~B*C*D*~E*~F+A*~B*C*D*~E*~F+~A*~B*~C*~D*E*~F+A*B*~C*~D*E*~F+A*B*C*~D*E*~F+A*~B*~C*~D*~E*F+~A*~B*C*~D*~E*F+~A*~B*~C*D*~E*F+~A*B*~C*D*~E*F+A*B*~C*D*~E*F+A*~B*C*D*~E*F+A*B*~C*D*E*F)"),
    .INIT(64'b0000100000000000001011010001001000000000100010010011000001100000))
    ramread1_syn_163 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_164));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(A*~B*~C*~D*~E*~F+~A*~B*C*~D*~E*~F+A*~B*C*~D*~E*~F+~A*~B*~C*D*~E*~F+A*~B*~C*~D*E*~F+~A*B*~C*~D*E*~F+A*B*~C*~D*E*~F+~A*B*C*~D*E*~F+A*B*C*~D*E*~F+~A*~B*~C*D*E*~F+A*~B*~C*D*E*~F+~A*~B*~C*~D*~E*F+A*~B*~C*~D*~E*F+~A*B*~C*~D*~E*F+~A*~B*C*~D*~E*F+A*~B*C*~D*~E*F+A*B*C*~D*~E*F+A*~B*~C*D*~E*F+~A*B*~C*D*~E*F+~A*~B*C*D*~E*F+A*~B*~C*~D*E*F+A*B*C*~D*E*F+A*B*~C*D*E*F+~A*~B*C*D*E*F)"),
    .INIT(64'b0001100010000010000101101011011100000011110011100000000100110010))
    ramread1_syn_165 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_166));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*~B*~C*~D*~E*~F+A*~B*~C*~D*~E*~F+~A*B*~C*~D*~E*~F+A*B*~C*~D*~E*~F+~A*~B*C*~D*~E*~F+~A*B*C*~D*~E*~F+A*~B*~C*D*~E*~F+A*~B*C*D*~E*~F+~A*~B*~C*~D*E*~F+A*~B*~C*~D*E*~F+~A*B*~C*~D*E*~F+~A*~B*~C*D*E*~F+~A*~B*C*D*E*~F+~A*~B*~C*~D*~E*F+A*B*~C*~D*~E*F+A*~B*C*~D*~E*F+A*B*C*~D*~E*F+~A*~B*~C*D*~E*F+~A*B*~C*D*~E*F+A*~B*C*D*~E*F+A*~B*~C*~D*E*F+A*B*~C*~D*E*F+A*~B*C*~D*E*F+A*B*C*~D*E*F+A*~B*~C*D*E*F+A*B*~C*D*E*F+A*~B*C*D*E*F)"),
    .INIT(64'b0010101010101010001001011010100100010001000001110010001001011111))
    ramread1_syn_167 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_168));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*~B*~C*~D*~E*~F+A*~B*~C*~D*~E*~F+A*B*~C*~D*~E*~F+~A*~B*C*~D*~E*~F+~A*B*C*~D*~E*~F+A*B*C*~D*~E*~F+A*~B*~C*D*~E*~F+~A*B*~C*D*~E*~F+~A*~B*C*D*~E*~F+~A*B*~C*~D*E*~F+A*B*~C*~D*E*~F+~A*B*C*~D*E*~F+~A*~B*~C*D*E*~F+A*~B*~C*D*E*~F+~A*~B*~C*~D*~E*F+A*B*~C*~D*~E*F+~A*B*C*~D*~E*F+A*~B*~C*D*~E*F+~A*~B*~C*~D*E*F+~A*B*~C*~D*E*F+~A*~B*C*~D*E*F+~A*B*C*~D*E*F+A*B*C*~D*E*F+~A*~B*~C*D*E*F+A*~B*~C*D*E*F)"),
    .INIT(64'b0000001111010101000000100100100100000011010011000001011011011011))
    ramread1_syn_169 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_170));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*~B*~C*~D*~E*~F+A*~B*~C*~D*~E*~F+A*B*~C*~D*~E*~F+~A*B*C*~D*~E*~F+A*~B*~C*D*~E*~F+~A*~B*C*D*~E*~F+A*~B*~C*~D*E*~F+~A*~B*C*~D*E*~F+A*~B*C*~D*E*~F+A*B*C*~D*E*~F+A*~B*~C*D*E*~F+~A*~B*C*D*E*~F+~A*~B*~C*~D*~E*F+A*B*~C*~D*~E*F+A*~B*~C*D*~E*F+~A*B*~C*D*~E*F+~A*B*~C*~D*E*F+A*B*~C*~D*E*F+~A*B*C*~D*E*F+A*B*C*~D*E*F+A*~B*~C*D*E*F+~A*~B*C*D*E*F)"),
    .INIT(64'b0001001011001100000001100000100100010010101100100001001001001011))
    ramread1_syn_171 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_172));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(A*~B*~C*~D*~E*~F+~A*~B*~C*~D*E*~F+A*~B*~C*~D*E*~F+~A*~B*~C*~D*~E*F+A*~B*~C*~D*~E*F+~A*B*~C*~D*~E*F+A*B*~C*~D*~E*F+~A*~B*C*~D*~E*F+A*~B*C*~D*~E*F+~A*B*C*~D*~E*F+A*B*C*~D*~E*F+~A*~B*~C*D*~E*F+A*~B*~C*D*~E*F+~A*B*~C*D*~E*F+A*B*~C*D*~E*F+~A*~B*C*D*~E*F+A*~B*C*D*~E*F+~A*B*C*D*~E*F+~A*~B*~C*~D*E*F+~A*B*~C*~D*E*F+~A*~B*C*~D*E*F+~A*B*C*~D*E*F+A*B*C*~D*E*F+A*~B*~C*D*E*F)"),
    .INIT(64'b0000001011010101011111111111111100000000000000110000000000000010))
    ramread1_syn_176 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_177));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*~B*~C*~D*~E*~F+A*~B*~C*~D*~E*~F+A*~B*C*~D*~E*~F+A*~B*~C*D*~E*~F+~A*B*~C*D*~E*~F+A*B*~C*D*~E*~F+~A*B*~C*~D*E*~F+A*~B*C*~D*E*~F+~A*~B*~C*D*E*~F+A*B*~C*D*E*~F+A*B*~C*~D*~E*F+A*~B*C*~D*~E*F+A*B*C*~D*~E*F+~A*~B*~C*D*~E*F+A*~B*~C*D*~E*F+~A*B*~C*D*~E*F+A*B*~C*D*~E*F+A*~B*C*D*~E*F+~A*~B*~C*~D*E*F+A*~B*~C*~D*E*F+~A*B*~C*~D*E*F+A*B*~C*~D*E*F+~A*~B*C*~D*E*F+A*~B*C*~D*E*F+~A*B*C*~D*E*F+A*B*C*~D*E*F+~A*~B*~C*D*E*F+A*~B*~C*D*E*F+~A*B*~C*D*E*F+A*B*~C*D*E*F+~A*~B*C*D*E*F+A*~B*C*D*E*F)"),
    .INIT(64'b0011111111111111001011111010100000001001001001000000111000100011))
    ramread1_syn_178 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_179));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*B*~C*~D*E*~F+~A*~B*C*~D*E*~F+~A*B*C*~D*E*~F+A*~B*~C*D*E*~F+A*B*~C*D*E*~F+A*~B*~C*~D*~E*F+~A*~B*C*~D*~E*F+A*~B*C*~D*~E*F+~A*B*C*~D*~E*F+A*B*C*~D*~E*F+~A*~B*~C*D*~E*F+A*~B*~C*D*~E*F+~A*B*~C*D*~E*F+~A*~B*~C*~D*E*F+A*~B*~C*~D*E*F+A*B*~C*~D*E*F+~A*~B*C*~D*E*F+~A*B*C*~D*E*F+~A*~B*~C*D*E*F+~A*B*~C*D*E*F+~A*~B*C*D*E*F)"),
    .INIT(64'b0001010101011011000001111111001000001010010101000000000000000000))
    ramread1_syn_180 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_181));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*~B*C*~D*~E*~F+~A*B*C*~D*~E*~F+A*B*C*~D*~E*~F+~A*~B*~C*~D*E*~F+A*B*~C*~D*E*~F+~A*B*C*~D*E*~F+A*~B*~C*D*E*~F+A*~B*C*D*E*~F+~A*~B*~C*~D*~E*F+A*~B*~C*~D*~E*F+~A*B*~C*~D*~E*F+A*B*~C*~D*~E*F+~A*~B*C*~D*~E*F+A*~B*C*~D*~E*F+~A*B*C*~D*~E*F+A*B*C*~D*~E*F+~A*~B*~C*D*~E*F+A*~B*~C*D*~E*F+A*B*~C*D*~E*F+~A*~B*~C*~D*E*F+A*~B*~C*~D*E*F+~A*~B*C*~D*E*F+~A*B*C*~D*E*F+~A*~B*~C*D*E*F+~A*B*~C*D*E*F+A*B*~C*D*E*F)"),
    .INIT(64'b0000110101010011000010111111111100100010010010010000000011010000))
    ramread1_syn_182 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_183));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*~B*~C*~D*~E*~F+A*B*~C*~D*~E*~F+~A*B*C*~D*~E*~F+A*~B*~C*D*~E*~F+A*~B*C*D*~E*~F+A*B*~C*~D*E*~F+~A*B*C*~D*E*~F+A*B*C*~D*E*~F+~A*B*~C*D*E*~F+~A*~B*C*D*E*~F+A*~B*~C*~D*~E*F+~A*B*C*~D*~E*F+A*B*C*~D*~E*F+~A*~B*~C*D*~E*F+A*~B*~C*D*~E*F+~A*~B*C*D*~E*F+A*~B*~C*~D*E*F+~A*~B*C*~D*E*F+A*~B*C*~D*E*F+~A*B*C*~D*E*F+~A*~B*~C*D*E*F+~A*B*~C*D*E*F+A*~B*C*D*E*F)"),
    .INIT(64'b0010010101110010000100111100001000010100110010000010001001001001))
    ramread1_syn_184 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_185));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*~B*C*~D*~E*~F+A*~B*C*~D*~E*~F+~A*~B*C*D*~E*~F+A*B*~C*~D*E*~F+~A*B*C*~D*E*~F+A*B*C*~D*E*~F+A*~B*C*D*E*~F+~A*~B*~C*~D*~E*F+A*~B*~C*~D*~E*F+A*B*~C*~D*~E*F+A*~B*C*~D*~E*F+A*B*C*~D*~E*F+~A*B*~C*D*~E*F+A*~B*~C*~D*E*F+A*~B*C*~D*E*F+~A*~B*~C*D*E*F+A*~B*~C*D*E*F+A*~B*C*D*E*F)"),
    .INIT(64'b0010001100100010000001001010101100100000110010000001000000110000))
    ramread1_syn_186 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_187));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*~B*~C*~D*~E*~F+A*~B*~C*~D*~E*~F+~A*B*~C*~D*~E*~F+A*B*~C*~D*~E*~F+~A*~B*C*~D*~E*~F+A*~B*C*~D*~E*~F+~A*B*C*~D*~E*~F+A*B*C*~D*~E*~F+~A*~B*~C*D*~E*~F+A*~B*~C*D*~E*~F+~A*B*~C*D*~E*~F+A*B*~C*D*~E*~F+~A*~B*C*D*~E*~F+~A*~B*~C*~D*E*~F+A*~B*~C*~D*E*~F+~A*B*~C*~D*E*~F+A*B*~C*~D*E*~F+~A*~B*C*~D*E*~F+A*~B*C*~D*E*~F+~A*B*C*~D*E*~F+A*B*C*~D*E*~F+~A*~B*~C*D*E*~F+A*~B*~C*D*E*~F+~A*B*~C*D*E*~F+A*B*~C*D*E*~F+~A*~B*C*D*E*~F+A*~B*~C*~D*~E*F+~A*~B*C*~D*~E*F+A*~B*C*~D*~E*F+~A*B*C*~D*~E*F+A*B*C*~D*~E*F+~A*~B*~C*D*~E*F+A*~B*~C*D*~E*F+~A*B*~C*D*~E*F+A*~B*C*D*~E*F+~A*B*~C*~D*E*F+A*B*~C*~D*E*F+~A*~B*C*~D*E*F+A*~B*C*~D*E*F+~A*~B*C*D*E*F)"),
    .INIT(64'b0001000000111100001001111111001000011111111111110001111111111111))
    ramread1_syn_188 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_189));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(A*~B*~C*~D*~E*~F+~A*B*~C*~D*~E*~F+A*~B*C*~D*~E*~F+~A*~B*~C*D*~E*~F+A*~B*~C*D*~E*~F+~A*B*~C*D*~E*~F+A*B*~C*D*~E*~F+~A*~B*C*D*~E*~F+A*~B*C*D*~E*~F+A*~B*~C*~D*E*~F+~A*~B*C*~D*E*~F+A*~B*C*~D*E*~F+~A*B*C*~D*E*~F+~A*~B*~C*D*E*~F+A*~B*~C*D*E*~F+~A*B*~C*D*E*~F+A*B*~C*D*E*~F+~A*~B*~C*~D*~E*F+~A*B*~C*~D*~E*F+A*B*~C*~D*~E*F+~A*~B*C*~D*~E*F+A*~B*C*~D*~E*F+A*B*C*~D*~E*F+A*~B*~C*D*~E*F+~A*B*~C*D*~E*F+~A*~B*C*D*~E*F+A*~B*~C*~D*E*F+A*B*C*~D*E*F+A*~B*~C*D*E*F+~A*B*~C*D*E*F+~A*~B*C*D*E*F)"),
    .INIT(64'b0001011010000010000101101011110100001111011100100011111100100110))
    ramread1_syn_190 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_191));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*~B*~C*~D*~E*~F+A*B*~C*~D*~E*~F+~A*~B*C*~D*~E*~F+A*~B*C*~D*~E*~F+~A*B*C*~D*~E*~F+A*~B*~C*D*~E*~F+A*~B*C*D*~E*~F+~A*B*~C*~D*E*~F+A*B*~C*~D*E*~F+A*~B*C*~D*E*~F+~A*B*C*~D*E*~F+A*B*C*~D*E*~F+~A*~B*~C*D*E*~F+A*~B*~C*D*E*~F+~A*B*~C*D*E*~F+A*B*~C*D*E*~F+~A*~B*C*D*E*~F+~A*~B*~C*~D*~E*F+A*B*~C*~D*~E*F+A*~B*C*~D*~E*F+A*B*C*~D*~E*F+~A*B*~C*D*~E*F+A*~B*C*D*~E*F+A*~B*~C*~D*E*F+~A*B*~C*~D*E*F+A*B*~C*~D*E*F+~A*~B*C*~D*E*F+A*~B*C*~D*E*F+~A*B*C*~D*E*F+A*B*C*~D*E*F+~A*~B*~C*D*E*F+A*~B*~C*D*E*F+~A*B*~C*D*E*F+A*B*~C*D*E*F+~A*~B*C*D*E*F+A*~B*C*D*E*F)"),
    .INIT(64'b0011111111111110001001001010100100011111111011000010001001111001))
    ramread1_syn_192 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_193));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*~B*~C*~D*~E*~F+A*~B*~C*~D*~E*~F+A*B*~C*~D*~E*~F+~A*~B*C*~D*~E*~F+~A*B*C*~D*~E*~F+A*B*C*~D*~E*~F+~A*~B*~C*D*~E*~F+A*~B*~C*D*~E*~F+~A*B*~C*D*~E*~F+A*B*~C*D*~E*~F+~A*~B*C*D*~E*~F+A*B*~C*~D*E*~F+~A*~B*C*~D*E*~F+~A*B*C*~D*E*~F+A*B*C*~D*E*~F+~A*~B*~C*D*E*~F+A*B*~C*D*E*~F+~A*~B*~C*~D*~E*F+A*B*~C*~D*~E*F+~A*B*C*~D*~E*F+A*~B*~C*D*~E*F+~A*~B*~C*~D*E*F+~A*B*~C*~D*E*F+~A*~B*C*~D*E*F+~A*B*C*~D*E*F+A*~B*~C*D*E*F)"),
    .INIT(64'b0000001001010101000000100100100100001001110110000001111111011011))
    ramread1_syn_194 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_195));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(A*~B*~C*~D*~E*~F+~A*B*~C*~D*~E*~F+A*B*~C*~D*~E*~F+~A*B*C*~D*~E*~F+A*~B*~C*D*~E*~F+~A*~B*~C*~D*E*~F+A*~B*~C*~D*E*~F+A*~B*C*~D*E*~F+A*B*C*~D*E*~F+A*~B*~C*D*E*~F+~A*~B*C*D*E*~F+~A*~B*~C*~D*~E*F+A*B*~C*~D*~E*F+A*B*~C*D*~E*F+A*~B*~C*~D*E*F+~A*B*~C*~D*E*F+A*B*~C*~D*E*F+~A*B*C*~D*E*F+A*B*C*~D*E*F+A*~B*~C*D*E*F+~A*~B*C*D*E*F)"),
    .INIT(64'b0001001011001110000010000000100100010010101000110000001001001110))
    ramread1_syn_196 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_197));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*~B*~C*D*E*~F+A*B*C*~D*E*F+~A*~B*~C*D*E*F)"),
    .INIT(64'b0000000110000000000000000000000000000001000000000000000000000000))
    ramread1_syn_199 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_200));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*~B*C*D*E*~F+~A*B*C*~D*E*F+A*B*C*~D*E*F)"),
    .INIT(64'b0000000011000000000000000000000000010000000000000000000000000000))
    ramread1_syn_201 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_202));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(A*~B*~C*~D*~E*~F+~A*B*~C*~D*~E*~F+A*B*~C*~D*~E*~F+~A*~B*C*~D*~E*~F+A*~B*C*~D*~E*~F+~A*B*C*~D*~E*~F+A*B*C*~D*~E*~F+~A*~B*~C*D*~E*~F+A*~B*~C*D*~E*~F+~A*B*~C*D*~E*~F+A*B*~C*D*~E*~F+~A*~B*C*D*~E*~F+A*~B*C*D*~E*~F+~A*~B*~C*~D*E*~F+~A*B*~C*~D*E*~F+A*B*~C*~D*E*~F+~A*~B*C*~D*E*~F+A*~B*C*~D*E*~F+~A*B*C*~D*E*~F+A*B*C*~D*E*~F+~A*~B*~C*D*E*~F+A*~B*~C*D*E*~F+~A*B*~C*D*E*~F+A*B*~C*D*E*~F+~A*~B*C*D*E*~F+~A*~B*~C*~D*~E*F+A*~B*~C*~D*~E*F+~A*B*~C*~D*~E*F+A*B*~C*~D*~E*F+~A*~B*C*~D*~E*F+A*~B*C*~D*~E*F+~A*B*C*~D*~E*F+A*B*C*~D*~E*F+~A*~B*~C*D*~E*F+A*~B*~C*D*~E*F+~A*B*~C*D*~E*F+A*B*~C*D*~E*F+~A*~B*C*D*~E*F+A*~B*C*D*~E*F+~A*B*C*D*~E*F+~A*~B*~C*~D*E*F+~A*B*~C*~D*E*F+~A*~B*C*~D*E*F+~A*B*C*~D*E*F+A*B*C*~D*E*F+A*~B*~C*D*E*F)"),
    .INIT(64'b0000001011010101011111111111111100011111111111010011111111111110))
    ramread1_syn_203 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_204));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(A*~B*~C*~D*~E*~F+A*~B*C*~D*~E*~F+~A*B*~C*D*~E*~F+A*B*~C*D*~E*~F+~A*~B*~C*~D*E*~F+A*~B*~C*~D*E*~F+~A*B*~C*~D*E*~F+A*~B*C*~D*E*~F+~A*~B*~C*D*E*~F+A*B*~C*D*E*~F+A*B*~C*~D*~E*F+A*~B*C*~D*~E*F+A*B*C*~D*~E*F+A*B*~C*D*~E*F+A*~B*C*D*~E*F+~A*~B*~C*~D*E*F+A*~B*~C*~D*E*F+~A*B*~C*~D*E*F+A*B*~C*~D*E*F+~A*~B*C*~D*E*F+A*~B*C*~D*E*F+~A*B*C*~D*E*F+A*B*C*~D*E*F+~A*~B*~C*D*E*F+A*~B*~C*D*E*F+~A*B*~C*D*E*F+A*B*~C*D*E*F+~A*~B*C*D*E*F+A*~B*C*D*E*F)"),
    .INIT(64'b0011111111111111001010001010100000001001001001110000110000100010))
    ramread1_syn_205 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_206));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(A*B*~C*~D*~E*~F+~A*~B*C*~D*~E*~F+A*~B*C*~D*~E*~F+~A*B*C*~D*~E*~F+A*B*C*~D*~E*~F+~A*~B*~C*D*~E*~F+A*~B*~C*D*~E*~F+~A*B*~C*D*~E*~F+A*B*~C*D*~E*~F+~A*~B*C*D*~E*~F+~A*B*~C*~D*E*~F+A*B*~C*~D*E*~F+~A*~B*C*~D*E*~F+A*B*C*~D*E*~F+A*~B*~C*D*E*~F+~A*~B*C*D*E*~F+A*~B*~C*~D*~E*F+~A*~B*C*~D*~E*F+A*~B*~C*D*~E*F+A*~B*~C*~D*E*F+~A*B*C*~D*E*F+~A*~B*~C*D*E*F+A*~B*~C*D*E*F+~A*B*~C*D*E*F+A*B*~C*D*E*F+~A*~B*C*D*E*F+A*~B*C*D*E*F)"),
    .INIT(64'b0011111101000010000000100001001000010010100111000001111111111000))
    ramread1_syn_207 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_208));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*~B*C*~D*~E*~F+~A*~B*~C*~D*E*~F+A*B*~C*~D*E*~F+~A*B*C*~D*E*~F+A*~B*~C*D*E*~F+~A*~B*~C*~D*~E*F+A*~B*~C*~D*~E*F+~A*B*~C*~D*~E*F+A*B*~C*~D*~E*F+~A*~B*C*~D*~E*F+A*~B*C*~D*~E*F+~A*B*C*~D*~E*F+A*B*C*~D*~E*F+~A*~B*~C*D*~E*F+A*~B*~C*D*~E*F+~A*~B*C*D*~E*F+A*~B*~C*~D*E*F+~A*~B*C*~D*E*F+~A*B*C*~D*E*F+~A*~B*~C*D*E*F+A*~B*~C*D*E*F+~A*B*~C*D*E*F+~A*~B*C*D*E*F)"),
    .INIT(64'b0001011101010010000100111111111100000010010010010000000000010000))
    ramread1_syn_209 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_210));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*~B*~C*~D*~E*~F+A*~B*~C*~D*~E*~F+~A*B*~C*~D*~E*~F+A*B*~C*~D*~E*~F+~A*B*C*~D*~E*~F+A*B*C*~D*~E*~F+~A*~B*~C*D*~E*~F+A*~B*~C*D*~E*~F+~A*B*~C*D*~E*~F+A*~B*C*D*~E*~F+~A*~B*~C*~D*E*~F+A*~B*~C*~D*E*~F+~A*B*~C*~D*E*~F+A*B*~C*~D*E*~F+~A*~B*C*~D*E*~F+A*~B*C*~D*E*~F+A*B*C*~D*E*~F+~A*~B*~C*D*E*~F+A*~B*~C*D*E*~F+~A*B*~C*D*E*~F+A*B*~C*D*E*~F+~A*~B*C*D*E*~F+A*~B*C*D*E*~F+~A*B*C*D*E*~F+A*~B*~C*~D*~E*F+~A*B*~C*~D*~E*F+A*B*~C*~D*~E*F+~A*B*C*~D*~E*F+~A*~B*~C*D*~E*F+A*~B*~C*D*~E*F+~A*~B*C*D*~E*F+A*~B*~C*~D*E*F+~A*B*~C*~D*E*F+A*B*~C*~D*E*F+~A*~B*C*~D*E*F+~A*B*C*~D*E*F+A*B*C*~D*E*F+~A*~B*~C*D*E*F+A*~B*~C*D*E*F+~A*B*~C*D*E*F+A*B*~C*D*E*F+~A*~B*C*D*E*F+A*~B*C*D*E*F+~A*B*C*D*E*F)"),
    .INIT(64'b0111111111011110000100110100111001111111101111110010011111001111))
    ramread1_syn_211 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_212));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*B*~C*~D*~E*~F+~A*~B*C*D*~E*~F+A*~B*~C*~D*E*~F+~A*B*~C*~D*E*~F+A*B*~C*~D*E*~F+~A*B*C*~D*E*~F+~A*~B*~C*D*E*~F+A*~B*~C*D*E*~F+~A*~B*C*D*E*~F+~A*~B*~C*~D*~E*F+A*~B*~C*~D*~E*F+A*B*~C*~D*~E*F+A*~B*C*~D*~E*F+~A*B*C*~D*~E*F+A*B*C*~D*~E*F+~A*~B*~C*D*~E*F+A*~B*~C*D*~E*F+~A*B*~C*D*~E*F+A*B*~C*D*~E*F+~A*~B*C*D*~E*F+A*~B*~C*~D*E*F+A*~B*C*~D*E*F+~A*~B*~C*D*E*F+A*~B*~C*D*E*F+~A*B*~C*D*E*F+A*B*~C*D*E*F)"),
    .INIT(64'b0000111100100010000111111110101100010011010011100001000000000100))
    ramread1_syn_213 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_214));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*~B*~C*~D*E*~F+A*~B*~C*~D*E*~F+~A*B*~C*~D*E*~F+A*B*~C*~D*E*~F+~A*~B*C*~D*E*~F+A*~B*C*~D*E*~F+~A*B*C*~D*E*~F+A*B*C*~D*E*~F+~A*~B*~C*D*E*~F+A*~B*~C*D*E*~F+~A*B*~C*D*E*~F+A*B*~C*D*E*~F+~A*~B*C*D*E*~F+A*~B*~C*~D*~E*F+A*~B*C*D*~E*F+A*~B*C*~D*E*F+~A*B*C*~D*E*F+~A*~B*C*D*E*F)"),
    .INIT(64'b0001000001100000001000000000001000011111111111110000000000000000))
    ramread1_syn_215 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_216));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(A*~B*~C*~D*~E*~F+~A*B*~C*~D*~E*~F+A*~B*C*~D*~E*~F+~A*B*C*~D*~E*~F+~A*~B*~C*D*~E*~F+A*~B*C*D*~E*~F+A*~B*~C*~D*E*~F+A*~B*C*~D*E*~F+~A*B*C*~D*E*~F+A*B*~C*D*E*~F+~A*~B*C*D*E*~F+~A*~B*~C*~D*~E*F+~A*B*~C*~D*~E*F+A*B*~C*~D*~E*F+~A*~B*C*~D*~E*F+A*~B*C*~D*~E*F+A*B*C*~D*~E*F+A*~B*~C*D*~E*F+~A*B*~C*D*~E*F+~A*~B*C*D*~E*F+A*~B*~C*~D*E*F+~A*B*~C*~D*E*F+A*B*~C*~D*E*F+~A*~B*C*~D*E*F+A*B*C*~D*E*F+~A*~B*~C*D*E*F+A*~B*~C*D*E*F+A*~B*C*D*E*F)"),
    .INIT(64'b0010001110011110000101101011110100011000011000100010000101100110))
    ramread1_syn_217 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_218));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*~B*~C*~D*~E*~F+A*B*~C*~D*~E*~F+~A*B*C*~D*~E*~F+A*~B*~C*D*~E*~F+~A*B*~C*D*~E*~F+A*B*~C*D*~E*~F+~A*~B*C*D*~E*~F+A*~B*C*D*~E*~F+~A*B*C*D*~E*~F+A*B*~C*~D*E*~F+~A*~B*C*~D*E*~F+~A*~B*~C*~D*~E*F+A*B*~C*~D*~E*F+A*~B*C*~D*~E*F+~A*B*~C*D*~E*F+A*B*~C*D*~E*F+A*~B*C*D*~E*F+A*~B*~C*~D*E*F+~A*B*~C*~D*E*F+A*B*~C*~D*E*F+~A*~B*C*~D*E*F+A*~B*C*~D*E*F+~A*B*C*~D*E*F+A*B*C*~D*E*F+~A*~B*~C*D*E*F+A*~B*~C*D*E*F+~A*B*~C*D*E*F+A*B*~C*D*E*F+~A*~B*C*D*E*F+A*~B*C*D*E*F)"),
    .INIT(64'b0011111111111110001011000010100100000000000110000111111001001001))
    ramread1_syn_219 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_220));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*~B*~C*~D*~E*~F+A*~B*~C*~D*~E*~F+A*B*~C*~D*~E*~F+~A*~B*C*~D*~E*~F+~A*B*C*~D*~E*~F+A*B*C*~D*~E*~F+~A*~B*~C*D*~E*~F+A*~B*~C*D*~E*~F+~A*B*~C*D*~E*~F+A*B*~C*D*~E*~F+~A*~B*C*D*~E*~F+~A*~B*C*~D*E*~F+A*~B*C*~D*E*~F+~A*B*C*~D*E*~F+A*B*~C*D*E*~F+~A*~B*~C*~D*~E*F+A*B*~C*~D*~E*F+~A*B*C*~D*~E*F+A*~B*~C*D*~E*F+~A*~B*~C*~D*E*F+~A*B*~C*~D*E*F+A*B*~C*~D*E*F+~A*~B*C*~D*E*F+~A*B*C*~D*E*F)"),
    .INIT(64'b0000000001011101000000100100100100001000011100000001111111011011))
    ramread1_syn_221 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_222));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(A*~B*~C*~D*~E*~F+A*B*~C*~D*~E*~F+~A*~B*~C*~D*E*~F+A*~B*~C*~D*E*~F+A*~B*C*~D*E*~F+A*B*C*~D*E*~F+A*~B*~C*D*E*~F+~A*~B*C*D*E*~F+~A*~B*~C*~D*~E*F+A*B*~C*~D*~E*F+~A*~B*C*~D*~E*F+A*~B*C*~D*~E*F+~A*B*C*~D*~E*F+A*B*C*~D*~E*F+~A*~B*~C*D*~E*F+A*~B*~C*D*~E*F+A*B*~C*D*~E*F+~A*~B*C*D*~E*F+~A*~B*~C*~D*E*F+A*~B*~C*~D*E*F+~A*B*~C*~D*E*F+A*B*~C*~D*E*F+~A*B*C*~D*E*F+A*B*C*~D*E*F+A*~B*~C*D*E*F+~A*~B*C*D*E*F)"),
    .INIT(64'b0001001011001111000110111111100100010010101000110000000000001010))
    ramread1_syn_223 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_224));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(A*B*~C*~D*E*~F+~A*~B*C*~D*E*~F+A*~B*C*~D*E*~F+~A*B*C*~D*E*~F+A*B*C*~D*E*~F+~A*~B*~C*D*E*~F+A*~B*~C*D*E*~F+~A*B*~C*~D*E*F+A*B*~C*~D*E*F+~A*~B*C*~D*E*F+~A*B*~C*D*E*F+A*B*~C*D*E*F)"),
    .INIT(64'b0000110000011100000000000000000000000011111110000000000000000000))
    ramread1_syn_226 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_227));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*B*~C*~D*~E*~F+A*B*~C*~D*~E*~F+~A*~B*C*~D*~E*~F+A*B*C*~D*~E*~F+~A*~B*~C*D*~E*~F+A*~B*~C*D*~E*~F+~A*~B*~C*D*E*~F+~A*B*~C*~D*~E*F+A*B*C*~D*~E*F+~A*~B*~C*D*~E*F+A*~B*~C*D*~E*F+~A*B*~C*D*~E*F+~A*B*C*~D*E*F+A*B*C*~D*E*F+~A*~B*~C*D*E*F+A*~B*~C*D*E*F+~A*B*~C*D*E*F)"),
    .INIT(64'b0000011111000000000001111000010000000001000000000000001110011100))
    ramread1_syn_228 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_229));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*B*~C*~D*~E*~F+A*B*~C*~D*~E*~F+~A*~B*C*~D*~E*~F+~A*B*~C*~D*E*~F+A*B*~C*~D*E*~F+~A*~B*C*~D*E*~F+A*B*C*~D*E*~F+~A*~B*~C*D*E*~F+A*~B*~C*D*E*~F+~A*B*~C*D*E*~F+~A*B*~C*~D*~E*F+A*B*~C*~D*~E*F+~A*~B*C*~D*~E*F+A*~B*C*~D*~E*F+~A*B*C*~D*E*F+A*B*C*~D*E*F+~A*~B*~C*D*E*F+A*~B*~C*D*E*F+~A*B*~C*D*E*F+A*B*~C*D*E*F)"),
    .INIT(64'b0000111111000000000000000011110000000111100111000000000000011100))
    ramread1_syn_230 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_231));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*B*~C*~D*~E*~F+~A*B*C*~D*~E*~F+A*B*C*~D*~E*~F+A*B*~C*D*~E*~F+~A*~B*C*D*~E*~F+~A*B*~C*~D*E*~F+A*B*~C*D*E*~F+~A*~B*C*D*E*~F+~A*B*~C*~D*~E*F+A*B*~C*~D*~E*F+~A*B*C*~D*E*F+A*B*C*~D*E*F)"),
    .INIT(64'b0000000011000000000000000000110000011000000001000001100011000100))
    ramread1_syn_232 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_233));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(A*~B*~C*~D*~E*~F+~A*~B*~C*~D*E*~F+A*B*~C*~D*E*~F+~A*~B*C*~D*E*~F+A*B*~C*~D*~E*F+~A*~B*~C*D*~E*F+~A*~B*~C*~D*E*F+~A*B*~C*~D*E*F+~A*~B*C*~D*E*F+~A*B*C*~D*E*F+A*B*C*~D*E*F+A*~B*~C*D*E*F)"),
    .INIT(64'b0000001011010101000000010000100000000000000110010000000000000010))
    ramread1_syn_234 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_235));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(A*~B*~C*~D*~E*~F+~A*B*~C*~D*~E*~F+A*B*~C*~D*~E*~F+~A*~B*C*~D*~E*~F+A*~B*C*~D*~E*~F+~A*B*C*~D*~E*~F+A*B*C*~D*~E*~F+~A*~B*~C*D*~E*~F+A*~B*~C*D*~E*~F+~A*B*~C*D*~E*~F+A*B*~C*D*~E*~F+~A*~B*C*D*~E*~F+A*~B*~C*~D*E*~F+~A*B*~C*~D*E*~F+A*B*~C*~D*E*~F+~A*~B*C*~D*E*~F+A*~B*C*~D*E*~F+~A*B*C*~D*E*~F+A*B*C*~D*E*~F+~A*~B*~C*D*E*~F+A*~B*~C*D*E*~F+~A*B*~C*D*E*~F+A*B*~C*D*E*~F+~A*~B*C*D*E*~F+A*~B*C*D*E*~F+A*B*~C*~D*~E*F+A*~B*C*~D*~E*F+A*B*C*~D*~E*F+~A*~B*~C*D*~E*F+A*~B*~C*D*~E*F+~A*B*~C*D*~E*F+A*B*~C*D*~E*F+~A*B*C*~D*E*F+~A*~B*C*D*E*F+A*~B*C*D*E*F)"),
    .INIT(64'b0011000001000000000011111010100000111111111111100001111111111110))
    ramread1_syn_236 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_237));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(A*B*~C*~D*~E*~F+~A*~B*C*D*~E*~F+A*~B*C*D*~E*~F+~A*~B*~C*~D*E*~F+~A*B*~C*~D*E*~F+A*B*~C*~D*E*~F+~A*~B*C*~D*E*~F+A*~B*C*~D*E*~F+A*B*C*~D*E*~F+A*~B*~C*D*E*~F+~A*B*~C*D*E*~F+~A*~B*C*D*E*~F+A*~B*~C*~D*~E*F+~A*~B*C*~D*~E*F+A*~B*~C*D*~E*F+A*~B*~C*~D*E*F+~A*B*~C*~D*E*F+A*B*~C*~D*E*F+~A*~B*C*~D*E*F+A*~B*C*~D*E*F+~A*B*C*~D*E*F)"),
    .INIT(64'b0000000001111110000000100001001000010110101111010011000000001000))
    ramread1_syn_238 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_239));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*B*~C*~D*~E*~F+A*B*~C*~D*~E*~F+~A*~B*C*~D*~E*~F+~A*B*~C*D*~E*~F+A*B*~C*D*~E*~F+~A*~B*~C*~D*E*~F+A*B*~C*~D*E*~F+~A*B*C*~D*E*~F+A*~B*~C*D*E*~F+~A*~B*C*D*~E*F+A*~B*~C*~D*E*F+~A*B*~C*~D*E*F+A*B*~C*~D*E*F+~A*~B*C*~D*E*F+A*~B*C*~D*E*F+~A*B*C*~D*E*F+~A*~B*~C*D*E*F+A*~B*~C*D*E*F+~A*~B*C*D*E*F)"),
    .INIT(64'b0001001101111110000100000000000000000010010010010000110000011100))
    ramread1_syn_240 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_241));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(A*~B*C*D*~E*~F+A*~B*~C*~D*~E*F+~A*B*~C*~D*~E*F+A*B*~C*~D*~E*F+~A*B*C*~D*~E*F+~A*~B*C*D*~E*F+A*~B*~C*~D*E*F+~A*~B*C*~D*E*F+A*B*C*~D*E*F+~A*~B*~C*D*E*F+A*~B*~C*D*E*F+~A*B*~C*D*E*F+A*B*~C*D*E*F+~A*~B*C*D*E*F+A*~B*C*D*E*F+~A*B*C*D*E*F)"),
    .INIT(64'b0111111110010010000100000100111000000000000000000010000000000000))
    ramread1_syn_242 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_243));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*B*~C*~D*~E*~F+A*~B*C*~D*~E*~F+~A*B*C*~D*~E*~F+A*B*C*~D*~E*~F+~A*~B*~C*D*~E*~F+A*~B*~C*D*~E*~F+~A*B*~C*D*~E*~F+A*B*~C*D*~E*~F+~A*~B*C*D*~E*~F+~A*B*~C*~D*E*~F+A*B*~C*~D*E*~F+A*~B*C*~D*E*~F+~A*~B*~C*D*E*~F+~A*B*~C*D*E*~F+A*B*~C*D*E*~F+~A*~B*~C*~D*~E*F+A*~B*~C*~D*~E*F+A*B*~C*~D*~E*F+A*~B*C*~D*~E*F+A*B*C*~D*~E*F+A*~B*~C*D*~E*F+A*B*~C*D*~E*F+A*~B*C*~D*E*F+~A*~B*~C*D*E*F+A*B*~C*D*E*F+~A*~B*C*D*E*F)"),
    .INIT(64'b0001100100100000000010101010101100001101001011000001111111100100))
    ramread1_syn_244 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_245));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(A*~B*C*~D*~E*~F+~A*B*~C*D*~E*~F+A*B*~C*D*~E*~F+~A*~B*~C*~D*E*~F+A*B*~C*~D*E*~F+A*B*C*~D*E*~F+A*B*~C*~D*~E*F+A*B*C*~D*~E*F+A*B*~C*D*~E*F+~A*~B*~C*~D*E*F+~A*~B*C*~D*E*F+A*B*C*~D*E*F+~A*~B*~C*D*E*F+~A*~B*C*D*E*F)"),
    .INIT(64'b0001000110010001000010001000100000000000100010010000110000100000))
    ramread1_syn_246 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_247));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(A*~B*~C*~D*~E*~F+A*B*~C*~D*~E*~F+A*~B*C*~D*~E*~F+~A*B*C*~D*~E*~F+~A*~B*~C*D*~E*~F+A*~B*C*D*~E*~F+A*~B*~C*~D*E*~F+~A*~B*C*D*E*~F+A*~B*C*D*E*~F+~A*~B*~C*~D*~E*F+A*~B*~C*~D*~E*F+~A*B*~C*~D*~E*F+~A*~B*C*~D*~E*F+A*~B*C*~D*~E*F+A*B*C*~D*~E*F+A*~B*~C*D*~E*F+~A*B*~C*D*~E*F+~A*~B*C*D*~E*F+~A*~B*C*~D*E*F+A*~B*C*~D*E*F+A*B*C*~D*E*F+A*~B*C*D*E*F)"),
    .INIT(64'b0010000010110000000101101011011100110000000000100010000101101010))
    ramread1_syn_248 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_249));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*~B*~C*~D*~E*~F+A*B*~C*~D*~E*~F+~A*B*C*~D*~E*~F+A*~B*~C*~D*E*~F+~A*~B*C*~D*E*~F+~A*B*C*~D*E*~F+A*~B*~C*D*E*~F+~A*~B*~C*~D*~E*F+A*~B*~C*~D*~E*F+~A*B*~C*~D*~E*F+A*B*~C*~D*~E*F+~A*~B*C*~D*~E*F+A*~B*C*~D*~E*F+~A*B*C*~D*~E*F+A*B*C*~D*~E*F+~A*~B*~C*D*~E*F+A*~B*~C*D*~E*F+~A*B*~C*D*~E*F+A*B*~C*D*~E*F+A*~B*C*D*~E*F+A*~B*~C*~D*E*F+A*B*~C*~D*E*F+A*~B*C*~D*E*F+A*B*C*~D*E*F+A*~B*~C*D*E*F+A*B*~C*D*E*F+A*~B*C*D*E*F)"),
    .INIT(64'b0010101010101010001011111111111100000010010100100000000001001001))
    ramread1_syn_250 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_251));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*~B*~C*~D*~E*~F+A*~B*~C*~D*~E*~F+A*B*~C*~D*~E*~F+~A*~B*C*~D*~E*~F+~A*B*C*~D*~E*~F+A*B*C*~D*~E*~F+A*~B*~C*D*~E*~F+~A*B*~C*D*~E*~F+~A*~B*C*D*~E*~F+~A*B*C*~D*E*~F+~A*~B*C*D*E*~F+A*B*~C*~D*~E*F+~A*B*C*~D*~E*F+A*~B*~C*D*~E*F+~A*~B*~C*~D*E*F+~A*B*C*~D*E*F+A*B*C*~D*E*F+~A*~B*~C*D*E*F+A*~B*~C*D*E*F+~A*B*~C*D*E*F+A*B*~C*D*E*F+~A*~B*C*D*E*F)"),
    .INIT(64'b0001111111000001000000100100100000010000010000000001011011011011))
    ramread1_syn_252 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_253));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(A*~B*~C*~D*~E*~F+~A*B*~C*~D*~E*~F+~A*~B*C*~D*~E*~F+~A*B*C*~D*~E*~F+A*B*C*~D*~E*~F+~A*~B*~C*D*~E*~F+A*~B*~C*D*~E*~F+~A*B*~C*D*~E*~F+A*B*~C*D*~E*~F+~A*~B*C*D*~E*~F+A*~B*~C*~D*E*~F+A*~B*C*~D*E*~F+A*B*C*~D*E*~F+A*~B*~C*D*E*~F+~A*~B*C*D*E*~F+~A*~B*~C*~D*~E*F+~A*~B*C*D*~E*F+~A*B*~C*~D*E*F+A*B*~C*~D*E*F+~A*B*C*~D*E*F+A*B*C*~D*E*F+A*~B*~C*D*E*F+~A*~B*C*D*E*F)"),
    .INIT(64'b0001001011001100000100000000000100010010101000100001111111010110))
    ramread1_syn_254 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_255));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(A*~B*~C*~D*E*~F+~A*B*~C*~D*E*~F+A*~B*~C*D*E*~F+~A*B*~C*D*E*~F+A*~B*~C*~D*E*F+~A*B*~C*~D*E*F+~A*~B*C*~D*E*F+A*~B*C*~D*E*F+~A*B*C*~D*E*F+~A*B*~C*D*E*F+A*B*~C*D*E*F)"),
    .INIT(64'b0000110001110110000000000000000000000110000001100000000000000000))
    ramread1_syn_257 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_258));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(A*~B*~C*~D*~E*~F+~A*B*~C*~D*~E*~F+~A*~B*C*~D*~E*~F+A*~B*C*~D*~E*~F+~A*B*C*~D*~E*~F+A*B*C*~D*~E*~F+~A*B*~C*D*~E*~F+A*~B*~C*~D*E*~F+~A*B*~C*~D*E*~F+A*B*~C*~D*E*~F+~A*~B*C*~D*E*~F+A*~B*C*~D*E*~F+~A*B*C*~D*E*~F+A*B*C*~D*E*~F+~A*~B*~C*D*E*~F+A*~B*~C*D*E*~F+~A*B*~C*D*E*~F+A*B*~C*D*E*~F+~A*B*~C*~D*~E*F+~A*B*C*~D*~E*F+A*B*C*~D*~E*F+~A*B*~C*D*~E*F+A*B*~C*D*~E*F+A*~B*C*~D*E*F+~A*B*~C*D*E*F+A*B*~C*D*E*F)"),
    .INIT(64'b0000110000100000000011001100010000001111111111100000010011110110))
    ramread1_syn_259 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_260));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(A*~B*~C*~D*~E*~F+~A*~B*~C*~D*E*~F+~A*~B*~C*~D*E*F+~A*B*C*~D*E*F+A*B*C*~D*E*F+~A*~B*~C*D*E*F+A*B*~C*D*E*F+~A*~B*C*D*E*F)"),
    .INIT(64'b0001100111000001000000000000000000000000000000010000000000000010))
    ramread1_syn_26 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_27));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*B*~C*~D*~E*~F+~A*~B*C*~D*~E*~F+A*~B*C*~D*~E*~F+~A*B*C*~D*~E*~F+A*~B*~C*~D*E*~F+~A*B*~C*~D*E*~F+~A*~B*C*~D*E*~F+A*~B*C*~D*E*~F+~A*B*C*~D*E*~F+~A*B*~C*D*E*~F+A*B*~C*D*E*~F+A*~B*~C*~D*~E*F+~A*B*~C*~D*~E*F+A*~B*C*~D*~E*F+~A*B*C*~D*~E*F+A*B*C*~D*~E*F+A*~B*~C*~D*E*F+~A*B*~C*~D*E*F+~A*B*C*~D*E*F+A*B*~C*D*E*F)"),
    .INIT(64'b0000100001000110000000001110011000001100011101100000000001110100))
    ramread1_syn_261 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_262));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*B*~C*~D*~E*~F+~A*B*C*~D*~E*~F+A*B*C*~D*~E*~F+A*B*~C*D*~E*~F+~A*~B*C*D*~E*~F+~A*B*~C*~D*E*~F+A*B*~C*~D*E*~F+A*~B*~C*D*E*~F+~A*B*~C*D*E*~F+A*B*~C*D*E*~F+A*B*~C*~D*~E*F+~A*~B*C*~D*~E*F+A*~B*C*~D*~E*F+~A*B*C*~D*E*F+A*B*C*~D*E*F)"),
    .INIT(64'b0000000011000000000000000011100000001110000011000001100011000100))
    ramread1_syn_263 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_264));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(A*~B*~C*~D*~E*~F+~A*~B*~C*~D*E*~F+~A*~B*C*~D*E*~F+A*~B*C*~D*E*~F+A*B*~C*~D*~E*F+~A*~B*~C*D*~E*F+~A*~B*~C*~D*E*F+~A*B*~C*~D*E*F+~A*~B*C*~D*E*F+~A*B*C*~D*E*F+A*B*C*~D*E*F+A*~B*~C*D*E*F+~A*B*~C*D*E*F+A*B*~C*D*E*F)"),
    .INIT(64'b0000111011010101000000010000100000000000001100010000000000000010))
    ramread1_syn_265 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_266));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(A*B*~C*~D*E*~F+~A*~B*C*~D*E*~F+A*B*~C*~D*~E*F+~A*B*C*~D*E*F+~A*~B*C*D*E*F+A*~B*C*D*E*F)"),
    .INIT(64'b0011000001000000000000000000100000000000000110000000000000000000))
    ramread1_syn_267 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_268));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(A*B*~C*~D*~E*~F+A*~B*C*D*~E*~F+A*~B*~C*~D*E*~F+~A*B*~C*~D*E*~F+~A*~B*C*~D*E*~F+A*~B*C*~D*E*~F+~A*~B*~C*D*E*~F+~A*B*~C*D*E*~F+~A*~B*C*D*E*~F+A*~B*~C*~D*~E*F+~A*~B*C*~D*~E*F+A*~B*~C*D*~E*F+~A*~B*C*~D*E*F+A*~B*~C*D*E*F)"),
    .INIT(64'b0000001000010000000000100001001000010101001101100010000000001000))
    ramread1_syn_269 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_270));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*B*~C*~D*~E*~F+A*~B*C*~D*~E*~F+~A*B*C*~D*~E*~F+A*B*C*~D*~E*~F+~A*~B*~C*D*~E*~F+A*~B*~C*D*~E*~F+~A*B*~C*D*~E*~F+~A*~B*~C*~D*E*~F+A*B*~C*~D*E*~F+~A*B*C*~D*E*~F+A*~B*~C*D*E*~F+~A*~B*C*D*E*~F+A*B*~C*~D*~E*F+~A*~B*C*D*~E*F+A*~B*C*D*~E*F+A*~B*~C*~D*E*F+~A*~B*C*~D*E*F+~A*~B*~C*D*E*F+~A*~B*C*D*E*F)"),
    .INIT(64'b0001000100010010001100000000100000010010010010010000011111100100))
    ramread1_syn_271 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_272));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(A*~B*~C*~D*~E*~F+~A*B*~C*~D*~E*~F+A*B*~C*~D*~E*~F+~A*~B*C*~D*~E*~F+~A*~B*C*~D*E*~F+A*B*C*~D*E*~F+~A*B*C*~D*~E*F+~A*~B*C*D*~E*F+~A*~B*~C*D*E*F)"),
    .INIT(64'b0000000100000000000100000100000000000000100100000000000000011110))
    ramread1_syn_273 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_274));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*B*~C*~D*~E*~F+A*~B*C*~D*~E*~F+~A*~B*C*D*~E*~F+~A*~B*~C*~D*E*~F+A*~B*~C*~D*E*~F+~A*B*~C*~D*E*~F+A*B*~C*~D*E*~F+~A*~B*C*~D*E*~F+A*~B*C*~D*E*~F+~A*B*C*~D*E*~F+~A*~B*~C*D*E*~F+A*B*~C*D*E*~F+~A*~B*C*D*E*~F+~A*~B*~C*~D*~E*F+A*~B*~C*~D*~E*F+A*B*~C*~D*~E*F+A*~B*C*~D*~E*F+A*B*C*~D*~E*F+A*~B*~C*D*~E*F+A*B*~C*D*~E*F+A*B*~C*~D*E*F+~A*~B*C*~D*E*F+A*B*C*~D*E*F+~A*~B*~C*D*E*F)"),
    .INIT(64'b0000000110011000000010101010101100011001011111110001000000100100))
    ramread1_syn_275 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_276));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(A*~B*C*~D*~E*~F+A*B*~C*D*~E*~F+~A*~B*~C*~D*E*~F+A*B*~C*~D*E*~F+A*B*C*~D*E*~F+A*B*~C*~D*~E*F+A*B*C*~D*~E*F+~A*B*~C*D*~E*F+A*B*~C*D*~E*F+~A*~B*~C*~D*E*F+~A*~B*C*~D*E*F+~A*B*C*~D*E*F)"),
    .INIT(64'b0000000001010001000011001000100000000000100010010000100000100000))
    ramread1_syn_277 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_278));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(A*~B*~C*~D*~E*~F+~A*~B*C*~D*~E*~F+A*~B*C*~D*~E*~F+A*B*C*~D*~E*~F+~A*~B*~C*D*~E*~F+~A*B*~C*~D*E*~F+A*B*~C*~D*E*~F+A*B*C*~D*E*~F+~A*B*~C*D*E*~F+~A*~B*~C*~D*~E*F+~A*B*~C*~D*~E*F+~A*~B*C*~D*~E*F+A*~B*C*~D*~E*F+A*B*C*~D*~E*F+A*~B*~C*D*~E*F+~A*B*~C*D*~E*F+~A*~B*C*D*~E*F+A*~B*C*~D*E*F+~A*B*~C*D*E*F+A*B*~C*D*E*F+~A*B*C*D*E*F)"),
    .INIT(64'b0100110000100000000101101011010100000100100011000000000110110010))
    ramread1_syn_279 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_280));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(A*~B*C*~D*~E*~F+~A*B*~C*D*~E*~F+A*B*~C*D*~E*~F+~A*~B*C*D*~E*~F+~A*B*~C*~D*E*~F+A*B*~C*D*E*~F+A*B*~C*D*~E*F+~A*~B*C*D*~E*F+A*~B*C*D*~E*F)"),
    .INIT(64'b0000000000000000001110000000000000001000000001000001110000100000))
    ramread1_syn_28 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_29));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*B*C*~D*~E*~F+~A*B*~C*D*~E*~F+A*~B*~C*~D*E*~F+~A*B*C*~D*E*~F+A*~B*~C*D*E*~F+~A*~B*C*D*~E*F+A*~B*C*D*~E*F+A*~B*~C*~D*E*F+A*B*~C*~D*E*F+A*~B*C*~D*E*F+A*B*C*~D*E*F+A*~B*~C*D*E*F+A*B*~C*D*E*F+A*~B*C*D*E*F)"),
    .INIT(64'b0010101010101010001100000000000000000010010000100000010001000000))
    ramread1_syn_281 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_282));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*~B*~C*~D*~E*~F+A*~B*~C*~D*~E*~F+A*B*~C*~D*~E*~F+~A*~B*C*~D*~E*~F+~A*B*C*~D*~E*~F+A*B*C*~D*~E*~F+A*~B*~C*D*~E*~F+~A*B*~C*D*~E*~F+~A*~B*C*D*~E*~F+~A*~B*~C*~D*E*~F+A*~B*~C*~D*E*~F+~A*B*~C*~D*E*~F+A*B*~C*~D*E*~F+~A*~B*C*~D*E*~F+A*~B*C*~D*E*~F+~A*B*C*~D*E*~F+A*B*C*~D*E*~F+~A*~B*~C*D*E*~F+A*~B*~C*D*E*~F+~A*B*~C*D*E*~F+A*B*~C*D*E*~F+~A*~B*C*D*E*~F+A*~B*C*D*E*~F+A*B*~C*~D*~E*F+~A*~B*C*~D*~E*F+A*~B*C*~D*~E*F+~A*B*C*~D*~E*F+A*B*C*~D*~E*F+~A*~B*~C*D*~E*F+A*~B*~C*D*~E*F+~A*B*C*~D*E*F+A*B*C*~D*E*F+~A*~B*~C*D*E*F)"),
    .INIT(64'b0000000111000000000000111111100000111111111111110001011011011011))
    ramread1_syn_283 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_284));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(A*~B*~C*~D*~E*~F+~A*B*~C*~D*~E*~F+~A*~B*C*~D*~E*~F+~A*B*C*~D*~E*~F+~A*~B*~C*D*~E*~F+~A*B*~C*D*~E*~F+~A*~B*C*D*~E*~F+A*~B*~C*~D*E*~F+~A*B*~C*~D*E*~F+A*B*~C*~D*E*~F+~A*~B*C*~D*E*~F+A*~B*C*~D*E*~F+A*B*C*~D*E*~F+A*~B*~C*D*E*~F+~A*~B*C*D*E*~F+A*~B*~C*~D*~E*F+~A*~B*~C*D*~E*F+~A*~B*C*D*~E*F+~A*B*~C*~D*E*F+A*B*~C*~D*E*F+~A*B*C*~D*E*F+A*B*C*~D*E*F+A*~B*~C*D*E*F+~A*B*~C*D*E*F+A*B*~C*D*E*F+~A*~B*C*D*E*F)"),
    .INIT(64'b0001111011001100000100010000001000010010101111100001010101010110))
    ramread1_syn_285 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_286));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(A*~B*~C*~D*E*~F+~A*B*~C*D*E*~F+A*B*~C*D*E*~F+A*~B*~C*~D*~E*F+~A*B*~C*~D*~E*F+A*B*~C*~D*~E*F+~A*~B*C*~D*~E*F+A*~B*C*~D*~E*F+~A*B*C*~D*~E*F+A*B*C*~D*~E*F+~A*~B*~C*D*~E*F+A*~B*~C*D*~E*F+~A*B*~C*D*~E*F+A*B*~C*D*~E*F+A*~B*~C*~D*E*F+~A*B*C*~D*E*F+A*B*C*~D*E*F+~A*B*~C*D*E*F+A*B*~C*D*E*F)"),
    .INIT(64'b0000110011000010000011111111111000001100000000100000000000000000))
    ramread1_syn_288 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_289));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(A*~B*~C*~D*~E*~F+A*~B*C*~D*~E*~F+~A*B*C*~D*~E*~F+A*B*~C*D*~E*~F+~A*B*~C*~D*E*~F+A*B*~C*~D*E*~F+~A*~B*~C*D*E*~F+~A*B*~C*~D*~E*F+~A*B*C*~D*~E*F+A*B*~C*D*~E*F+~A*~B*C*D*~E*F+A*~B*~C*~D*E*F+~A*B*~C*~D*E*F+A*~B*C*~D*E*F+A*B*~C*D*E*F)"),
    .INIT(64'b0000100000100110000110000100010000000001000011000000100001100010))
    ramread1_syn_290 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_291));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*B*~C*~D*~E*~F+~A*B*C*~D*~E*~F+A*B*C*~D*~E*~F+~A*~B*~C*D*~E*~F+A*~B*~C*~D*E*~F+A*~B*C*~D*E*~F+~A*B*C*~D*E*~F+A*B*~C*D*E*~F+A*~B*~C*~D*~E*F+~A*B*C*~D*~E*F+A*B*C*~D*~E*F+~A*~B*~C*D*~E*F+A*~B*~C*D*~E*F+A*B*~C*~D*E*F+~A*~B*C*~D*E*F+A*~B*C*~D*E*F+A*B*C*~D*E*F+~A*~B*~C*D*E*F+A*~B*~C*D*E*F+~A*B*~C*D*E*F)"),
    .INIT(64'b0000011110111000000000111100001000001000011000100000000111000100))
    ramread1_syn_292 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_293));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*B*~C*~D*~E*~F+~A*B*C*~D*~E*~F+A*B*C*~D*~E*~F+A*B*~C*D*~E*~F+~A*~B*C*D*~E*~F+~A*~B*C*~D*E*~F+A*~B*C*~D*E*~F+A*B*C*~D*E*~F+~A*~B*~C*D*E*~F+A*~B*~C*D*E*~F+A*~B*C*~D*~E*F+~A*B*C*~D*~E*F+A*B*C*~D*~E*F+~A*~B*~C*D*~E*F+A*~B*~C*D*~E*F+~A*B*~C*D*~E*F+A*B*~C*D*~E*F+~A*~B*C*D*~E*F+~A*B*C*~D*E*F+A*B*C*~D*E*F)"),
    .INIT(64'b0000000011000000000111111110000000000011101100000001100011000100))
    ramread1_syn_294 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_295));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(A*~B*~C*~D*~E*~F+~A*~B*~C*~D*E*~F+~A*B*C*~D*E*~F+A*B*~C*~D*~E*F+~A*~B*~C*D*~E*F+~A*~B*~C*~D*E*F+~A*B*~C*~D*E*F+A*B*~C*~D*E*F+~A*~B*C*~D*E*F+~A*B*C*~D*E*F+A*B*C*~D*E*F+A*B*~C*D*E*F+~A*~B*C*D*E*F)"),
    .INIT(64'b0001100011011101000000010000100000000000010000010000000000000010))
    ramread1_syn_296 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_297));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*~B*~C*~D*~E*~F+A*~B*C*~D*E*~F+A*B*~C*~D*~E*F+~A*~B*C*~D*~E*F+A*~B*C*~D*~E*F+~A*B*C*~D*~E*F+A*B*C*~D*~E*F+~A*~B*~C*D*~E*F+A*~B*~C*D*~E*F+~A*B*~C*D*~E*F+A*B*~C*D*~E*F+~A*~B*C*D*~E*F+~A*B*C*~D*E*F+~A*~B*C*D*E*F+A*~B*C*D*E*F)"),
    .INIT(64'b0011000001000000000111111111100000000000001000000000000000000001))
    ramread1_syn_298 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_299));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*~B*C*~D*E*~F+A*B*C*~D*E*~F+A*~B*~C*~D*~E*F+A*~B*~C*~D*E*F+~A*B*~C*~D*E*F+A*B*~C*~D*E*F+~A*~B*C*~D*E*F+A*~B*C*~D*E*F+~A*B*C*~D*E*F)"),
    .INIT(64'b0000000001111110000000000000001000000000100100000000000000000000))
    ramread1_syn_30 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_31));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*~B*~C*~D*~E*~F+A*~B*~C*~D*~E*~F+~A*B*~C*~D*~E*~F+A*B*~C*~D*~E*~F+~A*~B*C*~D*~E*~F+A*~B*C*~D*~E*~F+~A*B*C*~D*~E*~F+A*B*C*~D*~E*~F+~A*B*~C*~D*E*~F+~A*~B*C*~D*E*~F+~A*B*C*~D*E*~F+~A*~B*~C*D*E*~F+~A*B*~C*D*E*~F+~A*~B*C*D*E*~F+A*~B*~C*~D*~E*F+~A*~B*C*~D*~E*F+A*~B*~C*D*~E*F+~A*~B*C*~D*E*F+A*~B*~C*D*E*F)"),
    .INIT(64'b0000001000010000000000100001001000010101010101000000000011111111))
    ramread1_syn_300 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_301));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*B*~C*~D*~E*~F+A*B*C*~D*~E*~F+~A*~B*~C*D*~E*~F+A*~B*~C*D*~E*~F+~A*~B*~C*~D*E*~F+A*B*~C*~D*E*~F+~A*B*C*~D*E*~F+A*~B*~C*D*E*~F+A*B*~C*D*E*~F+~A*~B*C*D*E*~F+A*B*~C*~D*~E*F+~A*~B*C*~D*~E*F+A*~B*C*D*~E*F+A*~B*~C*~D*E*F+~A*~B*C*~D*E*F+~A*~B*~C*D*E*F+A*~B*C*D*E*F)"),
    .INIT(64'b0010000100010010001000000001100000011010010010010000001110000100))
    ramread1_syn_302 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_303));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(A*~B*~C*~D*~E*~F+~A*B*~C*~D*~E*~F+A*B*~C*~D*~E*~F+~A*~B*C*~D*~E*~F+A*B*C*~D*~E*~F+~A*~B*~C*D*~E*~F+A*~B*~C*D*~E*~F+~A*B*~C*D*~E*~F+A*B*~C*D*~E*~F+~A*~B*C*D*~E*~F+A*~B*C*D*~E*~F+~A*~B*C*~D*E*~F+A*B*C*~D*E*~F+~A*B*~C*~D*~E*F+~A*B*C*~D*~E*F+A*B*~C*~D*E*F+A*B*C*~D*E*F)"),
    .INIT(64'b0000000010001000000000000100010000000000100100000011111110011110))
    ramread1_syn_304 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_305));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*~B*~C*~D*~E*~F+A*~B*~C*~D*~E*~F+~A*B*~C*~D*~E*~F+A*~B*C*~D*~E*~F+~A*~B*C*D*~E*~F+~A*~B*~C*~D*E*~F+A*~B*~C*~D*E*~F+~A*B*~C*~D*E*~F+A*B*~C*~D*E*~F+~A*~B*C*~D*E*~F+A*~B*C*~D*E*~F+~A*B*C*~D*E*~F+A*B*C*~D*E*~F+~A*~B*~C*D*E*~F+A*B*~C*D*E*~F+~A*~B*C*D*E*~F+~A*~B*~C*~D*~E*F+A*~B*~C*~D*~E*F+A*B*~C*~D*~E*F+A*~B*C*~D*~E*F+A*B*C*~D*~E*F+A*~B*~C*D*~E*F+A*B*~C*D*~E*F+A*B*~C*~D*E*F+~A*~B*C*~D*E*F+~A*B*C*~D*E*F)"),
    .INIT(64'b0000000001011000000010101010101100011001111111110001000000100111))
    ramread1_syn_306 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_307));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(A*~B*C*~D*~E*~F+A*B*~C*D*~E*~F+~A*~B*C*D*~E*~F+~A*~B*~C*~D*E*~F+A*B*~C*~D*E*~F+A*B*C*~D*E*~F+A*B*~C*~D*~E*F+~A*~B*C*~D*~E*F+A*~B*C*~D*~E*F+~A*B*C*~D*~E*F+A*B*C*~D*~E*F+~A*~B*~C*D*~E*F+A*~B*~C*D*~E*F+~A*B*~C*D*~E*F+~A*~B*~C*~D*E*F+A*~B*~C*~D*E*F+~A*B*~C*~D*E*F+A*B*~C*~D*E*F+~A*~B*C*~D*E*F+A*~B*C*~D*E*F+~A*B*C*~D*E*F+A*B*C*~D*E*F+~A*~B*~C*D*E*F+A*~B*~C*D*E*F+~A*B*~C*D*E*F+A*B*~C*D*E*F+~A*~B*C*D*E*F+A*~B*C*D*E*F)"),
    .INIT(64'b0011111111111111000001111111100000000000100010010001100000100000))
    ramread1_syn_308 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_309));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(A*~B*~C*~D*~E*~F+~A*~B*C*~D*~E*~F+A*~B*C*~D*~E*~F+A*B*C*~D*~E*~F+~A*~B*~C*D*~E*~F+~A*B*~C*D*~E*~F+A*B*~C*~D*E*~F+~A*~B*C*~D*E*~F+~A*~B*~C*D*E*~F+A*B*~C*D*E*~F+~A*~B*~C*~D*~E*F+~A*B*~C*~D*~E*F+~A*~B*C*~D*~E*F+A*~B*C*~D*~E*F+~A*B*C*~D*~E*F+A*B*C*~D*~E*F+~A*~B*~C*D*~E*F+A*~B*~C*D*~E*F+~A*B*~C*D*~E*F+A*B*~C*D*~E*F+~A*~B*C*D*~E*F+~A*B*~C*~D*E*F+A*B*~C*D*E*F+~A*~B*C*D*E*F)"),
    .INIT(64'b0001100000000100000111111111010100001001000110000000010110110010))
    ramread1_syn_310 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_311));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*B*~C*D*~E*~F+A*B*~C*D*~E*~F+A*~B*~C*~D*E*~F+~A*~B*C*~D*E*~F+A*~B*C*~D*E*~F+~A*B*C*~D*E*~F+A*B*C*~D*E*~F+~A*~B*~C*D*E*~F+A*~B*~C*D*E*~F+~A*B*~C*D*E*~F+A*B*~C*D*E*~F+~A*~B*C*D*E*~F+A*~B*C*D*E*~F+~A*~B*C*D*~E*F+A*~B*~C*~D*E*F+A*B*~C*~D*E*F+A*~B*C*~D*E*F+A*B*C*~D*E*F+A*~B*~C*D*E*F+A*B*~C*D*E*F+A*~B*C*D*E*F)"),
    .INIT(64'b0010101010101010000100000000000000111111111100100000110000000000))
    ramread1_syn_312 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_313));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*~B*~C*~D*~E*~F+A*~B*~C*~D*~E*~F+A*B*~C*~D*~E*~F+~A*~B*C*~D*~E*~F+~A*B*C*~D*~E*~F+A*B*C*~D*~E*~F+A*~B*~C*D*~E*~F+~A*B*~C*D*~E*~F+~A*~B*C*D*~E*~F+~A*~B*~C*~D*E*~F+A*~B*~C*~D*E*~F+~A*B*~C*~D*E*~F+A*B*~C*~D*E*~F+~A*~B*C*~D*E*~F+A*~B*C*~D*E*~F+~A*B*C*~D*E*~F+A*B*C*~D*E*~F+~A*~B*~C*D*E*~F+A*~B*~C*D*E*~F+~A*B*~C*D*E*~F+A*B*~C*D*E*~F+~A*~B*C*D*E*~F+A*~B*C*D*E*~F+~A*~B*~C*~D*~E*F+A*~B*~C*~D*~E*F+~A*~B*~C*~D*E*F+A*~B*~C*~D*E*F+~A*B*~C*~D*E*F+A*B*~C*~D*E*F+~A*~B*C*~D*E*F+A*~B*C*~D*E*F+~A*B*C*~D*E*F+~A*~B*~C*D*E*F+A*~B*~C*D*E*F)"),
    .INIT(64'b0000001101111111000000000000001100111111111111110001011011011011))
    ramread1_syn_314 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_315));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*~B*~C*~D*~E*~F+A*~B*~C*~D*~E*~F+~A*B*~C*~D*~E*~F+A*B*~C*~D*~E*~F+~A*~B*C*~D*~E*~F+~A*B*C*~D*~E*~F+~A*~B*~C*D*~E*~F+~A*B*~C*D*~E*~F+A*~B*~C*~D*E*~F+~A*B*~C*~D*E*~F+A*~B*C*~D*E*~F+A*B*C*~D*E*~F+~A*~B*~C*D*E*~F+A*~B*~C*D*E*~F+~A*B*~C*D*E*~F+A*B*~C*D*E*~F+~A*~B*C*D*E*~F+A*~B*C*D*E*~F+A*~B*~C*~D*~E*F+~A*~B*~C*D*~E*F+~A*B*~C*~D*E*F+A*B*~C*~D*E*F+~A*~B*C*~D*E*F+A*~B*C*~D*E*F+~A*B*C*~D*E*F+A*B*C*~D*E*F)"),
    .INIT(64'b0000000011111100000000010000001000111111101001100000010101011111))
    ramread1_syn_316 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_317));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*B*C*~D*~E*~F+A*B*C*~D*~E*~F+~A*B*~C*D*~E*~F+A*B*~C*D*~E*~F)"),
    .INIT(64'b0000000000000000000000000000000000000000000000000000110011000000))
    ramread1_syn_318 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_319));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*~B*C*~D*~E*~F+A*~B*C*~D*E*~F+A*~B*~C*D*E*~F+A*~B*C*~D*~E*F+~A*~B*C*D*E*F+A*~B*C*D*E*F)"),
    .INIT(64'b0011000000000000000000000010000000000010001000000000000000010000))
    ramread1_syn_32 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_33));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(A*~B*~C*~D*E*~F+A*B*~C*D*E*~F+~A*B*~C*~D*~E*F+A*B*~C*~D*~E*F+~A*~B*C*~D*~E*F+A*~B*C*~D*~E*F+~A*B*C*~D*~E*F+A*B*C*~D*~E*F+~A*~B*~C*D*~E*F+A*~B*~C*D*~E*F+~A*B*~C*D*~E*F+A*B*~C*D*~E*F+A*~B*~C*~D*E*F+~A*~B*~C*D*E*F+~A*B*~C*D*E*F+A*B*~C*D*E*F)"),
    .INIT(64'b0000110100000010000011111111110000001000000000100000000000000000))
    ramread1_syn_321 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_322));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(A*~B*~C*~D*~E*~F+A*B*~C*D*~E*~F+A*B*~C*~D*E*~F+~A*~B*C*~D*E*~F+~A*~B*~C*D*E*~F+~A*B*~C*~D*~E*F+A*~B*C*~D*~E*F+~A*B*C*~D*~E*F+~A*~B*C*D*~E*F+~A*B*~C*~D*E*F+A*B*~C*~D*E*F+~A*~B*C*~D*E*F+A*~B*C*~D*E*F+A*B*~C*D*E*F)"),
    .INIT(64'b0000100000111100000100000110010000000001000110000000100000000010))
    ramread1_syn_323 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_324));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*B*~C*~D*~E*~F+~A*~B*~C*D*~E*~F+A*~B*~C*D*~E*~F+~A*B*~C*D*~E*~F+A*B*~C*D*~E*~F+~A*~B*C*D*~E*~F+A*~B*~C*~D*E*~F+A*~B*C*~D*E*~F+~A*B*C*~D*E*~F+A*B*~C*D*E*~F+A*~B*~C*~D*~E*F+A*B*C*~D*~E*F+A*~B*~C*D*~E*F+~A*B*~C*D*~E*F+A*B*~C*D*~E*F+~A*B*C*~D*E*F+A*B*C*~D*E*F)"),
    .INIT(64'b0000000011000000000011101000001000001000011000100001111100000100))
    ramread1_syn_325 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_326));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*B*~C*~D*~E*~F+~A*B*C*~D*~E*~F+A*B*C*~D*~E*~F+A*B*~C*D*~E*~F+~A*~B*C*D*~E*~F+A*~B*C*~D*E*~F+~A*B*C*~D*E*~F+A*B*C*~D*E*~F+~A*B*C*~D*~E*F+A*B*C*~D*~E*F+~A*~B*~C*D*~E*F+A*~B*~C*D*~E*F+~A*B*~C*D*~E*F+A*B*~C*D*~E*F+~A*~B*C*D*~E*F+~A*B*C*~D*E*F+A*B*C*~D*E*F)"),
    .INIT(64'b0000000011000000000111111100000000000000111000000001100011000100))
    ramread1_syn_327 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_328));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(A*~B*~C*~D*~E*~F+~A*~B*~C*~D*E*~F+~A*B*C*~D*E*~F+A*B*C*~D*E*~F+A*B*~C*~D*~E*F+~A*~B*~C*D*~E*F+~A*~B*~C*~D*E*F+~A*B*C*~D*E*F+A*B*C*~D*E*F+~A*~B*C*D*E*F)"),
    .INIT(64'b0001000011000001000000010000100000000000110000010000000000000010))
    ramread1_syn_329 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_330));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*~B*~C*~D*~E*~F+A*~B*~C*~D*~E*~F+~A*B*~C*~D*~E*~F+A*B*~C*~D*~E*~F+~A*~B*C*~D*~E*~F+A*~B*C*~D*~E*~F+~A*B*C*~D*~E*~F+A*B*C*~D*~E*~F+~A*~B*~C*D*~E*~F+A*~B*~C*D*~E*~F+~A*B*~C*D*~E*~F+A*B*~C*D*~E*~F+~A*~B*C*D*~E*~F+A*~B*C*D*~E*~F+~A*B*~C*~D*E*~F+A*B*~C*~D*E*~F+A*B*C*~D*E*~F+~A*~B*~C*D*E*~F+~A*~B*C*~D*~E*F+~A*~B*~C*D*~E*F+~A*~B*C*D*~E*F+A*~B*C*D*~E*F+~A*B*~C*~D*E*F+A*B*~C*~D*E*F+~A*~B*C*~D*E*F+A*~B*C*~D*E*F+~A*B*C*~D*E*F+~A*~B*C*D*E*F+A*~B*C*D*E*F)"),
    .INIT(64'b0011000001111100001100010001000000000001100011000011111111111111))
    ramread1_syn_331 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_332));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(A*B*~C*~D*~E*~F+A*B*C*~D*~E*~F+~A*~B*~C*D*~E*~F+A*~B*~C*D*~E*~F+~A*B*~C*D*~E*~F+A*B*~C*D*~E*~F+~A*B*~C*~D*E*~F+~A*~B*C*~D*E*~F+A*B*C*~D*E*~F+~A*~B*C*D*E*~F+A*~B*~C*~D*~E*F+~A*~B*C*~D*~E*F+A*~B*C*~D*~E*F+~A*B*C*~D*~E*F+A*B*C*~D*~E*F+~A*~B*~C*D*~E*F+A*~B*~C*D*~E*F+~A*B*~C*D*~E*F+A*B*~C*D*~E*F+~A*~B*~C*~D*E*F+A*~B*~C*~D*E*F+~A*B*~C*~D*E*F+A*B*~C*~D*E*F+~A*~B*C*~D*E*F+A*~B*C*~D*E*F+~A*B*C*~D*E*F+A*B*C*~D*E*F+~A*~B*~C*D*E*F+A*~B*~C*D*E*F+~A*B*~C*D*E*F)"),
    .INIT(64'b0000011111111111000011111111001000010000100101000000111110001000))
    ramread1_syn_333 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_334));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*B*~C*~D*~E*~F+~A*B*C*~D*~E*~F+A*B*C*~D*~E*~F+~A*B*~C*D*~E*~F+A*B*~C*D*~E*~F+~A*~B*~C*~D*E*~F+A*~B*~C*~D*E*~F+~A*B*~C*~D*E*~F+A*B*~C*~D*E*~F+~A*~B*C*~D*E*~F+A*~B*C*~D*E*~F+~A*B*C*~D*E*~F+A*~B*~C*D*E*~F+~A*~B*C*~D*~E*F+A*~B*C*~D*~E*F+A*~B*C*D*~E*F+A*~B*~C*~D*E*F)"),
    .INIT(64'b0000000000000010001000000011000000000010011111110000110011000100))
    ramread1_syn_335 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_336));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(A*~B*~C*~D*~E*~F+~A*~B*C*~D*~E*~F+A*B*C*~D*~E*~F+A*~B*C*D*~E*~F+~A*~B*~C*~D*E*~F+A*~B*~C*~D*E*~F+~A*B*~C*~D*E*~F+A*B*~C*~D*E*~F+~A*~B*C*~D*E*~F+A*~B*C*~D*E*~F+~A*B*C*~D*E*~F+A*B*C*~D*E*~F+~A*~B*~C*D*E*~F+A*~B*~C*D*E*~F+~A*B*~C*D*E*~F+A*B*~C*D*E*~F+~A*~B*C*D*E*~F+A*~B*C*D*E*~F+~A*~B*~C*~D*~E*F+A*~B*~C*~D*~E*F+~A*B*~C*~D*~E*F+A*B*~C*~D*~E*F+~A*~B*C*~D*~E*F+A*~B*C*~D*~E*F+~A*B*C*~D*~E*F+A*B*C*~D*~E*F+~A*~B*~C*D*~E*F+A*~B*~C*D*~E*F+~A*B*~C*D*~E*F+A*B*~C*D*~E*F+~A*~B*C*D*~E*F+~A*~B*~C*~D*E*F+A*~B*~C*~D*E*F+~A*B*~C*~D*E*F+A*B*~C*~D*E*F+~A*~B*C*~D*E*F+A*~B*C*~D*E*F+~A*B*C*~D*E*F+A*B*C*~D*E*F+~A*~B*~C*D*E*F+A*~B*~C*D*E*F+~A*B*~C*D*E*F+A*B*~C*D*E*F+~A*~B*C*D*E*F+A*~B*C*D*E*F)"),
    .INIT(64'b0011111111111111000111111111111100111111111111110010000010010010))
    ramread1_syn_337 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_338));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*~B*~C*~D*~E*~F+~A*B*~C*~D*~E*~F+A*B*~C*~D*~E*~F+~A*~B*C*~D*~E*~F+A*~B*C*~D*~E*~F+~A*B*C*~D*~E*~F+A*B*C*~D*~E*~F+~A*~B*~C*D*~E*~F+A*~B*~C*D*~E*~F+A*B*~C*~D*E*~F+~A*~B*C*~D*E*~F+A*~B*C*~D*E*~F+~A*~B*~C*D*E*~F+A*~B*~C*D*E*~F+~A*B*~C*D*E*~F+A*~B*C*D*E*~F+~A*~B*~C*~D*~E*F+A*~B*~C*~D*~E*F+~A*B*~C*~D*~E*F+A*B*~C*~D*~E*F+A*~B*C*~D*~E*F+~A*B*C*~D*~E*F+A*B*C*~D*~E*F+~A*~B*~C*D*~E*F+A*~B*~C*D*~E*F+~A*B*~C*D*~E*F+A*B*~C*D*~E*F+~A*~B*~C*~D*E*F+A*~B*~C*~D*E*F+~A*B*~C*~D*E*F+A*B*~C*~D*E*F+~A*~B*C*~D*E*F+A*~B*C*~D*E*F+~A*B*C*~D*E*F+A*B*C*~D*E*F+~A*~B*~C*D*E*F+A*~B*~C*D*E*F+~A*B*~C*D*E*F+A*B*~C*D*E*F+~A*~B*C*D*E*F+A*~B*C*D*E*F)"),
    .INIT(64'b0011111111111111000011111110111100100111001110000000001111111101))
    ramread1_syn_339 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_340));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*~B*C*D*~E*~F+A*~B*C*D*~E*~F+~A*~B*C*~D*E*~F+A*~B*C*~D*E*~F+A*~B*~C*~D*~E*F+~A*B*~C*~D*~E*F+A*B*~C*~D*~E*F+~A*B*C*~D*~E*F+~A*~B*C*D*~E*F+~A*~B*C*~D*E*F+A*B*C*~D*E*F+~A*~B*~C*D*E*F)"),
    .INIT(64'b0000000110010000000100000100111000000000001100000011000000000000))
    ramread1_syn_34 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_35));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(A*~B*C*~D*~E*~F+~A*~B*C*D*~E*~F+~A*~B*~C*~D*E*~F+A*~B*~C*~D*E*~F+~A*B*~C*~D*E*~F+A*B*~C*~D*E*~F+~A*~B*C*~D*E*~F+A*~B*C*~D*E*~F+~A*B*C*~D*E*~F+A*B*C*~D*E*~F+~A*~B*~C*D*E*~F+A*~B*~C*D*E*~F+A*B*~C*~D*~E*F+A*B*C*~D*~E*F+~A*~B*~C*D*~E*F+A*~B*~C*D*~E*F+~A*B*~C*D*~E*F+A*B*~C*D*~E*F+~A*~B*~C*~D*E*F+~A*~B*C*~D*E*F+A*~B*C*~D*E*F+~A*B*C*~D*E*F+A*B*C*~D*E*F)"),
    .INIT(64'b0000000011110001000011111000100000000011111111110001000000100000))
    ramread1_syn_341 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_342));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(A*~B*~C*~D*~E*~F+A*~B*C*~D*~E*~F+~A*~B*~C*D*~E*~F+A*B*~C*D*~E*~F+~A*~B*~C*~D*E*~F+A*~B*~C*~D*E*~F+~A*~B*C*~D*E*~F+A*~B*C*~D*E*~F+~A*B*C*~D*E*~F+~A*~B*~C*D*E*~F+A*B*~C*D*E*~F+~A*~B*~C*~D*~E*F+A*~B*~C*~D*~E*F+~A*B*~C*~D*~E*F+~A*~B*C*~D*~E*F+~A*~B*C*D*~E*F+A*~B*~C*~D*E*F+~A*B*~C*~D*E*F+A*~B*C*~D*E*F+~A*B*C*~D*E*F+A*B*C*~D*E*F+~A*~B*~C*D*E*F+A*~B*~C*D*E*F+~A*B*~C*D*E*F+A*B*~C*D*E*F+~A*~B*C*D*E*F+A*~B*C*D*E*F)"),
    .INIT(64'b0011111111100110000100000001011100001001011100110000100100100010))
    ramread1_syn_343 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_344));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(A*~B*~C*~D*~E*~F+~A*B*~C*~D*~E*~F+A*~B*C*~D*~E*~F+~A*B*C*~D*~E*~F+A*B*C*~D*~E*~F+~A*~B*~C*D*~E*~F+A*~B*~C*D*~E*~F+~A*B*~C*D*~E*~F+A*B*~C*D*~E*~F+~A*~B*C*D*~E*~F+A*~B*C*D*~E*~F+~A*~B*~C*~D*E*~F+A*~B*~C*~D*E*~F+~A*B*~C*~D*E*~F+~A*B*C*~D*E*~F+A*~B*~C*D*E*~F+A*~B*~C*~D*~E*F+~A*B*~C*~D*~E*F+~A*B*C*~D*~E*F+A*B*C*~D*~E*F+~A*~B*~C*D*~E*F+A*~B*~C*D*~E*F+~A*B*~C*D*~E*F+A*B*~C*D*~E*F+~A*~B*C*D*~E*F+A*~B*~C*~D*E*F+A*B*~C*~D*E*F+A*~B*C*~D*E*F+~A*B*C*~D*E*F+A*B*C*~D*E*F+~A*~B*~C*D*E*F+A*~B*~C*D*E*F+A*B*~C*D*E*F+A*~B*C*D*E*F)"),
    .INIT(64'b0010101111101010000111111100011000000010010001110011111111100110))
    ramread1_syn_345 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_346));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*~B*~C*~D*~E*~F+A*~B*~C*~D*~E*~F+~A*B*~C*~D*~E*~F+A*B*~C*~D*~E*~F+~A*~B*C*~D*~E*~F+~A*B*C*~D*~E*~F+A*B*C*~D*~E*~F+~A*~B*~C*D*~E*~F+A*~B*~C*D*~E*~F+~A*B*~C*D*~E*~F+~A*~B*C*D*~E*~F+~A*B*C*~D*E*~F+~A*~B*~C*~D*~E*F+~A*~B*~C*~D*E*F+A*B*~C*~D*E*F+~A*~B*C*~D*E*F+A*~B*~C*D*E*F)"),
    .INIT(64'b0000001000011001000000000000000100000000010000000001011111011111))
    ramread1_syn_347 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_348));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*~B*~C*~D*~E*~F+A*~B*~C*~D*~E*~F+~A*B*~C*~D*~E*~F+A*B*~C*~D*~E*~F+~A*~B*C*~D*~E*~F+~A*B*C*~D*~E*~F+~A*~B*~C*D*~E*~F+~A*B*~C*D*~E*~F+A*~B*~C*~D*E*~F+A*~B*C*~D*E*~F+A*B*C*~D*E*~F+~A*~B*~C*D*E*~F+A*~B*~C*D*E*~F+~A*B*~C*D*E*~F+A*B*~C*D*E*~F+~A*~B*C*D*E*~F+A*~B*C*D*E*~F+A*~B*~C*~D*~E*F+~A*B*~C*~D*~E*F+A*B*~C*~D*~E*F+~A*~B*C*~D*~E*F+A*~B*C*~D*~E*F+~A*B*C*~D*~E*F+A*B*C*~D*~E*F+~A*~B*~C*D*~E*F+~A*B*~C*~D*E*F+A*B*~C*~D*E*F+~A*B*C*~D*E*F+A*B*C*~D*E*F)"),
    .INIT(64'b0000000011001100000000011111111000111111101000100000010101011111))
    ramread1_syn_349 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_350));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(A*~B*~C*~D*E*~F+~A*B*~C*~D*E*~F+~A*B*~C*D*E*~F+A*B*~C*~D*~E*F+A*~B*~C*~D*E*F+~A*B*~C*~D*E*F+A*~B*~C*D*E*F+~A*B*~C*D*E*F+A*B*~C*D*E*F)"),
    .INIT(64'b0000111000000110000000000000100000000100000001100000000000000000))
    ramread1_syn_354 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_355));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(A*~B*~C*~D*~E*~F+~A*B*~C*~D*~E*~F+~A*B*~C*D*~E*~F+A*~B*C*~D*E*~F+~A*B*C*~D*E*~F+~A*~B*~C*D*E*~F+~A*B*~C*~D*~E*F+A*B*~C*~D*~E*F+~A*B*C*~D*~E*F+A*B*~C*D*~E*F+~A*~B*C*D*~E*F+~A*~B*C*~D*E*F+A*~B*C*~D*E*F+~A*B*C*~D*E*F+~A*B*~C*D*E*F+A*B*~C*D*E*F)"),
    .INIT(64'b0000110001110000000110000100110000000001011000000000010000000110))
    ramread1_syn_356 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_357));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*B*~C*~D*~E*~F+A*B*~C*D*~E*~F+~A*~B*C*D*~E*~F+A*~B*~C*~D*E*~F+A*~B*C*~D*E*~F+~A*B*C*~D*E*~F+~A*B*~C*D*E*~F+A*B*~C*D*E*~F+A*~B*~C*~D*~E*F+~A*B*C*~D*~E*F+A*B*C*~D*~E*F+A*B*~C*D*~E*F+A*~B*~C*~D*E*F+~A*B*~C*~D*E*F+A*B*~C*~D*E*F+~A*~B*C*~D*E*F+A*~B*C*~D*E*F+~A*~B*~C*D*E*F+A*~B*~C*D*E*F)"),
    .INIT(64'b0000001100111110000010001100001000001100011000100001100000000100))
    ramread1_syn_358 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_359));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*B*~C*~D*~E*~F+~A*~B*C*D*~E*~F+A*~B*C*D*~E*~F+A*B*~C*~D*E*~F+A*~B*C*D*E*~F+A*~B*C*~D*~E*F+~A*~B*C*D*~E*F+A*~B*C*~D*E*F+~A*B*~C*D*E*F+A*B*~C*D*E*F)"),
    .INIT(64'b0000110000100000000100000010000000100000000010000011000000000100))
    ramread1_syn_36 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_37));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*B*~C*~D*~E*~F+~A*B*C*~D*~E*~F+A*B*C*~D*~E*~F+A*B*~C*D*~E*~F+~A*~B*C*D*~E*~F+~A*B*C*~D*E*~F+A*B*C*~D*E*~F+~A*~B*C*~D*~E*F+A*~B*C*~D*~E*F+~A*B*C*~D*~E*F+~A*B*C*~D*E*F+A*B*C*~D*E*F)"),
    .INIT(64'b0000000011000000000000000111000000000000110000000001100011000100))
    ramread1_syn_360 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_361));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(A*~B*~C*~D*~E*~F+~A*~B*~C*~D*E*~F+A*B*C*~D*E*~F+~A*~B*~C*D*E*~F+A*B*~C*~D*~E*F+~A*~B*C*~D*~E*F+A*~B*C*~D*~E*F+~A*B*C*~D*~E*F+A*B*C*~D*~E*F+~A*~B*~C*D*~E*F+A*~B*~C*D*~E*F+~A*~B*~C*~D*E*F+~A*B*C*~D*E*F+A*B*C*~D*E*F+~A*~B*C*D*E*F+A*~B*C*D*E*F)"),
    .INIT(64'b0011000011000001000000111111100000000001100000010000000000000010))
    ramread1_syn_362 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_363));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(A*B*~C*~D*~E*~F+~A*~B*C*~D*~E*~F+A*~B*~C*~D*E*~F+~A*B*~C*~D*E*~F+~A*~B*~C*D*E*~F+A*~B*~C*D*E*~F+~A*B*~C*D*E*~F+A*B*~C*~D*~E*F+~A*~B*C*~D*~E*F+~A*~B*~C*D*~E*F+A*~B*~C*D*~E*F+~A*B*~C*D*~E*F+~A*B*~C*~D*E*F+A*B*~C*~D*E*F+~A*~B*C*~D*E*F+A*~B*C*~D*E*F+~A*B*C*~D*E*F+~A*~B*~C*D*E*F+A*~B*~C*D*E*F+~A*B*~C*D*E*F+A*B*~C*D*E*F+~A*~B*C*D*E*F+A*~B*C*D*E*F)"),
    .INIT(64'b0011111101111100000001110001100000000111000001100000000000011000))
    ramread1_syn_364 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_365));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(A*B*~C*~D*~E*~F+A*B*~C*D*~E*~F+~A*~B*C*D*~E*~F+A*~B*C*D*~E*~F+~A*~B*C*~D*E*~F+A*B*C*~D*E*~F+~A*~B*C*D*E*~F+A*~B*~C*~D*~E*F+~A*~B*C*~D*E*F+~A*B*~C*D*E*F)"),
    .INIT(64'b0000010000010000000000000000001000010000100100000011100000001000))
    ramread1_syn_366 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_367));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*B*~C*~D*~E*~F+A*~B*C*~D*~E*~F+~A*B*C*~D*~E*~F+A*B*~C*D*~E*~F+~A*~B*C*D*~E*~F+A*~B*~C*D*E*~F+~A*B*C*~D*~E*F+A*B*C*~D*~E*F+A*~B*C*D*~E*F+A*~B*~C*~D*E*F+~A*B*~C*~D*E*F+A*B*~C*~D*E*F+~A*~B*C*~D*E*F+A*~B*C*~D*E*F+~A*B*C*~D*E*F+A*B*C*~D*E*F+~A*~B*~C*D*E*F+A*~B*~C*D*E*F+~A*B*~C*D*E*F+A*B*~C*D*E*F)"),
    .INIT(64'b0000111111111110001000001100000000000010000000000001100001100100))
    ramread1_syn_368 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_369));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(A*~B*~C*~D*~E*~F+~A*~B*C*~D*~E*~F+A*~B*C*~D*~E*~F+~A*B*C*~D*~E*~F+A*B*C*~D*~E*~F+A*~B*C*D*~E*~F+~A*~B*C*~D*E*~F+~A*~B*~C*D*E*~F+A*~B*C*D*E*~F+~A*B*~C*~D*~E*F+A*B*C*~D*~E*F+~A*~B*C*D*~E*F+A*B*~C*~D*E*F+A*B*C*~D*E*F+~A*~B*~C*D*E*F+A*~B*C*D*E*F)"),
    .INIT(64'b0010000110001000000100001000010000100001000100000010000011110010))
    ramread1_syn_370 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_371));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*B*~C*~D*~E*~F+A*~B*~C*D*~E*~F+~A*B*~C*D*~E*~F+A*B*~C*D*~E*~F+A*~B*~C*~D*E*~F+A*B*~C*~D*E*~F+A*~B*C*~D*E*~F+~A*B*C*~D*E*~F+~A*~B*~C*D*E*~F+~A*B*~C*D*E*~F+A*~B*C*D*E*~F+A*~B*C*~D*~E*F+A*B*~C*D*~E*F+A*B*~C*~D*E*F+~A*~B*C*~D*E*F+~A*B*C*~D*E*F+A*B*C*~D*E*F+~A*~B*~C*D*E*F)"),
    .INIT(64'b0000000111011000000010000010000000100101011010100000111000000100))
    ramread1_syn_372 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_373));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(A*~B*~C*~D*~E*~F+~A*B*~C*~D*~E*~F+A*B*~C*~D*~E*~F+~A*~B*C*~D*~E*~F+A*~B*C*~D*~E*~F+~A*B*C*~D*~E*~F+A*B*C*~D*~E*~F+~A*~B*~C*D*~E*~F+A*~B*~C*D*~E*~F+~A*B*~C*D*~E*~F+A*B*~C*D*~E*~F+~A*~B*C*D*~E*~F+A*~B*C*D*~E*~F+~A*~B*~C*D*E*~F+A*~B*~C*D*E*~F+~A*B*~C*D*E*~F+A*B*~C*D*E*~F+~A*~B*C*D*E*~F+~A*~B*~C*~D*~E*F+A*~B*~C*~D*~E*F+~A*B*~C*~D*~E*F+A*B*~C*~D*~E*F+A*B*C*~D*~E*F+A*B*~C*D*~E*F+~A*~B*C*D*~E*F+A*~B*~C*~D*E*F+~A*~B*C*~D*E*F+A*B*C*~D*E*F+~A*~B*~C*D*E*F+A*~B*~C*D*E*F)"),
    .INIT(64'b0000001110010010000110001000111100011111000000000011111111111110))
    ramread1_syn_374 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_375));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(A*~B*~C*~D*~E*~F+~A*~B*~C*D*~E*~F+~A*~B*C*D*~E*~F+A*~B*~C*~D*E*~F+~A*B*~C*~D*E*~F+~A*~B*C*~D*E*~F+A*B*C*~D*E*~F+~A*~B*~C*D*E*~F+A*B*~C*D*E*~F+~A*~B*~C*~D*~E*F+A*~B*~C*~D*~E*F+~A*B*~C*~D*~E*F+~A*~B*C*~D*~E*F+~A*~B*C*D*~E*F+~A*~B*~C*~D*E*F+A*~B*~C*~D*E*F+A*~B*C*~D*E*F)"),
    .INIT(64'b0000000000100011000100000001011100001001100101100001000100000010))
    ramread1_syn_376 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_377));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*~B*~C*~D*~E*~F+A*~B*~C*~D*~E*~F+A*~B*C*~D*~E*~F+A*~B*~C*~D*E*~F+A*B*~C*~D*E*~F+~A*~B*C*~D*E*~F+~A*B*C*~D*E*~F+A*~B*~C*D*E*~F+~A*B*~C*D*E*~F+~A*~B*~C*~D*~E*F+A*~B*~C*~D*~E*F+~A*B*C*~D*~E*F+~A*~B*C*D*~E*F+A*~B*~C*~D*E*F+A*B*~C*~D*E*F+A*B*~C*D*E*F+A*~B*C*D*E*F)"),
    .INIT(64'b0010100000001010000100000100001100000110010110100000000000100011))
    ramread1_syn_378 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_379));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(A*B*~C*D*~E*~F+~A*~B*C*D*~E*~F+A*~B*~C*~D*~E*F+A*~B*C*D*~E*F+A*B*~C*~D*E*F+~A*~B*C*~D*E*F)"),
    .INIT(64'b0000000000011000001000000000001000000000000000000001100000000000))
    ramread1_syn_38 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_39));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*~B*C*~D*~E*~F+~A*B*~C*D*~E*~F+~A*~B*C*D*~E*~F+~A*B*C*~D*E*~F+~A*B*~C*~D*~E*F+A*B*~C*~D*~E*F+~A*~B*C*~D*~E*F+A*~B*C*~D*~E*F+~A*B*C*~D*~E*F+A*B*C*~D*~E*F+~A*~B*~C*D*~E*F+A*~B*~C*D*~E*F+~A*B*~C*D*~E*F+A*B*~C*D*~E*F+~A*~B*C*D*~E*F+~A*~B*~C*~D*E*F)"),
    .INIT(64'b0000000000000001000111111111110000000000010000000001010000010000))
    ramread1_syn_380 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_381));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(A*~B*~C*~D*~E*~F+~A*B*~C*~D*~E*~F+~A*~B*C*~D*~E*~F+~A*B*C*~D*~E*~F+~A*~B*~C*D*~E*~F+~A*B*~C*D*~E*~F+A*~B*~C*~D*E*~F+A*~B*C*~D*E*~F+A*~B*~C*~D*~E*F+A*~B*~C*D*~E*F+~A*B*~C*~D*E*F+A*B*C*~D*E*F+~A*~B*~C*D*E*F+A*~B*~C*D*E*F+~A*B*~C*D*E*F+A*B*~C*D*E*F+~A*~B*C*D*E*F+A*~B*C*D*E*F)"),
    .INIT(64'b0011111110000100000000100000001000000000001000100000010101010110))
    ramread1_syn_382 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_383));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*B*~C*~D*E*~F+A*B*~C*~D*E*~F+~A*~B*C*~D*E*~F+A*~B*C*~D*E*~F+~A*B*C*~D*E*~F+A*B*C*~D*E*~F+~A*~B*~C*D*E*~F+A*~B*~C*D*E*~F+A*B*~C*~D*~E*F+~A*~B*C*~D*~E*F+~A*B*~C*~D*E*F+A*B*~C*~D*E*F+~A*B*~C*D*E*F+A*B*~C*D*E*F)"),
    .INIT(64'b0000110000001100000000000001100000000011111111000000000000000000))
    ramread1_syn_385 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_386));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*B*~C*~D*~E*~F+A*B*~C*~D*~E*~F+A*~B*~C*D*~E*~F+~A*B*~C*D*~E*~F+~A*B*C*~D*E*~F+A*B*C*~D*E*~F+~A*~B*~C*D*E*~F+A*B*~C*~D*~E*F+~A*~B*C*~D*~E*F+A*~B*C*~D*~E*F+~A*B*C*~D*~E*F+A*B*C*~D*~E*F+~A*B*~C*D*~E*F+A*B*~C*D*~E*F+A*~B*C*~D*E*F+~A*B*C*~D*E*F+A*B*C*~D*E*F+~A*~B*~C*D*E*F+A*~B*~C*D*E*F+~A*B*~C*D*E*F)"),
    .INIT(64'b0000011111100000000011001111100000000001110000000000011000001100))
    ramread1_syn_387 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_388));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*B*~C*~D*~E*~F+~A*B*~C*~D*E*~F+A*B*~C*~D*E*~F+~A*~B*C*~D*E*~F+A*~B*C*~D*E*~F+~A*B*C*~D*E*~F+A*B*C*~D*E*~F+~A*~B*~C*D*E*~F+A*~B*~C*D*E*~F+~A*B*~C*D*E*~F+~A*B*~C*~D*~E*F+A*B*~C*~D*~E*F+~A*~B*C*~D*~E*F+A*~B*C*~D*~E*F+~A*B*C*~D*~E*F+A*~B*~C*~D*E*F+A*~B*C*~D*E*F+~A*B*~C*D*E*F+A*B*~C*D*E*F)"),
    .INIT(64'b0000110000100010000000000111110000000111111111000000000000000100))
    ramread1_syn_389 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_390));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*B*~C*~D*~E*~F+A*B*~C*~D*~E*~F+~A*~B*C*~D*~E*~F+A*~B*C*~D*~E*~F+~A*B*C*~D*~E*~F+A*B*C*~D*~E*~F+~A*~B*~C*D*~E*~F+A*~B*~C*D*~E*~F+~A*B*~C*D*~E*~F+A*B*~C*D*~E*~F+~A*~B*C*D*~E*~F+~A*B*~C*~D*E*~F+A*B*~C*~D*E*~F+~A*~B*C*~D*E*~F+A*~B*C*~D*E*~F+~A*B*C*~D*E*~F+A*B*C*~D*E*~F+~A*~B*~C*D*E*~F+A*~B*~C*D*E*~F+~A*B*~C*D*E*~F+A*B*~C*D*E*~F+~A*~B*C*D*E*~F+~A*B*~C*~D*~E*F+A*B*~C*~D*~E*F+~A*~B*C*~D*~E*F+~A*B*C*~D*E*F+A*B*C*~D*E*F)"),
    .INIT(64'b0000000011000000000000000001110000011111111111000001111111111100))
    ramread1_syn_391 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_392));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(A*~B*~C*~D*~E*~F+~A*~B*~C*~D*E*~F+~A*~B*~C*D*E*~F+~A*~B*~C*~D*E*F+~A*B*C*~D*E*F+A*B*C*~D*E*F+~A*~B*~C*D*E*F)"),
    .INIT(64'b0000000111000001000000000000000000000001000000010000000000000010))
    ramread1_syn_393 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_394));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(A*~B*C*~D*~E*~F+~A*B*C*~D*~E*~F+~A*~B*~C*~D*E*~F+A*~B*~C*~D*E*~F+~A*B*~C*D*E*~F+A*B*~C*D*E*~F+~A*B*~C*~D*~E*F+A*B*~C*~D*~E*F+~A*B*~C*D*~E*F+A*B*~C*D*~E*F+~A*~B*C*D*~E*F)"),
    .INIT(64'b0000000000000000000111000000110000001100000000110000000001100000))
    ramread1_syn_395 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_396));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(A*B*~C*~D*~E*~F+A*~B*C*D*~E*~F+~A*~B*C*~D*E*~F+A*B*C*~D*E*~F+~A*~B*~C*D*E*~F+A*~B*~C*~D*~E*F+~A*~B*C*~D*E*F+~A*B*~C*D*E*F)"),
    .INIT(64'b0000010000010000000000000000001000000001100100000010000000001000))
    ramread1_syn_397 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_398));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*B*~C*~D*~E*~F+~A*~B*C*D*~E*~F+A*~B*C*D*~E*~F+A*~B*~C*D*E*~F+A*B*C*~D*~E*F+A*B*~C*D*E*F+~A*~B*C*D*E*F)"),
    .INIT(64'b0001100000000000000000001000000000000010000000000011000000000100))
    ramread1_syn_399 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_400));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*~B*~C*D*~E*~F+~A*~B*C*D*~E*~F+A*~B*~C*~D*E*~F+~A*B*C*~D*E*~F+A*B*~C*D*E*~F+~A*~B*C*D*E*~F+~A*~B*C*D*~E*F+A*~B*C*~D*E*F+A*~B*C*D*E*F+~A*B*C*D*E*F)"),
    .INIT(64'b0110000000100000000100000000000000011000010000100001000100000000))
    ramread1_syn_40 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_41));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(A*~B*~C*~D*~E*~F+~A*~B*C*~D*~E*~F+A*~B*C*~D*~E*~F+~A*B*C*~D*~E*~F+A*B*C*~D*~E*~F+~A*~B*C*~D*E*~F+~A*~B*~C*D*E*~F+A*~B*~C*D*E*~F+A*~B*C*D*E*~F+~A*B*~C*~D*~E*F+A*B*C*~D*~E*F+~A*~B*~C*D*~E*F+A*B*~C*~D*E*F+~A*~B*~C*D*E*F+A*~B*C*D*E*F)"),
    .INIT(64'b0010000100001000000000011000010000100011000100000000000011110010))
    ramread1_syn_401 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_402));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*B*~C*~D*~E*~F+A*B*~C*D*~E*~F+~A*~B*C*D*~E*~F+A*B*~C*~D*E*~F+~A*B*C*~D*E*~F+~A*~B*~C*D*E*~F+~A*B*C*D*E*~F+A*~B*C*~D*~E*F+A*B*~C*D*~E*F+A*B*~C*~D*E*F+~A*~B*C*~D*E*F+A*~B*~C*D*E*F+~A*B*~C*D*E*F)"),
    .INIT(64'b0000011000011000000010000010000001000001010010000001100000000100))
    ramread1_syn_403 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_404));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*~B*C*D*~E*~F+~A*~B*C*D*E*~F+~A*B*~C*~D*~E*F+A*B*~C*~D*~E*F+~A*~B*C*~D*~E*F+A*B*C*~D*~E*F+A*~B*C*D*~E*F+~A*~B*C*~D*E*F+A*~B*~C*D*E*F+~A*B*~C*D*E*F)"),
    .INIT(64'b0000011000010000001000001001110000010000000000000001000000000000))
    ramread1_syn_405 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_406));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(A*~B*C*D*~E*~F+A*B*~C*~D*E*~F+~A*~B*C*~D*E*~F+~A*~B*~C*D*E*~F+A*B*~C*D*E*~F+~A*~B*C*D*E*~F+~A*~B*C*D*~E*F+A*~B*C*~D*E*F)"),
    .INIT(64'b0000000000100000000100000000000000011001000110000010000000000000))
    ramread1_syn_407 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_408));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(A*~B*C*~D*~E*~F+A*~B*~C*~D*E*~F+A*~B*C*~D*E*~F+~A*B*C*~D*E*~F+A*~B*~C*D*E*~F+~A*B*~C*D*E*~F+~A*B*C*~D*~E*F+A*~B*C*D*~E*F+~A*B*C*D*~E*F+A*B*~C*~D*E*F+A*~B*C*D*E*F)"),
    .INIT(64'b0010000000001000011000000100000000000110011000100000000000100000))
    ramread1_syn_409 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_410));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*~B*C*~D*~E*~F+~A*~B*C*D*~E*~F+~A*B*C*~D*E*~F+~A*B*~C*~D*~E*F+A*B*~C*~D*~E*F+~A*~B*C*~D*~E*F+A*~B*C*~D*~E*F+~A*B*C*~D*~E*F+A*B*C*~D*~E*F+~A*~B*~C*D*~E*F+A*~B*~C*D*~E*F+~A*B*~C*D*~E*F+A*B*~C*D*~E*F+~A*~B*C*D*~E*F+~A*~B*~C*~D*E*F+A*~B*~C*~D*E*F+~A*B*~C*~D*E*F+A*B*~C*~D*E*F+~A*~B*C*~D*E*F+A*~B*C*~D*E*F+~A*B*C*~D*E*F+A*B*C*~D*E*F+~A*~B*~C*D*E*F+A*~B*~C*D*E*F+~A*B*~C*D*E*F+A*B*~C*D*E*F+~A*~B*C*D*E*F)"),
    .INIT(64'b0001111111111111000111111111110000000000010000000001000000010000))
    ramread1_syn_411 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_412));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(A*~B*~C*~D*~E*~F+~A*B*~C*~D*~E*~F+~A*~B*C*~D*~E*~F+~A*B*C*~D*~E*~F+A*B*C*~D*~E*~F+~A*~B*~C*D*~E*~F+A*~B*~C*D*~E*~F+~A*B*~C*D*~E*~F+A*B*~C*D*~E*~F+~A*~B*C*D*~E*~F+A*~B*C*~D*E*~F+A*~B*~C*~D*~E*F+A*~B*~C*D*~E*F+~A*B*~C*~D*E*F+A*B*C*~D*E*F)"),
    .INIT(64'b0000000010000100000000100000001000000000001000000001111111010110))
    ramread1_syn_413 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_414));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*~B*~C*~D*~E*~F+~A*B*C*~D*~E*~F+~A*~B*C*~D*E*~F+A*B*~C*D*E*~F+A*~B*C*D*~E*F+A*B*~C*~D*E*F+A*~B*C*D*E*F)"),
    .INIT(64'b0010000000001000001000000000000000001000000100000000000001000001))
    ramread1_syn_42 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_43));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*~B*C*~D*~E*~F+~A*~B*C*D*~E*~F+~A*B*C*~D*E*~F+~A*~B*C*D*E*~F+~A*~B*~C*~D*E*F+~A*B*C*~D*E*F+A*B*C*~D*E*F+~A*~B*~C*D*E*F+A*~B*~C*D*E*F+~A*B*~C*D*E*F+A*B*~C*D*E*F+~A*~B*C*D*E*F)"),
    .INIT(64'b0001111111000001000000000000000000010000010000000001000000010000))
    ramread1_syn_44 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_45));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*B*C*~D*~E*~F+A*~B*C*~D*E*~F+~A*~B*~C*~D*~E*F+~A*~B*C*D*~E*F+~A*B*~C*~D*E*F+A*B*C*~D*E*F+~A*~B*~C*D*E*F+A*~B*~C*D*E*F+~A*B*~C*D*E*F+A*B*~C*D*E*F+~A*~B*C*D*E*F+A*~B*C*D*E*F)"),
    .INIT(64'b0011111110000100000100000000000100000000001000000000000001000000))
    ramread1_syn_46 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_47));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(A*~B*~C*~D*~E*~F+A*~B*~C*D*~E*~F+~A*~B*~C*~D*E*~F+A*B*C*~D*E*~F+~A*~B*~C*D*E*~F+A*B*~C*~D*~E*F+~A*~B*C*~D*~E*F+A*~B*C*~D*~E*F+~A*B*C*~D*~E*F+A*B*C*~D*~E*F+~A*~B*~C*D*~E*F+A*~B*~C*D*~E*F+~A*~B*~C*~D*E*F+~A*B*C*~D*E*F+A*B*C*~D*E*F+~A*~B*C*D*E*F)"),
    .INIT(64'b0001000011000001000000111111100000000001100000010000001000000010))
    ramread1_syn_51 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_52));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*~B*~C*~D*~E*~F+A*~B*C*~D*~E*~F+~A*~B*C*D*~E*~F+~A*B*~C*~D*E*~F+A*~B*C*~D*E*~F+~A*~B*~C*D*E*~F+A*B*~C*D*E*~F+A*~B*~C*~D*~E*F+A*B*~C*~D*~E*F+A*~B*C*~D*~E*F+~A*B*C*~D*~E*F+A*~B*C*D*~E*F+~A*~B*~C*D*E*F+A*~B*~C*D*E*F+~A*B*~C*D*E*F+A*B*~C*D*E*F+~A*~B*C*D*E*F+A*~B*C*D*E*F+~A*B*C*D*E*F)"),
    .INIT(64'b0111111100000000001000000110101000001001001001000001000000100001))
    ramread1_syn_53 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_54));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(A*B*~C*~D*~E*~F+~A*~B*C*~D*~E*~F+A*~B*C*~D*~E*~F+~A*B*C*~D*~E*~F+A*B*C*~D*~E*~F+~A*~B*~C*D*~E*~F+A*~B*~C*D*~E*~F+~A*B*~C*D*~E*~F+A*B*~C*D*~E*~F+~A*~B*C*D*~E*~F+A*~B*C*D*~E*~F+~A*~B*C*~D*E*~F+A*B*C*~D*E*~F+~A*~B*~C*D*E*~F+A*~B*~C*~D*~E*F+A*~B*~C*~D*E*F+~A*B*C*~D*E*F+~A*~B*~C*D*E*F+A*~B*~C*D*E*F+~A*B*~C*D*E*F+A*B*~C*D*E*F+~A*~B*C*D*E*F+A*~B*C*D*E*F)"),
    .INIT(64'b0011111101000010000000000000001000000001100100000011111111111000))
    ramread1_syn_55 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_56));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*~B*C*~D*~E*~F+~A*~B*C*~D*E*~F+A*~B*C*~D*E*~F+~A*B*C*~D*E*~F+A*~B*~C*D*E*~F+A*~B*C*~D*~E*F+A*~B*~C*~D*E*F+~A*~B*C*~D*E*F+~A*~B*C*D*E*F)"),
    .INIT(64'b0001000000010010000000000010000000000010011100000000000000010000))
    ramread1_syn_57 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_58));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*~B*~C*~D*~E*~F+A*~B*~C*~D*~E*~F+~A*B*~C*~D*~E*~F+A*B*~C*~D*~E*~F+~A*B*C*~D*~E*~F+A*B*C*~D*~E*~F+~A*~B*~C*D*~E*~F+A*~B*~C*D*~E*~F+A*B*~C*D*~E*~F+~A*~B*C*D*~E*~F+A*~B*C*~D*E*~F+~A*B*C*~D*E*~F+A*B*C*~D*E*~F+~A*~B*~C*D*E*~F+A*~B*~C*D*E*~F+~A*B*~C*D*E*~F+A*B*~C*D*E*~F+~A*~B*C*D*E*~F+A*~B*C*D*E*~F+A*~B*~C*~D*~E*F+~A*B*C*~D*~E*F+A*B*~C*D*~E*F+~A*~B*C*D*~E*F+~A*~B*~C*~D*E*F+A*~B*~C*~D*E*F+~A*B*~C*~D*E*F+~A*~B*C*~D*E*F+A*B*C*~D*E*F+~A*~B*~C*D*E*F+A*~B*~C*D*E*F+~A*B*~C*D*E*F+A*B*~C*D*E*F+~A*~B*C*D*E*F+A*~B*C*D*E*F+~A*B*C*D*E*F)"),
    .INIT(64'b0111111110010111000110000100001000111111111000000001101111001111))
    ramread1_syn_59 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_60));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*B*~C*~D*~E*~F+A*B*~C*~D*~E*~F+~A*~B*C*~D*~E*~F+~A*~B*C*D*~E*~F+A*B*~C*~D*E*~F+~A*~B*C*~D*E*~F+A*~B*C*~D*E*~F+~A*B*C*~D*E*~F+A*~B*C*D*E*~F+A*~B*C*~D*~E*F+~A*~B*C*D*~E*F+A*~B*~C*~D*E*F+A*~B*C*~D*E*F+~A*~B*~C*D*E*F+A*~B*~C*D*E*F+~A*B*~C*D*E*F)"),
    .INIT(64'b0000011100100010000100000010000000100000011110000001000000011100))
    ramread1_syn_61 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_62));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(A*B*~C*~D*~E*~F+~A*~B*C*~D*~E*~F+A*B*~C*D*~E*~F+~A*~B*C*D*~E*~F+A*~B*C*D*~E*~F+~A*~B*~C*~D*E*~F+A*~B*~C*~D*E*~F+~A*B*~C*~D*E*~F+A*B*~C*~D*E*~F+~A*~B*C*~D*E*~F+A*~B*C*~D*E*~F+~A*B*C*~D*E*~F+A*B*C*~D*E*~F+~A*~B*~C*D*E*~F+A*~B*~C*D*E*~F+~A*B*~C*D*E*~F+A*B*~C*D*E*~F+A*~B*~C*~D*~E*F+~A*~B*C*~D*~E*F+A*~B*C*~D*~E*F+~A*B*C*~D*~E*F+A*B*C*~D*~E*F+~A*~B*~C*D*~E*F+A*~B*~C*D*~E*F+~A*B*~C*D*~E*F+A*~B*C*D*~E*F+~A*B*~C*~D*E*F+A*B*~C*~D*E*F+~A*B*C*~D*E*F+A*B*C*~D*E*F+~A*~B*~C*D*E*F)"),
    .INIT(64'b0000000111001100001001111111001000001111111111110011100000011000))
    ramread1_syn_63 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_64));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*~B*~C*~D*~E*~F+A*B*C*~D*~E*~F+~A*~B*~C*D*~E*~F+A*B*~C*D*~E*~F+~A*~B*C*D*~E*~F+A*~B*~C*~D*E*~F+A*~B*C*~D*E*~F+~A*B*C*~D*E*~F+~A*~B*C*D*E*~F+~A*~B*~C*~D*~E*F+A*~B*~C*~D*~E*F+~A*B*~C*~D*~E*F+~A*~B*C*~D*~E*F+~A*~B*C*D*~E*F+A*~B*C*~D*E*F+A*~B*C*D*E*F)"),
    .INIT(64'b0010000000100000000100000001011100010000011000100001100110000001))
    ramread1_syn_65 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_66));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*~B*~C*~D*~E*~F+A*B*~C*~D*~E*~F+~A*~B*C*~D*~E*~F+A*~B*C*~D*~E*~F+~A*B*C*~D*~E*~F+A*~B*~C*D*~E*~F+~A*B*~C*D*~E*~F+A*B*~C*D*~E*~F+~A*~B*C*D*~E*~F+A*~B*C*D*~E*~F+~A*B*C*D*~E*~F+A*B*~C*~D*E*~F+~A*~B*C*~D*E*~F+~A*B*C*~D*E*~F+~A*B*~C*D*E*~F+A*B*~C*D*E*~F+~A*~B*C*D*E*~F+~A*~B*~C*~D*~E*F+A*~B*~C*~D*~E*F+~A*B*~C*~D*~E*F+A*B*~C*~D*~E*F+~A*~B*C*~D*~E*F+A*~B*C*~D*~E*F+A*B*C*~D*~E*F+~A*B*~C*D*~E*F+A*B*~C*D*~E*F+A*~B*C*D*~E*F+A*B*~C*~D*E*F+A*B*~C*D*E*F+A*~B*C*D*E*F)"),
    .INIT(64'b0010100000001000001011001011111100011100010110000111111001111001))
    ramread1_syn_67 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_68));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*~B*C*~D*~E*~F+~A*~B*C*D*~E*~F+~A*B*C*~D*E*~F+~A*~B*C*D*E*~F+A*~B*C*D*E*~F+~A*~B*~C*~D*~E*F+A*~B*~C*~D*~E*F+~A*B*~C*~D*~E*F+A*B*~C*~D*~E*F+~A*~B*C*~D*~E*F+A*~B*C*~D*~E*F+~A*B*C*~D*~E*F+A*B*C*~D*~E*F+~A*~B*~C*D*~E*F+A*~B*~C*D*~E*F+~A*B*~C*D*~E*F+A*B*~C*D*~E*F+~A*~B*C*D*~E*F+~A*~B*~C*~D*E*F+~A*B*~C*~D*E*F+A*B*~C*~D*E*F+~A*~B*C*~D*E*F+~A*B*C*~D*E*F+~A*~B*C*D*E*F)"),
    .INIT(64'b0001000001011101000111111111111100110000010000000001000000010000))
    ramread1_syn_69 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_70));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*~B*C*~D*~E*~F+A*~B*C*~D*~E*~F+~A*B*C*~D*~E*~F+A*B*C*~D*~E*~F+~A*~B*~C*D*~E*~F+A*~B*~C*D*~E*~F+A*~B*~C*~D*E*~F+A*~B*C*~D*E*~F+~A*~B*~C*~D*~E*F+A*B*~C*~D*~E*F+~A*~B*C*~D*~E*F+A*~B*C*~D*~E*F+~A*B*C*~D*~E*F+A*B*C*~D*~E*F+~A*~B*~C*D*~E*F+A*~B*~C*D*~E*F+A*B*~C*D*~E*F+~A*~B*C*D*~E*F+~A*B*~C*~D*E*F+A*B*C*~D*E*F+~A*~B*~C*D*E*F+A*~B*~C*D*E*F+~A*B*~C*D*E*F+A*B*~C*D*E*F+~A*~B*C*D*E*F+A*~B*C*D*E*F)"),
    .INIT(64'b0011111110000100000110111111100100000000001000100000001111110000))
    ramread1_syn_71 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_72));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(A*~B*~C*~D*~E*~F+~A*~B*~C*D*~E*~F+A*~B*~C*D*~E*~F+~A*~B*~C*~D*E*~F+~A*B*C*~D*E*~F+A*B*C*~D*E*~F+A*B*~C*~D*~E*F+~A*~B*~C*D*~E*F+~A*~B*~C*~D*E*F+~A*B*C*~D*E*F+A*B*C*~D*E*F+~A*~B*C*D*E*F)"),
    .INIT(64'b0001000011000001000000010000100000000000110000010000001100000010))
    ramread1_syn_76 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_77));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*~B*~C*~D*~E*~F+A*~B*C*~D*~E*~F+A*B*~C*D*~E*~F+~A*~B*C*D*~E*~F+~A*B*~C*~D*E*~F+A*~B*C*~D*E*~F+~A*~B*~C*D*E*~F+A*B*~C*D*E*~F+~A*~B*~C*~D*~E*F+A*~B*~C*~D*~E*F+A*B*~C*~D*~E*F+A*B*C*~D*~E*F+~A*~B*~C*D*~E*F+A*~B*~C*D*~E*F+A*B*~C*D*~E*F+~A*~B*C*D*~E*F+~A*B*~C*~D*E*F+A*B*~C*~D*E*F+~A*~B*C*~D*E*F+A*~B*C*~D*E*F+~A*B*C*~D*E*F+~A*~B*C*D*E*F+A*~B*C*D*E*F)"),
    .INIT(64'b0011000001111100000110111000101100001001001001000001100000100001))
    ramread1_syn_78 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_79));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(A*B*~C*~D*~E*~F+A*B*~C*D*~E*~F+~A*B*~C*~D*E*~F+A*B*~C*~D*E*~F+~A*~B*C*~D*E*~F+A*B*C*~D*E*~F+A*~B*~C*D*E*~F+A*~B*~C*~D*~E*F+~A*B*~C*~D*~E*F+A*B*~C*~D*~E*F+~A*~B*C*~D*~E*F+A*~B*C*~D*~E*F+~A*B*C*~D*~E*F+A*B*C*~D*~E*F+~A*~B*~C*D*~E*F+A*~B*~C*D*~E*F+~A*B*~C*D*~E*F+A*B*~C*D*~E*F+~A*~B*C*D*~E*F+A*~B*C*D*~E*F+~A*~B*~C*~D*E*F+A*~B*~C*~D*E*F+A*B*~C*~D*E*F+~A*~B*C*~D*E*F+~A*B*C*~D*E*F+~A*~B*~C*D*E*F+~A*B*~C*D*E*F+~A*~B*C*D*E*F)"),
    .INIT(64'b0001010101011011001111111111111000000010100111000000100000001000))
    ramread1_syn_80 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_81));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*~B*~C*~D*~E*~F+A*~B*~C*~D*~E*~F+~A*B*~C*~D*~E*~F+A*B*~C*~D*~E*~F+~A*~B*C*~D*~E*~F+A*~B*C*~D*~E*~F+~A*B*C*~D*~E*~F+A*B*C*~D*~E*~F+~A*~B*~C*D*~E*~F+A*~B*~C*D*~E*~F+~A*B*~C*D*~E*~F+A*B*~C*D*~E*~F+~A*~B*C*D*~E*~F+A*~B*C*D*~E*~F+~A*~B*~C*~D*E*~F+A*~B*~C*~D*E*~F+~A*B*~C*~D*E*~F+A*B*~C*~D*E*~F+~A*B*C*~D*E*~F+A*~B*~C*D*E*~F+~A*~B*C*~D*~E*F+~A*~B*~C*D*~E*F+A*~B*~C*~D*E*F+~A*~B*C*~D*E*F+~A*~B*~C*D*E*F+~A*~B*C*D*E*F)"),
    .INIT(64'b0001000100010010000000010001000000000010010011110011111111111111))
    ramread1_syn_82 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_83));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*~B*~C*~D*~E*~F+A*B*~C*~D*~E*~F+~A*B*C*~D*~E*~F+A*~B*~C*D*~E*~F+~A*~B*C*D*~E*~F+A*~B*~C*~D*E*~F+~A*B*~C*~D*E*~F+~A*B*C*~D*E*~F+A*B*C*~D*E*~F+~A*B*~C*D*E*~F+~A*~B*C*D*E*~F+A*~B*~C*~D*~E*F+~A*B*C*~D*~E*F+A*B*C*~D*~E*F+~A*~B*~C*D*~E*F+A*B*~C*D*~E*F+~A*~B*~C*~D*E*F+A*~B*~C*~D*E*F+~A*B*~C*~D*E*F+A*B*~C*~D*E*F+~A*~B*C*~D*E*F+~A*B*C*~D*E*F+~A*~B*~C*D*E*F+~A*B*~C*D*E*F+A*~B*C*D*E*F)"),
    .INIT(64'b0010010101011111000010011100001000010100110001100001001001001001))
    ramread1_syn_84 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_85));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*B*~C*~D*~E*~F+A*B*~C*~D*~E*~F+~A*~B*C*~D*~E*~F+A*~B*C*~D*~E*~F+~A*B*C*~D*~E*~F+A*B*C*~D*~E*~F+~A*~B*~C*D*~E*~F+A*B*~C*D*~E*~F+A*B*~C*~D*E*~F+~A*B*C*~D*E*~F+A*B*C*~D*E*~F+~A*~B*~C*D*E*~F+A*~B*~C*D*E*~F+~A*B*~C*D*E*~F+~A*~B*C*D*E*~F+~A*~B*~C*~D*~E*F+A*~B*~C*~D*~E*F+~A*B*~C*~D*~E*F+A*B*~C*~D*~E*F+A*~B*C*~D*~E*F+A*B*C*~D*~E*F+~A*~B*~C*D*~E*F+A*~B*~C*D*~E*F+A*B*~C*D*~E*F+~A*~B*C*D*~E*F+A*~B*~C*~D*E*F+A*~B*C*~D*E*F+~A*~B*~C*D*E*F)"),
    .INIT(64'b0000000100100010000110111010111100010111110010000000100111111100))
    ramread1_syn_86 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_87));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*~B*C*~D*~E*~F+A*~B*C*D*~E*~F+~A*~B*~C*~D*E*~F+A*~B*~C*~D*E*~F+~A*B*~C*~D*E*~F+A*B*~C*~D*E*~F+~A*~B*C*~D*E*~F+A*~B*C*~D*E*~F+~A*B*C*~D*E*~F+A*B*C*~D*E*~F+~A*~B*~C*D*E*~F+A*~B*~C*D*E*~F+~A*B*~C*D*E*~F+A*B*~C*D*E*~F+~A*~B*C*D*E*~F+A*~B*~C*~D*~E*F+~A*~B*C*~D*~E*F+~A*~B*~C*D*~E*F+A*~B*~C*D*~E*F+~A*B*~C*D*~E*F+A*B*~C*D*~E*F+~A*~B*C*D*~E*F+A*~B*C*D*~E*F+~A*B*~C*~D*E*F+~A*~B*~C*D*E*F+A*~B*~C*D*E*F)"),
    .INIT(64'b0000001100000100001111110001001000011111111111110010000000010000))
    ramread1_syn_88 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_89));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*~B*~C*~D*~E*~F+A*B*C*~D*~E*~F+~A*~B*~C*D*~E*~F+A*B*~C*D*~E*~F+A*~B*~C*~D*E*~F+~A*~B*C*~D*E*~F+A*~B*C*~D*E*~F+~A*B*C*~D*E*~F+~A*~B*C*D*E*~F+~A*~B*~C*~D*~E*F+~A*B*~C*~D*~E*F+~A*~B*C*~D*~E*F+A*~B*C*~D*~E*F+~A*~B*C*D*~E*F+A*~B*C*~D*E*F+A*B*C*~D*E*F+~A*~B*~C*D*E*F+A*~B*C*D*E*F)"),
    .INIT(64'b0010000110100000000100000011010100010000011100100000100110000001))
    ramread1_syn_90 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_91));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*~B*~C*~D*~E*~F+A*B*~C*~D*~E*~F+~A*~B*C*~D*~E*~F+A*~B*C*~D*~E*~F+~A*B*C*~D*~E*~F+A*~B*~C*D*~E*~F+A*~B*C*D*~E*~F+~A*B*~C*~D*E*~F+A*B*~C*~D*E*~F+~A*B*C*~D*E*~F+A*B*C*~D*E*~F+~A*~B*C*D*E*~F+~A*~B*~C*~D*~E*F+A*~B*~C*~D*~E*F+~A*B*~C*~D*~E*F+A*B*~C*~D*~E*F+~A*~B*C*~D*~E*F+A*~B*C*~D*~E*F+A*B*C*~D*~E*F+~A*~B*~C*D*~E*F+A*~B*~C*D*~E*F+~A*B*~C*D*~E*F+A*~B*C*D*~E*F+A*~B*~C*~D*E*F+A*B*~C*~D*E*F+A*~B*C*~D*E*F+~A*B*C*~D*E*F+A*B*C*~D*E*F+~A*~B*~C*D*E*F+A*~B*~C*D*E*F+A*B*~C*D*E*F+A*~B*C*D*E*F)"),
    .INIT(64'b0010101111101010001001111011111100010000110011000010001001111001))
    ramread1_syn_92 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_93));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(~A*~B*~C*~D*~E*~F+A*~B*~C*~D*~E*~F+~A*B*~C*~D*~E*~F+A*B*~C*~D*~E*~F+~A*~B*C*~D*~E*~F+~A*B*C*~D*~E*~F+A*B*C*~D*~E*~F+~A*~B*~C*D*~E*~F+A*~B*~C*D*~E*~F+~A*B*~C*D*~E*~F+~A*~B*C*D*~E*~F+~A*B*C*~D*E*~F+A*B*~C*D*E*~F+~A*~B*C*D*E*~F+~A*~B*~C*~D*~E*F+~A*~B*C*D*~E*F+~A*~B*~C*~D*E*F+~A*B*~C*~D*E*F+~A*~B*C*~D*E*F+~A*B*C*~D*E*F+A*B*C*~D*E*F+A*~B*~C*D*E*F)"),
    .INIT(64'b0000001011010101000100000000000100011000010000000001011111011111))
    ramread1_syn_94 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_95));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  AL_MAP_LUT6 #(
    .EQN("(A*~B*~C*~D*~E*~F+~A*B*~C*~D*~E*~F+~A*~B*C*~D*~E*~F+~A*B*C*~D*~E*~F+A*~B*~C*D*~E*~F+A*~B*~C*~D*E*~F+A*~B*C*~D*E*~F+A*B*C*~D*E*~F+~A*~B*~C*D*E*~F+A*~B*~C*D*E*~F+~A*B*~C*D*E*~F+A*B*~C*D*E*~F+~A*~B*C*D*E*~F+A*~B*C*D*E*~F+~A*~B*~C*~D*~E*F+A*B*~C*~D*~E*F+~A*B*~C*D*~E*F+A*B*~C*D*~E*F+~A*B*~C*~D*E*F+A*B*C*~D*E*F+A*~B*C*D*E*F+~A*B*C*D*E*F)"),
    .INIT(64'b0110000010000100000011000000100100111111101000100000001001010110))
    ramread1_syn_96 (
    .a(row1[0]),
    .b(row1[1]),
    .c(row1[2]),
    .d(row1[3]),
    .e(char_id[0]),
    .f(char_id[1]),
    .o(ramread1_syn_97));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1162)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    \rgb[0]_syn_2  (
    .ipad(rgb[0]),
    .di(\rgb[0]_dup_1 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(3)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    \rgb[10]_syn_2  (
    .ipad(rgb[10]),
    .di(\rgb[10]_dup_1 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(3)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    \rgb[11]_syn_2  (
    .ipad(rgb[11]),
    .di(\rgb[11]_dup_1 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(3)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    \rgb[12]_syn_2  (
    .ipad(rgb[12]),
    .di(\rgb[12]_dup_1 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(3)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    \rgb[13]_syn_2  (
    .ipad(rgb[13]),
    .di(\rgb[13]_dup_1 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(3)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    \rgb[14]_syn_2  (
    .ipad(rgb[14]),
    .di(\rgb[14]_dup_1 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(3)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    \rgb[15]_syn_2  (
    .ipad(rgb[15]),
    .di(\rgb[15]_dup_1 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(3)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    \rgb[16]_syn_2  (
    .ipad(rgb[16]),
    .di(\rgb[16]_dup_1 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(3)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    \rgb[17]_syn_2  (
    .ipad(rgb[17]),
    .di(\rgb[17]_dup_1 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(3)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    \rgb[18]_syn_2  (
    .ipad(rgb[18]),
    .di(\rgb[18]_dup_1 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(3)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    \rgb[19]_syn_2  (
    .ipad(rgb[19]),
    .di(\rgb[19]_dup_1 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(3)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    \rgb[1]_syn_2  (
    .ipad(rgb[1]),
    .di(\rgb[1]_dup_1 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(3)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    \rgb[20]_syn_2  (
    .ipad(rgb[20]),
    .di(\rgb[20]_dup_1 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(3)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    \rgb[21]_syn_2  (
    .ipad(rgb[21]),
    .di(\rgb[21]_dup_1 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(3)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    \rgb[22]_syn_2  (
    .ipad(rgb[22]),
    .di(\rgb[22]_dup_1 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(3)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    \rgb[23]_syn_2  (
    .ipad(rgb[23]),
    .di(\rgb[23]_dup_1 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(3)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    \rgb[2]_syn_2  (
    .ipad(rgb[2]),
    .di(\rgb[2]_dup_1 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(3)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    \rgb[3]_syn_2  (
    .ipad(rgb[3]),
    .di(\rgb[3]_dup_1 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(3)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    \rgb[4]_syn_2  (
    .ipad(rgb[4]),
    .di(\rgb[4]_dup_1 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(3)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    \rgb[5]_syn_2  (
    .ipad(rgb[5]),
    .di(\rgb[5]_dup_1 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(3)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    \rgb[6]_syn_2  (
    .ipad(rgb[6]),
    .di(\rgb[6]_dup_1 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(3)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    \rgb[7]_syn_2  (
    .ipad(rgb[7]),
    .di(\rgb[7]_dup_1 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(3)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    \rgb[8]_syn_2  (
    .ipad(rgb[8]),
    .di(\rgb[8]_dup_1 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(3)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    \rgb[9]_syn_2  (
    .ipad(rgb[9]),
    .di(\rgb[9]_dup_1 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(3)
  EG_PHY_PAD #(
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \rgb_out[0]_syn_2  (
    .do({open_n4825,open_n4826,open_n4827,\rgb_out[0]_dup_1 }),
    .opad(rgb_out[0]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)
  AL_MAP_LUT3 #(
    .EQN("(C*B*A)"),
    .INIT(8'h80))
    \rgb_out[0]_syn_3  (
    .a(rgb_out_b1_n_syn_2),
    .b(bg2[0]),
    .c(de_out_dup_3),
    .o(\rgb_out[0]_dup_1 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)
  EG_PHY_PAD #(
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \rgb_out[10]_syn_2  (
    .do({open_n4842,open_n4843,open_n4844,\rgb_out[10]_dup_1 }),
    .opad(rgb_out[10]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)
  AL_MAP_LUT3 #(
    .EQN("(C*B*A)"),
    .INIT(8'h80))
    \rgb_out[10]_syn_3  (
    .a(rgb_out_b1_n_syn_2),
    .b(bg2[10]),
    .c(de_out_dup_3),
    .o(\rgb_out[10]_dup_1 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)
  EG_PHY_PAD #(
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \rgb_out[11]_syn_2  (
    .do({open_n4859,open_n4860,open_n4861,\rgb_out[11]_dup_1 }),
    .opad(rgb_out[11]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)
  AL_MAP_LUT4 #(
    .EQN("(C*(D*~(B)*~(A)+D*B*~(A)+~(D)*B*A+D*B*A))"),
    .INIT(16'hd080))
    \rgb_out[11]_syn_3  (
    .a(rgb_out_b1_n_syn_2),
    .b(bg2[11]),
    .c(de_out_dup_3),
    .d(fg2[11]),
    .o(\rgb_out[11]_dup_1 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)
  EG_PHY_PAD #(
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \rgb_out[12]_syn_2  (
    .do({open_n4876,open_n4877,open_n4878,\rgb_out[12]_dup_1 }),
    .opad(rgb_out[12]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)
  AL_MAP_LUT4 #(
    .EQN("(C*(D*~(B)*~(A)+D*B*~(A)+~(D)*B*A+D*B*A))"),
    .INIT(16'hd080))
    \rgb_out[12]_syn_3  (
    .a(rgb_out_b1_n_syn_2),
    .b(bg2[12]),
    .c(de_out_dup_3),
    .d(fg2[12]),
    .o(\rgb_out[12]_dup_1 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)
  EG_PHY_PAD #(
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \rgb_out[13]_syn_2  (
    .do({open_n4893,open_n4894,open_n4895,\rgb_out[13]_dup_1 }),
    .opad(rgb_out[13]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)
  AL_MAP_LUT4 #(
    .EQN("(C*(D*~(B)*~(A)+D*B*~(A)+~(D)*B*A+D*B*A))"),
    .INIT(16'hd080))
    \rgb_out[13]_syn_3  (
    .a(rgb_out_b1_n_syn_2),
    .b(bg2[13]),
    .c(de_out_dup_3),
    .d(fg2[13]),
    .o(\rgb_out[13]_dup_1 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)
  EG_PHY_PAD #(
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \rgb_out[14]_syn_2  (
    .do({open_n4910,open_n4911,open_n4912,\rgb_out[14]_dup_1 }),
    .opad(rgb_out[14]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)
  AL_MAP_LUT4 #(
    .EQN("(C*(D*~(B)*~(A)+D*B*~(A)+~(D)*B*A+D*B*A))"),
    .INIT(16'hd080))
    \rgb_out[14]_syn_3  (
    .a(rgb_out_b1_n_syn_2),
    .b(bg2[14]),
    .c(de_out_dup_3),
    .d(fg2[14]),
    .o(\rgb_out[14]_dup_1 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)
  EG_PHY_PAD #(
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \rgb_out[15]_syn_2  (
    .do({open_n4927,open_n4928,open_n4929,\rgb_out[15]_dup_1 }),
    .opad(rgb_out[15]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)
  AL_MAP_LUT4 #(
    .EQN("(C*(D*~(B)*~(A)+D*B*~(A)+~(D)*B*A+D*B*A))"),
    .INIT(16'hd080))
    \rgb_out[15]_syn_3  (
    .a(rgb_out_b1_n_syn_2),
    .b(bg2[15]),
    .c(de_out_dup_3),
    .d(fg2[15]),
    .o(\rgb_out[15]_dup_1 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)
  EG_PHY_PAD #(
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \rgb_out[16]_syn_2  (
    .do({open_n4944,open_n4945,open_n4946,\rgb_out[16]_dup_1 }),
    .opad(rgb_out[16]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)
  AL_MAP_LUT3 #(
    .EQN("(C*B*A)"),
    .INIT(8'h80))
    \rgb_out[16]_syn_3  (
    .a(rgb_out_b1_n_syn_2),
    .b(bg2[16]),
    .c(de_out_dup_3),
    .o(\rgb_out[16]_dup_1 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)
  AL_MAP_LUT4 #(
    .EQN("(~(A)*~(B)*C*~(D)+A*~(B)*C*~(D)+~(A)*B*C*~(D)+A*B*C*~(D)+A*~(B)*~(C)*D+A*B*~(C)*D+~(A)*B*C*D+A*B*C*D)"),
    .INIT(16'hcaf0))
    \rgb_out[17]_syn_11  (
    .a(bits[2]),
    .b(bits[3]),
    .c(col2[0]),
    .d(col2[1]),
    .o(\rgb_out[17]_syn_12 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)
  AL_MAP_LUT4 #(
    .EQN("(A*~(B)*~(C)*~(D)+A*B*~(C)*~(D)+~(A)*B*C*~(D)+A*B*C*~(D)+~(A)*~(B)*C*D+A*~(B)*C*D+~(A)*B*C*D+A*B*C*D)"),
    .INIT(16'hf0ca))
    \rgb_out[17]_syn_13  (
    .a(bits[0]),
    .b(bits[1]),
    .c(\rgb_out[17]_syn_12 ),
    .d(col2[1]),
    .o(mux0_syn_18));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)
  AL_MAP_LUT4 #(
    .EQN("(~(A)*~(B)*C*~(D)+A*~(B)*C*~(D)+~(A)*B*C*~(D)+A*B*C*~(D)+A*~(B)*~(C)*D+A*B*~(C)*D+~(A)*B*C*D+A*B*C*D)"),
    .INIT(16'hcaf0))
    \rgb_out[17]_syn_14  (
    .a(bits[10]),
    .b(bits[11]),
    .c(col2[0]),
    .d(col2[1]),
    .o(\rgb_out[17]_syn_15 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)
  AL_MAP_LUT4 #(
    .EQN("(A*~(B)*~(C)*~(D)+A*B*~(C)*~(D)+~(A)*B*C*~(D)+A*B*C*~(D)+~(A)*~(B)*C*D+A*~(B)*C*D+~(A)*B*C*D+A*B*C*D)"),
    .INIT(16'hf0ca))
    \rgb_out[17]_syn_16  (
    .a(bits[8]),
    .b(bits[9]),
    .c(\rgb_out[17]_syn_15 ),
    .d(col2[1]),
    .o(mux0_syn_20));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)
  AL_MAP_LUT4 #(
    .EQN("(A*~(B)*~(C)*~(D)+A*B*~(C)*~(D)+~(A)*B*C*~(D)+A*B*C*~(D)+~(A)*~(B)*C*D+A*~(B)*C*D+~(A)*B*C*D+A*B*C*D)"),
    .INIT(16'hf0ca))
    \rgb_out[17]_syn_17  (
    .a(mux0_syn_18),
    .b(mux0_syn_20),
    .c(col2[3]),
    .d(col2[2]),
    .o(\rgb_out[17]_syn_18 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)
  AL_MAP_LUT4 #(
    .EQN("(~(A)*~(B)*~(C)*~(D)+A*~(B)*~(C)*~(D)+~(A)*B*~(C)*~(D)+A*B*~(C)*~(D)+~(A)*B*~(C)*D+A*B*~(C)*D+A*~(B)*C*D+A*B*C*D)"),
    .INIT(16'hac0f))
    \rgb_out[17]_syn_19  (
    .a(\rgb_out[17]_syn_6 ),
    .b(\rgb_out[17]_syn_10 ),
    .c(\rgb_out[17]_syn_18 ),
    .d(col2[2]),
    .o(rgb_out_b1_n_syn_2));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)
  EG_PHY_PAD #(
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \rgb_out[17]_syn_2  (
    .do({open_n4961,open_n4962,open_n4963,\rgb_out[17]_dup_1 }),
    .opad(rgb_out[17]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)
  AL_MAP_LUT3 #(
    .EQN("(C*B*A)"),
    .INIT(8'h80))
    \rgb_out[17]_syn_20  (
    .a(rgb_out_b1_n_syn_2),
    .b(bg2[17]),
    .c(de_out_dup_3),
    .o(\rgb_out[17]_dup_1 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)
  AL_MAP_LUT4 #(
    .EQN("(~(A)*~(B)*C*~(D)+A*~(B)*C*~(D)+~(A)*B*C*~(D)+A*B*C*~(D)+A*~(B)*~(C)*D+A*B*~(C)*D+~(A)*B*C*D+A*B*C*D)"),
    .INIT(16'hcaf0))
    \rgb_out[17]_syn_3  (
    .a(bits[14]),
    .b(bits[15]),
    .c(col2[0]),
    .d(col2[1]),
    .o(\rgb_out[17]_syn_4 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)
  AL_MAP_LUT4 #(
    .EQN("(~(A)*~(B)*~(C)*~(D)+~(A)*B*~(C)*~(D)+~(A)*~(B)*C*~(D)+A*~(B)*C*~(D)+~(A)*~(B)*~(C)*D+A*~(B)*~(C)*D+~(A)*B*~(C)*D+A*B*~(C)*D)"),
    .INIT(16'h0f35))
    \rgb_out[17]_syn_5  (
    .a(bits[12]),
    .b(bits[13]),
    .c(\rgb_out[17]_syn_4 ),
    .d(col2[1]),
    .o(\rgb_out[17]_syn_6 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)
  AL_MAP_LUT4 #(
    .EQN("(~(A)*~(B)*C*~(D)+A*~(B)*C*~(D)+~(A)*B*C*~(D)+A*B*C*~(D)+A*~(B)*~(C)*D+A*B*~(C)*D+~(A)*B*C*D+A*B*C*D)"),
    .INIT(16'hcaf0))
    \rgb_out[17]_syn_7  (
    .a(bits[6]),
    .b(bits[7]),
    .c(col2[0]),
    .d(col2[1]),
    .o(\rgb_out[17]_syn_8 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)
  AL_MAP_LUT4 #(
    .EQN("(~(A)*~(B)*~(C)*~(D)+~(A)*B*~(C)*~(D)+~(A)*~(B)*C*~(D)+A*~(B)*C*~(D)+~(A)*~(B)*~(C)*D+A*~(B)*~(C)*D+~(A)*B*~(C)*D+A*B*~(C)*D)"),
    .INIT(16'h0f35))
    \rgb_out[17]_syn_9  (
    .a(bits[4]),
    .b(bits[5]),
    .c(\rgb_out[17]_syn_8 ),
    .d(col2[1]),
    .o(\rgb_out[17]_syn_10 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)
  EG_PHY_PAD #(
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \rgb_out[18]_syn_2  (
    .do({open_n4978,open_n4979,open_n4980,\rgb_out[18]_dup_1 }),
    .opad(rgb_out[18]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)
  AL_MAP_LUT4 #(
    .EQN("(C*(D*~(B)*~(A)+D*B*~(A)+~(D)*B*A+D*B*A))"),
    .INIT(16'hd080))
    \rgb_out[18]_syn_3  (
    .a(rgb_out_b1_n_syn_2),
    .b(bg2[18]),
    .c(de_out_dup_3),
    .d(fg2[11]),
    .o(\rgb_out[18]_dup_1 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)
  EG_PHY_PAD #(
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \rgb_out[19]_syn_2  (
    .do({open_n4995,open_n4996,open_n4997,\rgb_out[19]_dup_1 }),
    .opad(rgb_out[19]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)
  AL_MAP_LUT4 #(
    .EQN("(C*(D*~(B)*~(A)+D*B*~(A)+~(D)*B*A+D*B*A))"),
    .INIT(16'hd080))
    \rgb_out[19]_syn_3  (
    .a(rgb_out_b1_n_syn_2),
    .b(bg2[19]),
    .c(de_out_dup_3),
    .d(fg2[19]),
    .o(\rgb_out[19]_dup_1 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)
  EG_PHY_PAD #(
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \rgb_out[1]_syn_2  (
    .do({open_n5012,open_n5013,open_n5014,\rgb_out[1]_dup_1 }),
    .opad(rgb_out[1]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)
  AL_MAP_LUT4 #(
    .EQN("(C*(D*~(B)*~(A)+D*B*~(A)+~(D)*B*A+D*B*A))"),
    .INIT(16'hd080))
    \rgb_out[1]_syn_3  (
    .a(rgb_out_b1_n_syn_2),
    .b(bg2[1]),
    .c(de_out_dup_3),
    .d(fg2[1]),
    .o(\rgb_out[1]_dup_1 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)
  EG_PHY_PAD #(
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \rgb_out[20]_syn_2  (
    .do({open_n5029,open_n5030,open_n5031,\rgb_out[20]_dup_1 }),
    .opad(rgb_out[20]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)
  AL_MAP_LUT4 #(
    .EQN("(C*(D*~(B)*~(A)+D*B*~(A)+~(D)*B*A+D*B*A))"),
    .INIT(16'hd080))
    \rgb_out[20]_syn_3  (
    .a(rgb_out_b1_n_syn_2),
    .b(bg2[20]),
    .c(de_out_dup_3),
    .d(fg2[20]),
    .o(\rgb_out[20]_dup_1 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)
  EG_PHY_PAD #(
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \rgb_out[21]_syn_2  (
    .do({open_n5046,open_n5047,open_n5048,\rgb_out[21]_dup_1 }),
    .opad(rgb_out[21]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)
  AL_MAP_LUT4 #(
    .EQN("(C*(D*~(B)*~(A)+D*B*~(A)+~(D)*B*A+D*B*A))"),
    .INIT(16'hd080))
    \rgb_out[21]_syn_3  (
    .a(rgb_out_b1_n_syn_2),
    .b(bg2[21]),
    .c(de_out_dup_3),
    .d(fg2[1]),
    .o(\rgb_out[21]_dup_1 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)
  EG_PHY_PAD #(
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \rgb_out[22]_syn_2  (
    .do({open_n5063,open_n5064,open_n5065,\rgb_out[22]_dup_1 }),
    .opad(rgb_out[22]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)
  AL_MAP_LUT4 #(
    .EQN("(C*(D*~(B)*~(A)+D*B*~(A)+~(D)*B*A+D*B*A))"),
    .INIT(16'hd080))
    \rgb_out[22]_syn_3  (
    .a(rgb_out_b1_n_syn_2),
    .b(bg2[22]),
    .c(de_out_dup_3),
    .d(fg2[14]),
    .o(\rgb_out[22]_dup_1 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)
  EG_PHY_PAD #(
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \rgb_out[23]_syn_2  (
    .do({open_n5080,open_n5081,open_n5082,\rgb_out[23]_dup_1 }),
    .opad(rgb_out[23]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)
  AL_MAP_LUT4 #(
    .EQN("(C*(D*~(B)*~(A)+D*B*~(A)+~(D)*B*A+D*B*A))"),
    .INIT(16'hd080))
    \rgb_out[23]_syn_3  (
    .a(rgb_out_b1_n_syn_2),
    .b(bg2[23]),
    .c(de_out_dup_3),
    .d(fg2[23]),
    .o(\rgb_out[23]_dup_1 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)
  EG_PHY_PAD #(
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \rgb_out[2]_syn_2  (
    .do({open_n5097,open_n5098,open_n5099,\rgb_out[2]_dup_1 }),
    .opad(rgb_out[2]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)
  AL_MAP_LUT3 #(
    .EQN("(C*B*A)"),
    .INIT(8'h80))
    \rgb_out[2]_syn_3  (
    .a(rgb_out_b1_n_syn_2),
    .b(bg2[2]),
    .c(de_out_dup_3),
    .o(\rgb_out[2]_dup_1 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)
  EG_PHY_PAD #(
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \rgb_out[3]_syn_2  (
    .do({open_n5114,open_n5115,open_n5116,\rgb_out[3]_dup_1 }),
    .opad(rgb_out[3]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)
  AL_MAP_LUT4 #(
    .EQN("(C*(D*~(B)*~(A)+D*B*~(A)+~(D)*B*A+D*B*A))"),
    .INIT(16'hd080))
    \rgb_out[3]_syn_3  (
    .a(rgb_out_b1_n_syn_2),
    .b(bg2[3]),
    .c(de_out_dup_3),
    .d(fg2[23]),
    .o(\rgb_out[3]_dup_1 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)
  EG_PHY_PAD #(
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \rgb_out[4]_syn_2  (
    .do({open_n5131,open_n5132,open_n5133,\rgb_out[4]_dup_1 }),
    .opad(rgb_out[4]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)
  AL_MAP_LUT4 #(
    .EQN("(C*(D*~(B)*~(A)+D*B*~(A)+~(D)*B*A+D*B*A))"),
    .INIT(16'hd080))
    \rgb_out[4]_syn_3  (
    .a(rgb_out_b1_n_syn_2),
    .b(bg2[4]),
    .c(de_out_dup_3),
    .d(fg2[19]),
    .o(\rgb_out[4]_dup_1 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)
  EG_PHY_PAD #(
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \rgb_out[5]_syn_2  (
    .do({open_n5148,open_n5149,open_n5150,\rgb_out[5]_dup_1 }),
    .opad(rgb_out[5]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)
  AL_MAP_LUT4 #(
    .EQN("(C*(D*~(B)*~(A)+D*B*~(A)+~(D)*B*A+D*B*A))"),
    .INIT(16'hd080))
    \rgb_out[5]_syn_3  (
    .a(rgb_out_b1_n_syn_2),
    .b(bg2[5]),
    .c(de_out_dup_3),
    .d(fg2[23]),
    .o(\rgb_out[5]_dup_1 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)
  EG_PHY_PAD #(
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \rgb_out[6]_syn_2  (
    .do({open_n5165,open_n5166,open_n5167,\rgb_out[6]_dup_1 }),
    .opad(rgb_out[6]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)
  AL_MAP_LUT4 #(
    .EQN("(C*(D*~(B)*~(A)+D*B*~(A)+~(D)*B*A+D*B*A))"),
    .INIT(16'hd080))
    \rgb_out[6]_syn_3  (
    .a(rgb_out_b1_n_syn_2),
    .b(bg2[6]),
    .c(de_out_dup_3),
    .d(fg2[14]),
    .o(\rgb_out[6]_dup_1 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)
  EG_PHY_PAD #(
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \rgb_out[7]_syn_2  (
    .do({open_n5182,open_n5183,open_n5184,\rgb_out[7]_dup_1 }),
    .opad(rgb_out[7]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)
  AL_MAP_LUT4 #(
    .EQN("(C*(D*~(B)*~(A)+D*B*~(A)+~(D)*B*A+D*B*A))"),
    .INIT(16'hd080))
    \rgb_out[7]_syn_3  (
    .a(rgb_out_b1_n_syn_2),
    .b(bg2[7]),
    .c(de_out_dup_3),
    .d(fg2[15]),
    .o(\rgb_out[7]_dup_1 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)
  EG_PHY_PAD #(
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \rgb_out[8]_syn_2  (
    .do({open_n5199,open_n5200,open_n5201,\rgb_out[8]_dup_1 }),
    .opad(rgb_out[8]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)
  AL_MAP_LUT4 #(
    .EQN("(C*(D*~(B)*~(A)+D*B*~(A)+~(D)*B*A+D*B*A))"),
    .INIT(16'hd080))
    \rgb_out[8]_syn_3  (
    .a(rgb_out_b1_n_syn_2),
    .b(bg2[8]),
    .c(de_out_dup_3),
    .d(fg2[19]),
    .o(\rgb_out[8]_dup_1 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)
  EG_PHY_PAD #(
    //.SLEWRATE("SLOW"),
    .DRIVE("8"),
    .IOTYPE("LVCMOS25"),
    .MODE("OUT"),
    .TSMUX("0"))
    \rgb_out[9]_syn_2  (
    .do({open_n5216,open_n5217,open_n5218,\rgb_out[9]_dup_1 }),
    .opad(rgb_out[9]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)
  AL_MAP_LUT4 #(
    .EQN("(C*(D*~(B)*~(A)+D*B*~(A)+~(D)*B*A+D*B*A))"),
    .INIT(16'hd080))
    \rgb_out[9]_syn_3  (
    .a(rgb_out_b1_n_syn_2),
    .b(bg2[9]),
    .c(de_out_dup_3),
    .d(fg2[20]),
    .o(\rgb_out[9]_dup_1 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \row1_reg[0]  (
    .clk(clk_dup_1),
    .d(\gy[0]_syn_2 ),
    .sr(rst_dup_1),
    .q(row1[0]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \row1_reg[1]  (
    .clk(clk_dup_1),
    .d(\gy[1]_syn_2 ),
    .sr(rst_dup_1),
    .q(row1[1]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \row1_reg[2]  (
    .clk(clk_dup_1),
    .d(\gy[2]_syn_2 ),
    .sr(rst_dup_1),
    .q(row1[2]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \row1_reg[3]  (
    .clk(clk_dup_1),
    .d(\gy[3]_syn_2 ),
    .sr(rst_dup_1),
    .q(row1[3]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    rst_syn_2 (
    .ipad(rst),
    .di(rst_dup_1));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(3)
  AL_MAP_LUT5 #(
    .EQN("(~E*~D*~C*~B*~A)"),
    .INIT(32'h00000001))
    sel6_syn_136 (
    .a(\brightness[4]_dup_9 ),
    .b(\brightness[3]_dup_5 ),
    .c(\brightness[2]_dup_5 ),
    .d(\brightness[1]_dup_5 ),
    .e(\brightness[0]_dup_5 ),
    .o(sel6_syn_137));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1117)
  AL_MAP_LUT2 #(
    .EQN("(~B*A)"),
    .INIT(4'h2))
    sel6_syn_138 (
    .a(sel6_syn_137),
    .b(\brightness[5]_dup_9 ),
    .o(sel6_syn_139));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1117)
  AL_MAP_LUT5 #(
    .EQN("(C*~(B*A*~(~E*D)))"),
    .INIT(32'h7070f070))
    sel6_syn_140 (
    .a(sel6_syn_139),
    .b(\bg[1]_syn_2 ),
    .c(bar_b9_n),
    .d(\brightness[7]_dup_31 ),
    .e(\brightness[6]_dup_11 ),
    .o(sel6_syn_141));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1117)
  AL_MAP_LUT3 #(
    .EQN("(~C*B*~A)"),
    .INIT(8'h04))
    sel6_syn_142 (
    .a(\bg[1]_syn_2 ),
    .b(\text_addr[5]_syn_7 ),
    .c(\contrast[5]_dup_5 ),
    .o(sel6_syn_143));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1117)
  AL_MAP_LUT3 #(
    .EQN("(C*~B*A)"),
    .INIT(8'h20))
    sel6_syn_144 (
    .a(bar_b10_n1),
    .b(bar_b9_n),
    .c(bar_b10_n),
    .o(bar_b1_n2));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1117)
  AL_MAP_LUT4 #(
    .EQN("(A*~(B*~(~D*C)))"),
    .INIT(16'h22a2))
    sel6_syn_145 (
    .a(bar_b1_n2),
    .b(\text_addr[6]_syn_16 ),
    .c(\volume[7]_dup_31 ),
    .d(\volume[6]_dup_11 ),
    .o(sel6_syn_146));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1117)
  AL_MAP_LUT5 #(
    .EQN("(E*~(~C*~(A*~(~D*B))))"),
    .INIT(32'hfaf20000))
    sel6_syn_147 (
    .a(sel6_syn_141),
    .b(sel6_syn_143),
    .c(sel6_syn_146),
    .d(\text_addr[5]_syn_9 ),
    .e(bar_b10_n),
    .o(sel6_syn_2[6]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1117)
  AL_MAP_LUT4 #(
    .EQN("(A*~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C))"),
    .INIT(16'h202a))
    sel6_syn_148 (
    .a(sel6_syn_137),
    .b(\brightness[7]_dup_31 ),
    .c(\brightness[6]_dup_11 ),
    .d(\brightness[5]_dup_9 ),
    .o(sel6_syn_149));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1117)
  AL_MAP_LUT4 #(
    .EQN("(A*~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C))"),
    .INIT(16'h202a))
    sel6_syn_150 (
    .a(\text_addr[5]_syn_7 ),
    .b(\contrast[7]_dup_21 ),
    .c(\contrast[6]_dup_7 ),
    .d(\contrast[5]_dup_5 ),
    .o(sel6_syn_151));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1117)
  AL_MAP_LUT3 #(
    .EQN("~(B*~(A)*~(C)+B*A*~(C)+~(B)*A*C+B*A*C)"),
    .INIT(8'h53))
    sel6_syn_152 (
    .a(sel6_syn_149),
    .b(sel6_syn_151),
    .c(\bg[1]_syn_2 ),
    .o(sel6_syn_60));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1117)
  AL_MAP_LUT4 #(
    .EQN("(A*~(D*~(B)*~(C)+D*B*~(C)+~(D)*B*C+D*B*C))"),
    .INIT(16'h202a))
    sel6_syn_153 (
    .a(\text_addr[7]_syn_4 ),
    .b(\volume[7]_dup_31 ),
    .c(\volume[6]_dup_11 ),
    .d(\volume[5]_dup_9 ),
    .o(sel6_syn_154));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1117)
  AL_MAP_LUT5 #(
    .EQN("(E*((C*~B)*~(A)*~(D)+(C*~B)*A*~(D)+~((C*~B))*A*D+(C*~B)*A*D))"),
    .INIT(32'haa300000))
    sel6_syn_155 (
    .a(sel6_syn_60),
    .b(sel6_syn_154),
    .c(bar_b10_n1),
    .d(bar_b9_n),
    .e(bar_b10_n),
    .o(sel6_syn_2[7]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1117)
  AL_MAP_LUT4 #(
    .EQN("(D*C*~B*A)"),
    .INIT(16'h2000))
    sel6_syn_156 (
    .a(\text_addr[5]_syn_7 ),
    .b(\contrast[7]_dup_21 ),
    .c(\contrast[6]_dup_7 ),
    .d(\contrast[5]_dup_5 ),
    .o(sel2_syn_2[0]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1117)
  AL_MAP_LUT4 #(
    .EQN("(D*C*~B*A)"),
    .INIT(16'h2000))
    sel6_syn_157 (
    .a(sel6_syn_137),
    .b(\brightness[7]_dup_31 ),
    .c(\brightness[6]_dup_11 ),
    .d(\brightness[5]_dup_9 ),
    .o(sel1_syn_2[0]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1117)
  AL_MAP_LUT4 #(
    .EQN("(D*(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C))"),
    .INIT(16'hca00))
    sel6_syn_158 (
    .a(sel2_syn_2[0]),
    .b(sel1_syn_2[0]),
    .c(\bg[1]_syn_2 ),
    .d(bar_b9_n),
    .o(sel6_syn_159));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1117)
  AL_MAP_LUT4 #(
    .EQN("(D*C*B*A)"),
    .INIT(16'h8000))
    sel6_syn_160 (
    .a(\text_addr[7]_syn_4 ),
    .b(\text_addr[6]_syn_18 ),
    .c(\volume[6]_dup_11 ),
    .d(\volume[5]_dup_9 ),
    .o(sel6_syn_161));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1117)
  AL_MAP_LUT3 #(
    .EQN("(C*~(~B*~A))"),
    .INIT(8'he0))
    sel6_syn_162 (
    .a(sel6_syn_159),
    .b(sel6_syn_161),
    .c(bar_b10_n),
    .o(sel6_syn_2[3]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1117)
  AL_MAP_LUT4 #(
    .EQN("(~D*C*B*A)"),
    .INIT(16'h0080))
    sel6_syn_163 (
    .a(\bg[1]_syn_2 ),
    .b(sel6_syn_137),
    .c(\brightness[6]_dup_11 ),
    .d(\brightness[5]_dup_9 ),
    .o(sel6_syn_164));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1117)
  AL_MAP_LUT4 #(
    .EQN("(C*~(~B*~(D*A)))"),
    .INIT(16'he0c0))
    sel6_syn_165 (
    .a(sel6_syn_143),
    .b(sel6_syn_164),
    .c(bar_b9_n),
    .d(\contrast[6]_dup_7 ),
    .o(sel6_syn_166));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1117)
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    sel6_syn_167 (
    .a(bar_b1_n2),
    .b(\text_addr[6]_syn_16 ),
    .o(sel6_syn_168));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1117)
  AL_MAP_LUT4 #(
    .EQN("(C*~(~A*~(D*B)))"),
    .INIT(16'he0a0))
    sel6_syn_169 (
    .a(sel6_syn_166),
    .b(sel6_syn_168),
    .c(bar_b10_n),
    .d(\volume[6]_dup_11 ),
    .o(sel6_syn_2[4]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1117)
  AL_MAP_LUT4 #(
    .EQN("(B*A*(D@C))"),
    .INIT(16'h0880))
    sel6_syn_170 (
    .a(sel6_syn_139),
    .b(\bg[1]_syn_2 ),
    .c(\brightness[7]_dup_31 ),
    .d(\brightness[6]_dup_11 ),
    .o(sel6_syn_171));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1117)
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    sel6_syn_172 (
    .a(bar_b9_n),
    .b(bar_b10_n),
    .o(sel6_syn_173));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1117)
  AL_MAP_LUT5 #(
    .EQN("(C*~(~A*~(B*(E@D))))"),
    .INIT(32'ha0e0e0a0))
    sel6_syn_174 (
    .a(sel6_syn_171),
    .b(sel6_syn_143),
    .c(sel6_syn_173),
    .d(\contrast[7]_dup_21 ),
    .e(\contrast[6]_dup_7 ),
    .o(sel6_syn_175));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1117)
  AL_MAP_LUT4 #(
    .EQN("~(~A*~(B*(D@C)))"),
    .INIT(16'haeea))
    sel6_syn_176 (
    .a(sel6_syn_175),
    .b(sel6_syn_168),
    .c(\volume[7]_dup_31 ),
    .d(\volume[6]_dup_11 ),
    .o(sel6_syn_2[5]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1117)
  EG_PHY_LSLICE #(
    //.MACRO("sub0_syn_58"),
    //.R_POSITION("X0Y0Z0"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'h0005),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    sub0_syn_58 (
    .a({x[4],1'b0}),
    .b({x[5],x[3]}),
    .c(2'b11),
    .d(2'b01),
    .e(2'b11),
    .f({sub0_syn_3[1],open_n5270}),
    .fco(sub0_syn_52),
    .fx({sub0_syn_3[2],open_n5271}));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1115)
  EG_PHY_LSLICE #(
    //.MACRO("sub0_syn_58"),
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
    sub0_syn_59 (
    .a({x[8],x[6]}),
    .b({x[9],x[7]}),
    .c(2'b11),
    .d(2'b01),
    .e(2'b00),
    .fci(sub0_syn_52),
    .f({open_n5290,sub0_syn_3[3]}),
    .fco(sub0_syn_56),
    .fx({sub0_syn_3[6],open_n5291}));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1115)
  EG_PHY_LSLICE #(
    //.MACRO("sub0_syn_58"),
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
    sub0_syn_60 (
    .c(2'b11),
    .fci(sub0_syn_56),
    .f({open_n5318,sub0_syn_3[7]}));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1115)
  AL_MAP_LUT2 #(
    .EQN("~(B@A)"),
    .INIT(4'h9))
    sub2_syn_26 (
    .a(x[8]),
    .b(x[9]),
    .o(sub2_syn_3[1]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1125)
  AL_MAP_LUT2 #(
    .EQN("(~B*~A)"),
    .INIT(4'h1))
    sub2_syn_27 (
    .a(x[8]),
    .b(x[9]),
    .o(sub2_syn_3[2]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1125)
  EG_PHY_LSLICE #(
    //.MACRO("sub4_syn_57"),
    //.R_POSITION("X0Y0Z0"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'h0005),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    sub4_syn_57 (
    .a({x[4],1'b0}),
    .b({x[5],x[3]}),
    .c(2'b11),
    .d(2'b11),
    .e(2'b11),
    .fco(sub4_syn_51),
    .fx({sub4_syn_3[2],open_n5343}));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1148)
  EG_PHY_LSLICE #(
    //.MACRO("sub4_syn_57"),
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
    sub4_syn_58 (
    .a({x[8],x[6]}),
    .b({x[9],x[7]}),
    .c(2'b11),
    .d(2'b00),
    .e(2'b01),
    .fci(sub4_syn_51),
    .f({sub4_syn_3[5],sub4_syn_3[3]}),
    .fco(sub4_syn_55),
    .fx({open_n5362,sub4_syn_3[4]}));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1148)
  EG_PHY_LSLICE #(
    //.MACRO("sub4_syn_57"),
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
    sub4_syn_59 (
    .c(2'b11),
    .fci(sub4_syn_55),
    .f({open_n5389,sub4_syn_3[7]}));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1148)
  EG_PHY_LSLICE #(
    //.MACRO("sub7_syn_52"),
    //.R_POSITION("X0Y0Z0"),
    .DEMUX0("E"),
    .DEMUX1("E"),
    .INIT_LUTF0(16'h0005),
    .INIT_LUTF1(16'hA55A),
    .INIT_LUTG0(16'hC33C),
    .INIT_LUTG1(16'hC33C),
    .LSFMUX0("SUM"),
    .LSFMUX1("SUM"),
    .LSFXMUX0("SUM"),
    .LSFXMUX1("SUM"),
    .MODE("RIPPLE"))
    sub7_syn_52 (
    .a({x[4],1'b0}),
    .b({x[5],x[3]}),
    .c(2'b11),
    .d(2'b11),
    .e({eq5_syn_19,footer_left[3]}),
    .f({sub7_syn_4[1],open_n5412}),
    .fco(sub7_syn_47),
    .fx({sub7_syn_4[2],sub7_syn_4[0]}));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1151)
  EG_PHY_LSLICE #(
    //.MACRO("sub7_syn_52"),
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
    sub7_syn_53 (
    .a({x[8],x[6]}),
    .b({x[9],x[7]}),
    .c(2'b11),
    .d({1'b0,footer_left[3]}),
    .e(2'b01),
    .fci(sub7_syn_47),
    .f({sub7_syn_4[5],sub7_syn_4[3]}),
    .fx({sub7_syn_4[6],sub7_syn_4[4]}));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1151)
  AL_MAP_LUT5 #(
    .EQN("(~(~D*~B)*(C*~(E)*~(A)+C*E*~(A)+~(C)*E*A+C*E*A))"),
    .INIT(32'hfac85040))
    \text_addr[0]_syn_11  (
    .a(\gx[2]_syn_38 ),
    .b(\text_addr[5]_syn_11 ),
    .c(\text_addr[0]_syn_8 ),
    .d(\text_addr[5]_syn_13 ),
    .e(sub0_syn_3[1]),
    .o(\text_addr[0]_syn_12 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT3 #(
    .EQN("(~C*~B*~A)"),
    .INIT(8'h01))
    \text_addr[0]_syn_13  (
    .a(\text_addr[6]_syn_34 ),
    .b(\text_addr[6]_syn_23 ),
    .c(x[4]),
    .o(\text_addr[0]_syn_14 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT4 #(
    .EQN("~(A*~((~C*~B))*~(D)+A*(~C*~B)*~(D)+~(A)*(~C*~B)*D+A*(~C*~B)*D)"),
    .INIT(16'hfc55))
    \text_addr[0]_syn_15  (
    .a(\text_addr[0]_syn_10 ),
    .b(\text_addr[0]_syn_12 ),
    .c(\text_addr[0]_syn_14 ),
    .d(\text_addr[6]_syn_36 ),
    .o(\text_addr[0]_syn_4 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT5 #(
    .EQN("(A*((~D*C)*~(E)*~(B)+(~D*C)*E*~(B)+~((~D*C))*E*B+(~D*C)*E*B))"),
    .INIT(32'h88a80020))
    \text_addr[0]_syn_5  (
    .a(\gx[2]_syn_17 ),
    .b(\gx[2]_syn_19 ),
    .c(\gx[2]_syn_21 ),
    .d(sub0_syn_3[1]),
    .e(sub7_syn_4[1]),
    .o(\text_addr[0]_syn_6 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT5 #(
    .EQN("(~E*D*~C*~B*A)"),
    .INIT(32'h00000200))
    \text_addr[0]_syn_7  (
    .a(\gx[2]_syn_40 ),
    .b(\gx[2]_syn_42 ),
    .c(\gx[2]_syn_44 ),
    .d(lt38_syn_28),
    .e(x[5]),
    .o(\text_addr[0]_syn_8 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT5 #(
    .EQN("(~C*~(A*(D*~(E)*~(B)+D*E*~(B)+~(D)*E*B+D*E*B)))"),
    .INIT(32'h05070d0f))
    \text_addr[0]_syn_9  (
    .a(\gy[3]_syn_5 ),
    .b(\text_addr[1]_syn_8 ),
    .c(\text_addr[0]_syn_6 ),
    .d(\text_addr[0]_syn_8 ),
    .e(sub0_syn_3[1]),
    .o(\text_addr[0]_syn_10 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT2 #(
    .EQN("~(B@A)"),
    .INIT(4'h9))
    \text_addr[1]_syn_11  (
    .a(x[5]),
    .b(x[6]),
    .o(\text_addr[1]_syn_12 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT5 #(
    .EQN("(~E*D*~C*~B*A)"),
    .INIT(32'h00000200))
    \text_addr[1]_syn_13  (
    .a(\gx[2]_syn_40 ),
    .b(\gx[2]_syn_42 ),
    .c(\gx[2]_syn_44 ),
    .d(lt38_syn_28),
    .e(\text_addr[1]_syn_12 ),
    .o(\text_addr[1]_syn_14 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT5 #(
    .EQN("(~C*~(A*(D*~(E)*~(B)+D*E*~(B)+~(D)*E*B+D*E*B)))"),
    .INIT(32'h05070d0f))
    \text_addr[1]_syn_15  (
    .a(\gy[3]_syn_5 ),
    .b(\text_addr[1]_syn_8 ),
    .c(\text_addr[1]_syn_10 ),
    .d(\text_addr[1]_syn_14 ),
    .e(sub0_syn_3[2]),
    .o(\text_addr[1]_syn_16 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT3 #(
    .EQN("~(A*~(B)*~(C)+A*B*~(C)+~(A)*B*C+A*B*C)"),
    .INIT(8'h35))
    \text_addr[1]_syn_17  (
    .a(\text_addr[1]_syn_14 ),
    .b(sub0_syn_3[2]),
    .c(direct_n41),
    .o(\text_addr[1]_syn_18 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT5 #(
    .EQN("(~C*B*A*~(E@D))"),
    .INIT(32'h08000008))
    \text_addr[1]_syn_19  (
    .a(\text_addr[6]_syn_16 ),
    .b(\text_addr[6]_syn_18 ),
    .c(\volume[6]_dup_11 ),
    .d(x[4]),
    .e(x[5]),
    .o(\text_addr[1]_syn_20 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT3 #(
    .EQN("(~A*(C@B))"),
    .INIT(8'h14))
    \text_addr[1]_syn_21  (
    .a(\text_addr[6]_syn_23 ),
    .b(x[4]),
    .c(x[5]),
    .o(\text_addr[1]_syn_22 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT4 #(
    .EQN("~(D*~((~B*~A))*~(C)+D*(~B*~A)*~(C)+~(D)*(~B*~A)*C+D*(~B*~A)*C)"),
    .INIT(16'he0ef))
    \text_addr[1]_syn_23  (
    .a(\text_addr[1]_syn_20 ),
    .b(\text_addr[7]_syn_6 ),
    .c(\text_addr[6]_syn_27 ),
    .d(\text_addr[1]_syn_22 ),
    .o(\text_addr[1]_syn_24 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT3 #(
    .EQN("(~A*~(~C*~B))"),
    .INIT(8'h54))
    \text_addr[1]_syn_25  (
    .a(\text_addr[1]_syn_20 ),
    .b(\text_addr[6]_syn_27 ),
    .c(\text_addr[6]_syn_23 ),
    .o(\text_addr[1]_syn_26 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT5 #(
    .EQN("(~A*~((C*~(D*B)))*~(E)+~A*(C*~(D*B))*~(E)+~(~A)*(C*~(D*B))*E+~A*(C*~(D*B))*E)"),
    .INIT(32'h30f05555))
    \text_addr[1]_syn_27  (
    .a(\text_addr[1]_syn_16 ),
    .b(\text_addr[1]_syn_18 ),
    .c(\text_addr[1]_syn_24 ),
    .d(\text_addr[1]_syn_26 ),
    .e(\text_addr[6]_syn_36 ),
    .o(\text_addr[1]_syn_4 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT5 #(
    .EQN("(~E*C*B*~(D*~A))"),
    .INIT(32'h000080c0))
    \text_addr[1]_syn_5  (
    .a(lt38_syn_28),
    .b(direct_n41),
    .c(bar_b_n1),
    .d(y[8]),
    .e(y[9]),
    .o(\text_addr[1]_syn_6 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT4 #(
    .EQN("(C*~A*~(D@B))"),
    .INIT(16'h4010))
    \text_addr[1]_syn_7  (
    .a(\gx[2]_syn_30 ),
    .b(\gx[2]_syn_36 ),
    .c(\text_addr[1]_syn_6 ),
    .d(y[5]),
    .o(\text_addr[1]_syn_8 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT5 #(
    .EQN("(A*((D*C)*~(E)*~(B)+(D*C)*E*~(B)+~((D*C))*E*B+(D*C)*E*B))"),
    .INIT(32'ha8882000))
    \text_addr[1]_syn_9  (
    .a(\gx[2]_syn_17 ),
    .b(\gx[2]_syn_19 ),
    .c(\gx[2]_syn_21 ),
    .d(sub4_syn_3[2]),
    .e(sub7_syn_4[2]),
    .o(\text_addr[1]_syn_10 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT3 #(
    .EQN("~(C@(~B*~A))"),
    .INIT(8'h1e))
    \text_addr[2]_syn_11  (
    .a(x[4]),
    .b(x[5]),
    .c(x[6]),
    .o(sub3_syn_4[2]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT5 #(
    .EQN("~(~A*~(D)*~((~(E*B)*~C))+~A*D*~((~(E*B)*~C))+~(~A)*D*(~(E*B)*~C)+~A*D*(~(E*B)*~C))"),
    .INIT(32'ha8aba0af))
    \text_addr[2]_syn_12  (
    .a(\text_addr[2]_syn_10 ),
    .b(\text_addr[7]_syn_6 ),
    .c(\text_addr[5]_syn_13 ),
    .d(sub3_syn_4[2]),
    .e(\text_addr[6]_syn_27 ),
    .o(\text_addr[2]_syn_13 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT5 #(
    .EQN("(A*(C*~(E)*~((D*B))+C*E*~((D*B))+~(C)*E*(D*B)+C*E*(D*B)))"),
    .INIT(32'ha8a020a0))
    \text_addr[2]_syn_14  (
    .a(\gy[3]_syn_5 ),
    .b(\gx[2]_syn_38 ),
    .c(\text_addr[2]_syn_8 ),
    .d(\gx[2]_syn_26 ),
    .e(sub0_syn_3[3]),
    .o(\text_addr[2]_syn_15 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT5 #(
    .EQN("(A*((D*C)*~(E)*~(B)+(D*C)*E*~(B)+~((D*C))*E*B+(D*C)*E*B))"),
    .INIT(32'ha8882000))
    \text_addr[2]_syn_16  (
    .a(\gx[2]_syn_17 ),
    .b(\gx[2]_syn_19 ),
    .c(\gx[2]_syn_21 ),
    .d(sub4_syn_3[3]),
    .e(sub7_syn_4[3]),
    .o(\text_addr[2]_syn_17 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT4 #(
    .EQN("~((~D*~B)*~(A)*~(C)+(~D*~B)*A*~(C)+~((~D*~B))*A*C+(~D*~B)*A*C)"),
    .INIT(16'h5f5c))
    \text_addr[2]_syn_18  (
    .a(\text_addr[2]_syn_13 ),
    .b(\text_addr[2]_syn_15 ),
    .c(\text_addr[6]_syn_36 ),
    .d(\text_addr[2]_syn_17 ),
    .o(\text_addr[2]_syn_4 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT4 #(
    .EQN("(D*(C@(B*A)))"),
    .INIT(16'h7800))
    \text_addr[2]_syn_5  (
    .a(x[5]),
    .b(x[6]),
    .c(x[7]),
    .d(x[8]),
    .o(\text_addr[2]_syn_6 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT4 #(
    .EQN("(D*C*~B*A)"),
    .INIT(16'h2000))
    \text_addr[2]_syn_7  (
    .a(\gx[2]_syn_40 ),
    .b(\gx[2]_syn_44 ),
    .c(\text_addr[2]_syn_6 ),
    .d(lt38_syn_28),
    .o(\text_addr[2]_syn_8 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT3 #(
    .EQN("~(A*~(C)*~(B)+A*C*~(B)+~(A)*C*B+A*C*B)"),
    .INIT(8'h1d))
    \text_addr[2]_syn_9  (
    .a(\text_addr[2]_syn_8 ),
    .b(\text_addr[6]_syn_40 ),
    .c(sub0_syn_3[3]),
    .o(\text_addr[2]_syn_10 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT5 #(
    .EQN("(A*((D*C)*~(E)*~(B)+(D*C)*E*~(B)+~((D*C))*E*B+(D*C)*E*B))"),
    .INIT(32'ha8882000))
    \text_addr[3]_syn_1  (
    .a(\gx[2]_syn_17 ),
    .b(\gx[2]_syn_19 ),
    .c(\gx[2]_syn_21 ),
    .d(sub4_syn_3[4]),
    .e(sub7_syn_4[4]),
    .o(text_addr[3]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT5 #(
    .EQN("(A*((D*C)*~(E)*~(B)+(D*C)*E*~(B)+~((D*C))*E*B+(D*C)*E*B))"),
    .INIT(32'ha8882000))
    \text_addr[4]_syn_1  (
    .a(\gx[2]_syn_17 ),
    .b(\gx[2]_syn_19 ),
    .c(\gx[2]_syn_21 ),
    .d(sub4_syn_3[5]),
    .e(sub7_syn_4[5]),
    .o(text_addr[4]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT5 #(
    .EQN("(~D*A*~(~E*C*B))"),
    .INIT(32'h00aa002a))
    \text_addr[5]_syn_10  (
    .a(\text_addr[6]_syn_27 ),
    .b(\text_addr[6]_syn_16 ),
    .c(\text_addr[6]_syn_18 ),
    .d(\text_addr[6]_syn_29 ),
    .e(\volume[6]_dup_11 ),
    .o(\text_addr[5]_syn_11 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    \text_addr[5]_syn_12  (
    .a(\text_addr[6]_syn_21 ),
    .b(\text_addr[6]_syn_23 ),
    .o(\text_addr[5]_syn_13 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT4 #(
    .EQN("(D*C*B*~A)"),
    .INIT(16'h4000))
    \text_addr[5]_syn_14  (
    .a(\bg_b12[5]_syn_2 ),
    .b(\gx[2]_syn_23 ),
    .c(\gx[2]_syn_17 ),
    .d(\gx[2]_syn_26 ),
    .o(\text_addr[5]_syn_15 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT5 #(
    .EQN("(E@(~(A)*~(B)*~(C)*~(D)+A*~(B)*~(C)*~(D)+~(A)*B*~(C)*~(D)+A*B*~(C)*~(D)+~(A)*B*C*~(D)+~(A)*B*~(C)*D+A*B*~(C)*D+~(A)*B*C*D))"),
    .INIT(32'hb3b04c4f))
    \text_addr[5]_syn_16  (
    .a(\gx[2]_syn_10 ),
    .b(bar_b10_n1),
    .c(bar_b9_n),
    .d(bar_b10_n),
    .e(sub0_syn_3[6]),
    .o(text_addr_b15[5]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT4 #(
    .EQN("(~D*C*B*~A)"),
    .INIT(16'h0040))
    \text_addr[5]_syn_17  (
    .a(\gx[2]_syn_30 ),
    .b(text_addr_b15[5]),
    .c(direct_n47),
    .d(sub0_syn_3[7]),
    .o(\text_addr[5]_syn_18 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT4 #(
    .EQN("(C*A*~(~D*B))"),
    .INIT(16'ha020))
    \text_addr[5]_syn_19  (
    .a(\text_addr[5]_syn_15 ),
    .b(\gx[2]_syn_34 ),
    .c(\text_addr[5]_syn_18 ),
    .d(\text_addr[5]_syn_11 ),
    .o(\text_addr[5]_syn_20 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT4 #(
    .EQN("(A*~(~D*C*B))"),
    .INIT(16'haa2a))
    \text_addr[5]_syn_21  (
    .a(bar_b1_n1),
    .b(\text_addr[5]_syn_7 ),
    .c(\text_addr[5]_syn_9 ),
    .d(\contrast[5]_dup_5 ),
    .o(\text_addr[5]_syn_22 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT3 #(
    .EQN("(~A*~(~C*~B))"),
    .INIT(8'h54))
    \text_addr[5]_syn_23  (
    .a(bar_b9_n),
    .b(bar_b10_n),
    .c(audio_busy_dup_1),
    .o(\text_addr[5]_syn_24 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT5 #(
    .EQN("(~B*~(E*~(C*~(D*A))))"),
    .INIT(32'h10303333))
    \text_addr[5]_syn_25  (
    .a(\gx[2]_syn_38 ),
    .b(\text_addr[5]_syn_22 ),
    .c(\text_addr[5]_syn_13 ),
    .d(text_addr_b15[5]),
    .e(\text_addr[5]_syn_24 ),
    .o(\text_addr[5]_syn_26 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*B*A)"),
    .INIT(16'h0008))
    \text_addr[5]_syn_27  (
    .a(\gx[2]_syn_17 ),
    .b(\gx[2]_syn_26 ),
    .c(\gx[2]_syn_19 ),
    .d(\gx[2]_syn_21 ),
    .o(\text_addr[5]_syn_28 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT5 #(
    .EQN("(E*~D*~C*~B*A)"),
    .INIT(32'h00020000))
    \text_addr[5]_syn_29  (
    .a(\text_addr[5]_syn_28 ),
    .b(\bg_b12[5]_syn_2 ),
    .c(\gx[2]_syn_30 ),
    .d(\text_addr[6]_syn_27 ),
    .e(\gx[2]_syn_32 ),
    .o(\text_addr[5]_syn_30 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT5 #(
    .EQN("(A*(C*~((E@D))*~(B)+C*(E@D)*~(B)+~(C)*(E@D)*B+C*(E@D)*B))"),
    .INIT(32'h20a8a820))
    \text_addr[5]_syn_31  (
    .a(\gx[2]_syn_17 ),
    .b(\gx[2]_syn_19 ),
    .c(\gx[2]_syn_21 ),
    .d(footer_left[3]),
    .e(sub7_syn_4[6]),
    .o(\text_addr[5]_syn_32 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT4 #(
    .EQN("~((~D*~A)*~(B)*~(C)+(~D*~A)*B*~(C)+~((~D*~A))*B*C+(~D*~A)*B*C)"),
    .INIT(16'h3f3a))
    \text_addr[5]_syn_33  (
    .a(\text_addr[5]_syn_20 ),
    .b(\text_addr[5]_syn_26 ),
    .c(\text_addr[5]_syn_30 ),
    .d(\text_addr[5]_syn_32 ),
    .o(\text_addr[5]_syn_4 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT3 #(
    .EQN("(~C*~B*A)"),
    .INIT(8'h02))
    \text_addr[5]_syn_5  (
    .a(\field[2]_dup_1 ),
    .b(\field[1]_dup_1 ),
    .c(\field[0]_dup_1 ),
    .o(footer_left[3]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT5 #(
    .EQN("(~E*~D*~C*~B*~A)"),
    .INIT(32'h00000001))
    \text_addr[5]_syn_6  (
    .a(\contrast[4]_dup_5 ),
    .b(\contrast[3]_dup_3 ),
    .c(\contrast[2]_dup_3 ),
    .d(\contrast[1]_dup_3 ),
    .e(\contrast[0]_dup_3 ),
    .o(\text_addr[5]_syn_7 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT2 #(
    .EQN("(~B*A)"),
    .INIT(4'h2))
    \text_addr[5]_syn_8  (
    .a(\contrast[7]_dup_21 ),
    .b(\contrast[6]_dup_7 ),
    .o(\text_addr[5]_syn_9 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT2 #(
    .EQN("(~B*~A)"),
    .INIT(4'h1))
    \text_addr[6]_syn_13  (
    .a(\volume[4]_dup_9 ),
    .b(\volume[3]_dup_5 ),
    .o(\text_addr[6]_syn_14 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT5 #(
    .EQN("(~E*~D*~C*~B*A)"),
    .INIT(32'h00000002))
    \text_addr[6]_syn_15  (
    .a(\text_addr[6]_syn_14 ),
    .b(\volume[5]_dup_9 ),
    .c(\volume[2]_dup_5 ),
    .d(\volume[1]_dup_5 ),
    .e(\volume[0]_dup_5 ),
    .o(\text_addr[6]_syn_16 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT5 #(
    .EQN("(~E*~D*~C*B*~A)"),
    .INIT(32'h00000004))
    \text_addr[6]_syn_17  (
    .a(bar_b9_n),
    .b(bar_b10_n),
    .c(\volume[7]_dup_31 ),
    .d(y[8]),
    .e(y[9]),
    .o(\text_addr[6]_syn_18 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT4 #(
    .EQN("(B*~(~D*~C*~A))"),
    .INIT(16'hccc8))
    \text_addr[6]_syn_19  (
    .a(\gx[2]_syn_10 ),
    .b(bar_b9_n),
    .c(y[8]),
    .d(y[9]),
    .o(bar_b1_n1));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT3 #(
    .EQN("(C*B*A)"),
    .INIT(8'h80))
    \text_addr[6]_syn_20  (
    .a(x[4]),
    .b(x[5]),
    .c(x[6]),
    .o(\text_addr[6]_syn_21 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    \text_addr[6]_syn_22  (
    .a(bar_b10_n),
    .b(y[8]),
    .o(\text_addr[6]_syn_23 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT4 #(
    .EQN("~((~D*~C)*~(A)*~(B)+(~D*~C)*A*~(B)+~((~D*~C))*A*B+(~D*~C)*A*B)"),
    .INIT(16'h7774))
    \text_addr[6]_syn_24  (
    .a(\text_addr[6]_syn_21 ),
    .b(\text_addr[6]_syn_23 ),
    .c(audio_available_dup_1),
    .d(audio_busy_dup_1),
    .o(\text_addr[6]_syn_25 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT4 #(
    .EQN("(B*~(A*~(D*~C)))"),
    .INIT(16'h4c44))
    \text_addr[6]_syn_26  (
    .a(\gx[2]_syn_10 ),
    .b(bar_b10_n1),
    .c(bar_b9_n),
    .d(bar_b10_n),
    .o(\text_addr[6]_syn_27 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT3 #(
    .EQN("(~C*~B*~A)"),
    .INIT(8'h01))
    \text_addr[6]_syn_28  (
    .a(x[4]),
    .b(x[5]),
    .c(x[6]),
    .o(\text_addr[6]_syn_29 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT4 #(
    .EQN("(D*A*~(C@B))"),
    .INIT(16'h8200))
    \text_addr[6]_syn_30  (
    .a(\gx[2]_syn_13 ),
    .b(\gx[2]_syn_15 ),
    .c(x[9]),
    .d(\gx[2]_syn_26 ),
    .o(\text_addr[6]_syn_31 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT2 #(
    .EQN("(~B*A)"),
    .INIT(4'h2))
    \text_addr[6]_syn_32  (
    .a(direct_n47),
    .b(sub0_syn_3[7]),
    .o(direct_n41));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT4 #(
    .EQN("(A*~(~D*C*B))"),
    .INIT(16'haa2a))
    \text_addr[6]_syn_33  (
    .a(\text_addr[6]_syn_27 ),
    .b(\text_addr[6]_syn_16 ),
    .c(\text_addr[6]_syn_18 ),
    .d(\volume[6]_dup_11 ),
    .o(\text_addr[6]_syn_34 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT5 #(
    .EQN("(~E*D*~C*B*~A)"),
    .INIT(32'h00000400))
    \text_addr[6]_syn_35  (
    .a(\bg_b12[5]_syn_2 ),
    .b(\text_addr[6]_syn_31 ),
    .c(\gx[2]_syn_30 ),
    .d(\gx[2]_syn_32 ),
    .e(\gx[2]_syn_19 ),
    .o(\text_addr[6]_syn_36 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT3 #(
    .EQN("(C*~(~B*~A))"),
    .INIT(8'he0))
    \text_addr[6]_syn_37  (
    .a(bar_b9_n),
    .b(bar_b10_n),
    .c(y[8]),
    .o(\text_addr[6]_syn_38 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT5 #(
    .EQN("(D*(C@(~A*~(E*B))))"),
    .INIT(32'he100a500))
    \text_addr[6]_syn_39  (
    .a(\text_addr[6]_syn_38 ),
    .b(\gx[2]_syn_10 ),
    .c(\gx[2]_syn_28 ),
    .d(direct_n41),
    .e(bar_b9_n),
    .o(\text_addr[6]_syn_40 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT4 #(
    .EQN("(~A*~(~B*~(~D*~C)))"),
    .INIT(16'h4445))
    \text_addr[6]_syn_41  (
    .a(bar_b1_n1),
    .b(\text_addr[6]_syn_23 ),
    .c(audio_available_dup_1),
    .d(audio_busy_dup_1),
    .o(\text_addr[6]_syn_42 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT5 #(
    .EQN("(~E*(~(A)*~(B)*~(C)*~(D)+A*~(B)*~(C)*~(D)+~(A)*B*~(C)*~(D)+A*B*~(C)*~(D)+~(A)*B*C*~(D)+~(A)*B*~(C)*D+A*B*~(C)*D+~(A)*B*C*D))"),
    .INIT(32'h00004c4f))
    \text_addr[6]_syn_43  (
    .a(\gx[2]_syn_10 ),
    .b(bar_b10_n1),
    .c(bar_b9_n),
    .d(bar_b10_n),
    .e(sub0_syn_3[6]),
    .o(\text_addr[6]_syn_44 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT2 #(
    .EQN("(B*~A)"),
    .INIT(4'h4))
    \text_addr[6]_syn_45  (
    .a(bar_b9_n),
    .b(bar_b10_n),
    .o(\text_addr[6]_syn_46 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT5 #(
    .EQN("(A*~(E@D)*~(C@B))"),
    .INIT(32'h82000082))
    \text_addr[6]_syn_47  (
    .a(\text_addr[6]_syn_40 ),
    .b(\text_addr[6]_syn_44 ),
    .c(\text_addr[6]_syn_46 ),
    .d(y[5]),
    .e(\gx[2]_syn_36 ),
    .o(\text_addr[6]_syn_48 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT5 #(
    .EQN("(D*(~(A)*B*~(C)*~(E)+~(A)*B*C*~(E)+A*B*C*~(E)+~(A)*B*~(C)*E+A*~(B)*C*E+~(A)*B*C*E+A*B*C*E))"),
    .INIT(32'he400c400))
    \text_addr[6]_syn_49  (
    .a(\gx[2]_syn_34 ),
    .b(\text_addr[6]_syn_48 ),
    .c(\text_addr[6]_syn_34 ),
    .d(\text_addr[6]_syn_31 ),
    .e(\text_addr[6]_syn_29 ),
    .o(\text_addr[6]_syn_50 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT4 #(
    .EQN("~(~A*~((D*C))*~(B)+~A*(D*C)*~(B)+~(~A)*(D*C)*B+~A*(D*C)*B)"),
    .INIT(16'h2eee))
    \text_addr[6]_syn_51  (
    .a(\text_addr[6]_syn_25 ),
    .b(bar_b1_n1),
    .c(text_addr_b30_n),
    .d(\contrast[7]_dup_21 ),
    .o(\text_addr[6]_syn_52 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT3 #(
    .EQN("(~C*~B*A)"),
    .INIT(8'h02))
    \text_addr[6]_syn_53  (
    .a(\text_addr[6]_syn_52 ),
    .b(\text_addr[6]_syn_42 ),
    .c(\text_addr[6]_syn_27 ),
    .o(\text_addr[6]_syn_54 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT5 #(
    .EQN("~(~A*~(E*D)*~(C*B))"),
    .INIT(32'hffeaeaea))
    \text_addr[6]_syn_55  (
    .a(\text_addr[6]_syn_50 ),
    .b(\text_addr[6]_syn_54 ),
    .c(\text_addr[6]_syn_36 ),
    .d(\gx[2]_syn_17 ),
    .e(\gx[2]_syn_19 ),
    .o(\text_addr[6]_syn_12 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT2 #(
    .EQN("(~B*A)"),
    .INIT(4'h2))
    \text_addr[7]_syn_11  (
    .a(\gx[2]_syn_38 ),
    .b(\text_addr[7]_syn_10 ),
    .o(text_addr_b12[7]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT4 #(
    .EQN("(B*A*~(D*C))"),
    .INIT(16'h0888))
    \text_addr[7]_syn_12  (
    .a(\gx[2]_syn_17 ),
    .b(\gx[2]_syn_26 ),
    .c(bar_b9_n),
    .d(\contrast[7]_dup_21 ),
    .o(\text_addr[7]_syn_13 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT5 #(
    .EQN("(E*~D*~C*~B*A)"),
    .INIT(32'h00020000))
    \text_addr[7]_syn_14  (
    .a(\text_addr[7]_syn_13 ),
    .b(\bg_b12[5]_syn_2 ),
    .c(\gx[2]_syn_30 ),
    .d(\text_addr[6]_syn_27 ),
    .e(\gx[2]_syn_32 ),
    .o(\text_addr[7]_syn_15 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT4 #(
    .EQN("(D*~C*~B*~A)"),
    .INIT(16'h0100))
    \text_addr[7]_syn_16  (
    .a(\text_addr[7]_syn_6 ),
    .b(\bg_b12[5]_syn_2 ),
    .c(\gx[2]_syn_30 ),
    .d(\gx[2]_syn_32 ),
    .o(\text_addr[7]_syn_17 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT3 #(
    .EQN("(A*~(C*~B))"),
    .INIT(8'h8a))
    \text_addr[7]_syn_18  (
    .a(\text_addr[6]_syn_31 ),
    .b(\text_addr[6]_syn_27 ),
    .c(\gx[2]_syn_32 ),
    .o(\text_addr[7]_syn_19 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT5 #(
    .EQN("~(~(E*~(~D*~B))*~(C*~A))"),
    .INIT(32'hffdc5050))
    \text_addr[7]_syn_20  (
    .a(\text_addr[7]_syn_8 ),
    .b(text_addr_b12[7]),
    .c(\text_addr[7]_syn_15 ),
    .d(\text_addr[7]_syn_17 ),
    .e(\text_addr[7]_syn_19 ),
    .o(\text_addr[7]_syn_2 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT4 #(
    .EQN("(~D*~C*~B*A)"),
    .INIT(16'h0002))
    \text_addr[7]_syn_3  (
    .a(\text_addr[6]_syn_14 ),
    .b(\volume[2]_dup_5 ),
    .c(\volume[1]_dup_5 ),
    .d(\volume[0]_dup_5 ),
    .o(\text_addr[7]_syn_4 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT5 #(
    .EQN("(~C*~(~E*~D*B*A))"),
    .INIT(32'h0f0f0f07))
    \text_addr[7]_syn_5  (
    .a(\text_addr[7]_syn_4 ),
    .b(\text_addr[6]_syn_18 ),
    .c(\text_addr[6]_syn_29 ),
    .d(\volume[6]_dup_11 ),
    .e(\volume[5]_dup_9 ),
    .o(\text_addr[7]_syn_6 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT4 #(
    .EQN("(B*~(D*~(~C*~A)))"),
    .INIT(16'h04cc))
    \text_addr[7]_syn_7  (
    .a(\gx[2]_syn_38 ),
    .b(\text_addr[6]_syn_42 ),
    .c(\text_addr[6]_syn_21 ),
    .d(\text_addr[6]_syn_23 ),
    .o(\text_addr[7]_syn_8 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT3 #(
    .EQN("(C*~(~B*~A))"),
    .INIT(8'he0))
    \text_addr[7]_syn_9  (
    .a(\text_addr[6]_syn_44 ),
    .b(bar_b9_n),
    .c(bar_b10_n),
    .o(\text_addr[7]_syn_10 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT4 #(
    .EQN("(~C*(A*~(D)*~(B)+A*D*~(B)+~(A)*D*B+A*D*B))"),
    .INIT(16'h0e02))
    \text_addr[8]_syn_3  (
    .a(\text_addr[6]_syn_25 ),
    .b(bar_b1_n1),
    .c(\text_addr[6]_syn_27 ),
    .d(\contrast[7]_dup_21 ),
    .o(\text_addr[8]_syn_4 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT5 #(
    .EQN("~(A*~(E*~D*~C*B))"),
    .INIT(32'h555d5555))
    \text_addr[8]_syn_5  (
    .a(mux55_syn_68),
    .b(\gx[2]_syn_34 ),
    .c(\text_addr[8]_syn_4 ),
    .d(\text_addr[5]_syn_11 ),
    .e(\text_addr[6]_syn_31 ),
    .o(\text_addr[8]_syn_2 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  AL_MAP_LUT4 #(
    .EQN("(D*C*B*A)"),
    .INIT(16'h8000))
    \text_addr[9]_syn_1  (
    .a(\gx[2]_syn_34 ),
    .b(\gx[2]_syn_17 ),
    .c(bar_b1_n1),
    .d(\contrast[7]_dup_21 ),
    .o(text_addr[9]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(12)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    \volume[0]_syn_6  (
    .ipad(volume[0]),
    .di(\volume[0]_dup_5 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    \volume[1]_syn_6  (
    .ipad(volume[1]),
    .di(\volume[1]_dup_5 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    \volume[2]_syn_6  (
    .ipad(volume[2]),
    .di(\volume[2]_dup_5 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    \volume[3]_syn_6  (
    .ipad(volume[3]),
    .di(\volume[3]_dup_5 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    \volume[4]_syn_10  (
    .ipad(volume[4]),
    .di(\volume[4]_dup_9 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    \volume[5]_syn_10  (
    .ipad(volume[5]),
    .di(\volume[5]_dup_9 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    \volume[6]_syn_12  (
    .ipad(volume[6]),
    .di(\volume[6]_dup_11 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .TSMUX("1"))
    \volume[7]_syn_32  (
    .ipad(volume[7]),
    .di(\volume[7]_dup_31 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(4)
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
    .SRMODE("ASYNC"),
    .TSMUX("0"))
    vs_out_syn_4 (
    .do({open_n5571,open_n5572,open_n5573,vq[0]}),
    .osclk(clk_dup_1),
    .rst(rst_dup_1),
    .opad(vs_out));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(5)
  EG_PHY_PAD #(
    //.HYSTERESIS("OFF"),
    //.PCICLAMP("OFF"),
    .IDDRMODE("OFF"),
    .IDDRPIPEMODE("NONE"),
    .INCEMUX("1"),
    .INPCLKMUX("CLK"),
    .INRSTMUX("RST"),
    .IN_DFFMODE("FF"),
    .IN_REGSET("SET"),
    .IOTYPE("LVCMOS25"),
    .MODE("IN"),
    .SRMODE("ASYNC"),
    .TSMUX("1"))
    vs_syn_4 (
    .ipad(vs),
    .ipclk(clk_dup_1),
    .rst(rst_dup_1),
    .di(vs_dup_3),
    .diq({open_n5594,open_n5595,open_n5596,vq[0]}));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(3)
  AL_MAP_LUT1 #(
    .EQN("(~A)"),
    .INIT(2'h1))
    \x[8]_syn_3  (
    .a(x[8]),
    .o(\x[8]_syn_2 ));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(7)
  AL_MAP_LUT3 #(
    .EQN("(~C*B*A)"),
    .INIT(8'h08))
    \x_b[0]_syn_1  (
    .a(de_dup_3),
    .b(vs_dup_3),
    .c(x[0]),
    .o(x_b[0]));
  AL_MAP_LUT3 #(
    .EQN("(C*B*A)"),
    .INIT(8'h80))
    \x_b[1]_syn_1  (
    .a(x_b4[1]),
    .b(de_dup_3),
    .c(vs_dup_3),
    .o(x_b[1]));
  AL_MAP_LUT3 #(
    .EQN("(C*B*A)"),
    .INIT(8'h80))
    \x_b[2]_syn_1  (
    .a(x_b4[2]),
    .b(de_dup_3),
    .c(vs_dup_3),
    .o(x_b[2]));
  AL_MAP_LUT3 #(
    .EQN("(C*B*A)"),
    .INIT(8'h80))
    \x_b[3]_syn_1  (
    .a(x_b4[3]),
    .b(de_dup_3),
    .c(vs_dup_3),
    .o(x_b[3]));
  AL_MAP_LUT3 #(
    .EQN("(C*B*A)"),
    .INIT(8'h80))
    \x_b[4]_syn_1  (
    .a(x_b4[4]),
    .b(de_dup_3),
    .c(vs_dup_3),
    .o(x_b[4]));
  AL_MAP_LUT3 #(
    .EQN("(C*B*A)"),
    .INIT(8'h80))
    \x_b[5]_syn_1  (
    .a(x_b4[5]),
    .b(de_dup_3),
    .c(vs_dup_3),
    .o(x_b[5]));
  AL_MAP_LUT3 #(
    .EQN("(C*B*A)"),
    .INIT(8'h80))
    \x_b[6]_syn_1  (
    .a(x_b4[6]),
    .b(de_dup_3),
    .c(vs_dup_3),
    .o(x_b[6]));
  AL_MAP_LUT3 #(
    .EQN("(C*B*A)"),
    .INIT(8'h80))
    \x_b[7]_syn_1  (
    .a(x_b4[7]),
    .b(de_dup_3),
    .c(vs_dup_3),
    .o(x_b[7]));
  AL_MAP_LUT3 #(
    .EQN("(C*B*A)"),
    .INIT(8'h80))
    \x_b[8]_syn_1  (
    .a(x_b4[8]),
    .b(de_dup_3),
    .c(vs_dup_3),
    .o(x_b[8]));
  AL_MAP_LUT3 #(
    .EQN("(C*B*A)"),
    .INIT(8'h80))
    \x_b[9]_syn_1  (
    .a(x_b4[9]),
    .b(de_dup_3),
    .c(vs_dup_3),
    .o(x_b[9]));
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \x_reg[0]  (
    .clk(clk_dup_1),
    .d(x_b[0]),
    .sr(rst_dup_1),
    .q(x[0]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \x_reg[1]  (
    .clk(clk_dup_1),
    .d(x_b[1]),
    .sr(rst_dup_1),
    .q(x[1]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \x_reg[2]  (
    .clk(clk_dup_1),
    .d(x_b[2]),
    .sr(rst_dup_1),
    .q(x[2]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \x_reg[3]  (
    .clk(clk_dup_1),
    .d(x_b[3]),
    .sr(rst_dup_1),
    .q(x[3]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \x_reg[4]  (
    .clk(clk_dup_1),
    .d(x_b[4]),
    .sr(rst_dup_1),
    .q(x[4]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \x_reg[5]  (
    .clk(clk_dup_1),
    .d(x_b[5]),
    .sr(rst_dup_1),
    .q(x[5]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \x_reg[6]  (
    .clk(clk_dup_1),
    .d(x_b[6]),
    .sr(rst_dup_1),
    .q(x[6]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \x_reg[7]  (
    .clk(clk_dup_1),
    .d(x_b[7]),
    .sr(rst_dup_1),
    .q(x[7]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \x_reg[8]  (
    .clk(clk_dup_1),
    .d(x_b[8]),
    .sr(rst_dup_1),
    .q(x[8]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("1"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \x_reg[9]  (
    .clk(clk_dup_1),
    .d(x_b[9]),
    .sr(rst_dup_1),
    .q(x[9]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_LUT2 #(
    .EQN("(~B*A)"),
    .INIT(4'h2))
    \y_b[0]_syn_1  (
    .a(vs_dup_3),
    .b(y[0]),
    .o(y_b[0]));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    \y_b[1]_syn_1  (
    .a(y_b2[1]),
    .b(vs_dup_3),
    .o(y_b[1]));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    \y_b[2]_syn_1  (
    .a(y_b2[2]),
    .b(vs_dup_3),
    .o(y_b[2]));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    \y_b[3]_syn_1  (
    .a(y_b2[3]),
    .b(vs_dup_3),
    .o(y_b[3]));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    \y_b[4]_syn_1  (
    .a(y_b2[4]),
    .b(vs_dup_3),
    .o(y_b[4]));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    \y_b[5]_syn_1  (
    .a(y_b2[5]),
    .b(vs_dup_3),
    .o(y_b[5]));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    \y_b[6]_syn_1  (
    .a(y_b2[6]),
    .b(vs_dup_3),
    .o(y_b[6]));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    \y_b[7]_syn_1  (
    .a(y_b2[7]),
    .b(vs_dup_3),
    .o(y_b[7]));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    \y_b[8]_syn_1  (
    .a(y_b2[8]),
    .b(vs_dup_3),
    .o(y_b[8]));
  AL_MAP_LUT2 #(
    .EQN("(B*A)"),
    .INIT(4'h8))
    \y_b[9]_syn_1  (
    .a(y_b2[9]),
    .b(vs_dup_3),
    .o(y_b[9]));
  AL_MAP_SEQ #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \y_reg[0]  (
    .ce(mux68_syn_2[9]),
    .clk(clk_dup_1),
    .d(y_b[0]),
    .sr(rst_dup_1),
    .q(y[0]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \y_reg[1]  (
    .ce(mux68_syn_2[9]),
    .clk(clk_dup_1),
    .d(y_b[1]),
    .sr(rst_dup_1),
    .q(y[1]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \y_reg[2]  (
    .ce(mux68_syn_2[9]),
    .clk(clk_dup_1),
    .d(y_b[2]),
    .sr(rst_dup_1),
    .q(y[2]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \y_reg[3]  (
    .ce(mux68_syn_2[9]),
    .clk(clk_dup_1),
    .d(y_b[3]),
    .sr(rst_dup_1),
    .q(y[3]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \y_reg[4]  (
    .ce(mux68_syn_2[9]),
    .clk(clk_dup_1),
    .d(y_b[4]),
    .sr(rst_dup_1),
    .q(y[4]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \y_reg[5]  (
    .ce(mux68_syn_2[9]),
    .clk(clk_dup_1),
    .d(y_b[5]),
    .sr(rst_dup_1),
    .q(y[5]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \y_reg[6]  (
    .ce(mux68_syn_2[9]),
    .clk(clk_dup_1),
    .d(y_b[6]),
    .sr(rst_dup_1),
    .q(y[6]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \y_reg[7]  (
    .ce(mux68_syn_2[9]),
    .clk(clk_dup_1),
    .d(y_b[7]),
    .sr(rst_dup_1),
    .q(y[7]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \y_reg[8]  (
    .ce(mux68_syn_2[9]),
    .clk(clk_dup_1),
    .d(y_b[8]),
    .sr(rst_dup_1),
    .q(y[8]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)
  AL_MAP_SEQ #(
    .CEMUX("CE"),
    .CLKMUX("CLK"),
    .DFFMODE("FF"),
    .REGSET("RESET"),
    .SRMODE("ASYNC"),
    .SRMUX("SR"))
    \y_reg[9]  (
    .ce(mux68_syn_2[9]),
    .clk(clk_dup_1),
    .d(y_b[9]),
    .sr(rst_dup_1),
    .q(y[9]));  // D:/FPGA/lab_ex5_i2s/src/user_source/hdl_source/display/media_menu_overlay.v(1156)

endmodule 


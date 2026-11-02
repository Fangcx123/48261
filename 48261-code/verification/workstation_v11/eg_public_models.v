`timescale 1ns/1ps
// Minimal public behavioural models for the cells used by the exported
// sdr_as_ram gate netlist (workstation_v10/sdram_gate.v). The vendor models in
// TD sim_release are encrypted for commercial simulators only.
// Slices are modelled only in the incrementer roles they have in this netlist.

module AL_MAP_LUT1(input a, output o);
 parameter [1:0] INIT=2'h0; parameter EQN="";
 assign o=INIT[a];
endmodule
module AL_MAP_LUT2(input a,b, output o);
 parameter [3:0] INIT=4'h0; parameter EQN="";
 assign o=INIT[{b,a}];
endmodule
module AL_MAP_LUT3(input a,b,c, output o);
 parameter [7:0] INIT=8'h0; parameter EQN="";
 assign o=INIT[{c,b,a}];
endmodule
module AL_MAP_LUT4(input a,b,c,d, output o);
 parameter [15:0] INIT=16'h0; parameter EQN="";
 assign o=INIT[{d,c,b,a}];
endmodule
module AL_MAP_LUT5(input a,b,c,d,e, output o);
 parameter [31:0] INIT=32'h0; parameter EQN="";
 assign o=INIT[{e,d,c,b,a}];
endmodule

module AL_MAP_SEQ(input ce,clk,sr,d, output reg q);
 parameter DFFMODE="FF",REGSET="RESET",SRMUX="SR",SRMODE="SYNC",CEMUX="1",CLKMUX="CLK",GSR="DISABLE";
 parameter INIT=1'bx;
 wire rv=(REGSET=="SET");
 wire en=(CEMUX=="1") ? 1'b1 : (CEMUX=="INV") ? ~ce : ce;
 wire r=(SRMUX=="SR") ? sr : (SRMUX=="INV") ? ~sr : 1'b0;
 initial q=(INIT===1'b0 || INIT===1'b1) ? INIT : rv;
 generate if(SRMODE=="ASYNC") begin: a
  always @(posedge clk or posedge r) if(r) q<=rv; else if(en) q<=d;
 end else begin: s
  always @(posedge clk) if(r) q<=rv; else if(en) q<=d;
 end endgenerate
endmodule

module EG_PHY_CONFIG();
 parameter DONE_PERSISTN="ENABLE",INIT_PERSISTN="ENABLE",JTAG_PERSISTN="DISABLE",PROGRAMN_PERSISTN="DISABLE";
endmodule

// MODE IN/OUT/BI, optional input/output registers. TS_DRIVE_HIGH selects the
// interpretation of TSMUX("INV"): drive the pad while ts==1.
module EG_PHY_PAD(input ce,input [3:0] do,input ipad,ipclk,isclk,opclk,osclk,rst,ts,
 output di,output reg [3:0] diq,output opad,inout bpad);
 parameter MODE="IN",IN_DFFMODE="NONE",DO_DFFMODE="NONE",IN_REGSET="RESET",DO_REGSET="RESET";
 parameter INRSTMUX="0",OUTRSTMUX="0",OUTCEMUX="1",INCEMUX="1",SRMODE="SYNC",TSMUX="1";
 parameter IOTYPE="",DRIVE="",IDDRMODE="OFF",IDDRPIPEMODE="NONE",ODDRMODE="OFF",INPCLKMUX="CLK",OUTSCLKMUX="CLK";
 parameter TS_DRIVE_HIGH=1;
 wire pin=(MODE=="BI") ? bpad : ipad;
 assign di=pin;
 wire in_r=(INRSTMUX=="RST") ? rst : (INRSTMUX=="INV") ? ~rst : 1'b0;
 initial diq=4'd0;
 always @(posedge ipclk) if(IN_DFFMODE=="FF") begin
  if(in_r) diq[0]<=(IN_REGSET=="SET"); else diq[0]<=pin;
 end
 reg oq;
 wire o_r=(OUTRSTMUX=="RST") ? rst : (OUTRSTMUX=="INV") ? ~rst : 1'b0;
 wire o_en=(OUTCEMUX=="CE") ? ce : 1'b1;
 initial oq=(DO_REGSET=="SET");
 generate if(SRMODE=="ASYNC") begin: oa
  always @(posedge osclk or posedge o_r) if(o_r) oq<=(DO_REGSET=="SET"); else if(o_en) oq<=do[0];
 end else begin: os
  always @(posedge osclk) if(o_r) oq<=(DO_REGSET=="SET"); else if(o_en) oq<=do[0];
 end endgenerate
 wire ov=(DO_DFFMODE=="FF") ? oq : do[0];
 assign opad=ov;
 wire oe=(TSMUX=="INV") ? (TS_DRIVE_HIGH ? ts : ~ts) : (TSMUX=="0") ? 1'b1 : 1'b0;
 assign bpad=(MODE=="BI" && oe) ? ov : 1'bz;
endmodule

// Ripple incrementer half-slices in chain order a0,b0,a1,b1. An unconnected
// fci marks the chain head, where position a0 seeds carry=1.
module EG_PHY_LSLICE(input [1:0] a,b,c,d,e,input fci,clk,sr,ce,
 output [1:0] f,fx,output fco,output [1:0] q);
 parameter MODE="RIPPLE",DEMUX0="E",DEMUX1="E",LSFMUX0="SUM",LSFMUX1="SUM",LSFXMUX0="SUM",LSFXMUX1="SUM";
 parameter [15:0] INIT_LUTF0=16'h0,INIT_LUTF1=16'h0,INIT_LUTG0=16'h0,INIT_LUTG1=16'h0;
 wire head=(fci!==1'b0 && fci!==1'b1);
 wire c0=head ? 1'b1 : fci;
 wire s0=head ? 1'b0 : (a[0]^c0); wire k0=head ? 1'b1 : (a[0]&c0);
 wire s1=b[0]^k0; wire k1=b[0]&k0;
 wire s2=a[1]^k1; wire k2=a[1]&k1;
 wire s3=b[1]^k2; wire k3=b[1]&k2;
 assign f={s2,s0};assign fx={s3,s1};assign fco=k3;assign q=2'b00;
endmodule

// Two full-adder bits with optional registered sums (REGx_SD("F")).
module EG_PHY_MSLICE(input [1:0] a,b,input fci,clk,sr,ce,
 output [1:0] f,output fco,output reg [1:0] q);
 parameter ALUTYPE="ADD",MODE="RIPPLE",DFFMODE="FF",CEMUX="1",CLKMUX="CLK",SRMODE="SYNC",SRMUX="SR";
 parameter REG0_REGSET="RESET",REG1_REGSET="RESET",REG0_SD="F",REG1_SD="F";
 parameter [15:0] INIT_LUT0=16'h0,INIT_LUT1=16'h0;
 wire c0=(fci===1'b1);
 wire a0=(a[0]===1'b1),a1=(a[1]===1'b1),b0=(b[0]===1'b1),b1=(b[1]===1'b1);
 wire s0=a0^b0^c0; wire k0=(a0&b0)|(a0&c0)|(b0&c0);
 wire s1=a1^b1^k0; wire k1=(a1&b1)|(a1&k0)|(b1&k0);
 assign f={s1,s0};assign fco=k1;
 initial q=2'b00;
 always @(posedge clk) if(sr===1'b1) q<=2'b00; else q<={s1,s0};
endmodule

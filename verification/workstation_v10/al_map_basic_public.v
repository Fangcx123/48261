module reg_ar_as_w1
  (
  clk,
  d,
  en,
  reset,
  set,
  q
  );

  input clk;
  input d;
  input en;
  input reset;
  input set;
  output q;

  parameter REGSET = "RESET";
  wire enout;

  AL_MUX u_en0 (
    .i0(q),
    .i1(d),
    .sel(en),
    .o(enout));
  AL_DFF #(
    .INI((REGSET == "SET") ? 1'b1 : 1'b0))
    u_seq0 (
    .clk(clk),
    .d(enout),
    .reset(reset),
    .set(set),
    .q(q));

endmodule

module reg_sr_ss_w1
  (
  clk,
  d,
  en,
  reset,
  set,
  q
  );

  input clk;
  input d;
  input en;
  input reset;
  input set;
  output q;

  parameter REGSET = "RESET";
  wire enout;
  wire resetout;
  wire setout;

  AL_MUX u_en0 (
    .i0(q),
    .i1(d),
    .sel(en),
    .o(enout));
  AL_MUX u_reset0 (
    .i0(setout),
    .i1(1'b0),
    .sel(reset),
    .o(resetout));
  AL_DFF #(
    .INI((REGSET == "SET") ? 1'b1 : 1'b0))
    u_seq0 (
    .clk(clk),
    .d(resetout),
    .reset(1'b0),
    .set(1'b0),
    .q(q));
  AL_MUX u_set0 (
    .i0(enout),
    .i1(1'b1),
    .sel(set),
    .o(setout));

endmodule

module reg_ar_ss_w1
  (
  clk,
  d,
  en,
  reset,
  set,
  q
  );

  input clk;
  input d;
  input en;
  input reset;
  input set;
  output q;

  parameter REGSET = "RESET";
  wire enout;
  wire setout;

  AL_MUX u_en0 (
    .i0(q),
    .i1(d),
    .sel(en),
    .o(enout));
  AL_DFF #(
    .INI((REGSET == "SET") ? 1'b1 : 1'b0))
    u_seq0 (
    .clk(clk),
    .d(setout),
    .reset(reset),
    .set(1'b0),
    .q(q));
  AL_MUX u_set0 (
    .i0(enout),
    .i1(1'b1),
    .sel(set),
    .o(setout));

endmodule

module reg_sr_as_w1
  (
  clk,
  d,
  en,
  reset,
  set,
  q
  );

  input clk;
  input d;
  input en;
  input reset;
  input set;
  output q;

  parameter REGSET = "RESET";
  wire enout;
  wire resetout;

  AL_MUX u_en0 (
    .i0(q),
    .i1(d),
    .sel(en),
    .o(enout));
  AL_MUX u_reset0 (
    .i0(enout),
    .i1(1'b0),
    .sel(reset),
    .o(resetout));
  AL_DFF #(
    .INI((REGSET == "SET") ? 1'b1 : 1'b0))
    u_seq0 (
    .clk(clk),
    .d(resetout),
    .reset(1'b0),
    .set(set),
    .q(q));

endmodule

module latch_ar_ss_w1
  (
  clk,
  d,
  en,
  reset,
  set,
  q
  );

  input clk;
  input d;
  input en;
  input reset;
  input set;
  output q;

  parameter REGSET = "RESET";
  wire enout;
  wire setout;

  AL_MUX u_en0 (
    .i0(q),
    .i1(d),
    .sel(en),
    .o(enout));
  AL_LATCH #(
    .INI((REGSET == "SET") ? 1'b1 : 1'b0))
    u_seq0 (
    .clk(clk),
    .d(setout),
    .reset(reset),
    .set(1'b0),
    .q(q));
  AL_MUX u_set0 (
    .i0(enout),
    .i1(1'b1),
    .sel(set),
    .o(setout));

endmodule 

module latch_sr_as_w1
  (
  clk,
  d,
  en,
  reset,
  set,
  q
  );

  input clk;
  input d;
  input en;
  input reset;
  input set;
  output q;

  parameter REGSET = "RESET";
  wire enout;
  wire resetout;

  AL_MUX u_en0 (
    .i0(q),
    .i1(d),
    .sel(en),
    .o(enout));
  AL_MUX u_reset0 (
    .i0(enout),
    .i1(1'b0),
    .sel(reset),
    .o(resetout));
  AL_LATCH #(
    .INI((REGSET == "SET") ? 1'b1 : 1'b0))
    u_seq0 (
    .clk(clk),
    .d(resetout),
    .reset(1'b0),
    .set(set),
    .q(q));

endmodule

module latch_sr_ss_w1
  (
  clk,
  d,
  en,
  reset,
  set,
  q
  );

  input clk;
  input d;
  input en;
  input reset;
  input set;
  output q;

  parameter REGSET = "RESET";
  wire enout;
  wire resetout;
  wire setout;

  AL_MUX u_en0 (
    .i0(q),
    .i1(d),
    .sel(en),
    .o(enout));
  AL_MUX u_reset0 (
    .i0(setout),
    .i1(1'b0),
    .sel(reset),
    .o(resetout));
  AL_LATCH #(
    .INI((REGSET == "SET") ? 1'b1 : 1'b0))
    u_seq0 (
    .clk(clk),
    .d(resetout),
    .reset(1'b0),
    .set(1'b0),
    .q(q));
  AL_MUX u_set0 (
    .i0(enout),
    .i1(1'b1),
    .sel(set),
    .o(setout));

endmodule

module latch_ar_as_w1
  (
  clk,
  d,
  en,
  reset,
  set,
  q
  );

  input clk;
  input d;
  input en;
  input reset;
  input set;
  output q;

  parameter REGSET = "RESET";
  wire enout;

  AL_MUX u_en0 (
    .i0(q),
    .i1(d),
    .sel(en),
    .o(enout));
  AL_LATCH #(
    .INI((REGSET == "SET") ? 1'b1 : 1'b0))
    u_seq0 (
    .clk(clk),
    .d(enout),
    .reset(reset),
    .set(set),
    .q(q));

endmodule

module  AL_DFF_W ( ar, as, sr, ss, en, clk, d, q );

  parameter WIDTH = 1;
  parameter INIT = {WIDTH{1'b0}};
  parameter SSROVERCE = "ENABLE";  //DISABLE,ENABLE
  parameter GSR = "DISABLE";       //DISABLE,ENABLE

  input  [WIDTH-1:0] ar;
  input  [WIDTH-1:0] as;
  input  [WIDTH-1:0] sr;
  input  [WIDTH-1:0] ss;
  input  [WIDTH-1:0] en;
  input              clk;
  input  [WIDTH-1:0] d;
  output [WIDTH-1:0] q;

  genvar i;
  generate
    for (i = 0; i < WIDTH; i = i + 1) begin: gen
      AL_DFF_X #(.INIT(INIT[i]),
                 .SSROVERCE(SSROVERCE),
                 .GSR(GSR),
                 .REGSET((INIT[i] === 1'b1) ? "SET" : "RESET")
                 )
        dff (.ar(ar[i]),
             .as(as[i]),
             .sr(sr[i]),
             .ss(ss[i]),
             .en(en[i]),
             .clk(clk),
             .d(d[i]),
             .q(q[i])
            );
    end
  endgenerate

endmodule

module  AL_DFF_0 ( ar, as, sr, ss, en, clk, d, q );

  input ar;
  input as;
  input sr;
  input ss;
  input en;
  input clk;
  input d;
  output q;

  parameter SSROVERCE = "ENABLE";  //DISABLE,ENABLE
  parameter GSR = "DISABLE";       //DISABLE,ENABLE
  parameter REGSET = "RESET";      //RESET,SET

  wire enout;
  wire srout;
  wire ssout;

  reg ssr_over_en;
`ifdef FORMAL_VERIFICATION
  always@(*) begin
`else
  initial begin
`endif
    case (SSROVERCE)
     	"DISABLE"   : ssr_over_en = 0;
     	"ENABLE"    : ssr_over_en = 1;
     	default : begin
      //ssr_over_en = 0;
        $display("Parameter Error : The attribute SSROVERCE in AL_DFF_0 instance is set to %s. It's not legal value.\n", SSROVERCE);
        $finish;
      end  
    endcase
  end // initial

  wire sr_tmp = sr & (ssr_over_en | en);
  wire ss_tmp = ss & (ssr_over_en | en);

  AL_MUX u_en (
    .i0(q),
    .i1(d),
    .sel(en),
    .o(enout));
  AL_MUX u_reset (
    .i0(ssout),
    .i1(1'b0),
    .sel(sr_tmp),
    .o(srout));
  AL_DFF #(
    .GSR(GSR),
    .REGSET(REGSET),
    .INI(1'b0))
    u_seq (
    .clk(clk),
    .d(srout),
    .reset(ar),
    .set(as),
    .q(q));
  AL_MUX u_set (
    .i0(enout),
    .i1(1'b1),
    .sel(ss_tmp),
    .o(ssout));

endmodule 

module  AL_DFF_1 ( ar, as, sr, ss, en, clk, d, q );

  input ar;
  input as;
  input sr;
  input ss;
  input en;
  input clk;
  input d;
  output q;

  parameter SSROVERCE = "ENABLE";  //DISABLE,ENABLE
  parameter GSR = "DISABLE";       //DISABLE,ENABLE
  parameter REGSET = "SET";        //RESET,SET

  wire enout;
  wire srout;
  wire ssout;

  reg ssr_over_en;
`ifdef FORMAL_VERIFICATION
  always@(*) begin
`else
  initial begin
`endif
    case (SSROVERCE)
     	"DISABLE"   : ssr_over_en = 0;
     	"ENABLE"    : ssr_over_en = 1;
     	default : begin
      //ssr_over_en = 0;
        $display("Parameter Error : The attribute SSROVERCE in AL_DFF_1 instance is set to %s. It's not legal value.\n", SSROVERCE);
        $finish;
      end  
    endcase
  end // initial

  wire sr_tmp = sr & (ssr_over_en | en);
  wire ss_tmp = ss & (ssr_over_en | en);
  AL_MUX u_en (
    .i0(q),
    .i1(d),
    .sel(en),
    .o(enout));
  AL_MUX u_reset (
    .i0(ssout),
    .i1(1'b0),
    .sel(sr_tmp),
    .o(srout));
  AL_DFF #(
    .GSR(GSR),
    .REGSET(REGSET),
    .INI(1'b1))
    u_seq (
    .clk(clk),
    .d(srout),
    .reset(ar),
    .set(as),
    .q(q));
  AL_MUX u_set (
    .i0(enout),
    .i1(1'b1),
    .sel(ss_tmp),
    .o(ssout));

endmodule 

module  AL_DFF_X ( ar, as, sr, ss, en, clk, d, q );

  input ar;
  input as;
  input sr;
  input ss;
  input en;
  input clk;
  input d;
  output q;

  parameter INIT = 1'b0;
  parameter SSROVERCE = "ENABLE";  //DISABLE,ENABLE
  parameter GSR = "DISABLE";       //DISABLE,ENABLE
  parameter REGSET = INIT === 1'b1 ? "SET" : "RESET";
//  parameter REGSET = "RESET";      //RESET,SET

  wire enout;
  wire srout;
  wire ssout;

  reg ssr_over_en;
`ifdef FORMAL_VERIFICATION
  always@(*) begin
`else
  initial begin
`endif
    case (SSROVERCE)
     	"DISABLE"   : ssr_over_en = 0;
     	"ENABLE"    : ssr_over_en = 1;
     	default : begin
      //ssr_over_en = 0;
        $display("Parameter Error : The attribute SSROVERCE in AL_DFF_X instance is set to %s. It's not legal value.\n", SSROVERCE);
        $finish;
      end  
    endcase
  end // initial

  wire sr_tmp = sr & (ssr_over_en | en);
  wire ss_tmp = ss & (ssr_over_en | en);
  AL_MUX u_en (
    .i0(q),
    .i1(d),
    .sel(en),
    .o(enout));
  AL_MUX u_reset (
    .i0(ssout),
    .i1(1'b0),
    .sel(sr_tmp),
    .o(srout));
  AL_DFF #(
    .GSR(GSR),
    .REGSET(REGSET),
    .INI(INIT))
    u_seq (
    .clk(clk),
    .d(srout),
    .reset(ar),
    .set(as),
    .q(q));
  AL_MUX u_set (
    .i0(enout),
    .i1(1'b1),
    .sel(ss_tmp),
    .o(ssout));

endmodule 

module  AL_LATCH_W ( ar, as, sr, ss, en, clk, d, q );

  parameter WIDTH = 1;
  parameter INIT = {WIDTH{1'b0}};
  parameter SSROVERCE = "ENABLE";  //DISABLE,ENABLE
  parameter GSR = "DISABLE";       //DISABLE,ENABLE

  input  [WIDTH-1:0] ar;
  input  [WIDTH-1:0] as;
  input  [WIDTH-1:0] sr;
  input  [WIDTH-1:0] ss;
  input  [WIDTH-1:0] en;
  input              clk;
  input  [WIDTH-1:0] d;
  output [WIDTH-1:0] q;

  genvar i;
  generate
    for (i = 0; i < WIDTH; i = i + 1) begin: gen
      AL_LATCH_X #(.INIT(INIT[i]),
                   .SSROVERCE(SSROVERCE),
                   .GSR(GSR),
                   .REGSET((INIT[i] === 1'b1) ? "SET" : "RESET")
                  )
        latch (.ar(ar[i]),
               .as(as[i]),
               .sr(sr[i]),
               .ss(ss[i]),
               .en(en[i]),
               .clk(clk),
               .d(d[i]),
               .q(q[i])
              );
    end
  endgenerate

endmodule

module AL_LATCH_0 ( ar, as, sr, ss, en, clk, d, q );

  input ar;
  input as;
  input sr;
  input ss;
  input en;
  input clk;
  input d;
  output q;

  parameter SSROVERCE = "ENABLE";  //DISABLE,ENABLE
  parameter GSR = "DISABLE";       //DISABLE,ENABLE
  parameter REGSET = "RESET";      //RESET,SET

  wire enout;
  wire srout;
  wire ssout;

  reg ssr_over_en;
`ifdef FORMAL_VERIFICATION
  always@(*) begin
`else
  initial begin
`endif
    case (SSROVERCE)
     	"DISABLE"   : ssr_over_en = 0;
     	"ENABLE"    : ssr_over_en = 1;
     	default : begin
      //ssr_over_en = 0;
        $display("Parameter Error : The attribute SSROVERCE in AL_LATCH_0 instance is set to %s. It's not legal value.\n", SSROVERCE);
        $finish;
      end  
    endcase
  end // initial

  wire sr_tmp = sr & (ssr_over_en | en);
  wire ss_tmp = ss & (ssr_over_en | en);
  AL_MUX u_en (
    .i0(q),
    .i1(d),
    .sel(en),
    .o(enout));
  AL_MUX u_reset (
    .i0(ssout),
    .i1(1'b0),
    .sel(sr_tmp),
    .o(srout));
  AL_LATCH #(
    .GSR(GSR),
    .REGSET(REGSET),
    .INI(1'b0))
    u_seq (
    .clk(clk),
    .d(srout),
    .reset(ar),
    .set(as),
    .q(q));
  AL_MUX u_set (
    .i0(enout),
    .i1(1'b1),
    .sel(ss_tmp),
    .o(ssout));

endmodule 

module AL_LATCH_1 ( ar, as, sr, ss, en, clk, d, q );

  input ar;
  input as;
  input sr;
  input ss;
  input en;
  input clk;
  input d;
  output q;

  parameter SSROVERCE = "ENABLE";  //DISABLE,ENABLE
  parameter GSR = "DISABLE";       //DISABLE,ENABLE
  parameter REGSET = "SET";        //RESET,SET

  wire enout;
  wire srout;
  wire ssout;

  reg ssr_over_en;
`ifdef FORMAL_VERIFICATION
  always@(*) begin
`else
  initial begin
`endif
    case (SSROVERCE)
     	"DISABLE"   : ssr_over_en = 0;
     	"ENABLE"    : ssr_over_en = 1;
     	default : begin
      //ssr_over_en = 0;
        $display("Parameter Error : The attribute SSROVERCE in AL_LATCH_1 instance is set to %s. It's not legal value.\n", SSROVERCE);
        $finish;
      end  
    endcase
  end // initial

  wire sr_tmp = sr & (ssr_over_en | en);
  wire ss_tmp = ss & (ssr_over_en | en);
  AL_MUX u_en (
    .i0(q),
    .i1(d),
    .sel(en),
    .o(enout));
  AL_MUX u_reset (
    .i0(ssout),
    .i1(1'b0),
    .sel(sr_tmp),
    .o(srout));
  AL_LATCH #(
    .GSR(GSR),
    .REGSET(REGSET),
    .INI(1'b1))
    u_seq (
    .clk(clk),
    .d(srout),
    .reset(ar),
    .set(as),
    .q(q));
  AL_MUX u_set (
    .i0(enout),
    .i1(1'b1),
    .sel(ss_tmp),
    .o(ssout));

endmodule 

module AL_LATCH_X ( ar, as, sr, ss, en, clk, d, q );

  input ar;
  input as;
  input sr;
  input ss;
  input en;
  input clk;
  input d;
  output q;

  parameter INIT = 1'b0;
  parameter SSROVERCE = "ENABLE";  //DISABLE,ENABLE
  parameter GSR = "DISABLE";       //DISABLE,ENABLE
  parameter REGSET = INIT === 1'b1 ? "SET" : "RESET";
//  parameter REGSET = "RESET";      //RESET,SET

  wire enout;
  wire srout;
  wire ssout;

  reg ssr_over_en;
`ifdef FORMAL_VERIFICATION
  always@(*) begin
`else
  initial begin
`endif
    case (SSROVERCE)
     	"DISABLE"   : ssr_over_en = 0;
     	"ENABLE"    : ssr_over_en = 1;
     	default : begin
      //ssr_over_en = 0;
        $display("Parameter Error : The attribute SSROVERCE in AL_LATCH_X instance is set to %s. It's not legal value.\n", SSROVERCE);
        $finish;
      end  
    endcase
  end // initial

  wire sr_tmp = sr & (ssr_over_en | en);
  wire ss_tmp = ss & (ssr_over_en | en);
  AL_MUX u_en (
    .i0(q),
    .i1(d),
    .sel(en),
    .o(enout));
  AL_MUX u_reset (
    .i0(ssout),
    .i1(1'b0),
    .sel(sr_tmp),
    .o(srout));
  AL_LATCH #(
    .GSR(GSR),
    .REGSET(REGSET),
    .INI(INIT))
    u_seq (
    .clk(clk),
    .d(srout),
    .reset(ar),
    .set(as),
    .q(q));
  AL_MUX u_set (
    .i0(enout),
    .i1(1'b1),
    .sel(ss_tmp),
    .o(ssout));

endmodule 

module AL_MUX
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

  wire not_sel, sel_i0, sel_i1;
  not u0 (not_sel, sel);
  and u1 (sel_i1, sel, i1);
  and u2 (sel_i0, not_sel, i0);
  or u3 (o, sel_i1, sel_i0);

endmodule

module AL_DFF
  (
  reset,
  set,
  clk,
  d,
  q
  );

  input reset;
  input set;
  input clk;
  input d;
  output reg q;

  parameter INI = 1'b0;
  parameter GSR = "DISABLE";       //DISABLE,ENABLE
  parameter REGSET = "RESET";      //RESET,SET

  reg mc1_gsr;
  reg mc1_asyncreset;
`ifdef FORMAL_VERIFICATION
  always @(*) begin
`else
  initial begin
`endif
    case (GSR)
     	"DISABLE"   : mc1_gsr = 0;
     	"ENABLE"    : mc1_gsr = 1;
     	default : begin
      //mc1_gsr = 0;
        $display("Parameter Error : The attribute GSR in AL_DFF instance is set to %s. It's not Legal value.\n", GSR);
        $finish;
      end  
    endcase

    case (REGSET)
      "RESET"   : mc1_asyncreset = 1;
      "SET"     : mc1_asyncreset = 0;
      default : begin
      // mc1_asyncreset = 0;
        $display("Parameter Error : The attribute REGSET in AL_DFF instance is set to %s. It's not Legal value.\n", REGSET);
        $finish;
      end
    endcase
  end

  wire gsrn;
  wire done_gwe;
`ifdef FORMAL_VERIFICATION
  assign gsrn = 1'b1;
  assign done_gwe = 1'b1;
`else
  assign gsrn = 1'b0;
  assign done_gwe = 1'b1;
`endif
  wire gsr  = !(done_gwe & (!mc1_gsr) | gsrn);
  wire rst_tmp = reset | ( mc1_asyncreset & gsr);
  wire set_tmp = set   | (!mc1_asyncreset & gsr);

  always @(posedge rst_tmp or posedge set_tmp or posedge clk)
  begin
    if (rst_tmp)
      q <= 1'b0;
    else if (set_tmp)
      q <= 1'b1;
    else
      q <= d;
  end

endmodule

module AL_LATCH
  (
  reset,
  set,
  clk,
  d,
  q
  );

  input reset;
  input set;
  input clk;
  input d;
  output reg q;

  parameter INI = 1'b0;
  parameter GSR = "DISABLE";       //DISABLE,ENABLE
  parameter REGSET = "RESET";      //RESET,SET

  reg mc1_gsr;
  reg mc1_asyncreset;
`ifdef FORMAL_VERIFICATION
  always @(*) begin
`else
  initial begin
`endif
    case (GSR)
     	"DISABLE"   : mc1_gsr = 0;
     	"ENABLE"    : mc1_gsr = 1;
     	default : begin
      //mc1_gsr = 0;
        $display("Parameter Error : The attribute GSR in AL_LATCH instance is set to %s. It's not Legal value.\n", GSR);
        $finish;
      end  
    endcase

    case (REGSET)
      "RESET"   : mc1_asyncreset = 1;
      "SET"     : mc1_asyncreset = 0;
      default : begin
      // mc1_asyncreset = 0;
        $display("Parameter Error : The attribute REGSET in AL_LATCH instance is set to %s. It's not Legal value.\n", REGSET);
        $finish;
      end
    endcase
  end

  wire gsrn;
  wire done_gwe;
`ifdef FORMAL_VERIFICATION
  assign gsrn = 1'b1;
  assign done_gwe = 1'b1;
`else
  assign gsrn = 1'b0;
  assign done_gwe = 1'b1;
`endif

  wire gsr  = !(done_gwe & (!mc1_gsr) | gsrn);
  wire rst_tmp = reset | ( mc1_asyncreset & gsr);
  wire set_tmp = set   | (!mc1_asyncreset & gsr);

  always @(rst_tmp or set_tmp or clk or d)
  begin
    if (rst_tmp)
      q <= 1'b0;
    else if (set_tmp)
      q <= 1'b1;
    else if (clk)
      q <= d;
  end

endmodule

module AL_FADD
  (
  a,
  b,
  c,
  sum,
  cout
  );

  input a;
  input b;
  input c;
  output sum;
  output cout;

  wire prop;
  wire not_prop;
  wire sel_i0;
  wire sel_i1;

  xor u0 (prop, a, b);
  xor u1 (sum, prop, c);
  not u2 (not_prop, prop);
  and u3 (sel_i1, prop, c);
  and u4 (sel_i0, not_prop, a);
  or  u5 (cout, sel_i0, sel_i1);

endmodule


`timescale 1ns/1ps
module tb_board_startup;
reg clk=0, app_clk=0;
always #10 clk=~clk;
always #7 app_clk=~app_clk;
// Important: the cold-start test NEVER pulses the board reset input.
reg ext_n=1, locked=1;
wire pll_n, logic_n, app_n;
board_startup_reset #(.PLL_RESET_CYCLES(8), .LOGIC_RESET_CYCLES(20)) dut(
    .clk(clk), .ext_rst_n(ext_n), .plls_locked(locked),
    .pll_reset_n(pll_n), .logic_reset_n(logic_n)
);
reset_sync sync(app_clk,logic_n,app_n);
reg [7:0] peripheral_state;
always @(posedge app_clk or negedge app_n)
    if(!app_n) peripheral_state<=8'ha5;
    else peripheral_state<=peripheral_state+1'b1;
integer stable_cycles=0;
always @(posedge clk) begin
    if(!ext_n || !pll_n || !locked) stable_cycles<=0;
    else stable_cycles<=stable_cycles+1;
end
always @(posedge logic_n)
    if(stable_cycles<20) $fatal(1,"logic released before lock qualification");
task ticks(input integer n); repeat(n) @(negedge clk); endtask
initial begin
    #1;
    if(pll_n!==0 || logic_n!==0) $fatal(1,"no autonomous power-on reset");
    ticks(7);
    if(pll_n!==0 || logic_n!==0) $fatal(1,"PLL reset too short");
    ticks(2);
    if(pll_n!==1 || logic_n!==0) $fatal(1,"PLL release depends on lock");
    if(peripheral_state!==8'ha5) $fatal(1,"cold peripheral reset was not executed");
    wait(logic_n); wait(app_n);
    if(peripheral_state!==8'ha5) $fatal(1,"reset value lost before domain release");
    ticks(2);
    // A real loss of lock resets logic, but must not reassert PLL reset.
    @(negedge clk) locked=0;
    #1; if(logic_n!==0 || pll_n!==1) $fatal(1,"lock loss reset/PLL feedback");
    ticks(4);
    if(peripheral_state!==8'ha5) $fatal(1,"lock-loss reset not propagated");
    locked=1;
    ticks(19); if(logic_n!==0) $fatal(1,"lock did not requalify");
    wait(logic_n);
    // Manual reset repeats both stages and can still start with lock held low.
    #3 ext_n=0; locked=0;
    #1; if(pll_n!==0 || logic_n!==0) $fatal(1,"manual reset not asynchronous");
    ticks(2); ext_n=1;
    ticks(10);
    if(pll_n!==1 || logic_n!==0) $fatal(1,"PLL reset lock feedback deadlock");
    locked=1; wait(logic_n); wait(app_n);
    $display("PASS board startup: no reset-key pulse, PLL hold, stable lock hold, peripheral reset, lock loss, manual restart");
    $finish;
end
initial begin #10000; $fatal(1,"board startup test timed out"); end
endmodule

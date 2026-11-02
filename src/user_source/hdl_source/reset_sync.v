// Lesson 6: asynchronous assertion, two-edge synchronous release per domain.
module reset_sync(input clk, input ext_rst_n, output rst_n_sync);
    (* async_reg = "true" *) reg s1, s2;
    always @(posedge clk or negedge ext_rst_n)
        if(!ext_rst_n) begin s1<=0; s2<=0; end
        else begin s1<=1; s2<=s1; end
    assign rst_n_sync=s2;
endmodule

// Generate an actual reset after configuration, even if the board reset key
// stays high and the PLLs have already locked before user logic starts.
// The zero initial values are FPGA configuration state, not a simulation pulse.
module board_startup_reset #(
    parameter integer PLL_RESET_CYCLES = 50_000,     // 1 ms at 50 MHz
    parameter integer LOGIC_RESET_CYCLES = 25_000_000 // 500 ms of stable lock
)(
    input clk,
    input ext_rst_n,
    input plls_locked,
    output pll_reset_n,
    output logic_reset_n
);
    localparam integer PLL_BITS = PLL_RESET_CYCLES <= 1 ? 1 : $clog2(PLL_RESET_CYCLES);
    localparam integer LOGIC_BITS = LOGIC_RESET_CYCLES <= 1 ? 1 : $clog2(LOGIC_RESET_CYCLES);
    reg [PLL_BITS-1:0] pll_count = 0;
    reg pll_released = 0;
    reg [LOGIC_BITS-1:0] logic_count = 0;
    reg logic_released = 0;
    (* async_reg = "true" *) reg [1:0] lock_sync = 0;

    // No lock feedback here: a low lock must never hold its own PLL in reset.
    always @(posedge clk or negedge ext_rst_n) begin
        if (!ext_rst_n) begin
            pll_count <= 0;
            pll_released <= 0;
        end else if (!pll_released) begin
            if (PLL_RESET_CYCLES <= 1 || pll_count == PLL_RESET_CYCLES-1)
                pll_released <= 1;
            else pll_count <= pll_count + 1'b1;
        end
    end

    always @(posedge clk or negedge ext_rst_n) begin
        if (!ext_rst_n) lock_sync <= 0;
        else lock_sync <= {lock_sync[0], plls_locked && pll_released};
    end

    always @(posedge clk or negedge ext_rst_n) begin
        if (!ext_rst_n) begin
            logic_count <= 0;
            logic_released <= 0;
        end else if (!pll_released || !lock_sync[1] || !plls_locked) begin
            logic_count <= 0;
            logic_released <= 0;
        end else if (!logic_released) begin
            if (LOGIC_RESET_CYCLES <= 1 || logic_count == LOGIC_RESET_CYCLES-1)
                logic_released <= 1;
            else logic_count <= logic_count + 1'b1;
        end
    end

    assign pll_reset_n = ext_rst_n && pll_released;
    assign logic_reset_n = ext_rst_n && pll_released && plls_locked && logic_released;
endmodule

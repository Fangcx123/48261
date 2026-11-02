# 50 MHz board reference; preserve related pixel/serializer timing analysis.
create_clock -name clk -period 20 -waveform {0 10} [get_ports {clk}]
derive_clocks
rename_clock -name {sd_card_clk} -source [get_ports {clk}] -master_clock {clk} [get_pins {sys_pll_m0/pll_inst.clkc[0]}]
rename_clock -name {ext_mem_clk} -source [get_ports {clk}] -master_clock {clk} [get_pins {sys_pll_m0/pll_inst.clkc[1]}]
rename_clock -name {video_clk} -source [get_ports {clk}] -master_clock {clk} [get_pins {video_pll_m0/pll_inst.clkc[0]}]
rename_clock -name {hdmi_5x_clk} -source [get_ports {clk}] -master_clock {clk} [get_pins {video_pll_m0/pll_inst.clkc[1]}]
# No mutually exclusive grouping: both video clocks operate simultaneously.
# No global false paths between SDRAM clock phases or the frame-buffer clocks.
# Board IO delays require measured external timing and are not invented here.
# reset_source_n drives ONLY the asynchronous clear inputs of the eight
# reset_sync flops (four domains, s1/s2). Release to user logic is via s2.
# Match that source net: TD can pack these flops into unrelated LUT slices,
# renaming their SR endpoints (e.g. seg_scan_m0/sel1_syn_479.sr), so matching
# RTL register names loses exceptions after packing. This exception ends at
# those asynchronous SR inputs; s1.Q -> s2.D and every downstream synchronized
# reset/data path remain timed. Do not add user logic to reset_source_n.
set_false_path -through [get_nets {reset_source_n}]

# Each FIFO clear net drives ONLY the SR pins of its four internal reset
# synchronizer flops (two per clock domain). Async assertion is intentional;
# deassertion to FIFO logic is synchronized by the vendor IP. Audit consumers
# after routing in check_reset_constraints.py, including packed/renamed cells.
# No data path or synchronizer stage-to-stage timing is excluded here.
set_false_path -through [get_nets {u_frame_loader/fifo_rst}]
set_false_path -through [get_nets {u_frame_reader/clear_fifo}]

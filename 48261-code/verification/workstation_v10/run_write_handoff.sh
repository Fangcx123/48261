#!/bin/sh
set -eu
cd "$(dirname "$0")/../.."
v=verification/workstation_v10
iverilog -g2012 -s tb_write_handoff -o "$v/write_handoff.vvp" "$v/tb_write_handoff.v" src/user_source/hdl_source/SD/frame_fifo_write.v
vvp "$v/write_handoff.vvp"
vvp "$v/write_handoff.vvp" +drain_only

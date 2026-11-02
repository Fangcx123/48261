#!/bin/sh
set -eu
cd "$(dirname "$0")/../.."
v=verification/workstation_v10
iverilog -g2005 -s tb_menu_gate -o "$v/menu_gate.vvp" "$v/tb_menu_gate.v" "$v/menu_compare_gate.v" src/user_source/hdl_source/display/media_menu_overlay.v "$v/al_map_basic_public.v" "$v/logic_rom_model.v"
vvp "$v/menu_gate.vvp"

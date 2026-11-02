#!/bin/sh
set -eu
cd "$(dirname "$0")/../.."
h=src/user_source/hdl_source
v=verification/media_v9
iverilog -g2012 -s tb_settings -o "$v/settings.vvp" "$v/tb_settings.v" "$h/display/media_settings_cdc.v"
vvp "$v/settings.vvp"
iverilog -g2012 -s tb_preview_chain -o "$v/preview.vvp" "$v/tb_preview_chain.v" "$h"/display/*.v
vvp "$v/preview.vvp"
iverilog -g2012 -s tb_menu -o "$v/menu.vvp" "$v/tb_menu.v" "$h/display/media_menu_overlay.v"
vvp "$v/menu.vvp"

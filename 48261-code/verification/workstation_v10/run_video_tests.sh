#!/bin/sh
set -eu
cd "$(dirname "$0")/../.."
h=src/user_source/hdl_source
v=verification/workstation_v10
iverilog -g2012 -s tb_captions -o "$v/captions.vvp" "$v/tb_captions.v" "$h/display/speech_caption_overlay.v" "$h/display/speech_caption_rom.v"
vvp "$v/captions.vvp"
iverilog -g2012 -s tb_preview_chain -o "$v/chain.vvp" "$v/tb_preview_chain.v" "$h"/display/*.v
vvp "$v/chain.vvp"
iverilog -g2012 -s tb_menu -o "$v/menu.vvp" "$v/tb_menu.v" "$h/display/media_menu_overlay.v"
vvp "$v/menu.vvp"

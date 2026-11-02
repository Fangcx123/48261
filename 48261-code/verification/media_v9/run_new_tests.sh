#!/bin/sh
set -eu
cd "$(dirname "$0")/../.."
h=src/user_source/hdl_source
v=verification/media_v9
iverilog -g2012 -s tb_adjust -o "$v/adjust.vvp" "$v/tb_adjust.v" "$h/display/brightness_contrast_adjust.v"
vvp "$v/adjust.vvp"
iverilog -g2012 -s tb_ui -o "$v/ui.vvp" "$v/tb_ui.v" "$h/SD/media_ui_controller.v"
vvp "$v/ui.vvp"
iverilog -g2012 -s tb_scaler -o "$v/scaler.vvp" "$v/tb_scaler.v" "$h/SD/bmp_nearest_scaler.v"
for dim in '1 1' '3 5' '320 240' '641 481' '1280 960' '2048 2' '2 2048'; do
 set -- $dim
 vvp "$v/scaler.vvp" +w="$1" +h="$2"
done

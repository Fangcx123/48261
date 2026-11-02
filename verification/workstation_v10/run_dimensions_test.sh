#!/bin/sh
set -eu
cd "$(dirname "$0")/../.."
iverilog -g2012 -s tb_dimensions_osd -o verification/workstation_v10/dimensions.vvp verification/workstation_v10/tb_dimensions_osd.v src/user_source/hdl_source/display/promax_text_overlay.v
vvp verification/workstation_v10/dimensions.vvp

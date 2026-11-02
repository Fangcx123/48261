#!/bin/sh
set -eu
cd "$(dirname "$0")/../.."
h=src/user_source/hdl_source
v=verification/wav_v8
python3 "$v/make_wav_fixtures.py" > "$v/fixtures.log"
iverilog -g2012 -Wall -s tb_wav_player -o "$v/player.vvp" "$v/tb_wav_player.v" \
 "$h/audio/fat32_wav_player.v" "$h/audio/pcm_async_fifo.v" "$h/audio/wav_pcm_decoder.v" \
 "$h/SD/fat32_volume_scanner.v" "$h/SD/fat32_file_streamer.v" "$h/SD/sd_sector_adapter.v"
for c in mono stereo short chunks missing bad_rate bad_bits bad_magic bad_align bad_riff no_data odd_data truncated bad_fat loop_fat short_sector timeout underflow superfloppy activefat spc8; do
 vvp "$v/player.vvp" +case="$c"
done

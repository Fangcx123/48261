source [file join [file dirname [info script]] paths.tcl]
# Generate the final bitstream from the repaired database.
require_file $repaired_db
cd $run_dir
import_device eagle_s20.db -package EG4S20BG256
import_db $repaired_db
update_timing -mode final
report_timing_summary -file [file join $output_dir final_timing.rpt]
bitgen -bit $final_bit
require_file $final_bit
puts "PACKAGE_BITGEN_OK"
exit

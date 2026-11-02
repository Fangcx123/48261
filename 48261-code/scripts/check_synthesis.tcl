source [file join [file dirname [info script]] paths.tcl]
# Optional source/IP compilation check, without placement and routing.
cd $project_dir
import_device eagle_s20.db -package EG4S20BG256
open_project $project_file
reset_runs syn_1
launch_runs syn_1 -step gate
wait_run syn_1 -quiet
close_project
require_file [file join $project_dir ${project_name}_Runs syn_1 ${project_name}_gate.db]
puts "PACKAGE_SYNTHESIS_OK"
exit

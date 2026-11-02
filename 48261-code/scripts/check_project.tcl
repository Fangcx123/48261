source [file join [file dirname [info script]] paths.tcl]
# Read the project in TD without launching synthesis or implementation.
cd $project_dir
import_device eagle_s20.db -package EG4S20BG256
open_project $project_file
close_project
puts "PACKAGE_PROJECT_OK"
exit

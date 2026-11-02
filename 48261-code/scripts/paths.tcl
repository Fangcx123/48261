# Paths are resolved from this script, independently of the working directory.
set package_root [file normalize [file join [file dirname [info script]] ..]]
set project_dir [file join $package_root src td_project_workstation_v10]
set project_name HDMI1.4b_Transmitter_v1.0
set project_file [file join $project_dir ${project_name}.al]
set run_dir [file join $project_dir ${project_name}_Runs phy_1]
set output_dir [file join $package_root output]
set routed_db [file join $run_dir ${project_name}_pr.db]
set repaired_db [file join $output_dir multimedia_hold_eco.db]
set final_bit [file join $output_dir multimedia_system.bit]
file mkdir $output_dir

proc require_file {path} {
    if {![file isfile $path]} { error "Required file is missing: $path" }
}
require_file $project_file
set channel [open $project_file r]
fconfigure $channel -encoding utf-8
set project_text [read $channel]
close $channel
set reference_count 0
foreach {whole relative_path} [regexp -all -inline {<File\s+Path="([^"]+)"} $project_text] {
    if {[file pathtype $relative_path] ne "relative"} {
        error "Project contains an absolute source path: $relative_path"
    }
    require_file [file normalize [file join $project_dir $relative_path]]
    incr reference_count
}
if {$reference_count == 0} { error "No project source references found" }
puts "PACKAGE_REFERENCES_OK: $reference_count"

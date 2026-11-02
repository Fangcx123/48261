cd [file normalize [file join [file dirname [info script]] ../src/td_project]]
import_device eagle_s20.db -package EG4S20BG256
open_project HDMI1.4b_Transmitter_v1.0.al -noanalyze
source ../../verification/ensure_media_sources.tcl
close_project
open_project HDMI1.4b_Transmitter_v1.0.al
close_project
exit

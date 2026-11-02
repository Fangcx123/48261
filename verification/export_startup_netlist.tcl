# Inspect the synthesized configuration/reset state without touching hardware.
cd [file normalize [file join [file dirname [info script]] ..]]
import_device eagle_s20.db -package EG4S20BG256
import_db src/td_project/HDMI1.4b_Transmitter_v1.0_Runs/syn_1/HDMI1.4b_Transmitter_v1.0_gate.db
write_verilog verification/startup_gate.v

# Source in the Tcl Console of the already-open v10 project.
# Set the strategy in the current GUI session.
# Do not use get_param here: TD GUI rejects it in sourced scripts.
# It does not reset runs, start compilation, or program the board.
set_param place seed 1 -run phy_1

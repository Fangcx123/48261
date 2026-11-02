#!/bin/sh
# Sequential place/route seed sweep on the existing v11 synthesis result.
cd "$(dirname "$0")"
R=../../src/td_project_workstation_v10/HDMI1.4b_Transmitter_v1.0_Runs/phy_1
for s in 2 3 4 5 6; do
  td_commands_prompt.exe "$(pwd -W 2>/dev/null || pwd)/seed_$s.tcl" > seed_$s.log 2>&1
  mkdir -p seed_results/seed_$s
  cp $R/final_timing.rpt seed_results/seed_$s/ 2>/dev/null
  cp $R/HDMI1.4b_Transmitter_v1.0_pr.db seed_results/seed_$s/ 2>/dev/null
  e=$(grep -cE '\bERROR\b|\bFATAL\b' $R/run.log)
  echo "seed $s errors=$e $(grep -E 'SWNS:|HWNS:' seed_results/seed_$s/final_timing.rpt | tr -s ' \t\n' ' ')" >> seed_summary.txt
done

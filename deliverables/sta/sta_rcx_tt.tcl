set flow "$::env(HOME)/OpenROAD-flow-scripts/flow"
set spef "$::env(HOME)/i2c_recovery/deliverables/sta/i2c_recovery_rcx.spef"
read_liberty "$flow/platforms/sky130hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib"
read_db "$flow/results/sky130hd/i2c_recovery/base/6_final.odb"
read_sdc "$flow/results/sky130hd/i2c_recovery/base/6_final.sdc"
source "$flow/platforms/sky130hd/setRC.tcl"
read_spef $spef
puts "===== TT RCX EXTRACTED-PARASITIC STA ====="
check_setup
report_checks -path_delay max -format full_clock_expanded
report_checks -path_delay min -format full_clock_expanded
report_worst_slack -max
report_worst_slack -min
exit

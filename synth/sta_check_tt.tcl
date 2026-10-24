read_liberty /home/vsduser/OpenROAD-flow-scripts/flow/platforms/sky130hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib
read_db /home/vsduser/OpenROAD-flow-scripts/flow/results/sky130hd/i2c_recovery/base/6_final.odb
read_sdc /home/vsduser/OpenROAD-flow-scripts/flow/results/sky130hd/i2c_recovery/base/6_final.sdc
source /home/vsduser/OpenROAD-flow-scripts/flow/platforms/sky130hd/setRC.tcl
estimate_parasitics -global_routing
puts "TT corner: global-route parasitic estimates; no extracted SPEF"
check_setup
puts "===== CHECK_SETUP ====="
check_setup -verbose
report_checks -path_delay max -format full_clock_expanded
puts "===== CHECK_SETUP ====="
check_setup -verbose
report_checks -path_delay min -format full_clock_expanded
report_worst_slack -max
report_worst_slack -min
exit

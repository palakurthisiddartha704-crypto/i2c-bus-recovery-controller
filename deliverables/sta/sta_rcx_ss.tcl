set flow "/home/vsduser/OpenROAD-flow-scripts/flow"
read_liberty "/home/vsduser/OpenROAD-flow-scripts/tools/OpenROAD/test/sky130hd/sky130_fd_sc_hd__ss_n40C_1v40.lib"
read_db "$flow/results/sky130hd/i2c_recovery/base/6_final.odb"
read_sdc "$flow/results/sky130hd/i2c_recovery/base/6_final.sdc"
source "$flow/platforms/sky130hd/setRC.tcl"
read_spef "/home/vsduser/i2c_recovery/deliverables/sta/i2c_recovery_rcx.spef"
puts "===== SS RCX STA ====="
check_setup
report_worst_slack -max
report_worst_slack -min
report_checks -path_delay max -format full_clock_expanded
report_checks -path_delay min -format full_clock_expanded
exit

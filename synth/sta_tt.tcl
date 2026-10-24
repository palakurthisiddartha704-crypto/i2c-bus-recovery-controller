read_liberty /home/vsduser/OpenROAD-flow-scripts/flow/platforms/sky130hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib
read_verilog /home/vsduser/OpenROAD-flow-scripts/flow/results/sky130hd/i2c_recovery/base/1_2_yosys.v
link_design i2c_recovery_controller
read_sdc /home/vsduser/OpenROAD-flow-scripts/flow/designs/sky130hd/i2c_recovery/constraint.sdc
check_setup
report_checks -path_delay max -format full_clock_expanded
report_checks -path_delay min -format full_clock_expanded
report_worst_slack -max
report_worst_slack -min
exit

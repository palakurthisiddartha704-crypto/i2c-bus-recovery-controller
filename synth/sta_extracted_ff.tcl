read_liberty /home/vsduser/OpenROAD-flow-scripts/tools/OpenROAD/test/sky130hd/sky130_fd_sc_hd__ff_n40C_1v95.lib
read_db /home/vsduser/OpenROAD-flow-scripts/flow/results/sky130hd/i2c_recovery/base/6_final.odb
read_sdc /home/vsduser/OpenROAD-flow-scripts/flow/results/sky130hd/i2c_recovery/base/6_final.sdc
source /home/vsduser/OpenROAD-flow-scripts/flow/platforms/sky130hd/setRC.tcl
read_spef /home/vsduser/i2c_recovery/synth/i2c_recovery_test.spef
puts "CORNER: FF library with TT experimental SPEF; provisional only"
check_setup
report_checks -path_delay max -format full_clock_expanded
report_checks -path_delay min -format full_clock_expanded
report_worst_slack -max
report_worst_slack -min
exit

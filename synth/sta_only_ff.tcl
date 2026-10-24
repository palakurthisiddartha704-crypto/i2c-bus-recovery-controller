read_liberty /home/vsduser/OpenROAD-flow-scripts/tools/OpenROAD/test/sky130hd/sky130_fd_sc_hd__ff_n40C_1v95.lib
read_db /home/vsduser/OpenROAD-flow-scripts/flow/results/sky130hd/i2c_recovery/base/6_final.odb
read_sdc /home/vsduser/OpenROAD-flow-scripts/flow/results/sky130hd/i2c_recovery/base/6_final.sdc
source /home/vsduser/OpenROAD-flow-scripts/flow/platforms/sky130hd/setRC.tcl
estimate_parasitics -global_routing
puts "CORNER: FF — GLOBAL-ROUTE PARASITIC ESTIMATES; NO SPEF"
check_setup -verbose
exit

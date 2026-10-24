read_liberty /home/vsduser/OpenROAD-flow-scripts/flow/platforms/sky130hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib
read_db /home/vsduser/OpenROAD-flow-scripts/flow/results/sky130hd/i2c_recovery/base/6_final.odb
read_sdc /home/vsduser/OpenROAD-flow-scripts/flow/results/sky130hd/i2c_recovery/base/6_final.sdc
source /home/vsduser/OpenROAD-flow-scripts/flow/platforms/sky130hd/setRC.tcl
read_spef /home/vsduser/i2c_recovery/synth/i2c_recovery_test.spef
check_setup -verbose
exit

set flow "$::env(HOME)/OpenROAD-flow-scripts/flow"
set root "$::env(HOME)/OpenROAD-flow-scripts"
set rules "$root/tools/OpenROAD/test/sky130hd/sky130hd.rcx_rules"
set db "$flow/results/sky130hd/i2c_recovery/base/6_final.odb"
set sdc "$flow/results/sky130hd/i2c_recovery/base/6_final.sdc"
set out "$::env(HOME)/i2c_recovery/deliverables/sta/i2c_recovery_rcx.spef"

source "$root/tools/OpenROAD/src/rcx/src/OpenRCX.tcl"
read_liberty "$flow/platforms/sky130hd/lib/sky130_fd_sc_hd__tt_025C_1v80.lib"
read_db $db
read_sdc $sdc
source "$flow/platforms/sky130hd/setRC.tcl"
if {![file exists $rules]} { error "Sky130HD extraction rules not found: $rules" }
define_process_corner -ext_model_index 0 X
extract_parasitics -ext_model_file $rules
write_spef $out
puts "RCX_TEST_COMPLETE: $out"
exit

set flow "$::env(HOME)/OpenROAD-flow-scripts/flow"
source "$::env(HOME)/OpenROAD-flow-scripts/tools/OpenROAD/src/rcx/src/OpenRCX.tcl"
read_db "$flow/results/sky130hd/i2c_recovery/base/6_final.odb"
set tech [ord::get_db_tech]
puts "TECH_NAME: [$tech getName]"
foreach name {mcon via via2 via3 via4} {
  set layer [$tech findLayer $name]
  if {$layer == "NULL"} {
    puts "$name: NOT_FOUND"
  } else {
    puts "$name: found"
  }
}
puts "RULE_FILE: $flow/tools/OpenROAD/test/sky130hd/sky130hd.rcx_rules"
puts "RULE_FILE_EXISTS: [file exists $flow/tools/OpenROAD/test/sky130hd/sky130hd.rcx_rules]"
exit

###############################################################################
# Created by write_sdc
###############################################################################
current_design i2c_recovery_controller
###############################################################################
# Timing Constraints
###############################################################################
create_clock -name core_clk -period 10.0000 [get_ports {clk}]
set_clock_uncertainty 0.2000 core_clk
set_propagated_clock [get_clocks {core_clk}]
set_input_delay 1.0000 -clock [get_clocks {core_clk}] -add_delay [get_ports {enable}]
set_input_delay 1.0000 -clock [get_clocks {core_clk}] -add_delay [get_ports {rst_n}]
set_input_delay 1.0000 -clock [get_clocks {core_clk}] -add_delay [get_ports {scl_in}]
set_input_delay 1.0000 -clock [get_clocks {core_clk}] -add_delay [get_ports {sda_in}]
set_output_delay 1.0000 -clock [get_clocks {core_clk}] -add_delay [get_ports {busy}]
set_output_delay 1.0000 -clock [get_clocks {core_clk}] -add_delay [get_ports {fault}]
set_output_delay 1.0000 -clock [get_clocks {core_clk}] -add_delay [get_ports {recovery_done}]
set_output_delay 1.0000 -clock [get_clocks {core_clk}] -add_delay [get_ports {scl_release}]
set_output_delay 1.0000 -clock [get_clocks {core_clk}] -add_delay [get_ports {sda_release}]
###############################################################################
# Environment
###############################################################################
###############################################################################
# Design Rules
###############################################################################

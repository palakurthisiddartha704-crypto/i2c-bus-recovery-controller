I2C Bus Hang Detection and Automatic Recovery Controller Using Verilog HDL

Package contents:
- RTL source and testbench
- Final routed Verilog netlist, ODB database, and SDC
- Experimental-SPEF STA scripts and logs
- Global-route RC-estimate STA scripts and logs
- Constraint audit logs

GLOBAL-ROUTE RC-ESTIMATE STA
Corner   Setup Slack (ns)   Hold Slack (ns)
TT       +7.23              +0.35
SS       +1.24              +0.76
FF       +7.82              +0.14

EXPERIMENTAL-SPEF STA
Corner   Setup Slack (ns)   Hold Slack (ns)
TT       +7.30              +0.31
SS       +1.52              +0.72
FF       +7.86              +0.11

Limitations:
- Global-route results use platform RC estimates.
- The experimental-SPEF runs reuse one TT-derived test extraction file for all timing libraries.
- Neither set establishes corner-specific extracted parasitic signoff.
- Reset timing constraints require review.
- Foundry-level DRC/LVS signoff remains outstanding.
- Positive reported slack alone does not prove complete timing coverage or signoff.

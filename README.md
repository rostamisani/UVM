# UVM
Design Verification
#UVM-Based 8-bit Counter Verification

This project demonstrates functional verification of a simple 8-bit synchronous counter using SystemVerilog and UVM.

---

## DUT Overview

- 8-bit synchronous counter with enable and reset.
- Interface signals: `clk`, `rst`, `enable`, `count`.

---

##  Testbench Overview

UVM Testbench includes:
- `uvm_sequence` to control enable/reset signals.
- `uvm_driver` to send stimulus to DUT.
- `uvm_monitor` to collect outputs.
- `uvm_scoreboard` to compare expected vs actual count.

---

##  Simulation Instructions

```bash
# Compile & run (example with ModelSim)
vlog rtl/counter.v tb/top_tb.sv uvm/*.sv
vsim -c work.top_tb -do "run -all; quit"

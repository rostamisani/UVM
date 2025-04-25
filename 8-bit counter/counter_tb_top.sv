`timescale 1ns/1ps
import uvm_pkg::*;
`include "uvm_macros.svh"

module counter_tb_top;
  import uvm_pkg::*;
  `include "counter_if.sv"
  `include "counter.sv"
  `include "counter_transaction.sv"
  `include "counter_driver.sv"
  `include "counter_monitor.sv"
  `include "counter_scoreboard.sv"
  `include "counter_agent.sv"
  `include "counter_env.sv"
  `include "counter_test.sv"

  counter_if cif();
  counter #(.WIDTH(8)) dut(.clk(cif.clk), .rst(cif.rst), .count(cif.count));

  initial begin
    uvm_config_db#(virtual counter_if)::set(null, "*", "vif", cif);
    run_test("counter_test");
  end

  initial forever #5 cif.clk = ~cif.clk;
endmodule
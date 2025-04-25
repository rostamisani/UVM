class counter_monitor extends uvm_monitor;
  `uvm_component_utils(counter_monitor)
  virtual counter_if vif;
  uvm_analysis_port #(counter_transaction) ap;

  function new(string name, uvm_component parent);
    super.new(name, parent);
    ap = new("ap", this);
  endfunction

  task run_phase(uvm_phase phase);
    forever begin
      counter_transaction tr = new();
      @(posedge vif.clk);
      tr.rst = vif.rst;
      ap.write(tr);
    end
  endtask
endclass
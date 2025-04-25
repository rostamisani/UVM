class counter_agent extends uvm_agent;
  `uvm_component_utils(counter_agent)
  counter_driver drv;
  counter_monitor mon;
  uvm_sequencer #(counter_transaction) seqr;
  virtual counter_if vif;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    drv = counter_driver::type_id::create("drv", this);
    mon = counter_monitor::type_id::create("mon", this);
    seqr = uvm_sequencer#(counter_transaction)::type_id::create("seqr", this);
    drv.vif = vif;
    mon.vif = vif;
  endfunction
endclass
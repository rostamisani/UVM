class counter_driver extends uvm_driver #(counter_transaction);
  `uvm_component_utils(counter_driver)
  virtual counter_if vif;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  task run_phase(uvm_phase phase);
    forever begin
      counter_transaction tr;
      seq_item_port.get_next_item(tr);
      vif.rst <= tr.rst;
      seq_item_port.item_done();
      @(posedge vif.clk);
    end
  endtask
endclass
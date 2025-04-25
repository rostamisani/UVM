class counter_test extends uvm_test;
  `uvm_component_utils(counter_test)
  counter_env env;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env = counter_env::type_id::create("env", this);
  endfunction

  task run_phase(uvm_phase phase);
    counter_transaction tr;
    phase.raise_objection(this);
    tr = counter_transaction::type_id::create("tr");
    tr.rst = 1;
    env.agt.seqr.start_item(tr);
    env.agt.seqr.finish_item(tr);
    @(posedge env.agt.vif.clk);
    repeat (10) begin
      tr.rst = 0;
      env.agt.seqr.start_item(tr);
      env.agt.seqr.finish_item(tr);
      @(posedge env.agt.vif.clk);
    end
    phase.drop_objection(this);
  endtask
endclass
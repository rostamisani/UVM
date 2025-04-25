class counter_scoreboard extends uvm_component;
  `uvm_component_utils(counter_scoreboard)
  uvm_analysis_imp #(counter_transaction, counter_scoreboard) analysis_export;
  virtual counter_if vif;
  bit [7:0] expected;

  function new(string name, uvm_component parent);
    super.new(name, parent);
    analysis_export = new("analysis_export", this);
    expected = 0;
  endfunction

  function void write(counter_transaction tr);
    if (tr.rst)
      expected = 0;
    else
      expected++;

    if (vif.count !== expected)
      `uvm_error("SCOREBOARD", $sformatf("Expected: %0d, Got: %0d", expected, vif.count))
  endfunction
endclass
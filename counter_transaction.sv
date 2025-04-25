class counter_transaction extends uvm_sequence_item;
  rand bit rst;

  `uvm_object_utils(counter_transaction)

  function new(string name = "counter_transaction");
    super.new(name);
  endfunction
endclass
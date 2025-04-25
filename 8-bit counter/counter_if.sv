interface counter_if #(parameter WIDTH = 8);
  logic clk;
  logic rst;
  logic [WIDTH-1:0] count;
endinterface
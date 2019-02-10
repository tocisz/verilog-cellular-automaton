module ca_cell(clk, out, rule, left, state, set_state, right);
  input wire       clk;
  input wire [7:0] rule;

  input wire       left;
  input wire       right;

  input wire       state;
  input wire       set_state;

  output reg       out;

  always @ ( posedge clk ) begin
    if (set_state)
      out <= state;
    else
      out <= rule[{left,out,right}];
  end

endmodule

module ca_cell (
  input wire       clk,
  input wire [7:0] rule,

  input wire       left,
  input wire       right,

  input wire       state,
  input wire       set_state,

  output logic     out
);

  always_ff @ ( posedge clk )
  begin
    if (set_state)
      out <= state;
    else
      out <= rule[{left,out,right}];
  end

endmodule

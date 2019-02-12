module ca3(
  input wire       clk,
  input wire [7:0] rule,

  input wire       left,
  input wire       right,

  input wire [31:0] state,
  input wire       set_state,

  output wire [31:0] out
);

  genvar i;
  generate
  for (i=0; i <= 31; i=i+1)
    ca_cell ith(
      .clk,
      .rule,
      .set_state,
      .state(state[i]),
      .out(out[i]),

      .left(i == 0 ? left : out[i-1]),
      .right(i == 31 ? right : out[i+1])
    );
  endgenerate

endmodule

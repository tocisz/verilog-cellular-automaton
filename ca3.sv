module ca3(
  input wire       clk,
  input wire [7:0] rule,

  input wire       left,
  input wire       right,

  input wire [31:0] state,
  input wire       set_state,

  output wire [31:0] out
);

  ca_cell i_first(
    .clk,
    .rule,
    .set_state,
    .state(state[0]),
    .out(out[0]),

    .left,
    .right(out[1])
  );

  genvar index;
  generate
  for (index=1; index < 31; index=index+1)
    ca_cell ith(
      .clk,
      .rule,
      .set_state,
      .state(state[index]),
      .out(out[index]),

      .left(out[index-1]),
      .right(out[index+1])
    );
  endgenerate

  ca_cell i_last(
    .clk,
    .rule,
    .set_state,
    .state(state[31]),
    .out(out[31]),

    .left(out[30]),
    .right
  );
endmodule

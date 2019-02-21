module ca3(
  input wire       clk,
  input wire [7:0] rule,

  input wire [WIDTH-1 : 0] state,
  input wire       set_state,

  output wire [WIDTH-1 : 0] out
);

  parameter WIDTH = 32;

  genvar i;
  generate
  for (i=0; i < WIDTH; ++i)
    ca_cell ith(
      .clk,
      .rule,
      .set_state,
      .state(state[i]),
      .out(out[i]),

      .left(i == 0 ? out[WIDTH-1] : out[i-1]),
      .right(i == WIDTH-1 ? out[0] : out[i+1])
    );
  endgenerate

endmodule

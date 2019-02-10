module ca2(clk, out, rule, left, state, set_state, right);
  input wire       clk;
  input wire [7:0] rule;

  input wire       left;
  input wire       right;

  input wire [7:0] state;
  input wire       set_state;

  output wire [7:0] out;

  ca_cell i01(
    .clk(clk),
    .rule(rule),
    .set_state(set_state),
    .state(state[0]),
    .out(out[0]),

    .left(left),
    .right(out[1])
  );

  ca_cell i02(
    .clk(clk),
    .rule(rule),
    .set_state(set_state),
    .state(state[1]),
    .out(out[1]),

    .left(out[0]),
    .right(out[2])
  );

  ca_cell i03(
    .clk(clk),
    .rule(rule),
    .set_state(set_state),
    .state(state[2]),
    .out(out[2]),

    .left(out[1]),
    .right(out[3])
  );

  ca_cell i04(
    .clk(clk),
    .rule(rule),
    .set_state(set_state),
    .state(state[3]),
    .out(out[3]),

    .left(out[2]),
    .right(out[4])
  );

  ca_cell i05(
    .clk(clk),
    .rule(rule),
    .set_state(set_state),
    .state(state[4]),
    .out(out[4]),

    .left(out[3]),
    .right(out[5])
  );

  ca_cell i06(
    .clk(clk),
    .rule(rule),
    .set_state(set_state),
    .state(state[5]),
    .out(out[5]),

    .left(out[4]),
    .right(out[6])
  );

  ca_cell i07(
    .clk(clk),
    .rule(rule),
    .set_state(set_state),
    .state(state[6]),
    .out(out[6]),

    .left(out[5]),
    .right(out[7])
  );

  ca_cell i08(
    .clk(clk),
    .rule(rule),
    .set_state(set_state),
    .state(state[7]),
    .out(out[7]),

    .left(out[6]),
    .right(right)
  );
endmodule

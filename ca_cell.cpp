#include <iostream>
#include <bitset>
#include <cassert>

#include "Vca_cell.h"

void print(Vca_cell& top, int i) {
    std::cout << "i=" << i
      << " out=" << std::bitset<1>(top.out)
      << std::endl;
}

void testCa() {
  std::cout << "Testing ca" << std::endl;
  int count = 0;
  Vca_cell ca;

  ca.clk = 0;
  ca.rule = 30; // use rule 30
  ca.set_state = 1;
  ca.state = 0; // X0X
  ca.eval();

  ca.clk = 1;
  ca.eval();
  print(ca, ++count);

  ca.set_state = 0;
  ca.left = 1;
  ca.right = 0; // 100
  ca.clk = 0;
  ca.eval();

  ca.clk = 1;
  ca.eval();
  assert(ca.out == 1); // 100 => X1X
  print(ca, ++count);

  ca.left = 1;
  ca.right = 0; // 110
  ca.clk = 0;
  ca.eval();

  ca.clk = 1;
  ca.eval();
  assert(ca.out == 0); // 110 => X0X
  print(ca, ++count);

  ca.left = 0;
  ca.right = 1; // 001
  ca.clk = 0;
  ca.eval();

  ca.clk = 1;
  ca.eval();
  assert(ca.out == 1); // 001 => X1X
  print(ca, ++count);

  ca.left = 0;
  ca.right = 1; // 011
  ca.clk = 0;
  ca.eval();

  ca.clk = 1;
  ca.eval();
  assert(ca.out == 1); // 011 => X1X
  print(ca, ++count);

}

int main(int argc, char **argv, char **env) {
  Verilated::commandArgs(argc, argv);
  testCa();
  exit(0);
}

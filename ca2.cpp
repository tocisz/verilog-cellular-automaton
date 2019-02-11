#include <iostream>
#include <bitset>
#include <cassert>

#include "Vca2.h"

void print(Vca2& top, int i) {
    std::cout << "i=" << i
      << "\tout=" << std::bitset<8>(top.out)
      << std::endl;
}

void testCa2() {
  std::cout << "Testing ca2" << std::endl;
  int count = 0;
  Vca2 ca;

  ca.clk = 0;
  ca.rule = 30; // use rule 30
  ca.set_state = 1;
  ca.state = 16; // 00010000
  ca.eval();

  ca.clk = 1;
  ca.eval();
  print(ca, ++count);

  ca.set_state = 0;
  ca.left = 0;
  ca.right = 0;

  while (count < 10) {
    ca.clk = 0;
    ca.eval();

    ca.clk = 1;
    ca.eval();
    print(ca, ++count);
  }

}

int main(int argc, char **argv, char **env) {
  Verilated::commandArgs(argc, argv);
  testCa2();
  exit(0);
}

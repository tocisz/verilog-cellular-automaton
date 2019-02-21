#include <iostream>
#include <bitset>
#include <cassert>

#include "Vca3.h"

void print(Vca3& top, int i) {
    std::cout << "i=" << i
      << "\tout=" << std::bitset<32>(top.out)
      << std::endl;
}

void testCa3() {
  std::cout << "Testing ca3" << std::endl;
  int count = 0;
  Vca3 ca;

  ca.clk = 0;
  ca.rule = 30; // use rule 30
  ca.set_state = 1;
  ca.state = 1 << 16; // 00010000
  ca.eval();

  ca.clk = 1;
  ca.eval();
  print(ca, ++count);

  ca.set_state = 0;

  while (count < 120) {
    ca.clk = 0;
    ca.eval();

    ca.clk = 1;
    ca.eval();
    print(ca, ++count);
  }

}

int main(int argc, char **argv, char **env) {
  Verilated::commandArgs(argc, argv);
  testCa3();
  exit(0);
}

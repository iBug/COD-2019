package alu

import chisel3.iotesters

import util._

object Tests extends App {
  // ALU Tests
  ALUTester.main(args)
  AdderTester.main(args)
  RegisterTester.main(args)

  // ALU Utility Tests
  ComparatorTester.main(args)
  AccumulatorTester.main(args)
  FibonacciTester.main(args)
}

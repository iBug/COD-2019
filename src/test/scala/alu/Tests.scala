package alu

import chisel3.iotesters

import util._

object ALUTests extends App {
  // ALU Tests
  iotesters.Driver.execute(args, () => new And(32)) { c => new AndTester(c) }
  iotesters.Driver.execute(args, () => new Or(32)) { c => new OrTester(c) }
  iotesters.Driver.execute(args, () => new Xor(32)) { c => new XorTester(c) }
  iotesters.Driver.execute(args, () => new Adder(32)) { c => new AdderTester(c) }
  iotesters.Driver.execute(args, () => new Register(32)) { c => new RegisterTester(c) }
  iotesters.Driver.execute(args, () => new ALU(6, 3, 4)) { c => new ALUTester(c) }

  // ALU Utility Tests
  iotesters.Driver.execute(args, () => new Comparator(32)) { c => new ComparatorTester(c) }
  iotesters.Driver.execute(args, () => new Accumulator(32)) { c => new AccumulatorTester(c) }
  iotesters.Driver.execute(args, () => new Fibonacci(32)) { c => new FibonacciTester(c) }
}

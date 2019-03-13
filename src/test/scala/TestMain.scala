import chisel3._
import chisel3.util._
import chisel3.iotesters

import alu._

object TestMain extends App {
  // ALU Tests
  iotesters.Driver.execute(args, () => new And(32)) {
    c => new AndTester(c)
  }
  iotesters.Driver.execute(args, () => new Or(32)) {
    c => new OrTester(c)
  }
  iotesters.Driver.execute(args, () => new Xor(32)) {
    c => new XorTester(c)
  }
  iotesters.Driver.execute(args, () => new Adder(32)) {
    c => new AdderTester(c)
  }
}

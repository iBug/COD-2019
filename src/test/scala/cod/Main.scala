package cod

import chisel3._
import chisel3.util._
import chisel3.iotesters

object TestMain extends App {
  iotesters.Driver.execute(args, () => new Adder(32)) {
    c => new AdderTester(c)
  }
}

package cod

import chisel3._
import chisel3.util._
import chisel3.iotesters
import chisel3.iotesters._
import org.scalatest.{FlatSpec, Matchers}

object AdderTB extends App {
  iotesters.Driver.execute(args, () => new Adder(32)) {
    c => new AdderTester(c)
  }
}

class AdderTester(c: Adder) extends PeekPokeTester(c) {
  poke(c.io.A, 0x1)
  poke(c.io.B, 0x2)
  poke(c.io.Cin, 0)
  step(1)
  expect(c.io.Sum, 0x3)
  expect(c.io.Cout, 0)

  poke(c.io.A, 0xFFFFFFFFL)
  poke(c.io.B, 0x2)
  poke(c.io.Cin, 0)
  step(1)
  expect(c.io.Sum, 0x1)
  expect(c.io.Cout, 1)
}

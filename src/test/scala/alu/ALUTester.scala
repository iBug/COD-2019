package alu

import chisel3._
import chisel3.util._
import chisel3.iotesters._
import org.scalatest.{FlatSpec, Matchers}
import scala.util.Random

class ALUTester(c: ALU) extends PeekPokeTester(c) {
  poke(c.io.a, 31)
  poke(c.io.b, 1)
  poke(c.io.s, ALUSelect.ADD)
  step(1)
  expect(c.io.y, 32)
  expect(c.io.f, 10) // Overflow, Sign
}

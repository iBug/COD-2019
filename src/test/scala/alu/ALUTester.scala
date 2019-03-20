package alu

import chisel3._
import chisel3.util._
import chisel3.iotesters._
import org.scalatest.{FlatSpec, Matchers}
import scala.util.Random

class ALUTester(c: ALU) extends PeekPokeTester(c) {
  poke(c.io.A, 31)
  poke(c.io.B, 1)
  poke(c.io.S, ALUSelect.ADD)
  step(1)
  expect(c.io.Y, 32)
  expect(c.io.F, 10) // Overflow, Sign
}

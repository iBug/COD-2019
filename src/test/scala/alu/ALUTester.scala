package alu

import chisel3._
import chisel3.util._
import chisel3.iotesters._
import org.scalatest.{FlatSpec, Matchers}

object ALUTester extends App {
  iotesters.Driver.execute(args, () => new ALU(6, 3, 4)) { c => new ALUTester(c) }
}

class ALUTester(c: ALU) extends PeekPokeTester(c) {
  poke(c.io.A, 31)
  poke(c.io.B, 1)
  poke(c.io.S, ALUSelect.ADD)
  step(1)
  expect(c.io.Y, 32)
  expect(c.io.F, 10) // Overflow, Sign

  poke(c.io.A, 15)
  poke(c.io.B, 12)
  poke(c.io.S, ALUSelect.SUB)
  step(1)
  expect(c.io.Y, 3)
  expect(c.io.F, 0) // No flags

  poke(c.io.A, 21)
  poke(c.io.B, 10)
  poke(c.io.S, ALUSelect.AND)
  step(1)
  expect(c.io.Y, 0)
  expect(c.io.F, 1) // Zero

  poke(c.io.A, 17)
  poke(c.io.B, 33)
  poke(c.io.S, ALUSelect.OR)
  step(1)
  expect(c.io.Y, 49)
  expect(c.io.F, 2) // Sign

  poke(c.io.A, 17)
  poke(c.io.B, 33)
  poke(c.io.S, ALUSelect.XOR)
  step(1)
  expect(c.io.Y, 48)
  expect(c.io.F, 2) // Sign

  poke(c.io.S, ALUSelect.NOT)
  step(1)
  expect(c.io.Y, 46)
  expect(c.io.F, 2) // Sign
}

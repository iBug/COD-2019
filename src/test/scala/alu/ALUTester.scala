package alu

import chisel3._
import chisel3.util._
import chisel3.iotesters
import chisel3.iotesters._
import org.scalatest.{FlatSpec, Matchers}

class AndTester(c: And) extends PeekPokeTester(c) {
  poke(c.io.A, 0x12345678)
  poke(c.io.B, 0xFEDCBA90)
  step(1)
  expect(c.io.S, 0x12141210L)
}

class OrTester(c: Or) extends PeekPokeTester(c) {
  poke(c.io.A, 0x12345678)
  poke(c.io.B, 0xFEDCBA90)
  step(1)
  expect(c.io.S, 0xFEFCFEF8L)
}

class XorTester(c: Xor) extends PeekPokeTester(c) {
  poke(c.io.A, 0x12345678)
  poke(c.io.B, 0xFEDCBA90)
  step(1)
  expect(c.io.S, 0xECE8ECE8L)
}

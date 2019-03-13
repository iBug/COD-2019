package alu.util

import chisel3._
import chisel3.util._
import chisel3.iotesters._
import org.scalatest.{FlatSpec, Matchers}

class AccumulatorTester(c: Accumulator) extends PeekPokeTester(c) {
  poke(c.io.x, 123)
  step(1)
  expect(c.io.s, 123)

  step(1)
  expect(c.io.s, 246)

  poke(c.io.x, 99)
  step(1)
  expect(c.io.s, 345)

  reset(1)
  expect(c.io.s, 0)
}

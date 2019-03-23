package fsm

import chisel3._
import chisel3.util._
import chisel3.iotesters._
import org.scalatest.{FlatSpec, Matchers}

class DivisorTester(val c: Divisor) extends PeekPokeTester(c) {
  val d = c.io
  poke(d.x, 71)
  poke(d.y, 7)

  reset(1)
  expect(d.error, false)
  step(c.w)
  expect(d.q, 10)
  expect(d.r, 1)
  expect(d.done, true)

  poke(d.y, 0)
  reset(1)
  expect(d.error, true)
}

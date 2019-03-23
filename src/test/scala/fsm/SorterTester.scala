package fsm

import chisel3._
import chisel3.util._
import chisel3.iotesters._
import org.scalatest.{FlatSpec, Matchers}

class SorterTester(val c: Sorter4) extends PeekPokeTester(c) {
  val d = c.io
  poke(d.x0, 8)
  poke(d.x1, 3)
  poke(d.x2, 2)
  poke(d.x3, 5)

  reset(1)
  expect(d.s0, 8)
  expect(d.s1, 3)
  expect(d.s2, 2)
  expect(d.s3, 5)

  step(4)
  expect(d.done, true)
  expect(d.s0, 2)
  expect(d.s1, 3)
  expect(d.s2, 5)
  expect(d.s3, 8)
}

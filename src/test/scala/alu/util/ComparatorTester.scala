package alu.util

import chisel3._
import chisel3.util._
import chisel3.iotesters._
import org.scalatest.{FlatSpec, Matchers}

class ComparatorTester(c: Comparator) extends PeekPokeTester(c) {
  poke(c.io.x, 123)
  poke(c.io.y, 123)
  step(1)
  expect(c.io.eq, 1)
  expect(c.io.ug, 0)
  expect(c.io.ul, 0)
  expect(c.io.sg, 0)
  expect(c.io.sl, 0)

  poke(c.io.x, 123)
  poke(c.io.y, 121)
  step(1)
  expect(c.io.eq, 0)
  expect(c.io.ug, 1)
  expect(c.io.ul, 0)
  expect(c.io.sg, 1)
  expect(c.io.sl, 0)

  poke(c.io.x, -123)
  poke(c.io.y, -121)
  step(1)
  expect(c.io.eq, 0)
  expect(c.io.ug, 0)
  expect(c.io.ul, 1)
  expect(c.io.sg, 0)
  expect(c.io.sl, 1)
}

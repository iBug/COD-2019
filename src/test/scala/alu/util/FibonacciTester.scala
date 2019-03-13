package alu.util

import chisel3._
import chisel3.util._
import chisel3.iotesters._
import org.scalatest.{FlatSpec, Matchers}

class FibonacciTester(c: Fibonacci) extends PeekPokeTester(c) {
  poke(c.io.f0, 1)
  poke(c.io.f1, 1)
  reset(1)
  expect(c.io.fn, 1)

  step(1)
  expect(c.io.fn, 2)
  step(1)
  expect(c.io.fn, 3)
  step(1)
  expect(c.io.fn, 5)
  step(1)
  expect(c.io.fn, 8)
  step(1)
  expect(c.io.fn, 13)
  step(1)
  expect(c.io.fn, 21)
}

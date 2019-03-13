package alu

import chisel3._
import chisel3.util._
import chisel3.iotesters._
import org.scalatest.{FlatSpec, Matchers}
import scala.util.Random

class RegisterTester(c: Register) extends PeekPokeTester(c) {
  expect(c.io.out, 0)

  poke(c.io.in, 123456)
  step(1)
  expect(c.io.out, 0)

  poke(c.io.enable, true)
  step(1)
  expect(c.io.out, 123456)

  poke(c.io.enable, false)
  reset(1)
  expect(c.io.out, 0)
}

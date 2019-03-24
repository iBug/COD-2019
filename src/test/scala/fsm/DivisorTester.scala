package fsm

import chisel3._
import chisel3.util._
import chisel3.iotesters._
import org.scalatest.{FlatSpec, Matchers}
import scala.util.Random

class DivisorTester(val c: Divisor) extends PeekPokeTester(c) {
  val d = c.io
  val r = Random

  for (n <- 0 until 10) {
    val x = r.nextInt(101)
    val y = r.nextInt(11)
    poke(d.x, x)
    poke(d.y, y)

    reset(1)
    expect(d.q, 0)
    expect(d.r, 0)
    expect(d.error, false)
    step(c.w)
    expect(d.q, x / y)
    expect(d.r, x % y)
    expect(d.done, true)
  }

  // Test error
  poke(d.y, 0)
  reset(1)
  expect(d.q, 0)
  expect(d.r, 0)
  expect(d.error, true)
  step(1)
  expect(d.q, 0)
  expect(d.r, 0)
  expect(d.error, true)
}

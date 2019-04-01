package reg

import chisel3._
import chisel3.util._
import chisel3.iotesters._
import org.scalatest.{FlatSpec, Matchers}
import scala.util.Random

object CounterTester extends App {
  iotesters.Driver.execute(args, () => new Counter(4)) { c => new CounterTester(c) }
}

class CounterTester(val c: Counter) extends PeekPokeTester(c) {
  var u: Int = 0
  var s: Int = 0
  reset(1)

  // Pass 1: increment test
  poke(c.io.ce, true)
  for (n <- 0 until 16) {
    s = 1 + Random.nextInt(15)
    u = (u + s) % 16
    step(s)
    expect(c.io.q, u)
  }
  poke(c.io.ce, false)
  step(u)
  expect(c.io.q, u) // Check behavior on CE = false

  // Pass 2: set number test
  poke(c.io.pe, true)
  for (n <- 0 until 16) {
    s = Random.nextInt(16)
    poke(c.io.d, s)
    step(1)
    expect(c.io.q, s)
  }
}

package alu

import chisel3._
import chisel3.util._
import chisel3.iotesters._
import org.scalatest.{FlatSpec, Matchers}
import scala.util.Random

class AdderTester(c: Adder) extends PeekPokeTester(c) {
  poke(c.io.A, 0x1)
  poke(c.io.B, 0x2)
  poke(c.io.Cin, 0)
  step(1)
  expect(c.io.Sum, 0x3)
  expect(c.io.Cout, 0)

  poke(c.io.A, 0xFFFFFFFFL)
  poke(c.io.B, 0x2)
  poke(c.io.Cin, 0)
  step(1)
  expect(c.io.Sum, 0x1)
  expect(c.io.Cout, 1)

  val r = scala.util.Random
  for (n <- 0 until 4) {
    val a = math.abs(r.nextInt).toLong
    val b = math.abs(r.nextInt).toLong
    val cin = r.nextInt(2)
    val sum = a + b + cin
    poke(c.io.A, a)
    poke(c.io.B, b)
    poke(c.io.Cin, cin)
    step(1)
    expect(c.io.Sum, (sum + 4294967296L) % 4294967296L)
    expect(c.io.Cout, sum >= (4294967296L))
  }
}

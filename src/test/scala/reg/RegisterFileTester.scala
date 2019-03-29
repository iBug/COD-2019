package reg

import chisel3._
import chisel3.util._
import chisel3.iotesters._
import org.scalatest.{FlatSpec, Matchers}
import scala.util.Random

class RegisterFileTester(val c: RegisterFile) extends PeekPokeTester(c) {
  val v: Array[Int] = new Array[Int](8)
  var n: Int = 0
  var i: Int = 0
  var j: Int = 0

  for (i <- 0 until 8)
    v(i) = Random.nextInt(16)

  reset(1)
  // Pass 1: write through
  poke(c.io.we, true)
  for (n <- 0 until 8) {
    poke(c.io.wa0, n)
    poke(c.io.wd0, v(n))
    step(1)
    poke(c.io.ra0, n)
    poke(c.io.ra1, n)
    expect(c.io.rd0, v(n))
    expect(c.io.rd1, v(n))
  }
  poke(c.io.we, false)
  step(1)

  // Pass 2: random asynchronous read
  for (n <- 0 until 32) {
    i = Random.nextInt(8)
    j = Random.nextInt(8)
    poke(c.io.ra0, i)
    poke(c.io.ra1, j)
    expect(c.io.rd0, v(i))
    expect(c.io.rd1, v(j))
  }

  // Pass 3: random synchronous write
  poke(c.io.we, true)
  for (n <- 0 until 8) {
    i = Random.nextInt(8)
    v(i) = Random.nextInt(16)
    poke(c.io.wa0, i)
    poke(c.io.wd0, v(i))
    step(1)
    poke(c.io.ra0, i)
    expect(c.io.rd0, v(i))
  }
  poke(c.io.we, false)
  step(1)

  // Pass 4: check data
  for (n <- 0 until 8) {
    poke(c.io.ra0, n)
    expect(c.io.rd0, v(n))
  }
}

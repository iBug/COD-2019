package fsm

import chisel3._
import chisel3.util._
import chisel3.iotesters._
import org.scalatest.{FlatSpec, Matchers}
import scala.util.Random

object SorterTester extends App {
  iotesters.Driver.execute(args, () => new Sorter4(8)) { c => new SorterTester(c) }
}

class SorterTester(val c: Sorter4) extends PeekPokeTester(c) {
  val d = c.io

  for (n <- 0 until 32) {
    val x = List.tabulate(4)(e => Random.nextInt(256))
    poke(d.x0, x(0))
    poke(d.x1, x(1))
    poke(d.x2, x(2))
    poke(d.x3, x(3))

    reset(1)
    expect(d.s0, x(0))
    expect(d.s1, x(1))
    expect(d.s2, x(2))
    expect(d.s3, x(3))
    expect(d.done, false)

    step(2)
    expect(d.done, false)

    val s = x.sorted(Ordering.Int)
    step(1)
    expect(d.done, true)
    expect(d.s0, s(0))
    expect(d.s1, s(1))
    expect(d.s2, s(2))
    expect(d.s3, s(3))
  }
}

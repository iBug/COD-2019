package reg.util

import chisel3._
import chisel3.util._
import chisel3.iotesters._
import org.scalatest.{FlatSpec, Matchers}
import scala.util.Random

class FIFOTester(val c: FIFO) extends PeekPokeTester(c) {
}

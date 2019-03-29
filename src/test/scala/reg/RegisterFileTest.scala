package reg

import chisel3._
import chisel3.util._
import chisel3.iotesters._
import org.scalatest.{FlatSpec, Matchers}
import scala.util.Random

class RegisterFileTester(val c: RegisterFile) extends PeekPokeTester(c) {
  val d = c.io

  for (n <- 0 until 10) {
  }
}

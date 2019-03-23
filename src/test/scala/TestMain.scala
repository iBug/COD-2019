import chisel3._
import chisel3.util._
import chisel3.iotesters

import alu._
import alu.util._
import fsm._

object Main extends App {
  var Args: Array[String] = args
  if (!(Args contains "--backend-name")) {
    Args ++= Array("--backend-name", "treadle", "-tgvo", "on")
  }

  FSMTests.main(Args)
}

object TestAll extends App {
  var Args: Array[String] = args
  if (!(Args contains "--backend-name")) {
    Args ++= Array("--backend-name", "treadle", "-tgvo", "on")
  }

  ALUTests.main(Args)
  FSMTests.main(Args)
}

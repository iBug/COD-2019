import chisel3._
import chisel3.util._
import chisel3.iotesters

import alu.Tests
import fsm.Tests
import reg.Tests

object Main extends App {
  var Args: Array[String] = args
  if (!(Args contains "--backend-name")) {
    Args ++= Array("--backend-name", "treadle", "-tgvo", "on")
  }

  reg.Tests.main(Args)
}

object TestAll extends App {
  var Args: Array[String] = args
  if (!(Args contains "--backend-name")) {
    Args ++= Array("--backend-name", "treadle", "-tgvo", "on")
  }

  alu.Tests.main(Args)
  fsm.Tests.main(Args)
  reg.Tests.main(Args)
}

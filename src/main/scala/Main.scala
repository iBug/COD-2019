import chisel3._
import chisel3.util._

import alu.ALU

object Main extends App {
  var Args: Array[String] = args
  if (!((Args contains "--target-dir") || (Args contains "-td"))) {
    Args ++= Array("--target-dir", "target")
  }

  chisel3.Driver.execute(Args, () => new ALU(6, 3, 3))
}

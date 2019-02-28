package cod

import chisel3._
import chisel3.util._

object Main extends App {
  var Args: Array[String] = args
  if (!((Args contains "--target-dir") || (Args contains "-td"))) {
    Args ++= Array("--target-dir", "target")
  }

  chisel3.Driver.execute(Args, () => new Adder(32))
}

package cod

import chisel3._
import chisel3.util._

object Main extends App {
  var new_args = args
  if (!((args contains "--target-dir") || (args contains "-td"))) {
    new_args ++= Array("--target-dir", "target")
  }

  chisel3.Driver.execute(new_args, () => new Adder(32))
}

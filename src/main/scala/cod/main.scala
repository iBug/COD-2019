package cod

import chisel3._
import chisel3.util._

object Main extends App {
  var new_args = args
  if (!(args contains "--target")) {
    new_args ++= Array("--target", "target")
  }
  // chisel3.Driver.execute(new_args, () => new DumbCore)
}

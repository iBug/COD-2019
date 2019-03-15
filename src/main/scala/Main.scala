import chisel3._
import chisel3.util._

import alu.ALU
import alu.util._

object Main extends App {
  var Args: Array[String] = args
  if (!((Args contains "--target-dir") || (Args contains "-td"))) {
    Args ++= Array("--target-dir", "target")
  }

  ALUMain.main(Args)
}

object ALUMain extends App {
  chisel3.Driver.execute(args, () => new ALU(6, 3, 3))
  chisel3.Driver.execute(args, () => new Accumulator(8))
  chisel3.Driver.execute(args, () => new Fibonacci(8))
}

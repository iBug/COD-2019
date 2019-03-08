package cod

import chisel3._
import chisel3.util._

class And(w: Int) extends Module {
  val io = IO(new Bundle {
    val A = Input(UInt(w.W))
    val B = Input(UInt(w.W))
    val S = Output(UInt(w.W))
  })

  io.S := io.A & io.B
}

class Or(w: Int) extends Module {
  val io = IO(new Bundle {
    val A = Input(UInt(w.W))
    val B = Input(UInt(w.W))
    val S = Output(UInt(w.W))
  })

  io.S := io.A | io.B
}

class Xor(w: Int) extends Module {
  val io = IO(new Bundle {
    val A = Input(UInt(w.W))
    val B = Input(UInt(w.W))
    val S = Output(UInt(w.W))
  })

  io.S := io.A | io.B
}

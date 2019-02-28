package cod

import chisel3._
import chisel3.util._

class Adder(w: Int) extends Module {
  val io = IO(new Bundle {
    val A = Input(UInt(w.W))
    val B = Input(UInt(w.W))
    val Sum = Output(UInt(w.W))
    val Cin = Input(UInt(1.W))
    val Cout = Output(UInt(1.W))
  })

  val sum = Cat(0.U, io.A) + Cat(0.U, io.B) + Cat(0.U(w.W), io.Cin)
  io.Cout := sum(w)
  io.Sum := sum(w - 1, 0)
}

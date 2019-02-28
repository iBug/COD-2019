package cod

import chisel3._
import chisel3.util._

class Adder(w: Int) extends Module {
  val io = IO(new Bundle {
    val a = Input(UInt(w.W))
    val b = Input(UInt(w.W))
    val s = Output(UInt(w.W))
    val cin = Input(UInt(1.W))
    val cout = Output(UInt(1.W))
  })

  val sum = Cat(0.U, io.a) + Cat(0.U, io.b) + Cat(0.U(w.W), cin)
  io.cout := sum(w)
  io.s := sum(w - 1, 0)
}

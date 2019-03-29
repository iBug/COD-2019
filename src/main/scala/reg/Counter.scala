package reg

import chisel3._
import chisel3.util._

class Counter(val w: Int) extends Module {
  val io = IO(new Bundle {
    val ce = Input(Bool())
    val pe = Input(Bool())
    val d = Input(UInt(w.W))
    val q = Output(UInt(w.W))
  })

  val q = RegInit(0.U(w.W))
  io.q := q

  when (io.pe) {
    q := io.d
  } .elsewhen (io.ce) {
    q := q + 1.U
  }
}

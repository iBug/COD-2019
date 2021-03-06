package fsm

import chisel3._
import chisel3.util._

class Divisor(val w: Int) extends Module {
  val io = IO(new Bundle {
    val x = Input(UInt(w.W))
    val y = Input(UInt(w.W))
    val q = Output(UInt(w.W))
    val r = Output(UInt(w.W))
    val error = Output(Bool())
    val done = Output(Bool())
  })
  io.error := io.y === 0.U

  val q = RegInit(0.U(w.W))
  val r = RegInit(0.U(w.W))
  io.q := q
  io.r := r

  val n = RegInit(w.U(log2Ceil(w + 1).W))
  io.done := n === 0.U

  when (io.error || io.done) {
    n := 0.U
  } .otherwise {
    val t: UInt = (r << 1) | io.x(n - 1.U)
    val s: Bool = t >= io.y
    r := Mux(s, t - io.y, t)
    q := Mux(s, q | (1.U << (n - 1.U)), q)
    n := n - 1.U
  }
}

package alu

import chisel3._
import chisel3.util._

object Register {
  def apply(w: Int, in: UInt, enable: Bool, init: Int = 0): UInt = {
    val m = Module(new Register(w, init)).io
    m.in := in
    m.enable := enable
    m.out
  }
}

class Register(val w: Int, val init: Int = 0) extends Module {
  val io = IO(new Bundle {
    val in = Input(UInt(w.W))
    val out = Output(UInt(w.W))
    val enable = Input(Bool())
  })

  val reg = RegEnable(io.in, init.U(w.W), io.enable)
  io.out := reg
}

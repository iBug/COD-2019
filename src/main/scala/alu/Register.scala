package alu

import chisel3._
import chisel3.util._

class Register(w: Int) extends Module {
  val io = IO(new Bundle {
    val in = Input(UInt(w.W))
    val out = Output(UInt(w.W))
    val enable = Input(Bool())
  })

  val reg = RegInit(0.U(w.W))
  io.out := reg

  when (io.enable) {
    reg := io.in
  }
}

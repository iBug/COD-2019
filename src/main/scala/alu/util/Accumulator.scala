package alu.util

import chisel3._
import chisel3.util._
import alu.Register

class Accumulator(w: Int) extends Module {
  val io = IO(new Bundle {
    val x = Input(UInt(w.W))
    val s = Output(UInt(w.W))
  })

  io.s := Register(w, io.x + io.s, true.B)
}

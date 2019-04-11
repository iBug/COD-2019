package vga

import chisel3._
import chisel3.util._

import alu.Register

class Button(val tEnable: Int = 50000000, val tRepeat: Int = 2500000) extends Module {
  val io = IO(new Bundle {
    val i = Input(Bool())
    val o = Output(Bool())
  })

  val c = RegInit(0.U(32.W))
  io.o := (c === 1.U) || (c >= tEnable.U && (c % tRepeat.U === 1.U))

  when (io.i) {
    c := c + 1.U
  } .otherwise {
    c := 0.U
  }
}

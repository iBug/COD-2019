package vga

import chisel3._
import chisel3.util._

import alu.Register

object Button {
  def apply(i: Bool, repeat: Bool = false.B, te: Int = 50000000): Bool = {
    val m = Module(new Button(te)).io
    m.i := i
    m.repeat := repeat
    m.o
  }
}

class Button(val tEnable: Int = 50000000) extends Module {
  val io = IO(new Bundle {
    val i = Input(Bool())
    val repeat = Input(Bool())
    val o = Output(Bool())
  })

  val c = RegInit(0.U(32.W))
  io.o := (c === 1.U) || (c >= tEnable.U && io.repeat)

  when (io.i) {
    c := c + 1.U
  } .otherwise {
    c := 0.U
  }
}

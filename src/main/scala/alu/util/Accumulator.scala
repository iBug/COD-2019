package alu.util

import chisel3._
import chisel3.util._
import alu.{ALU, ALUSelect, Register}

class Accumulator(w: Int) extends Module {
  val io = IO(new Bundle {
    val x = Input(UInt(w.W))
    val s = Output(UInt(w.W))
  })

  val alu = Module(new ALU(w, 3, 3)).io
  val reg = Module(new Register(w)).io
  io.s := reg.out

  alu.a := io.x
  alu.b := reg.out
  alu.s := ALUSelect.ADD
  alu.f := DontCare
  reg.in := alu.y
  reg.enable := true.B
}

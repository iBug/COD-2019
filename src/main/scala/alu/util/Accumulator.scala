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

  alu.A := io.x
  alu.B := reg.out
  alu.S := ALUSelect.ADD
  alu.F := DontCare
  reg.in := alu.Y
  reg.enable := true.B
}

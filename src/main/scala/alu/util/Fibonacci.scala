package alu.util

import chisel3._
import chisel3.util._
import alu.{ALU, ALUSelect, Register}

class Fibonacci(w: Int) extends Module {
  val io = IO(new Bundle {
    val f0 = Input(UInt(w.W))
    val f1 = Input(UInt(w.W))
    val fn = Output(UInt(w.W))
  })

  val alu = Module(new ALU(w, 3, 3)).io
  val r0 = RegInit(io.f0)
  val r1 = RegInit(io.f1)
  io.fn := r1

  alu.A := r0
  alu.B := r1
  alu.S := ALUSelect.ADD
  alu.F := DontCare

  r0 := r1
  r1 := alu.Y
}

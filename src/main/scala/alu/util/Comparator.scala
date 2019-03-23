package alu.util

import chisel3._
import chisel3.util._
import alu.{ALU, ALUSelect}

class Comparator(w: Int) extends Module {
  val io = IO(new Bundle {
    val x = Input(UInt(w.W))
    val y = Input(UInt(w.W))
    val ug = Output(Bool())
    val ul = Output(Bool())
    val eq = Output(Bool())
    val sg = Output(Bool())
    val sl = Output(Bool())
  })

  val alu = Module(new ALU(w, 3, 4)).io
  alu.A := io.x
  alu.B := io.y
  alu.S := ALUSelect.SUB

  io.eq := alu.F(0)
  io.ug := ~io.eq & ~alu.F(2) // Zero + ~Carry
  io.ul := ~io.eq & alu.F(2) // Zero + Carry
  io.sg := ~io.eq & (~alu.F(1) ^ alu.F(3))
  io.sl := ~io.eq & (alu.F(1) ^ alu.F(3))
}

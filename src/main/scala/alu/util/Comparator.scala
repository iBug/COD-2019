package alu.util

import chisel3._
import chisel3.util._

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

  io.eq := io.x === io.y
  io.ug := io.x > io.y
  io.ul := io.x < io.y
  io.sg := io.x.asSInt > io.y.asSInt
  io.sl := io.x.asSInt < io.y.asSInt
}

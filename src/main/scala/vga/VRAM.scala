package vga

import chisel3._
import chisel3.util._

import alu.Register

class VRAM(val wAddr: Int = 16, val wData: Int = 12) extends Module {
  val io = IO(new Bundle {
    val ra = Input(UInt(wAddr.W))
    val rd = Output(UInt(wData.W))
    val wa = Input(UInt(wAddr.W))
    val wd = Input(UInt(wData.W))
    val we = Input(Bool())
  })

  val r = VecInit(Seq.fill(1 << wAddr)(Module(new Register(wData)).io))

  for (i <- 0 until (1 << wAddr)) {
    r(i).in := io.wd
    r(i).enable := io.we && (io.wa === i.U)
  }

  io.rd := r(io.ra).out
  io.rd := r(io.ra).out
}

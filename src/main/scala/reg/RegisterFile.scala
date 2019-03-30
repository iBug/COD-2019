package reg

import chisel3._
import chisel3.util._

import alu.Register

class RegisterFile(val wData: Int, val wAddr: Int) extends Module {
  val io = IO(new Bundle {
    val ra0 = Input(UInt(wAddr.W))
    val ra1 = Input(UInt(wAddr.W))
    val rd0 = Output(UInt(wData.W))
    val rd1 = Output(UInt(wData.W))
    val wa0 = Input(UInt(wAddr.W))
    val wd0 = Input(UInt(wData.W))
    val we = Input(Bool())
  })

  val r = VecInit(Seq.fill(1 << wAddr)(Module(new Register(wData)).io))

  for (i <- 0 until (1 << wAddr)) {
    r(i).in := io.wd0
    r(i).enable := io.we && (io.wa0 === i.U)
  }

  io.rd0 := r(io.ra0).out
  io.rd1 := r(io.ra1).out
}

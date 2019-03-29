package reg.util

import chisel3._
import chisel3.util._

import reg.RegisterFile

class FIFO(val wData: Int, val wAddr: Int) extends Module {
  val io = IO(new Bundle {
    val en_in = Input(Bool())
    val en_out = Input(Bool())
    val in = Input(UInt(wData.W))
    val out = Output(UInt(wData.W))
    val empty = Output(Bool())
    val full = Output(Bool())
    val display = Output(UInt((8 + (1 << wAddr)).W))
  })

  val r = Module(new RegisterFile(wData, wAddr)).io

  val head = RegInit(0.U(wAddr.W))
  val tail = RegInit(0.U(wAddr.W))
  val out = RegInit(0.U(wData.W))

  io.empty := head === tail
  io.full := (tail + 1.U(wAddr.W)) === head
  io.out := out

  r.ra0 := head
  r.wa0 := in
  r.wd0 := tail
  r.we := io.en_in && !io.full

  when (io.en_out && !io.empty) {
    head := head + 1.U(wAddr.W)
    out := r.rd0
  }
}

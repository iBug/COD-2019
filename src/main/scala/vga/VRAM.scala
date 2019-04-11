package vga

import chisel3._
import chisel3.util._

import alu.Register

class VRAM(val wAddr: Int = 16, val wData: Int = 12) extends BlackBox {
  val io = IO(new Bundle {
    val clock = Input(Clock())
    val ra = Input(UInt(wAddr.W))
    val rd = Output(UInt(wData.W))
    val wa = Input(UInt(wAddr.W))
    val wd = Input(UInt(wData.W))
    val we = Input(Bool())
  })
}

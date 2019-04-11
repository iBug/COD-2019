package vga

import chisel3._
import chisel3.util._

import alu.Register

class Painter extends Module {
  val io = IO(new Bundle {
    val btn = Input(UInt(4.W))
    // 0123 = URDL
    val sw = Input(UInt(12.W))
    val de = Input(Bool())
    val hs = Output(Bool())
    val vs = Output(Bool())
    val vr = Output(UInt(4.W))
    val vg = Output(UInt(4.W))
    val vb = Output(UInt(4.W))
  })

  val x = RegInit(127.U(8.W))
  val y = RegInit(127.U(8.W))
  val mu = Button(io.btn(0))
  val mr = Button(io.btn(1))
  val md = Button(io.btn(2))
  val ml = Button(io.btn(3))

  val vram = Module(new VRAM()).io
  val vga = Module(new VGA()).io
  vga.clock := clock
  io.hs := vga.hs
  io.vs := vga.vs
  val rx = Wire(UInt(8.W))
  val ry = Wire(UInt(8.W))
  val re = Wire(Bool())
  val rd = Mux(re, vram.rd, 0.U(12.W))
  vram.ra := (ry << 8.U) | rx
  vram.wa := (y << 8.U) | x
  vram.wd := io.sw
  vram.we := io.de
  rx := vga.x - ((640 - 256) / 2).U
  ry := vga.y - ((480 - 256) / 2).U
  re := (vga.x >= ((640 - 256) / 2).U) && (vga.x < ((640 + 256) / 2).U) && (vga.y >= ((480 - 256) / 2).U) && (vga.y < ((480 + 256) / 2).U)
  io.vr := rd(11, 8)
  io.vg := rd(7, 4)
  io.vb := rd(3, 0)

  when (y > 0.U && mu) {
    y := y - 1.U
  }
  when (x < 255.U && mr) {
    x := x + 1.U
  }
  when (y < 255.U && md) {
    y := y + 1.U
  }
  when (x > 0.U && ml) {
    x := x - 1.U
  }
}
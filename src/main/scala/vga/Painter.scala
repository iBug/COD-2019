package vga

import chisel3._
import chisel3.util._

import alu.Register

class Painter(val w: Int = 256, val h: Int = 256, val dw: Int = 640, val dh: Int = 480) extends Module {
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

  val cRepeat = RegInit(0.U(32.W))
  val repeat = cRepeat === 0.U

  val x = RegInit(((w - 1) / 2).U(log2Ceil(w).W))
  val y = RegInit(((h - 1) / 2).U(log2Ceil(h).W))
  val mu = Button(io.btn(0), repeat)
  val mr = Button(io.btn(1), repeat)
  val md = Button(io.btn(2), repeat)
  val ml = Button(io.btn(3), repeat)

  val vram = Module(new VRAM()).io
  val vga = Module(new VGA()).io
  vram.clock := clock // BlackBox doesn't have implicit clock and reset
  io.hs := vga.hs
  io.vs := vga.vs
  val rx = Wire(UInt(8.W))
  val ry = Wire(UInt(8.W))
  val re = Wire(Bool())
  val rd = Mux(re,
    Mux((rx =/= x || ry =/= y), vram.rd, 0xFFF.U(12.W)),
    Mux(
      (vga.y >= ((dh - h) / 2 - 2).U && vga.y <= ((dh + h) / 2 + 1).U && (vga.x === ((dw - w) / 2 - 2).U || vga.x === ((dw + w) / 2 + 1).U)) || (vga.x >= ((dw - w) / 2 - 2).U && vga.x <= ((dw + w) / 2 + 1).U && (vga.y === ((dh - h) / 2 - 2).U || vga.y === ((dh + h) / 2 + 1).U)),
      0xFFF.U(12.W), 0.U(12.W))
  )
  vram.ra := (ry << 8.U) | rx
  vram.wa := (y << 8.U) | x
  vram.wd := io.sw
  vram.we := io.de
  rx := vga.x - ((dw - w) / 2).U
  ry := vga.y - ((dh - h) / 2).U
  re := (vga.x >= ((dw - w) / 2).U) && (vga.x < ((dw + w) / 2).U) && (vga.y >= ((dh - h) / 2).U) && (vga.y < ((dh + h) / 2).U)
  io.vr := rd(11, 8)
  io.vg := rd(7, 4)
  io.vb := rd(3, 0)

  when (y > 0.U && mu) {
    y := y - 1.U
  }
  when (x < (w - 1).U && mr) {
    x := x + 1.U
  }
  when (y < (h - 1).U && md) {
    y := y + 1.U
  }
  when (x > 0.U && ml) {
    x := x - 1.U
  }
  when (cRepeat >= 2499999.U) {
    cRepeat := 0.U
  } .otherwise {
    cRepeat := cRepeat + 1.U
  }
}

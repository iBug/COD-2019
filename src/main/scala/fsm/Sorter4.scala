package fsm

import chisel3._
import chisel3.util._

import alu.util.Comparator

class Sorter2(val w: Int) extends Module {
  val io = IO(new Bundle {
    val x0 = Input(UInt(w.W))
    val x1 = Input(UInt(w.W))
    val s0 = Output(UInt(w.W))
    val s1 = Output(UInt(w.W))
  })

  val comp: Bool = io.x0 >= io.x1

  io.s0 := Mux(comp, io.x1, io.x0)
  io.s1 := Mux(comp, io.x0, io.x1)
}

class Sorter4(val w: Int) extends Module {
  val io = IO(new Bundle {
    val x0 = Input(UInt(w.W))
    val x1 = Input(UInt(w.W))
    val x2 = Input(UInt(w.W))
    val x3 = Input(UInt(w.W))
    val s0 = Output(UInt(w.W))
    val s1 = Output(UInt(w.W))
    val s2 = Output(UInt(w.W))
    val s3 = Output(UInt(w.W))
    val done = Output(Bool())
  })

  val state = RegInit(0.U(2.W)) // 4 states is enough
  val r0 = RegInit(io.x0)
  val r1 = RegInit(io.x1)
  val r2 = RegInit(io.x2)
  val r3 = RegInit(io.x3)
  io.s0 := r0
  io.s1 := r1
  io.s2 := r2
  io.s3 := r3
  io.done := (state === 3.U)

  val p0 = Module(new Sorter2(w)).io
  val p1 = Module(new Sorter2(w)).io

  when (state === 0.U) {
    p0.x0 := r0
    p0.x1 := r1
    p1.x0 := r2
    p1.x1 := r3
    r0 := p0.s0
    r1 := p0.s1
    r2 := p1.s0
    r3 := p1.s1
    state := 1.U(2.W)
  } .elsewhen (state === 1.U) {
    p0.x0 := r0
    p0.x1 := r2
    p1.x0 := r1
    p1.x1 := r3
    r0 := p0.s0
    r1 := p1.s0
    r2 := p0.s1
    r3 := p1.s1
    state := 2.U(2.W)
  } .elsewhen (state === 2.U) {
    p0.x0 := r1
    p0.x1 := r2
    p1.x0 := 0.U(w.W)
    p1.x1 := 0.U(w.W)
    r1 := p0.s0
    r2 := p0.s1
    state := 3.U(2.W)
  } .otherwise {
    p0.x0 := 0.U(w.W)
    p0.x1 := 0.U(w.W)
    p1.x0 := 0.U(w.W)
    p1.x1 := 0.U(w.W)
  }
}

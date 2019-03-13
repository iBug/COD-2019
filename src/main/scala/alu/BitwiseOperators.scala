package alu

import chisel3._
import chisel3.util._

class And(w: Int) extends Module {
  val io = IO(new Bundle {
    val A = Input(UInt(w.W))
    val B = Input(UInt(w.W))
    val S = Output(UInt(w.W))
  })

  io.S := io.A & io.B
}

object And {
  def apply(w: Int, a: UInt, b: UInt) = {
    val m = Module(new And(w)).io
    m.A := a
    m.B := b
    m.S
  }
}

class Or(w: Int) extends Module {
  val io = IO(new Bundle {
    val A = Input(UInt(w.W))
    val B = Input(UInt(w.W))
    val S = Output(UInt(w.W))
  })

  io.S := io.A | io.B
}

object Or {
  def apply(w: Int, a: UInt, b: UInt) = {
    val m = Module(new Or(w)).io
    m.A := a
    m.B := b
    m.S
  }
}

class Xor(w: Int) extends Module {
  val io = IO(new Bundle {
    val A = Input(UInt(w.W))
    val B = Input(UInt(w.W))
    val S = Output(UInt(w.W))
  })

  io.S := io.A ^ io.B
}

object Xor {
  def apply(w: Int, a: UInt, b: UInt) = {
    val m = Module(new Xor(w)).io
    m.A := a
    m.B := b
    m.S
  }
}

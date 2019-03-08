package cod

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

class ALU(w: Int) extends Module {
  val io = IO(new Bundle {
    val A = Input(UInt(w.W))
    val B = Input(UInt(w.W))
    val S = Output(UInt(w.W))
    val select = Input(UInt(4.W))
  })

  val adder = Module(new Adder(w)).io
  val multer = Module(new Multiplier(w)).io
  val andS = And(w, io.A, io.B)
  val orS = Or(w, io.A, io.B)
  val xorS = Xor(w, io.A, io.B)

  adder.A := io.A
  multer.A := io.A

  adder.B := io.B
  multer.B := io.B

  // Special handling
  adder.Cin := 0.U(1.W)

  io.S := MuxLookup(io.select, 0.U(w.W), Array(
    0.U -> adder.Sum,
    1.U -> multer.Result,
    2.U -> andS,
    3.U -> orS,
    4.U -> xorS,
    5.U -> (~io.A)
  ))
}

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

class Or(w: Int) extends Module {
  val io = IO(new Bundle {
    val A = Input(UInt(w.W))
    val B = Input(UInt(w.W))
    val S = Output(UInt(w.W))
  })

  io.S := io.A | io.B
}

class Xor(w: Int) extends Module {
  val io = IO(new Bundle {
    val A = Input(UInt(w.W))
    val B = Input(UInt(w.W))
    val S = Output(UInt(w.W))
  })

  io.S := io.A ^ io.B
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
  val and = Module(new And(w)).io
  val or = Module(new Or(w)).io
  val xor = Module(new Xor(w)).io

  adder.A := io.A
  multer.A := io.A
  and.A := io.A
  or.A := io.A
  xor.A := io.A

  adder.B := io.B
  multer.B := io.B
  and.B := io.B
  or.B := io.B
  xor.B := io.B

  // Special handling
  adder.Cin := 0.U(1.W)

  io.S := MuxLookup(io.select, 0.U(w.W), Array(
    0.U -> adder.Sum,
    1.U -> multer.Result,
    2.U -> and.S,
    3.U -> or.S,
    4.U -> xor.S,
    5.U -> (~io.A)
  ))
}

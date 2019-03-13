package alu

import chisel3._
import chisel3.util._

class Adder(w: Int) extends Module {
  val io = IO(new Bundle {
    val A = Input(UInt(w.W))
    val B = Input(UInt(w.W))
    val Sum = Output(UInt(w.W))
    val Cin = Input(UInt(1.W))
    val Cout = Output(UInt(1.W))
  })

  val sum = Cat(0.U, io.A) + Cat(0.U, io.B) + Cat(0.U(w.W), io.Cin)
  io.Cout := sum(w)
  io.Sum := sum(w - 1, 0)
}

class Subtractor(w: Int) extends Module {
  val io = IO(new Bundle {
    val A = Input(UInt(w.W))
    val B = Input(UInt(w.W))
    val Sum = Output(UInt(w.W))
    val Cin = Input(UInt(1.W))
    val Cout = Output(UInt(1.W))
  })

  val sum = Cat(0.U, io.A) + Cat(1.U, ~io.B) + Cat(0.U(w.W), io.Cin)
  io.Cout := sum(w)
  io.Sum := sum(w - 1, 0)
}

class Multiplier(w: Int) extends Module {
  val io = IO(new Bundle {
    val A = Input(UInt(w.W))
    val B = Input(UInt(w.W))
    val Result = Output(UInt(w.W))
    val ResultUpper = Output(UInt(w.W))
  })

  val result = io.A * io.B
  io.Result := result(w - 1, 0)
  io.ResultUpper := result(2 * w - 1, w)
}

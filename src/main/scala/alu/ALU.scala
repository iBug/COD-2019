package alu

import chisel3._
import chisel3.util._

object ALUSelect {
  val ADD = 0.U
  val SUB = 1.U
  val AND = 2.U
  val OR = 3.U
  val XOR = 4.U
  val NOT = 5.U
}

class ALU(wData: Int, wSelect: Int, wFlags: Int) extends Module {
  val io = IO(new Bundle {
    val a = Input(UInt(wData.W))
    val b = Input(UInt(wData.W))
    val s = Input(UInt(wSelect.W))
    val y = Output(UInt(wData.W))
    val f = Output(UInt(wFlags.W))
  })

  // Internal results
  val adder = Module(new Adder(wData)).io
  val suber = Module(new Subtractor(wData)).io
  val andS = And(wData, io.a, io.b)
  val orS = Or(wData, io.a, io.b)
  val xorS = Xor(wData, io.a, io.b)

  // Result flags
  val addCarry = adder.Cout
  val subCarry = suber.Cout
  val addOverflow = io.a(wData - 1) ^ io.b(wData - 1) ^ adder.Sum(wData - 1) ^ addCarry
  val subOverflow = io.a(wData - 1) ^ io.b(wData - 1) ^ suber.Sum(wData - 1) ^ subCarry
  val flagZero = io.y === 0.U(wData.W)
  val flagSign = io.y(wData - 1)

  adder.A := io.a
  suber.A := io.a

  adder.B := io.b
  suber.B := io.b

  // Special handling
  adder.Cin := 0.U(1.W)
  suber.Cin := 1.U(1.W)

  io.y := MuxLookup(io.s, 0.U(wData.W), Array(
    ALUSelect.ADD -> adder.Sum,
    ALUSelect.SUB -> suber.Sum,
    ALUSelect.AND -> andS,
    ALUSelect.OR -> orS,
    ALUSelect.XOR -> xorS,
    ALUSelect.NOT -> (~io.a)
  ))
  io.f := Cat(
    // Overflow flag
    MuxLookup(io.s, 0.U(1.W), Array(
      ALUSelect.ADD -> addOverflow,
      ALUSelect.SUB -> subOverflow
    )),

    // Carry flag
    MuxLookup(io.s, 0.U(1.W), Array(
      ALUSelect.ADD -> addCarry,
      ALUSelect.SUB -> subCarry
    )),

    // Sign flag
    MuxLookup(io.s, 0.U(1.W), Array(
      ALUSelect.ADD -> flagSign,
      ALUSelect.SUB -> flagSign
    )),

    // Zero flag - any operation should have this enabled
    flagZero
  )(wFlags - 1, 0)
}

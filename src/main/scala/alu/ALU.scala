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

object ALU extends App {
  chisel3.Driver.execute(args, () => new ALU(6, 3, 3))
}

class ALU(wData: Int, wSelect: Int, wFlags: Int) extends Module {
  val io = IO(new Bundle {
    val A = Input(UInt(wData.W))
    val B = Input(UInt(wData.W))
    val S = Input(UInt(wSelect.W))
    val Y = Output(UInt(wData.W))
    val F = Output(UInt(wFlags.W))
  })

  // Internal results
  val adder = Module(new Adder(wData)).io
  val suber = Module(new Subtractor(wData)).io
  val andS = And(wData, io.A, io.B)
  val orS = Or(wData, io.A, io.B)
  val xorS = Xor(wData, io.A, io.B)

  // Result flags
  val addCarry = adder.Cout
  val subCarry = ~suber.Cout
  val addOverflowChecker = Cat(io.A(wData - 1), io.B(wData - 1), adder.Sum(wData - 1))
  val subOverflowChecker = Cat(io.A(wData - 1), io.B(wData - 1), suber.Sum(wData - 1))
  val addOverflow = (addOverflowChecker === 1.U) || (addOverflowChecker === 6.U)
  val subOverflow = (subOverflowChecker === 4.U) || (subOverflowChecker === 3.U)
  val flagZero = io.Y === 0.U(wData.W)
  val flagSign = io.Y(wData - 1)

  adder.A := io.A
  suber.A := io.A

  adder.B := io.B
  suber.B := io.B

  // Special handling
  adder.Cin := 0.U(1.W)
  suber.Cin := 1.U(1.W)

  io.Y := MuxLookup(io.S, 0.U(wData.W), Array(
    ALUSelect.ADD -> adder.Sum,
    ALUSelect.SUB -> suber.Sum,
    ALUSelect.AND -> andS,
    ALUSelect.OR -> orS,
    ALUSelect.XOR -> xorS,
    ALUSelect.NOT -> (~io.A)
  ))
  io.F := Cat(
    // Overflow flag
    MuxLookup(io.S, 0.U(1.W), Array(
      ALUSelect.ADD -> addOverflow,
      ALUSelect.SUB -> subOverflow
    )),

    // Carry flag
    MuxLookup(io.S, 0.U(1.W), Array(
      ALUSelect.ADD -> addCarry,
      ALUSelect.SUB -> subCarry
    )),

    // Sign flag
    MuxLookup(io.S, 0.U(1.W), Array(
      ALUSelect.ADD -> flagSign,
      ALUSelect.SUB -> flagSign
    )),

    // Zero flag - any operation should have this enabled
    flagZero
  )(wFlags - 1, 0)
}

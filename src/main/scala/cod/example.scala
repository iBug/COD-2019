package cod

import chisel3._
import chisel3.util._

class Example extends Module {
  val io = IO(new Bundle{
    val x = Input(UInt(8.W))
    val y = Output(UInt(4.W))
    val select = Input(Bool())
  })

  io.y := Mux(io.select, Cat(io.x(7), io.x(5), io.x(3), io.x(1)), Cat(io.x(6), io.x(4), io.x(2), io.x(0)))
}

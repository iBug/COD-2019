package reg

import chisel3._
import chisel3.util._

class RegisterFile(val aWidth: Int, val dWidth: Int) extends Module {
  val io = IO(new Bundle {
    val ra0 = Input(UInt(aWidth.W))
    val ra1 = Input(UInt(aWidth.W))
    val rd0 = Output(UInt(dWidth.W))
    val rd1 = Output(UInt(dWidth.W))
    val wa0 = Input(UInt(aWidth.W))
    val wd0 = Input(UInt(dWidth.W))
    val we = Input(Bool())
  })

  val r = RegInit(VecInit(Seq.fill(1 << aWidth)(0.U(dWidth.W))))

  io.rd0 := r(io.ra0)
  io.rd1 := r(io.ra1)

  when (io.we) {
    r(io.wa0) := io.wd0
  }
}

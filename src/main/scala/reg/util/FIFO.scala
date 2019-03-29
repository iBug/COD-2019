package reg.util

import chisel3._
import chisel3.util._

import reg._

// Warning: display may not work as expected if (wd, wa) != (4, 3)
class FIFO(val wData: Int, val wAddr: Int) extends Module {
  val io = IO(new Bundle {
    val en_in = Input(Bool())
    val en_out = Input(Bool())
    val in = Input(UInt(wData.W))
    val out = Output(UInt(wData.W))
    val empty = Output(Bool())
    val full = Output(Bool())
    val display = Output(UInt((8 + (1 << wAddr)).W))

    // 7-seg display helper
    val CLK100MHZ = Input(Clock())
  })

  val r = Module(new RegisterFile(wData, wAddr)).io
  val display = core.withClockAndReset(io.CLK100MHZ, false.B) {
    Module(new FIFODisplay(wData, wAddr))
  }.io

  val push = Wire(Bool())
  val pop = Wire(Bool())
  push := io.en_in && (!io.full || io.en_out)
  pop := io.en_out && !io.empty

  val head = reg.Counter(wAddr, pop, false.B, 0.U)
  val tail = reg.Counter(wAddr, push, false.B, 0.U)
  val out = RegInit(0.U(wData.W))

  io.empty := head === tail
  io.full := (tail + 1.U(wAddr.W)) === head
  io.out := out

  r.ra0 := head
  r.wa0 := tail
  r.wd0 := io.in
  r.we := push

  // Send these signals to display helper
  display.head := head
  display.tail := tail
  r.ra1 := display.addr
  display.data := r.rd1
  io.display := display.output

  when (pop) {
    out := r.rd0
  }
}

object SegDisplay {
  val D: Array[(UInt, UInt)] = Array(
    0.U -> "b0000001".U(7.W),
    1.U -> "b1001111".U(7.W),
    2.U -> "b0010010".U(7.W),
    3.U -> "b0000110".U(7.W),
    4.U -> "b1001100".U(7.W),
    5.U -> "b0100100".U(7.W),
    6.U -> "b0100000".U(7.W),
    7.U -> "b0001111".U(7.W),
    8.U -> "b0000000".U(7.W),
    9.U -> "b0000100".U(7.W),
    15.U -> "b1111110".U(7.W)
  )
}

class FIFODisplay(val wData: Int, val wAddr: Int) extends Module {
  val io = IO(new Bundle {
    val head = Input(UInt(wAddr.W))
    val tail = Input(UInt(wAddr.W))

    val addr = Output(UInt(wAddr.W))
    val data = Input(UInt(wData.W))
    val output = Output(UInt((8 + (1 << wAddr)).W))
  })

  val c = RegInit(0.U(16.W))
  val addr = RegInit(0.U(wAddr.W))
  val sel = Wire(UInt((1 << wAddr).W))
  val seg = Wire(UInt(7.W))
  val dp = Wire(UInt(1.W))

  io.addr := addr
  sel := ~(1.U << addr)
  seg := Mux(Mux(io.tail >= io.head,
      (addr >= io.head) && (addr < io.tail),
      (addr < io.tail) || (addr >= io.head)
    ),
    MuxLookup(io.data, 127.U(7.W), SegDisplay.D),
    127.U(7.W)
  )
  io.output := Cat(sel, dp, seg)

  dp := (addr =/= io.head) // DP is inversed, same as SEG

  when (c >= 9999.U) {
    c := 0.U
    addr := addr + 1.U(wAddr.W)
  } .otherwise {
    c := c + 1.U
  }
}

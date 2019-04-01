package reg

import chisel3.iotesters

import reg.util.{FIFO, FIFOTester}

object Tests extends App {
  RegisterFileTester.main(args)
  CounterTester.main(args)
  FIFOTester.main(args)
}

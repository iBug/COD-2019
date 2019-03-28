package fsm

import chisel3.iotesters

object Tests extends App {
  iotesters.Driver.execute(args, () => new Sorter4(8)) { c => new SorterTester(c) }
  iotesters.Driver.execute(args, () => new Divisor(8)) { c => new DivisorTester(c) }
}

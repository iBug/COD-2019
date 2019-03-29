package reg

import chisel3.iotesters

object Tests extends App {
  iotesters.Driver.execute(args, () => new RegisterFile(4, 3)) { c => new RegisterFileTester(c) }
  iotesters.Driver.execute(args, () => new Counter(4)) { c => new CounterTester(c) }
}

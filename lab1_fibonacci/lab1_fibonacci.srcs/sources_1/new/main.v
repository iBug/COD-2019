module Adder( // @[:@3.2]
  input  [7:0] io_A, // @[:@6.4]
  input  [7:0] io_B, // @[:@6.4]
  output [7:0] io_Sum // @[:@6.4]
);
  wire [8:0] _T_16; // @[Cat.scala 30:58:@8.4]
  wire [8:0] _T_18; // @[Cat.scala 30:58:@9.4]
  wire [9:0] _T_19; // @[Adder.scala 15:28:@10.4]
  wire [8:0] _T_20; // @[Adder.scala 15:28:@11.4]
  wire [9:0] _T_23; // @[Adder.scala 15:45:@13.4]
  wire [8:0] sum; // @[Adder.scala 15:45:@14.4]
  assign _T_16 = {1'h0,io_A}; // @[Cat.scala 30:58:@8.4]
  assign _T_18 = {1'h0,io_B}; // @[Cat.scala 30:58:@9.4]
  assign _T_19 = _T_16 + _T_18; // @[Adder.scala 15:28:@10.4]
  assign _T_20 = _T_16 + _T_18; // @[Adder.scala 15:28:@11.4]
  assign _T_23 = {{1'd0}, _T_20}; // @[Adder.scala 15:45:@13.4]
  assign sum = _T_23[8:0]; // @[Adder.scala 15:45:@14.4]
  assign io_Sum = sum[7:0]; // @[Adder.scala 17:10:@18.4]
endmodule
module ALU( // @[:@62.2]
  input  [7:0] io_A, // @[:@65.4]
  input  [7:0] io_B, // @[:@65.4]
  output [7:0] io_Y // @[:@65.4]
);
  wire [7:0] Adder_io_A; // @[ALU.scala 25:21:@67.4]
  wire [7:0] Adder_io_B; // @[ALU.scala 25:21:@67.4]
  wire [7:0] Adder_io_Sum; // @[ALU.scala 25:21:@67.4]
  Adder Adder ( // @[ALU.scala 25:21:@67.4]
    .io_A(Adder_io_A),
    .io_B(Adder_io_B),
    .io_Sum(Adder_io_Sum)
  );
  assign io_Y = Adder_io_Sum; // @[ALU.scala 51:8:@126.4]
  assign Adder_io_A = io_A; // @[ALU.scala 41:11:@107.4]
  assign Adder_io_B = io_B; // @[ALU.scala 44:11:@109.4]
endmodule
module Fibonacci( // @[:@145.2]
  input        clock, // @[:@146.4]
  input        reset, // @[:@147.4]
  input  [7:0] io_f0, // @[:@148.4]
  input  [7:0] io_f1, // @[:@148.4]
  output [7:0] io_fn // @[:@148.4]
);
  wire [7:0] ALU_io_A; // @[Fibonacci.scala 14:19:@150.4]
  wire [7:0] ALU_io_B; // @[Fibonacci.scala 14:19:@150.4]
  wire [7:0] ALU_io_Y; // @[Fibonacci.scala 14:19:@150.4]
  reg [7:0] r0; // @[Fibonacci.scala 15:19:@153.4]
  reg [31:0] _RAND_0;
  reg [7:0] r1; // @[Fibonacci.scala 16:19:@154.4]
  reg [31:0] _RAND_1;
  ALU ALU ( // @[Fibonacci.scala 14:19:@150.4]
    .io_A(ALU_io_A),
    .io_B(ALU_io_B),
    .io_Y(ALU_io_Y)
  );
  assign io_fn = r1; // @[Fibonacci.scala 17:9:@155.4]
  assign ALU_io_A = r0; // @[Fibonacci.scala 19:9:@156.4]
  assign ALU_io_B = r1; // @[Fibonacci.scala 20:9:@157.4]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  r0 = _RAND_0[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  r1 = _RAND_1[7:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      r0 <= io_f0;
    end else begin
      r0 <= r1;
    end
    if (reset) begin
      r1 <= io_f1;
    end else begin
      r1 <= ALU_io_Y;
    end
  end
endmodule

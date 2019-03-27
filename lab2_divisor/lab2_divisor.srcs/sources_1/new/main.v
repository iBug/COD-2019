module Divisor( // @[:@3.2]
  input        clock, // @[:@4.4]
  input        reset, // @[:@5.4]
  input  [7:0] io_x, // @[:@6.4]
  input  [7:0] io_y, // @[:@6.4]
  output [7:0] io_q, // @[:@6.4]
  output [7:0] io_r, // @[:@6.4]
  output       io_error, // @[:@6.4]
  output       io_done // @[:@6.4]
);
  reg [7:0] q; // @[Divisor.scala 17:18:@10.4]
  reg [31:0] _RAND_0;
  reg [7:0] r; // @[Divisor.scala 18:18:@11.4]
  reg [31:0] _RAND_1;
  reg [3:0] n; // @[Divisor.scala 22:18:@14.4]
  reg [31:0] _RAND_2;
  wire  _T_26; // @[Divisor.scala 23:16:@15.4]
  wire  _T_29; // @[Divisor.scala 25:18:@18.4]
  wire [8:0] _GEN_3; // @[Divisor.scala 28:16:@23.6]
  wire [8:0] _T_31; // @[Divisor.scala 28:16:@23.6]
  wire [4:0] _T_33; // @[Divisor.scala 28:32:@24.6]
  wire [4:0] _T_34; // @[Divisor.scala 28:32:@25.6]
  wire [3:0] _T_35; // @[Divisor.scala 28:32:@26.6]
  wire [7:0] _T_36; // @[Divisor.scala 28:29:@27.6]
  wire  _T_37; // @[Divisor.scala 28:29:@28.6]
  wire [8:0] _GEN_4; // @[Divisor.scala 28:22:@30.6]
  wire [8:0] _T_40; // @[Divisor.scala 28:22:@30.6]
  wire [8:0] _GEN_5; // @[Divisor.scala 29:16:@31.6]
  wire  _T_41; // @[Divisor.scala 29:16:@31.6]
  wire [9:0] _T_42; // @[Divisor.scala 29:27:@32.6]
  wire [9:0] _T_43; // @[Divisor.scala 29:27:@33.6]
  wire [8:0] _T_44; // @[Divisor.scala 29:27:@34.6]
  wire [8:0] _T_45; // @[Divisor.scala 29:13:@35.6]
  wire [15:0] _T_52; // @[Divisor.scala 30:34:@41.6]
  wire [15:0] _GEN_8; // @[Divisor.scala 30:27:@42.6]
  wire [15:0] _T_53; // @[Divisor.scala 30:27:@42.6]
  wire [15:0] _T_54; // @[Divisor.scala 30:13:@43.6]
  wire [3:0] _GEN_0; // @[Divisor.scala 25:32:@19.4]
  wire [8:0] _GEN_1; // @[Divisor.scala 25:32:@19.4]
  wire [15:0] _GEN_2; // @[Divisor.scala 25:32:@19.4]
  assign _T_26 = n == 4'h0; // @[Divisor.scala 23:16:@15.4]
  assign _T_29 = io_error | _T_26; // @[Divisor.scala 25:18:@18.4]
  assign _GEN_3 = {{1'd0}, r}; // @[Divisor.scala 28:16:@23.6]
  assign _T_31 = _GEN_3 << 1; // @[Divisor.scala 28:16:@23.6]
  assign _T_33 = n - 4'h1; // @[Divisor.scala 28:32:@24.6]
  assign _T_34 = $unsigned(_T_33); // @[Divisor.scala 28:32:@25.6]
  assign _T_35 = _T_34[3:0]; // @[Divisor.scala 28:32:@26.6]
  assign _T_36 = io_x >> _T_35; // @[Divisor.scala 28:29:@27.6]
  assign _T_37 = _T_36[0]; // @[Divisor.scala 28:29:@28.6]
  assign _GEN_4 = {{8'd0}, _T_37}; // @[Divisor.scala 28:22:@30.6]
  assign _T_40 = _T_31 | _GEN_4; // @[Divisor.scala 28:22:@30.6]
  assign _GEN_5 = {{1'd0}, io_y}; // @[Divisor.scala 29:16:@31.6]
  assign _T_41 = _T_40 >= _GEN_5; // @[Divisor.scala 29:16:@31.6]
  assign _T_42 = _T_40 - _GEN_5; // @[Divisor.scala 29:27:@32.6]
  assign _T_43 = $unsigned(_T_42); // @[Divisor.scala 29:27:@33.6]
  assign _T_44 = _T_43[8:0]; // @[Divisor.scala 29:27:@34.6]
  assign _T_45 = _T_41 ? _T_44 : _T_40; // @[Divisor.scala 29:13:@35.6]
  assign _T_52 = 16'h1 << _T_35; // @[Divisor.scala 30:34:@41.6]
  assign _GEN_8 = {{8'd0}, q}; // @[Divisor.scala 30:27:@42.6]
  assign _T_53 = _GEN_8 | _T_52; // @[Divisor.scala 30:27:@42.6]
  assign _T_54 = _T_41 ? _T_53 : {{8'd0}, q}; // @[Divisor.scala 30:13:@43.6]
  assign _GEN_0 = _T_29 ? 4'h0 : _T_35; // @[Divisor.scala 25:32:@19.4]
  assign _GEN_1 = _T_29 ? {{1'd0}, r} : _T_45; // @[Divisor.scala 25:32:@19.4]
  assign _GEN_2 = _T_29 ? {{8'd0}, q} : _T_54; // @[Divisor.scala 25:32:@19.4]
  assign io_q = q; // @[Divisor.scala 19:8:@12.4]
  assign io_r = r; // @[Divisor.scala 20:8:@13.4]
  assign io_error = io_y == 8'h0; // @[Divisor.scala 15:12:@9.4]
  assign io_done = n == 4'h0; // @[Divisor.scala 23:11:@16.4]
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
  q = _RAND_0[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  r = _RAND_1[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  n = _RAND_2[3:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      q <= 8'h0;
    end else begin
      q <= _GEN_2[7:0];
    end
    if (reset) begin
      r <= 8'h0;
    end else begin
      r <= _GEN_1[7:0];
    end
    if (reset) begin
      n <= 4'h8;
    end else begin
      if (_T_29) begin
        n <= 4'h0;
      end else begin
        n <= _T_35;
      end
    end
  end
endmodule

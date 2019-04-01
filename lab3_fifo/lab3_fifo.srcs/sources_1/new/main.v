module Register(
  input        clock,
  input        reset,
  input  [3:0] io_in,
  output [3:0] io_out,
  input        io_enable
);
  reg [3:0] reg_; // @[Register.scala 22:20]
  reg [31:0] _RAND_0;
  assign io_out = reg_; // @[Register.scala 23:10]
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
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  reg_ = _RAND_0[3:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end
  always @(posedge clock) begin
    if (reset) begin
      reg_ <= 4'h0;
    end else begin
      if (io_enable) begin
        reg_ <= io_in;
      end
    end
  end
endmodule
module RegisterFile(
  input        clock,
  input        reset,
  input  [2:0] io_ra0,
  input  [2:0] io_ra1,
  output [3:0] io_rd0,
  output [3:0] io_rd1,
  input  [2:0] io_wa0,
  input  [3:0] io_wd0,
  input        io_we
);
  wire  Register_clock; // @[RegisterFile.scala 19:46]
  wire  Register_reset; // @[RegisterFile.scala 19:46]
  wire [3:0] Register_io_in; // @[RegisterFile.scala 19:46]
  wire [3:0] Register_io_out; // @[RegisterFile.scala 19:46]
  wire  Register_io_enable; // @[RegisterFile.scala 19:46]
  wire  Register_1_clock; // @[RegisterFile.scala 19:46]
  wire  Register_1_reset; // @[RegisterFile.scala 19:46]
  wire [3:0] Register_1_io_in; // @[RegisterFile.scala 19:46]
  wire [3:0] Register_1_io_out; // @[RegisterFile.scala 19:46]
  wire  Register_1_io_enable; // @[RegisterFile.scala 19:46]
  wire  Register_2_clock; // @[RegisterFile.scala 19:46]
  wire  Register_2_reset; // @[RegisterFile.scala 19:46]
  wire [3:0] Register_2_io_in; // @[RegisterFile.scala 19:46]
  wire [3:0] Register_2_io_out; // @[RegisterFile.scala 19:46]
  wire  Register_2_io_enable; // @[RegisterFile.scala 19:46]
  wire  Register_3_clock; // @[RegisterFile.scala 19:46]
  wire  Register_3_reset; // @[RegisterFile.scala 19:46]
  wire [3:0] Register_3_io_in; // @[RegisterFile.scala 19:46]
  wire [3:0] Register_3_io_out; // @[RegisterFile.scala 19:46]
  wire  Register_3_io_enable; // @[RegisterFile.scala 19:46]
  wire  Register_4_clock; // @[RegisterFile.scala 19:46]
  wire  Register_4_reset; // @[RegisterFile.scala 19:46]
  wire [3:0] Register_4_io_in; // @[RegisterFile.scala 19:46]
  wire [3:0] Register_4_io_out; // @[RegisterFile.scala 19:46]
  wire  Register_4_io_enable; // @[RegisterFile.scala 19:46]
  wire  Register_5_clock; // @[RegisterFile.scala 19:46]
  wire  Register_5_reset; // @[RegisterFile.scala 19:46]
  wire [3:0] Register_5_io_in; // @[RegisterFile.scala 19:46]
  wire [3:0] Register_5_io_out; // @[RegisterFile.scala 19:46]
  wire  Register_5_io_enable; // @[RegisterFile.scala 19:46]
  wire  Register_6_clock; // @[RegisterFile.scala 19:46]
  wire  Register_6_reset; // @[RegisterFile.scala 19:46]
  wire [3:0] Register_6_io_in; // @[RegisterFile.scala 19:46]
  wire [3:0] Register_6_io_out; // @[RegisterFile.scala 19:46]
  wire  Register_6_io_enable; // @[RegisterFile.scala 19:46]
  wire  Register_7_clock; // @[RegisterFile.scala 19:46]
  wire  Register_7_reset; // @[RegisterFile.scala 19:46]
  wire [3:0] Register_7_io_in; // @[RegisterFile.scala 19:46]
  wire [3:0] Register_7_io_out; // @[RegisterFile.scala 19:46]
  wire  Register_7_io_enable; // @[RegisterFile.scala 19:46]
  wire  _T; // @[RegisterFile.scala 23:37]
  wire  _T_2; // @[RegisterFile.scala 23:37]
  wire  _T_4; // @[RegisterFile.scala 23:37]
  wire  _T_6; // @[RegisterFile.scala 23:37]
  wire  _T_8; // @[RegisterFile.scala 23:37]
  wire  _T_10; // @[RegisterFile.scala 23:37]
  wire  _T_12; // @[RegisterFile.scala 23:37]
  wire  _T_14; // @[RegisterFile.scala 23:37]
  wire [3:0] r_0_out; // @[RegisterFile.scala 19:18 RegisterFile.scala 19:18]
  wire [3:0] r_1_out; // @[RegisterFile.scala 19:18 RegisterFile.scala 19:18]
  wire [3:0] _GEN_4; // @[RegisterFile.scala 26:10]
  wire [3:0] r_2_out; // @[RegisterFile.scala 19:18 RegisterFile.scala 19:18]
  wire [3:0] _GEN_7; // @[RegisterFile.scala 26:10]
  wire [3:0] r_3_out; // @[RegisterFile.scala 19:18 RegisterFile.scala 19:18]
  wire [3:0] _GEN_10; // @[RegisterFile.scala 26:10]
  wire [3:0] r_4_out; // @[RegisterFile.scala 19:18 RegisterFile.scala 19:18]
  wire [3:0] _GEN_13; // @[RegisterFile.scala 26:10]
  wire [3:0] r_5_out; // @[RegisterFile.scala 19:18 RegisterFile.scala 19:18]
  wire [3:0] _GEN_16; // @[RegisterFile.scala 26:10]
  wire [3:0] r_6_out; // @[RegisterFile.scala 19:18 RegisterFile.scala 19:18]
  wire [3:0] _GEN_19; // @[RegisterFile.scala 26:10]
  wire [3:0] r_7_out; // @[RegisterFile.scala 19:18 RegisterFile.scala 19:18]
  wire [3:0] _GEN_28; // @[RegisterFile.scala 27:10]
  wire [3:0] _GEN_31; // @[RegisterFile.scala 27:10]
  wire [3:0] _GEN_34; // @[RegisterFile.scala 27:10]
  wire [3:0] _GEN_37; // @[RegisterFile.scala 27:10]
  wire [3:0] _GEN_40; // @[RegisterFile.scala 27:10]
  wire [3:0] _GEN_43; // @[RegisterFile.scala 27:10]
  Register Register ( // @[RegisterFile.scala 19:46]
    .clock(Register_clock),
    .reset(Register_reset),
    .io_in(Register_io_in),
    .io_out(Register_io_out),
    .io_enable(Register_io_enable)
  );
  Register Register_1 ( // @[RegisterFile.scala 19:46]
    .clock(Register_1_clock),
    .reset(Register_1_reset),
    .io_in(Register_1_io_in),
    .io_out(Register_1_io_out),
    .io_enable(Register_1_io_enable)
  );
  Register Register_2 ( // @[RegisterFile.scala 19:46]
    .clock(Register_2_clock),
    .reset(Register_2_reset),
    .io_in(Register_2_io_in),
    .io_out(Register_2_io_out),
    .io_enable(Register_2_io_enable)
  );
  Register Register_3 ( // @[RegisterFile.scala 19:46]
    .clock(Register_3_clock),
    .reset(Register_3_reset),
    .io_in(Register_3_io_in),
    .io_out(Register_3_io_out),
    .io_enable(Register_3_io_enable)
  );
  Register Register_4 ( // @[RegisterFile.scala 19:46]
    .clock(Register_4_clock),
    .reset(Register_4_reset),
    .io_in(Register_4_io_in),
    .io_out(Register_4_io_out),
    .io_enable(Register_4_io_enable)
  );
  Register Register_5 ( // @[RegisterFile.scala 19:46]
    .clock(Register_5_clock),
    .reset(Register_5_reset),
    .io_in(Register_5_io_in),
    .io_out(Register_5_io_out),
    .io_enable(Register_5_io_enable)
  );
  Register Register_6 ( // @[RegisterFile.scala 19:46]
    .clock(Register_6_clock),
    .reset(Register_6_reset),
    .io_in(Register_6_io_in),
    .io_out(Register_6_io_out),
    .io_enable(Register_6_io_enable)
  );
  Register Register_7 ( // @[RegisterFile.scala 19:46]
    .clock(Register_7_clock),
    .reset(Register_7_reset),
    .io_in(Register_7_io_in),
    .io_out(Register_7_io_out),
    .io_enable(Register_7_io_enable)
  );
  assign _T = io_wa0 == 3'h0; // @[RegisterFile.scala 23:37]
  assign _T_2 = io_wa0 == 3'h1; // @[RegisterFile.scala 23:37]
  assign _T_4 = io_wa0 == 3'h2; // @[RegisterFile.scala 23:37]
  assign _T_6 = io_wa0 == 3'h3; // @[RegisterFile.scala 23:37]
  assign _T_8 = io_wa0 == 3'h4; // @[RegisterFile.scala 23:37]
  assign _T_10 = io_wa0 == 3'h5; // @[RegisterFile.scala 23:37]
  assign _T_12 = io_wa0 == 3'h6; // @[RegisterFile.scala 23:37]
  assign _T_14 = io_wa0 == 3'h7; // @[RegisterFile.scala 23:37]
  assign r_0_out = Register_io_out; // @[RegisterFile.scala 19:18 RegisterFile.scala 19:18]
  assign r_1_out = Register_1_io_out; // @[RegisterFile.scala 19:18 RegisterFile.scala 19:18]
  assign _GEN_4 = 3'h1 == io_ra0 ? r_1_out : r_0_out; // @[RegisterFile.scala 26:10]
  assign r_2_out = Register_2_io_out; // @[RegisterFile.scala 19:18 RegisterFile.scala 19:18]
  assign _GEN_7 = 3'h2 == io_ra0 ? r_2_out : _GEN_4; // @[RegisterFile.scala 26:10]
  assign r_3_out = Register_3_io_out; // @[RegisterFile.scala 19:18 RegisterFile.scala 19:18]
  assign _GEN_10 = 3'h3 == io_ra0 ? r_3_out : _GEN_7; // @[RegisterFile.scala 26:10]
  assign r_4_out = Register_4_io_out; // @[RegisterFile.scala 19:18 RegisterFile.scala 19:18]
  assign _GEN_13 = 3'h4 == io_ra0 ? r_4_out : _GEN_10; // @[RegisterFile.scala 26:10]
  assign r_5_out = Register_5_io_out; // @[RegisterFile.scala 19:18 RegisterFile.scala 19:18]
  assign _GEN_16 = 3'h5 == io_ra0 ? r_5_out : _GEN_13; // @[RegisterFile.scala 26:10]
  assign r_6_out = Register_6_io_out; // @[RegisterFile.scala 19:18 RegisterFile.scala 19:18]
  assign _GEN_19 = 3'h6 == io_ra0 ? r_6_out : _GEN_16; // @[RegisterFile.scala 26:10]
  assign r_7_out = Register_7_io_out; // @[RegisterFile.scala 19:18 RegisterFile.scala 19:18]
  assign _GEN_28 = 3'h1 == io_ra1 ? r_1_out : r_0_out; // @[RegisterFile.scala 27:10]
  assign _GEN_31 = 3'h2 == io_ra1 ? r_2_out : _GEN_28; // @[RegisterFile.scala 27:10]
  assign _GEN_34 = 3'h3 == io_ra1 ? r_3_out : _GEN_31; // @[RegisterFile.scala 27:10]
  assign _GEN_37 = 3'h4 == io_ra1 ? r_4_out : _GEN_34; // @[RegisterFile.scala 27:10]
  assign _GEN_40 = 3'h5 == io_ra1 ? r_5_out : _GEN_37; // @[RegisterFile.scala 27:10]
  assign _GEN_43 = 3'h6 == io_ra1 ? r_6_out : _GEN_40; // @[RegisterFile.scala 27:10]
  assign io_rd0 = 3'h7 == io_ra0 ? r_7_out : _GEN_19; // @[RegisterFile.scala 26:10]
  assign io_rd1 = 3'h7 == io_ra1 ? r_7_out : _GEN_43; // @[RegisterFile.scala 27:10]
  assign Register_clock = clock;
  assign Register_reset = reset;
  assign Register_io_in = io_wd0; // @[RegisterFile.scala 19:18]
  assign Register_io_enable = io_we & _T; // @[RegisterFile.scala 19:18]
  assign Register_1_clock = clock;
  assign Register_1_reset = reset;
  assign Register_1_io_in = io_wd0; // @[RegisterFile.scala 19:18]
  assign Register_1_io_enable = io_we & _T_2; // @[RegisterFile.scala 19:18]
  assign Register_2_clock = clock;
  assign Register_2_reset = reset;
  assign Register_2_io_in = io_wd0; // @[RegisterFile.scala 19:18]
  assign Register_2_io_enable = io_we & _T_4; // @[RegisterFile.scala 19:18]
  assign Register_3_clock = clock;
  assign Register_3_reset = reset;
  assign Register_3_io_in = io_wd0; // @[RegisterFile.scala 19:18]
  assign Register_3_io_enable = io_we & _T_6; // @[RegisterFile.scala 19:18]
  assign Register_4_clock = clock;
  assign Register_4_reset = reset;
  assign Register_4_io_in = io_wd0; // @[RegisterFile.scala 19:18]
  assign Register_4_io_enable = io_we & _T_8; // @[RegisterFile.scala 19:18]
  assign Register_5_clock = clock;
  assign Register_5_reset = reset;
  assign Register_5_io_in = io_wd0; // @[RegisterFile.scala 19:18]
  assign Register_5_io_enable = io_we & _T_10; // @[RegisterFile.scala 19:18]
  assign Register_6_clock = clock;
  assign Register_6_reset = reset;
  assign Register_6_io_in = io_wd0; // @[RegisterFile.scala 19:18]
  assign Register_6_io_enable = io_we & _T_12; // @[RegisterFile.scala 19:18]
  assign Register_7_clock = clock;
  assign Register_7_reset = reset;
  assign Register_7_io_in = io_wd0; // @[RegisterFile.scala 19:18]
  assign Register_7_io_enable = io_we & _T_14; // @[RegisterFile.scala 19:18]
endmodule
module FIFODisplay(
  input         clock,
  input  [2:0]  io_head,
  input  [2:0]  io_tail,
  output [2:0]  io_addr,
  input  [3:0]  io_data,
  output [15:0] io_output
);
  reg [15:0] c; // @[FIFO.scala 82:18]
  reg [31:0] _RAND_0;
  reg [2:0] addr; // @[FIFO.scala 83:21]
  reg [31:0] _RAND_1;
  wire [7:0] _T; // @[FIFO.scala 89:16]
  wire [7:0] sel; // @[FIFO.scala 89:10]
  wire  _T_2; // @[FIFO.scala 90:26]
  wire  _T_3; // @[FIFO.scala 91:13]
  wire  _T_4; // @[FIFO.scala 91:34]
  wire  _T_5; // @[FIFO.scala 91:25]
  wire  _T_8; // @[FIFO.scala 92:24]
  wire  _T_9; // @[FIFO.scala 90:17]
  wire  _T_10; // @[Mux.scala 69:19]
  wire [6:0] _T_11; // @[Mux.scala 69:16]
  wire  _T_12; // @[Mux.scala 69:19]
  wire [6:0] _T_13; // @[Mux.scala 69:16]
  wire  _T_14; // @[Mux.scala 69:19]
  wire [6:0] _T_15; // @[Mux.scala 69:16]
  wire  _T_16; // @[Mux.scala 69:19]
  wire [6:0] _T_17; // @[Mux.scala 69:16]
  wire  _T_18; // @[Mux.scala 69:19]
  wire [6:0] _T_19; // @[Mux.scala 69:16]
  wire  _T_20; // @[Mux.scala 69:19]
  wire [6:0] _T_21; // @[Mux.scala 69:16]
  wire  _T_22; // @[Mux.scala 69:19]
  wire [6:0] _T_23; // @[Mux.scala 69:16]
  wire  _T_24; // @[Mux.scala 69:19]
  wire [6:0] _T_25; // @[Mux.scala 69:16]
  wire  _T_26; // @[Mux.scala 69:19]
  wire [6:0] _T_27; // @[Mux.scala 69:16]
  wire  _T_28; // @[Mux.scala 69:19]
  wire [6:0] _T_29; // @[Mux.scala 69:16]
  wire  _T_30; // @[Mux.scala 69:19]
  wire [6:0] _T_31; // @[Mux.scala 69:16]
  wire [6:0] seg; // @[FIFO.scala 90:13]
  wire  dp; // @[FIFO.scala 99:15]
  wire [8:0] _T_33; // @[Cat.scala 30:58]
  wire  _T_36; // @[FIFO.scala 101:11]
  wire [2:0] _T_38; // @[FIFO.scala 103:18]
  wire [15:0] _T_40; // @[FIFO.scala 105:12]
  assign _T = 8'h1 << addr; // @[FIFO.scala 89:16]
  assign sel = ~ _T; // @[FIFO.scala 89:10]
  assign _T_2 = io_tail >= io_head; // @[FIFO.scala 90:26]
  assign _T_3 = addr >= io_head; // @[FIFO.scala 91:13]
  assign _T_4 = addr < io_tail; // @[FIFO.scala 91:34]
  assign _T_5 = _T_3 & _T_4; // @[FIFO.scala 91:25]
  assign _T_8 = _T_4 | _T_3; // @[FIFO.scala 92:24]
  assign _T_9 = _T_2 ? _T_5 : _T_8; // @[FIFO.scala 90:17]
  assign _T_10 = 4'hf == io_data; // @[Mux.scala 69:19]
  assign _T_11 = _T_10 ? 7'h7e : 7'h7f; // @[Mux.scala 69:16]
  assign _T_12 = 4'h9 == io_data; // @[Mux.scala 69:19]
  assign _T_13 = _T_12 ? 7'h4 : _T_11; // @[Mux.scala 69:16]
  assign _T_14 = 4'h8 == io_data; // @[Mux.scala 69:19]
  assign _T_15 = _T_14 ? 7'h0 : _T_13; // @[Mux.scala 69:16]
  assign _T_16 = 4'h7 == io_data; // @[Mux.scala 69:19]
  assign _T_17 = _T_16 ? 7'hf : _T_15; // @[Mux.scala 69:16]
  assign _T_18 = 4'h6 == io_data; // @[Mux.scala 69:19]
  assign _T_19 = _T_18 ? 7'h20 : _T_17; // @[Mux.scala 69:16]
  assign _T_20 = 4'h5 == io_data; // @[Mux.scala 69:19]
  assign _T_21 = _T_20 ? 7'h24 : _T_19; // @[Mux.scala 69:16]
  assign _T_22 = 4'h4 == io_data; // @[Mux.scala 69:19]
  assign _T_23 = _T_22 ? 7'h4c : _T_21; // @[Mux.scala 69:16]
  assign _T_24 = 4'h3 == io_data; // @[Mux.scala 69:19]
  assign _T_25 = _T_24 ? 7'h6 : _T_23; // @[Mux.scala 69:16]
  assign _T_26 = 4'h2 == io_data; // @[Mux.scala 69:19]
  assign _T_27 = _T_26 ? 7'h12 : _T_25; // @[Mux.scala 69:16]
  assign _T_28 = 4'h1 == io_data; // @[Mux.scala 69:19]
  assign _T_29 = _T_28 ? 7'h4f : _T_27; // @[Mux.scala 69:16]
  assign _T_30 = 4'h0 == io_data; // @[Mux.scala 69:19]
  assign _T_31 = _T_30 ? 7'h1 : _T_29; // @[Mux.scala 69:16]
  assign seg = _T_9 ? _T_31 : 7'h7f; // @[FIFO.scala 90:13]
  assign dp = addr != io_head; // @[FIFO.scala 99:15]
  assign _T_33 = {sel,dp}; // @[Cat.scala 30:58]
  assign _T_36 = c >= 16'h270f; // @[FIFO.scala 101:11]
  assign _T_38 = addr + 3'h1; // @[FIFO.scala 103:18]
  assign _T_40 = c + 16'h1; // @[FIFO.scala 105:12]
  assign io_addr = addr; // @[FIFO.scala 88:11]
  assign io_output = {_T_33,seg}; // @[FIFO.scala 97:13]
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
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  c = _RAND_0[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  addr = _RAND_1[2:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end
  always @(posedge clock) begin
    if (_T_36) begin
      c <= 16'h0;
    end else begin
      c <= _T_40;
    end
    if (_T_36) begin
      addr <= _T_38;
    end
  end
endmodule
module Counter(
  input        clock,
  input        reset,
  input        io_ce,
  output [2:0] io_q
);
  reg [2:0] q; // @[Counter.scala 24:18]
  reg [31:0] _RAND_0;
  wire [2:0] _T_1; // @[Counter.scala 30:12]
  assign _T_1 = q + 3'h1; // @[Counter.scala 30:12]
  assign io_q = q; // @[Counter.scala 25:8]
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
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  q = _RAND_0[2:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end
  always @(posedge clock) begin
    if (reset) begin
      q <= 3'h0;
    end else begin
      if (io_ce) begin
        q <= _T_1;
      end
    end
  end
endmodule
module FIFO(
  input         clock,
  input         reset,
  input         io_en_in,
  input         io_en_out,
  input  [3:0]  io_in,
  output [3:0]  io_out,
  output        io_empty,
  output        io_full,
  output [15:0] io_display,
  input         io_CLK100MHZ
);
  wire  RegisterFile_clock; // @[FIFO.scala 23:17]
  wire  RegisterFile_reset; // @[FIFO.scala 23:17]
  wire [2:0] RegisterFile_io_ra0; // @[FIFO.scala 23:17]
  wire [2:0] RegisterFile_io_ra1; // @[FIFO.scala 23:17]
  wire [3:0] RegisterFile_io_rd0; // @[FIFO.scala 23:17]
  wire [3:0] RegisterFile_io_rd1; // @[FIFO.scala 23:17]
  wire [2:0] RegisterFile_io_wa0; // @[FIFO.scala 23:17]
  wire [3:0] RegisterFile_io_wd0; // @[FIFO.scala 23:17]
  wire  RegisterFile_io_we; // @[FIFO.scala 23:17]
  wire  FIFODisplay_clock; // @[FIFO.scala 25:11]
  wire [2:0] FIFODisplay_io_head; // @[FIFO.scala 25:11]
  wire [2:0] FIFODisplay_io_tail; // @[FIFO.scala 25:11]
  wire [2:0] FIFODisplay_io_addr; // @[FIFO.scala 25:11]
  wire [3:0] FIFODisplay_io_data; // @[FIFO.scala 25:11]
  wire [15:0] FIFODisplay_io_output; // @[FIFO.scala 25:11]
  wire  Counter_clock; // @[Counter.scala 8:19]
  wire  Counter_reset; // @[Counter.scala 8:19]
  wire  Counter_io_ce; // @[Counter.scala 8:19]
  wire [2:0] Counter_io_q; // @[Counter.scala 8:19]
  wire  Counter_1_clock; // @[Counter.scala 8:19]
  wire  Counter_1_reset; // @[Counter.scala 8:19]
  wire  Counter_1_io_ce; // @[Counter.scala 8:19]
  wire [2:0] Counter_1_io_q; // @[Counter.scala 8:19]
  wire  _T; // @[FIFO.scala 28:33]
  wire  _T_1; // @[FIFO.scala 28:42]
  wire  _T_2; // @[FIFO.scala 29:32]
  wire  pop; // @[FIFO.scala 29:29]
  reg [3:0] out; // @[FIFO.scala 33:20]
  reg [31:0] _RAND_0;
  wire [2:0] _T_5; // @[FIFO.scala 36:20]
  RegisterFile RegisterFile ( // @[FIFO.scala 23:17]
    .clock(RegisterFile_clock),
    .reset(RegisterFile_reset),
    .io_ra0(RegisterFile_io_ra0),
    .io_ra1(RegisterFile_io_ra1),
    .io_rd0(RegisterFile_io_rd0),
    .io_rd1(RegisterFile_io_rd1),
    .io_wa0(RegisterFile_io_wa0),
    .io_wd0(RegisterFile_io_wd0),
    .io_we(RegisterFile_io_we)
  );
  FIFODisplay FIFODisplay ( // @[FIFO.scala 25:11]
    .clock(FIFODisplay_clock),
    .io_head(FIFODisplay_io_head),
    .io_tail(FIFODisplay_io_tail),
    .io_addr(FIFODisplay_io_addr),
    .io_data(FIFODisplay_io_data),
    .io_output(FIFODisplay_io_output)
  );
  Counter Counter ( // @[Counter.scala 8:19]
    .clock(Counter_clock),
    .reset(Counter_reset),
    .io_ce(Counter_io_ce),
    .io_q(Counter_io_q)
  );
  Counter Counter_1 ( // @[Counter.scala 8:19]
    .clock(Counter_1_clock),
    .reset(Counter_1_reset),
    .io_ce(Counter_1_io_ce),
    .io_q(Counter_1_io_q)
  );
  assign _T = io_full == 1'h0; // @[FIFO.scala 28:33]
  assign _T_1 = _T | io_en_out; // @[FIFO.scala 28:42]
  assign _T_2 = io_empty == 1'h0; // @[FIFO.scala 29:32]
  assign pop = io_en_out & _T_2; // @[FIFO.scala 29:29]
  assign _T_5 = Counter_1_io_q + 3'h1; // @[FIFO.scala 36:20]
  assign io_out = out; // @[FIFO.scala 37:10]
  assign io_empty = Counter_io_q == Counter_1_io_q; // @[FIFO.scala 35:12]
  assign io_full = _T_5 == Counter_io_q; // @[FIFO.scala 36:11]
  assign io_display = FIFODisplay_io_output; // @[FIFO.scala 49:14]
  assign RegisterFile_clock = clock;
  assign RegisterFile_reset = reset;
  assign RegisterFile_io_ra0 = Counter_io_q; // @[FIFO.scala 39:9]
  assign RegisterFile_io_ra1 = FIFODisplay_io_addr; // @[FIFO.scala 47:9]
  assign RegisterFile_io_wa0 = Counter_1_io_q; // @[FIFO.scala 40:9]
  assign RegisterFile_io_wd0 = io_in; // @[FIFO.scala 41:9]
  assign RegisterFile_io_we = io_en_in & _T_1; // @[FIFO.scala 42:8]
  assign FIFODisplay_clock = io_CLK100MHZ;
  assign FIFODisplay_io_head = Counter_io_q; // @[FIFO.scala 45:16]
  assign FIFODisplay_io_tail = Counter_1_io_q; // @[FIFO.scala 46:16]
  assign FIFODisplay_io_data = RegisterFile_io_rd1; // @[FIFO.scala 48:16]
  assign Counter_clock = clock;
  assign Counter_reset = reset;
  assign Counter_io_ce = io_en_out & _T_2; // @[Counter.scala 9:10]
  assign Counter_1_clock = clock;
  assign Counter_1_reset = reset;
  assign Counter_1_io_ce = io_en_in & _T_1; // @[Counter.scala 9:10]
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
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  out = _RAND_0[3:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end
  always @(posedge clock) begin
    if (reset) begin
      out <= 4'h0;
    end else begin
      if (pop) begin
        out <= RegisterFile_io_rd0;
      end
    end
  end
endmodule

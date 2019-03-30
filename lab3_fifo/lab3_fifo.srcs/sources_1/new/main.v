module RegisterFile( // @[:@3.2]
  input        clock, // @[:@4.4]
  input        reset, // @[:@5.4]
  input  [2:0] io_ra0, // @[:@6.4]
  input  [2:0] io_ra1, // @[:@6.4]
  output [3:0] io_rd0, // @[:@6.4]
  output [3:0] io_rd1, // @[:@6.4]
  input  [2:0] io_wa0, // @[:@6.4]
  input  [3:0] io_wd0, // @[:@6.4]
  input        io_we // @[:@6.4]
);
  reg [3:0] r_0; // @[RegisterFile.scala 17:18:@17.4]
  reg [31:0] _RAND_0;
  reg [3:0] r_1; // @[RegisterFile.scala 17:18:@17.4]
  reg [31:0] _RAND_1;
  reg [3:0] r_2; // @[RegisterFile.scala 17:18:@17.4]
  reg [31:0] _RAND_2;
  reg [3:0] r_3; // @[RegisterFile.scala 17:18:@17.4]
  reg [31:0] _RAND_3;
  reg [3:0] r_4; // @[RegisterFile.scala 17:18:@17.4]
  reg [31:0] _RAND_4;
  reg [3:0] r_5; // @[RegisterFile.scala 17:18:@17.4]
  reg [31:0] _RAND_5;
  reg [3:0] r_6; // @[RegisterFile.scala 17:18:@17.4]
  reg [31:0] _RAND_6;
  reg [3:0] r_7; // @[RegisterFile.scala 17:18:@17.4]
  reg [31:0] _RAND_7;
  wire [3:0] _GEN_1; // @[RegisterFile.scala 19:10:@18.4]
  wire [3:0] _GEN_2; // @[RegisterFile.scala 19:10:@18.4]
  wire [3:0] _GEN_3; // @[RegisterFile.scala 19:10:@18.4]
  wire [3:0] _GEN_4; // @[RegisterFile.scala 19:10:@18.4]
  wire [3:0] _GEN_5; // @[RegisterFile.scala 19:10:@18.4]
  wire [3:0] _GEN_6; // @[RegisterFile.scala 19:10:@18.4]
  wire [3:0] _GEN_9; // @[RegisterFile.scala 20:10:@19.4]
  wire [3:0] _GEN_10; // @[RegisterFile.scala 20:10:@19.4]
  wire [3:0] _GEN_11; // @[RegisterFile.scala 20:10:@19.4]
  wire [3:0] _GEN_12; // @[RegisterFile.scala 20:10:@19.4]
  wire [3:0] _GEN_13; // @[RegisterFile.scala 20:10:@19.4]
  wire [3:0] _GEN_14; // @[RegisterFile.scala 20:10:@19.4]
  wire [3:0] _GEN_16; // @[RegisterFile.scala 23:15:@21.6]
  wire [3:0] _GEN_17; // @[RegisterFile.scala 23:15:@21.6]
  wire [3:0] _GEN_18; // @[RegisterFile.scala 23:15:@21.6]
  wire [3:0] _GEN_19; // @[RegisterFile.scala 23:15:@21.6]
  wire [3:0] _GEN_20; // @[RegisterFile.scala 23:15:@21.6]
  wire [3:0] _GEN_21; // @[RegisterFile.scala 23:15:@21.6]
  wire [3:0] _GEN_22; // @[RegisterFile.scala 23:15:@21.6]
  wire [3:0] _GEN_23; // @[RegisterFile.scala 23:15:@21.6]
  wire [3:0] _GEN_24; // @[RegisterFile.scala 22:16:@20.4]
  wire [3:0] _GEN_25; // @[RegisterFile.scala 22:16:@20.4]
  wire [3:0] _GEN_26; // @[RegisterFile.scala 22:16:@20.4]
  wire [3:0] _GEN_27; // @[RegisterFile.scala 22:16:@20.4]
  wire [3:0] _GEN_28; // @[RegisterFile.scala 22:16:@20.4]
  wire [3:0] _GEN_29; // @[RegisterFile.scala 22:16:@20.4]
  wire [3:0] _GEN_30; // @[RegisterFile.scala 22:16:@20.4]
  wire [3:0] _GEN_31; // @[RegisterFile.scala 22:16:@20.4]
  assign _GEN_1 = 3'h1 == io_ra0 ? r_1 : r_0; // @[RegisterFile.scala 19:10:@18.4]
  assign _GEN_2 = 3'h2 == io_ra0 ? r_2 : _GEN_1; // @[RegisterFile.scala 19:10:@18.4]
  assign _GEN_3 = 3'h3 == io_ra0 ? r_3 : _GEN_2; // @[RegisterFile.scala 19:10:@18.4]
  assign _GEN_4 = 3'h4 == io_ra0 ? r_4 : _GEN_3; // @[RegisterFile.scala 19:10:@18.4]
  assign _GEN_5 = 3'h5 == io_ra0 ? r_5 : _GEN_4; // @[RegisterFile.scala 19:10:@18.4]
  assign _GEN_6 = 3'h6 == io_ra0 ? r_6 : _GEN_5; // @[RegisterFile.scala 19:10:@18.4]
  assign _GEN_9 = 3'h1 == io_ra1 ? r_1 : r_0; // @[RegisterFile.scala 20:10:@19.4]
  assign _GEN_10 = 3'h2 == io_ra1 ? r_2 : _GEN_9; // @[RegisterFile.scala 20:10:@19.4]
  assign _GEN_11 = 3'h3 == io_ra1 ? r_3 : _GEN_10; // @[RegisterFile.scala 20:10:@19.4]
  assign _GEN_12 = 3'h4 == io_ra1 ? r_4 : _GEN_11; // @[RegisterFile.scala 20:10:@19.4]
  assign _GEN_13 = 3'h5 == io_ra1 ? r_5 : _GEN_12; // @[RegisterFile.scala 20:10:@19.4]
  assign _GEN_14 = 3'h6 == io_ra1 ? r_6 : _GEN_13; // @[RegisterFile.scala 20:10:@19.4]
  assign _GEN_16 = 3'h0 == io_wa0 ? io_wd0 : r_0; // @[RegisterFile.scala 23:15:@21.6]
  assign _GEN_17 = 3'h1 == io_wa0 ? io_wd0 : r_1; // @[RegisterFile.scala 23:15:@21.6]
  assign _GEN_18 = 3'h2 == io_wa0 ? io_wd0 : r_2; // @[RegisterFile.scala 23:15:@21.6]
  assign _GEN_19 = 3'h3 == io_wa0 ? io_wd0 : r_3; // @[RegisterFile.scala 23:15:@21.6]
  assign _GEN_20 = 3'h4 == io_wa0 ? io_wd0 : r_4; // @[RegisterFile.scala 23:15:@21.6]
  assign _GEN_21 = 3'h5 == io_wa0 ? io_wd0 : r_5; // @[RegisterFile.scala 23:15:@21.6]
  assign _GEN_22 = 3'h6 == io_wa0 ? io_wd0 : r_6; // @[RegisterFile.scala 23:15:@21.6]
  assign _GEN_23 = 3'h7 == io_wa0 ? io_wd0 : r_7; // @[RegisterFile.scala 23:15:@21.6]
  assign _GEN_24 = io_we ? _GEN_16 : r_0; // @[RegisterFile.scala 22:16:@20.4]
  assign _GEN_25 = io_we ? _GEN_17 : r_1; // @[RegisterFile.scala 22:16:@20.4]
  assign _GEN_26 = io_we ? _GEN_18 : r_2; // @[RegisterFile.scala 22:16:@20.4]
  assign _GEN_27 = io_we ? _GEN_19 : r_3; // @[RegisterFile.scala 22:16:@20.4]
  assign _GEN_28 = io_we ? _GEN_20 : r_4; // @[RegisterFile.scala 22:16:@20.4]
  assign _GEN_29 = io_we ? _GEN_21 : r_5; // @[RegisterFile.scala 22:16:@20.4]
  assign _GEN_30 = io_we ? _GEN_22 : r_6; // @[RegisterFile.scala 22:16:@20.4]
  assign _GEN_31 = io_we ? _GEN_23 : r_7; // @[RegisterFile.scala 22:16:@20.4]
  assign io_rd0 = 3'h7 == io_ra0 ? r_7 : _GEN_6; // @[RegisterFile.scala 19:10:@18.4]
  assign io_rd1 = 3'h7 == io_ra1 ? r_7 : _GEN_14; // @[RegisterFile.scala 20:10:@19.4]
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
  r_0 = _RAND_0[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  r_1 = _RAND_1[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  r_2 = _RAND_2[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  r_3 = _RAND_3[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  r_4 = _RAND_4[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  r_5 = _RAND_5[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  r_6 = _RAND_6[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  r_7 = _RAND_7[3:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      r_0 <= 4'h0;
    end else begin
      if (io_we) begin
        if (3'h0 == io_wa0) begin
          r_0 <= io_wd0;
        end
      end
    end
    if (reset) begin
      r_1 <= 4'h0;
    end else begin
      if (io_we) begin
        if (3'h1 == io_wa0) begin
          r_1 <= io_wd0;
        end
      end
    end
    if (reset) begin
      r_2 <= 4'h0;
    end else begin
      if (io_we) begin
        if (3'h2 == io_wa0) begin
          r_2 <= io_wd0;
        end
      end
    end
    if (reset) begin
      r_3 <= 4'h0;
    end else begin
      if (io_we) begin
        if (3'h3 == io_wa0) begin
          r_3 <= io_wd0;
        end
      end
    end
    if (reset) begin
      r_4 <= 4'h0;
    end else begin
      if (io_we) begin
        if (3'h4 == io_wa0) begin
          r_4 <= io_wd0;
        end
      end
    end
    if (reset) begin
      r_5 <= 4'h0;
    end else begin
      if (io_we) begin
        if (3'h5 == io_wa0) begin
          r_5 <= io_wd0;
        end
      end
    end
    if (reset) begin
      r_6 <= 4'h0;
    end else begin
      if (io_we) begin
        if (3'h6 == io_wa0) begin
          r_6 <= io_wd0;
        end
      end
    end
    if (reset) begin
      r_7 <= 4'h0;
    end else begin
      if (io_we) begin
        if (3'h7 == io_wa0) begin
          r_7 <= io_wd0;
        end
      end
    end
  end
endmodule
module FIFODisplay( // @[:@24.2]
  input         clock, // @[:@25.4]
  input  [2:0]  io_head, // @[:@27.4]
  input  [2:0]  io_tail, // @[:@27.4]
  output [2:0]  io_addr, // @[:@27.4]
  input  [3:0]  io_data, // @[:@27.4]
  output [15:0] io_output // @[:@27.4]
);
  reg [15:0] c; // @[FIFO.scala 84:18:@29.4]
  reg [31:0] _RAND_0;
  reg [2:0] addr; // @[FIFO.scala 85:21:@30.4]
  reg [31:0] _RAND_1;
  wire [7:0] _T_23; // @[FIFO.scala 91:16:@35.4]
  wire [7:0] sel; // @[FIFO.scala 91:10:@36.4]
  wire  _T_25; // @[FIFO.scala 92:26:@38.4]
  wire  _T_26; // @[FIFO.scala 93:13:@39.4]
  wire  _T_27; // @[FIFO.scala 93:34:@40.4]
  wire  _T_28; // @[FIFO.scala 93:25:@41.4]
  wire  _T_31; // @[FIFO.scala 94:24:@44.4]
  wire  _T_32; // @[FIFO.scala 92:17:@45.4]
  wire  _T_56; // @[Mux.scala 46:19:@46.4]
  wire [6:0] _T_57; // @[Mux.scala 46:16:@47.4]
  wire  _T_58; // @[Mux.scala 46:19:@48.4]
  wire [6:0] _T_59; // @[Mux.scala 46:16:@49.4]
  wire  _T_60; // @[Mux.scala 46:19:@50.4]
  wire [6:0] _T_61; // @[Mux.scala 46:16:@51.4]
  wire  _T_62; // @[Mux.scala 46:19:@52.4]
  wire [6:0] _T_63; // @[Mux.scala 46:16:@53.4]
  wire  _T_64; // @[Mux.scala 46:19:@54.4]
  wire [6:0] _T_65; // @[Mux.scala 46:16:@55.4]
  wire  _T_66; // @[Mux.scala 46:19:@56.4]
  wire [6:0] _T_67; // @[Mux.scala 46:16:@57.4]
  wire  _T_68; // @[Mux.scala 46:19:@58.4]
  wire [6:0] _T_69; // @[Mux.scala 46:16:@59.4]
  wire  _T_70; // @[Mux.scala 46:19:@60.4]
  wire [6:0] _T_71; // @[Mux.scala 46:16:@61.4]
  wire  _T_72; // @[Mux.scala 46:19:@62.4]
  wire [6:0] _T_73; // @[Mux.scala 46:16:@63.4]
  wire  _T_74; // @[Mux.scala 46:19:@64.4]
  wire [6:0] _T_75; // @[Mux.scala 46:16:@65.4]
  wire  _T_76; // @[Mux.scala 46:19:@66.4]
  wire [6:0] _T_77; // @[Mux.scala 46:16:@67.4]
  wire [6:0] seg; // @[FIFO.scala 92:13:@68.4]
  wire  dp; // @[FIFO.scala 101:15:@73.4]
  wire [8:0] _T_80; // @[Cat.scala 30:58:@70.4]
  wire  _T_84; // @[FIFO.scala 103:11:@75.4]
  wire [3:0] _T_87; // @[FIFO.scala 105:18:@78.6]
  wire [2:0] _T_88; // @[FIFO.scala 105:18:@79.6]
  wire [16:0] _T_90; // @[FIFO.scala 107:12:@83.6]
  wire [15:0] _T_91; // @[FIFO.scala 107:12:@84.6]
  assign _T_23 = 8'h1 << addr; // @[FIFO.scala 91:16:@35.4]
  assign sel = ~ _T_23; // @[FIFO.scala 91:10:@36.4]
  assign _T_25 = io_tail >= io_head; // @[FIFO.scala 92:26:@38.4]
  assign _T_26 = addr >= io_head; // @[FIFO.scala 93:13:@39.4]
  assign _T_27 = addr < io_tail; // @[FIFO.scala 93:34:@40.4]
  assign _T_28 = _T_26 & _T_27; // @[FIFO.scala 93:25:@41.4]
  assign _T_31 = _T_27 | _T_26; // @[FIFO.scala 94:24:@44.4]
  assign _T_32 = _T_25 ? _T_28 : _T_31; // @[FIFO.scala 92:17:@45.4]
  assign _T_56 = 4'hf == io_data; // @[Mux.scala 46:19:@46.4]
  assign _T_57 = _T_56 ? 7'h7e : 7'h7f; // @[Mux.scala 46:16:@47.4]
  assign _T_58 = 4'h9 == io_data; // @[Mux.scala 46:19:@48.4]
  assign _T_59 = _T_58 ? 7'h4 : _T_57; // @[Mux.scala 46:16:@49.4]
  assign _T_60 = 4'h8 == io_data; // @[Mux.scala 46:19:@50.4]
  assign _T_61 = _T_60 ? 7'h0 : _T_59; // @[Mux.scala 46:16:@51.4]
  assign _T_62 = 4'h7 == io_data; // @[Mux.scala 46:19:@52.4]
  assign _T_63 = _T_62 ? 7'hf : _T_61; // @[Mux.scala 46:16:@53.4]
  assign _T_64 = 4'h6 == io_data; // @[Mux.scala 46:19:@54.4]
  assign _T_65 = _T_64 ? 7'h20 : _T_63; // @[Mux.scala 46:16:@55.4]
  assign _T_66 = 4'h5 == io_data; // @[Mux.scala 46:19:@56.4]
  assign _T_67 = _T_66 ? 7'h24 : _T_65; // @[Mux.scala 46:16:@57.4]
  assign _T_68 = 4'h4 == io_data; // @[Mux.scala 46:19:@58.4]
  assign _T_69 = _T_68 ? 7'h4c : _T_67; // @[Mux.scala 46:16:@59.4]
  assign _T_70 = 4'h3 == io_data; // @[Mux.scala 46:19:@60.4]
  assign _T_71 = _T_70 ? 7'h6 : _T_69; // @[Mux.scala 46:16:@61.4]
  assign _T_72 = 4'h2 == io_data; // @[Mux.scala 46:19:@62.4]
  assign _T_73 = _T_72 ? 7'h12 : _T_71; // @[Mux.scala 46:16:@63.4]
  assign _T_74 = 4'h1 == io_data; // @[Mux.scala 46:19:@64.4]
  assign _T_75 = _T_74 ? 7'h4f : _T_73; // @[Mux.scala 46:16:@65.4]
  assign _T_76 = 4'h0 == io_data; // @[Mux.scala 46:19:@66.4]
  assign _T_77 = _T_76 ? 7'h1 : _T_75; // @[Mux.scala 46:16:@67.4]
  assign seg = _T_32 ? _T_77 : 7'h7f; // @[FIFO.scala 92:13:@68.4]
  assign dp = addr != io_head; // @[FIFO.scala 101:15:@73.4]
  assign _T_80 = {sel,dp}; // @[Cat.scala 30:58:@70.4]
  assign _T_84 = c >= 16'h270f; // @[FIFO.scala 103:11:@75.4]
  assign _T_87 = addr + 3'h1; // @[FIFO.scala 105:18:@78.6]
  assign _T_88 = addr + 3'h1; // @[FIFO.scala 105:18:@79.6]
  assign _T_90 = c + 16'h1; // @[FIFO.scala 107:12:@83.6]
  assign _T_91 = c + 16'h1; // @[FIFO.scala 107:12:@84.6]
  assign io_addr = addr; // @[FIFO.scala 90:11:@34.4]
  assign io_output = {_T_80,seg}; // @[FIFO.scala 99:13:@72.4]
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
  c = _RAND_0[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  addr = _RAND_1[2:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (_T_84) begin
      c <= 16'h0;
    end else begin
      c <= _T_91;
    end
    if (_T_84) begin
      addr <= _T_88;
    end
  end
endmodule
module Counter( // @[:@88.2]
  input        clock, // @[:@89.4]
  input        reset, // @[:@90.4]
  input        io_ce, // @[:@91.4]
  output [2:0] io_q // @[:@91.4]
);
  reg [2:0] q; // @[Counter.scala 24:18:@93.4]
  reg [31:0] _RAND_0;
  wire [3:0] _T_16; // @[Counter.scala 30:12:@100.8]
  wire [2:0] _T_17; // @[Counter.scala 30:12:@101.8]
  wire [2:0] _GEN_0; // @[Counter.scala 29:23:@99.6]
  assign _T_16 = q + 3'h1; // @[Counter.scala 30:12:@100.8]
  assign _T_17 = q + 3'h1; // @[Counter.scala 30:12:@101.8]
  assign _GEN_0 = io_ce ? _T_17 : q; // @[Counter.scala 29:23:@99.6]
  assign io_q = q; // @[Counter.scala 25:8:@94.4]
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
  q = _RAND_0[2:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      q <= 3'h0;
    end else begin
      if (io_ce) begin
        q <= _T_17;
      end
    end
  end
endmodule
module FIFO( // @[:@122.2]
  input         clock, // @[:@123.4]
  input         reset, // @[:@124.4]
  input         io_en_in, // @[:@125.4]
  input         io_en_out, // @[:@125.4]
  input  [3:0]  io_in, // @[:@125.4]
  output [3:0]  io_out, // @[:@125.4]
  output        io_empty, // @[:@125.4]
  output        io_full, // @[:@125.4]
  output [15:0] io_display, // @[:@125.4]
  input         io_CLK100MHZ // @[:@125.4]
);
  wire  RegisterFile_clock; // @[FIFO.scala 23:17:@127.4]
  wire  RegisterFile_reset; // @[FIFO.scala 23:17:@127.4]
  wire [2:0] RegisterFile_io_ra0; // @[FIFO.scala 23:17:@127.4]
  wire [2:0] RegisterFile_io_ra1; // @[FIFO.scala 23:17:@127.4]
  wire [3:0] RegisterFile_io_rd0; // @[FIFO.scala 23:17:@127.4]
  wire [3:0] RegisterFile_io_rd1; // @[FIFO.scala 23:17:@127.4]
  wire [2:0] RegisterFile_io_wa0; // @[FIFO.scala 23:17:@127.4]
  wire [3:0] RegisterFile_io_wd0; // @[FIFO.scala 23:17:@127.4]
  wire  RegisterFile_io_we; // @[FIFO.scala 23:17:@127.4]
  wire  FIFODisplay_clock; // @[FIFO.scala 25:11:@130.4]
  wire [2:0] FIFODisplay_io_head; // @[FIFO.scala 25:11:@130.4]
  wire [2:0] FIFODisplay_io_tail; // @[FIFO.scala 25:11:@130.4]
  wire [2:0] FIFODisplay_io_addr; // @[FIFO.scala 25:11:@130.4]
  wire [3:0] FIFODisplay_io_data; // @[FIFO.scala 25:11:@130.4]
  wire [15:0] FIFODisplay_io_output; // @[FIFO.scala 25:11:@130.4]
  wire  Counter_clock; // @[Counter.scala 8:19:@142.4]
  wire  Counter_reset; // @[Counter.scala 8:19:@142.4]
  wire  Counter_io_ce; // @[Counter.scala 8:19:@142.4]
  wire [2:0] Counter_io_q; // @[Counter.scala 8:19:@142.4]
  wire  Counter_1_clock; // @[Counter.scala 8:19:@148.4]
  wire  Counter_1_reset; // @[Counter.scala 8:19:@148.4]
  wire  Counter_1_io_ce; // @[Counter.scala 8:19:@148.4]
  wire [2:0] Counter_1_io_q; // @[Counter.scala 8:19:@148.4]
  wire  _T_25; // @[FIFO.scala 30:24:@135.4]
  wire  _T_26; // @[FIFO.scala 30:33:@136.4]
  wire  _T_29; // @[FIFO.scala 31:23:@139.4]
  wire  pop; // @[FIFO.scala 31:20:@140.4]
  reg [3:0] out; // @[FIFO.scala 35:20:@154.4]
  reg [31:0] _RAND_0;
  wire [3:0] _T_39; // @[FIFO.scala 38:20:@157.4]
  wire [2:0] _T_40; // @[FIFO.scala 38:20:@158.4]
  wire [3:0] _GEN_0; // @[FIFO.scala 53:14:@171.4]
  RegisterFile RegisterFile ( // @[FIFO.scala 23:17:@127.4]
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
  FIFODisplay FIFODisplay ( // @[FIFO.scala 25:11:@130.4]
    .clock(FIFODisplay_clock),
    .io_head(FIFODisplay_io_head),
    .io_tail(FIFODisplay_io_tail),
    .io_addr(FIFODisplay_io_addr),
    .io_data(FIFODisplay_io_data),
    .io_output(FIFODisplay_io_output)
  );
  Counter Counter ( // @[Counter.scala 8:19:@142.4]
    .clock(Counter_clock),
    .reset(Counter_reset),
    .io_ce(Counter_io_ce),
    .io_q(Counter_io_q)
  );
  Counter Counter_1 ( // @[Counter.scala 8:19:@148.4]
    .clock(Counter_1_clock),
    .reset(Counter_1_reset),
    .io_ce(Counter_1_io_ce),
    .io_q(Counter_1_io_q)
  );
  assign _T_25 = io_full == 1'h0; // @[FIFO.scala 30:24:@135.4]
  assign _T_26 = _T_25 | io_en_out; // @[FIFO.scala 30:33:@136.4]
  assign _T_29 = io_empty == 1'h0; // @[FIFO.scala 31:23:@139.4]
  assign pop = io_en_out & _T_29; // @[FIFO.scala 31:20:@140.4]
  assign _T_39 = Counter_1_io_q + 3'h1; // @[FIFO.scala 38:20:@157.4]
  assign _T_40 = Counter_1_io_q + 3'h1; // @[FIFO.scala 38:20:@158.4]
  assign _GEN_0 = pop ? RegisterFile_io_rd0 : out; // @[FIFO.scala 53:14:@171.4]
  assign io_out = out; // @[FIFO.scala 39:10:@161.4]
  assign io_empty = Counter_io_q == Counter_1_io_q; // @[FIFO.scala 37:12:@156.4]
  assign io_full = _T_40 == Counter_io_q; // @[FIFO.scala 38:11:@160.4]
  assign io_display = FIFODisplay_io_output; // @[FIFO.scala 51:14:@170.4]
  assign RegisterFile_clock = clock; // @[:@128.4]
  assign RegisterFile_reset = reset; // @[:@129.4]
  assign RegisterFile_io_ra0 = Counter_io_q; // @[FIFO.scala 41:9:@162.4]
  assign RegisterFile_io_ra1 = FIFODisplay_io_addr; // @[FIFO.scala 49:9:@168.4]
  assign RegisterFile_io_wa0 = Counter_1_io_q; // @[FIFO.scala 42:9:@163.4]
  assign RegisterFile_io_wd0 = io_in; // @[FIFO.scala 43:9:@164.4]
  assign RegisterFile_io_we = io_en_in & _T_26; // @[FIFO.scala 44:8:@165.4]
  assign FIFODisplay_clock = io_CLK100MHZ; // @[:@131.4]
  assign FIFODisplay_io_head = Counter_io_q; // @[FIFO.scala 47:16:@166.4]
  assign FIFODisplay_io_tail = Counter_1_io_q; // @[FIFO.scala 48:16:@167.4]
  assign FIFODisplay_io_data = RegisterFile_io_rd1; // @[FIFO.scala 50:16:@169.4]
  assign Counter_clock = clock; // @[:@143.4]
  assign Counter_reset = reset; // @[:@144.4]
  assign Counter_io_ce = io_en_out & _T_29; // @[Counter.scala 9:10:@145.4]
  assign Counter_1_clock = clock; // @[:@149.4]
  assign Counter_1_reset = reset; // @[:@150.4]
  assign Counter_1_io_ce = io_en_in & _T_26; // @[Counter.scala 9:10:@151.4]
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
  out = _RAND_0[3:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
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

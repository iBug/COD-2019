module Subtractor( // @[:@20.2]
  input  [2:0] io_A, // @[:@23.4]
  input  [2:0] io_B, // @[:@23.4]
  output [2:0] io_Sum, // @[:@23.4]
  output       io_Cout // @[:@23.4]
);
  wire [3:0] _T_16; // @[Cat.scala 30:58:@25.4]
  wire [2:0] _T_18; // @[Adder.scala 29:39:@26.4]
  wire [3:0] _T_19; // @[Cat.scala 30:58:@27.4]
  wire [4:0] _T_20; // @[Adder.scala 29:28:@28.4]
  wire [3:0] _T_21; // @[Adder.scala 29:28:@29.4]
  wire [4:0] _T_24; // @[Adder.scala 29:46:@31.4]
  wire [3:0] sum; // @[Adder.scala 29:46:@32.4]
  assign _T_16 = {1'h0,io_A}; // @[Cat.scala 30:58:@25.4]
  assign _T_18 = ~ io_B; // @[Adder.scala 29:39:@26.4]
  assign _T_19 = {1'h1,_T_18}; // @[Cat.scala 30:58:@27.4]
  assign _T_20 = _T_16 + _T_19; // @[Adder.scala 29:28:@28.4]
  assign _T_21 = _T_16 + _T_19; // @[Adder.scala 29:28:@29.4]
  assign _T_24 = _T_21 + 4'h1; // @[Adder.scala 29:46:@31.4]
  assign sum = _T_21 + 4'h1; // @[Adder.scala 29:46:@32.4]
  assign io_Sum = sum[2:0]; // @[Adder.scala 31:10:@36.4]
  assign io_Cout = sum[3]; // @[Adder.scala 30:11:@34.4]
endmodule
module ALU( // @[:@38.2]
  input  [2:0] io_A, // @[:@41.4]
  input  [2:0] io_B, // @[:@41.4]
  output [2:0] io_Y, // @[:@41.4]
  output [3:0] io_F // @[:@41.4]
);
  wire [2:0] Subtractor_io_A; // @[ALU.scala 26:21:@46.4]
  wire [2:0] Subtractor_io_B; // @[ALU.scala 26:21:@46.4]
  wire [2:0] Subtractor_io_Sum; // @[ALU.scala 26:21:@46.4]
  wire  Subtractor_io_Cout; // @[ALU.scala 26:21:@46.4]
  wire  _T_15; // @[ALU.scala 35:25:@53.4]
  wire  _T_16; // @[ALU.scala 35:43:@54.4]
  wire  _T_17; // @[ALU.scala 35:37:@55.4]
  wire  _T_23; // @[ALU.scala 36:66:@62.4]
  wire  _T_24; // @[ALU.scala 36:55:@63.4]
  wire  subOverflow; // @[ALU.scala 36:78:@64.4]
  wire  flagZero; // @[ALU.scala 37:23:@65.4]
  wire  flagSign; // @[ALU.scala 38:22:@66.4]
  wire  _T_48; // @[Mux.scala 46:16:@91.4]
  wire [1:0] _T_51; // @[Cat.scala 30:58:@94.4]
  wire [1:0] _T_52; // @[Cat.scala 30:58:@95.4]
  Subtractor Subtractor ( // @[ALU.scala 26:21:@46.4]
    .io_A(Subtractor_io_A),
    .io_B(Subtractor_io_B),
    .io_Sum(Subtractor_io_Sum),
    .io_Cout(Subtractor_io_Cout)
  );
  assign _T_15 = io_A[2]; // @[ALU.scala 35:25:@53.4]
  assign _T_16 = io_B[2]; // @[ALU.scala 35:43:@54.4]
  assign _T_17 = _T_15 ^ _T_16; // @[ALU.scala 35:37:@55.4]
  assign _T_23 = Subtractor_io_Sum[2]; // @[ALU.scala 36:66:@62.4]
  assign _T_24 = _T_17 ^ _T_23; // @[ALU.scala 36:55:@63.4]
  assign subOverflow = _T_24 ^ Subtractor_io_Cout; // @[ALU.scala 36:78:@64.4]
  assign flagZero = io_Y == 3'h0; // @[ALU.scala 37:23:@65.4]
  assign flagSign = io_Y[2]; // @[ALU.scala 38:22:@66.4]
  assign _T_48 = Subtractor_io_Cout; // @[Mux.scala 46:16:@91.4]
  assign _T_51 = {flagSign,flagZero}; // @[Cat.scala 30:58:@94.4]
  assign _T_52 = {subOverflow,_T_48}; // @[Cat.scala 30:58:@95.4]
  assign io_Y = Subtractor_io_Sum; // @[ALU.scala 50:8:@85.4]
  assign io_F = {_T_52,_T_51}; // @[ALU.scala 58:8:@98.4]
  assign Subtractor_io_A = io_A; // @[ALU.scala 41:11:@68.4]
  assign Subtractor_io_B = io_B; // @[ALU.scala 44:11:@70.4]
endmodule
module Comparator( // @[:@100.2]
  input  [2:0] io_x, // @[:@103.4]
  input  [2:0] io_y, // @[:@103.4]
  output       io_ug, // @[:@103.4]
  output       io_eq // @[:@103.4]
);
  wire [2:0] ALU_io_A; // @[Comparator.scala 18:19:@105.4]
  wire [2:0] ALU_io_B; // @[Comparator.scala 18:19:@105.4]
  wire [2:0] ALU_io_Y; // @[Comparator.scala 18:19:@105.4]
  wire [3:0] ALU_io_F; // @[Comparator.scala 18:19:@105.4]
  wire  _T_20; // @[Comparator.scala 24:12:@113.4]
  wire  _T_21; // @[Comparator.scala 24:27:@114.4]
  wire  _T_22; // @[Comparator.scala 24:21:@115.4]
  ALU ALU ( // @[Comparator.scala 18:19:@105.4]
    .io_A(ALU_io_A),
    .io_B(ALU_io_B),
    .io_Y(ALU_io_Y),
    .io_F(ALU_io_F)
  );
  assign _T_20 = ~ io_eq; // @[Comparator.scala 24:12:@113.4]
  assign _T_21 = ALU_io_F[2]; // @[Comparator.scala 24:27:@114.4]
  assign _T_22 = ~ _T_21; // @[Comparator.scala 24:21:@115.4]
  assign io_ug = _T_20 & _T_22; // @[Comparator.scala 24:9:@117.4]
  assign io_eq = ALU_io_F[0]; // @[Comparator.scala 23:9:@112.4]
  assign ALU_io_A = io_x; // @[Comparator.scala 19:9:@108.4]
  assign ALU_io_B = io_y; // @[Comparator.scala 20:9:@109.4]
endmodule
module Sorter2( // @[:@136.2]
  input  [2:0] io_x0, // @[:@139.4]
  input  [2:0] io_x1, // @[:@139.4]
  output [2:0] io_s0, // @[:@139.4]
  output [2:0] io_s1 // @[:@139.4]
);
  wire [2:0] Comparator_io_x; // @[Sorter4.scala 16:20:@141.4]
  wire [2:0] Comparator_io_y; // @[Sorter4.scala 16:20:@141.4]
  wire  Comparator_io_ug; // @[Sorter4.scala 16:20:@141.4]
  wire  Comparator_io_eq; // @[Sorter4.scala 16:20:@141.4]
  wire  _T_13; // @[Sorter4.scala 20:16:@146.4]
  Comparator Comparator ( // @[Sorter4.scala 16:20:@141.4]
    .io_x(Comparator_io_x),
    .io_y(Comparator_io_y),
    .io_ug(Comparator_io_ug),
    .io_eq(Comparator_io_eq)
  );
  assign _T_13 = ~ Comparator_io_ug; // @[Sorter4.scala 20:16:@146.4]
  assign io_s0 = _T_13 ? io_x0 : io_x1; // @[Sorter4.scala 20:9:@148.4]
  assign io_s1 = Comparator_io_ug ? io_x0 : io_x1; // @[Sorter4.scala 21:9:@150.4]
  assign Comparator_io_x = io_x0; // @[Sorter4.scala 17:10:@144.4]
  assign Comparator_io_y = io_x1; // @[Sorter4.scala 18:10:@145.4]
endmodule
module Sorter4( // @[:@301.2]
  input        clock, // @[:@302.4]
  input        reset, // @[:@303.4]
  input  [2:0] io_x0, // @[:@304.4]
  input  [2:0] io_x1, // @[:@304.4]
  input  [2:0] io_x2, // @[:@304.4]
  input  [2:0] io_x3, // @[:@304.4]
  output [2:0] io_s0, // @[:@304.4]
  output [2:0] io_s1, // @[:@304.4]
  output [2:0] io_s2, // @[:@304.4]
  output [2:0] io_s3, // @[:@304.4]
  output       io_done // @[:@304.4]
);
  wire [2:0] Sorter2_io_x0; // @[Sorter4.scala 48:18:@317.4]
  wire [2:0] Sorter2_io_x1; // @[Sorter4.scala 48:18:@317.4]
  wire [2:0] Sorter2_io_s0; // @[Sorter4.scala 48:18:@317.4]
  wire [2:0] Sorter2_io_s1; // @[Sorter4.scala 48:18:@317.4]
  wire [2:0] Sorter2_1_io_x0; // @[Sorter4.scala 49:18:@320.4]
  wire [2:0] Sorter2_1_io_x1; // @[Sorter4.scala 49:18:@320.4]
  wire [2:0] Sorter2_1_io_s0; // @[Sorter4.scala 49:18:@320.4]
  wire [2:0] Sorter2_1_io_s1; // @[Sorter4.scala 49:18:@320.4]
  reg [1:0] state; // @[Sorter4.scala 37:22:@306.4]
  reg [31:0] _RAND_0;
  reg [2:0] r0; // @[Sorter4.scala 38:19:@307.4]
  reg [31:0] _RAND_1;
  reg [2:0] r1; // @[Sorter4.scala 39:19:@308.4]
  reg [31:0] _RAND_2;
  reg [2:0] r2; // @[Sorter4.scala 40:19:@309.4]
  reg [31:0] _RAND_3;
  reg [2:0] r3; // @[Sorter4.scala 41:19:@310.4]
  reg [31:0] _RAND_4;
  wire  _T_32; // @[Sorter4.scala 51:15:@323.4]
  wire  _T_35; // @[Sorter4.scala 61:22:@336.6]
  wire  _T_38; // @[Sorter4.scala 71:22:@349.8]
  wire [2:0] _GEN_0; // @[Sorter4.scala 71:31:@350.8]
  wire [2:0] _GEN_1; // @[Sorter4.scala 71:31:@350.8]
  wire [2:0] _GEN_3; // @[Sorter4.scala 71:31:@350.8]
  wire [2:0] _GEN_4; // @[Sorter4.scala 71:31:@350.8]
  wire [1:0] _GEN_5; // @[Sorter4.scala 71:31:@350.8]
  wire [2:0] _GEN_6; // @[Sorter4.scala 61:31:@337.6]
  wire [2:0] _GEN_7; // @[Sorter4.scala 61:31:@337.6]
  wire [2:0] _GEN_8; // @[Sorter4.scala 61:31:@337.6]
  wire [2:0] _GEN_9; // @[Sorter4.scala 61:31:@337.6]
  wire [2:0] _GEN_10; // @[Sorter4.scala 61:31:@337.6]
  wire [2:0] _GEN_11; // @[Sorter4.scala 61:31:@337.6]
  wire [2:0] _GEN_12; // @[Sorter4.scala 61:31:@337.6]
  wire [2:0] _GEN_13; // @[Sorter4.scala 61:31:@337.6]
  wire [1:0] _GEN_14; // @[Sorter4.scala 61:31:@337.6]
  wire [2:0] _GEN_19; // @[Sorter4.scala 51:24:@324.4]
  wire [2:0] _GEN_20; // @[Sorter4.scala 51:24:@324.4]
  wire [2:0] _GEN_21; // @[Sorter4.scala 51:24:@324.4]
  wire [2:0] _GEN_22; // @[Sorter4.scala 51:24:@324.4]
  wire [1:0] _GEN_23; // @[Sorter4.scala 51:24:@324.4]
  Sorter2 Sorter2 ( // @[Sorter4.scala 48:18:@317.4]
    .io_x0(Sorter2_io_x0),
    .io_x1(Sorter2_io_x1),
    .io_s0(Sorter2_io_s0),
    .io_s1(Sorter2_io_s1)
  );
  Sorter2 Sorter2_1 ( // @[Sorter4.scala 49:18:@320.4]
    .io_x0(Sorter2_1_io_x0),
    .io_x1(Sorter2_1_io_x1),
    .io_s0(Sorter2_1_io_s0),
    .io_s1(Sorter2_1_io_s1)
  );
  assign _T_32 = state == 2'h0; // @[Sorter4.scala 51:15:@323.4]
  assign _T_35 = state == 2'h1; // @[Sorter4.scala 61:22:@336.6]
  assign _T_38 = state == 2'h2; // @[Sorter4.scala 71:22:@349.8]
  assign _GEN_0 = _T_38 ? r1 : 3'h0; // @[Sorter4.scala 71:31:@350.8]
  assign _GEN_1 = _T_38 ? r2 : 3'h0; // @[Sorter4.scala 71:31:@350.8]
  assign _GEN_3 = _T_38 ? Sorter2_io_s0 : r1; // @[Sorter4.scala 71:31:@350.8]
  assign _GEN_4 = _T_38 ? Sorter2_io_s1 : r2; // @[Sorter4.scala 71:31:@350.8]
  assign _GEN_5 = _T_38 ? 2'h3 : state; // @[Sorter4.scala 71:31:@350.8]
  assign _GEN_6 = _T_35 ? r0 : _GEN_0; // @[Sorter4.scala 61:31:@337.6]
  assign _GEN_7 = _T_35 ? r2 : _GEN_1; // @[Sorter4.scala 61:31:@337.6]
  assign _GEN_8 = _T_35 ? r1 : 3'h0; // @[Sorter4.scala 61:31:@337.6]
  assign _GEN_9 = _T_35 ? r3 : 3'h0; // @[Sorter4.scala 61:31:@337.6]
  assign _GEN_10 = _T_35 ? Sorter2_io_s0 : r0; // @[Sorter4.scala 61:31:@337.6]
  assign _GEN_11 = _T_35 ? Sorter2_1_io_s0 : _GEN_3; // @[Sorter4.scala 61:31:@337.6]
  assign _GEN_12 = _T_35 ? Sorter2_io_s1 : _GEN_4; // @[Sorter4.scala 61:31:@337.6]
  assign _GEN_13 = _T_35 ? Sorter2_1_io_s1 : r3; // @[Sorter4.scala 61:31:@337.6]
  assign _GEN_14 = _T_35 ? 2'h2 : _GEN_5; // @[Sorter4.scala 61:31:@337.6]
  assign _GEN_19 = _T_32 ? Sorter2_io_s0 : _GEN_10; // @[Sorter4.scala 51:24:@324.4]
  assign _GEN_20 = _T_32 ? Sorter2_io_s1 : _GEN_11; // @[Sorter4.scala 51:24:@324.4]
  assign _GEN_21 = _T_32 ? Sorter2_1_io_s0 : _GEN_12; // @[Sorter4.scala 51:24:@324.4]
  assign _GEN_22 = _T_32 ? Sorter2_1_io_s1 : _GEN_13; // @[Sorter4.scala 51:24:@324.4]
  assign _GEN_23 = _T_32 ? 2'h1 : _GEN_14; // @[Sorter4.scala 51:24:@324.4]
  assign io_s0 = r0; // @[Sorter4.scala 42:9:@311.4]
  assign io_s1 = r1; // @[Sorter4.scala 43:9:@312.4]
  assign io_s2 = r2; // @[Sorter4.scala 44:9:@313.4]
  assign io_s3 = r3; // @[Sorter4.scala 45:9:@314.4]
  assign io_done = state == 2'h3; // @[Sorter4.scala 46:11:@316.4]
  assign Sorter2_io_x0 = _T_32 ? r0 : _GEN_6; // @[Sorter4.scala 52:11:@325.6 Sorter4.scala 62:11:@338.8 Sorter4.scala 72:11:@351.10 Sorter4.scala 80:11:@360.10]
  assign Sorter2_io_x1 = _T_32 ? r1 : _GEN_7; // @[Sorter4.scala 53:11:@326.6 Sorter4.scala 63:11:@339.8 Sorter4.scala 73:11:@352.10 Sorter4.scala 81:11:@361.10]
  assign Sorter2_1_io_x0 = _T_32 ? r2 : _GEN_8; // @[Sorter4.scala 54:11:@327.6 Sorter4.scala 64:11:@340.8 Sorter4.scala 74:11:@353.10 Sorter4.scala 82:11:@362.10]
  assign Sorter2_1_io_x1 = _T_32 ? r3 : _GEN_9; // @[Sorter4.scala 55:11:@328.6 Sorter4.scala 65:11:@341.8 Sorter4.scala 75:11:@354.10 Sorter4.scala 83:11:@363.10]
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
  state = _RAND_0[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  r0 = _RAND_1[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  r1 = _RAND_2[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  r2 = _RAND_3[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  r3 = _RAND_4[2:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      state <= 2'h0;
    end else begin
      if (_T_32) begin
        state <= 2'h1;
      end else begin
        if (_T_35) begin
          state <= 2'h2;
        end else begin
          if (_T_38) begin
            state <= 2'h3;
          end
        end
      end
    end
    if (reset) begin
      r0 <= io_x0;
    end else begin
      if (_T_32) begin
        r0 <= Sorter2_io_s0;
      end else begin
        if (_T_35) begin
          r0 <= Sorter2_io_s0;
        end
      end
    end
    if (reset) begin
      r1 <= io_x1;
    end else begin
      if (_T_32) begin
        r1 <= Sorter2_io_s1;
      end else begin
        if (_T_35) begin
          r1 <= Sorter2_1_io_s0;
        end else begin
          if (_T_38) begin
            r1 <= Sorter2_io_s0;
          end
        end
      end
    end
    if (reset) begin
      r2 <= io_x2;
    end else begin
      if (_T_32) begin
        r2 <= Sorter2_1_io_s0;
      end else begin
        if (_T_35) begin
          r2 <= Sorter2_io_s1;
        end else begin
          if (_T_38) begin
            r2 <= Sorter2_io_s1;
          end
        end
      end
    end
    if (reset) begin
      r3 <= io_x3;
    end else begin
      if (_T_32) begin
        r3 <= Sorter2_1_io_s1;
      end else begin
        if (_T_35) begin
          r3 <= Sorter2_1_io_s1;
        end
      end
    end
  end
endmodule

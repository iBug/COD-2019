module Adder( // @[:@3.2]
  input  [5:0] io_A, // @[:@6.4]
  input  [5:0] io_B, // @[:@6.4]
  output [5:0] io_Sum, // @[:@6.4]
  output       io_Cout // @[:@6.4]
);
  wire [6:0] _T_16; // @[Cat.scala 30:58:@8.4]
  wire [6:0] _T_18; // @[Cat.scala 30:58:@9.4]
  wire [7:0] _T_19; // @[Adder.scala 15:28:@10.4]
  wire [6:0] _T_20; // @[Adder.scala 15:28:@11.4]
  wire [7:0] _T_23; // @[Adder.scala 15:45:@13.4]
  wire [6:0] sum; // @[Adder.scala 15:45:@14.4]
  assign _T_16 = {1'h0,io_A}; // @[Cat.scala 30:58:@8.4]
  assign _T_18 = {1'h0,io_B}; // @[Cat.scala 30:58:@9.4]
  assign _T_19 = _T_16 + _T_18; // @[Adder.scala 15:28:@10.4]
  assign _T_20 = _T_16 + _T_18; // @[Adder.scala 15:28:@11.4]
  assign _T_23 = {{1'd0}, _T_20}; // @[Adder.scala 15:45:@13.4]
  assign sum = _T_23[6:0]; // @[Adder.scala 15:45:@14.4]
  assign io_Sum = sum[5:0]; // @[Adder.scala 17:10:@18.4]
  assign io_Cout = sum[6]; // @[Adder.scala 16:11:@16.4]
endmodule
module Subtractor( // @[:@20.2]
  input  [5:0] io_A, // @[:@23.4]
  input  [5:0] io_B, // @[:@23.4]
  output [5:0] io_Sum, // @[:@23.4]
  output       io_Cout // @[:@23.4]
);
  wire [6:0] _T_16; // @[Cat.scala 30:58:@25.4]
  wire [5:0] _T_18; // @[Adder.scala 29:39:@26.4]
  wire [6:0] _T_19; // @[Cat.scala 30:58:@27.4]
  wire [7:0] _T_20; // @[Adder.scala 29:28:@28.4]
  wire [6:0] _T_21; // @[Adder.scala 29:28:@29.4]
  wire [7:0] _T_24; // @[Adder.scala 29:46:@31.4]
  wire [6:0] sum; // @[Adder.scala 29:46:@32.4]
  assign _T_16 = {1'h0,io_A}; // @[Cat.scala 30:58:@25.4]
  assign _T_18 = ~ io_B; // @[Adder.scala 29:39:@26.4]
  assign _T_19 = {1'h1,_T_18}; // @[Cat.scala 30:58:@27.4]
  assign _T_20 = _T_16 + _T_19; // @[Adder.scala 29:28:@28.4]
  assign _T_21 = _T_16 + _T_19; // @[Adder.scala 29:28:@29.4]
  assign _T_24 = _T_21 + 7'h1; // @[Adder.scala 29:46:@31.4]
  assign sum = _T_21 + 7'h1; // @[Adder.scala 29:46:@32.4]
  assign io_Sum = sum[5:0]; // @[Adder.scala 31:10:@36.4]
  assign io_Cout = sum[6]; // @[Adder.scala 30:11:@34.4]
endmodule
module And( // @[:@38.2]
  input  [5:0] io_A, // @[:@41.4]
  input  [5:0] io_B, // @[:@41.4]
  output [5:0] io_S // @[:@41.4]
);
  assign io_S = io_A & io_B; // @[BitwiseOperators.scala 13:8:@44.4]
endmodule
module Or( // @[:@46.2]
  input  [5:0] io_A, // @[:@49.4]
  input  [5:0] io_B, // @[:@49.4]
  output [5:0] io_S // @[:@49.4]
);
  assign io_S = io_A | io_B; // @[BitwiseOperators.scala 32:8:@52.4]
endmodule
module Xor( // @[:@54.2]
  input  [5:0] io_A, // @[:@57.4]
  input  [5:0] io_B, // @[:@57.4]
  output [5:0] io_S // @[:@57.4]
);
  assign io_S = io_A ^ io_B; // @[BitwiseOperators.scala 51:8:@60.4]
endmodule
module ALU( // @[:@62.2]
  input        clock, // @[:@63.4]
  input        reset, // @[:@64.4]
  input  [5:0] io_A, // @[:@65.4]
  input  [5:0] io_B, // @[:@65.4]
  input  [2:0] io_S, // @[:@65.4]
  output [5:0] io_Y, // @[:@65.4]
  output [2:0] io_F // @[:@65.4]
);
  wire [5:0] Adder_io_A; // @[ALU.scala 25:21:@67.4]
  wire [5:0] Adder_io_B; // @[ALU.scala 25:21:@67.4]
  wire [5:0] Adder_io_Sum; // @[ALU.scala 25:21:@67.4]
  wire  Adder_io_Cout; // @[ALU.scala 25:21:@67.4]
  wire [5:0] Subtractor_io_A; // @[ALU.scala 26:21:@70.4]
  wire [5:0] Subtractor_io_B; // @[ALU.scala 26:21:@70.4]
  wire [5:0] Subtractor_io_Sum; // @[ALU.scala 26:21:@70.4]
  wire  Subtractor_io_Cout; // @[ALU.scala 26:21:@70.4]
  wire [5:0] And_io_A; // @[BitwiseOperators.scala 18:19:@73.4]
  wire [5:0] And_io_B; // @[BitwiseOperators.scala 18:19:@73.4]
  wire [5:0] And_io_S; // @[BitwiseOperators.scala 18:19:@73.4]
  wire [5:0] Or_io_A; // @[BitwiseOperators.scala 37:19:@78.4]
  wire [5:0] Or_io_B; // @[BitwiseOperators.scala 37:19:@78.4]
  wire [5:0] Or_io_S; // @[BitwiseOperators.scala 37:19:@78.4]
  wire [5:0] Xor_io_A; // @[BitwiseOperators.scala 56:19:@83.4]
  wire [5:0] Xor_io_B; // @[BitwiseOperators.scala 56:19:@83.4]
  wire [5:0] Xor_io_S; // @[BitwiseOperators.scala 56:19:@83.4]
  wire  _T_15; // @[ALU.scala 34:36:@88.4]
  wire  _T_16; // @[ALU.scala 34:53:@89.4]
  wire  _T_17; // @[ALU.scala 34:75:@90.4]
  wire [2:0] addOverflowChecker; // @[Cat.scala 30:58:@92.4]
  wire  _T_21; // @[ALU.scala 35:75:@95.4]
  wire [2:0] subOverflowChecker; // @[Cat.scala 30:58:@97.4]
  wire  _T_24; // @[ALU.scala 36:41:@98.4]
  wire  _T_26; // @[ALU.scala 36:73:@99.4]
  wire  addOverflow; // @[ALU.scala 36:50:@100.4]
  wire  _T_28; // @[ALU.scala 37:41:@101.4]
  wire  _T_30; // @[ALU.scala 37:73:@102.4]
  wire  subOverflow; // @[ALU.scala 37:50:@103.4]
  wire  flagZero; // @[ALU.scala 38:23:@104.4]
  wire  flagSign; // @[ALU.scala 39:22:@105.4]
  wire [5:0] _T_41; // @[ALU.scala 57:23:@112.4]
  wire  _T_42; // @[Mux.scala 46:19:@113.4]
  wire [5:0] _T_43; // @[Mux.scala 46:16:@114.4]
  wire  _T_44; // @[Mux.scala 46:19:@115.4]
  wire [5:0] _T_45; // @[Mux.scala 46:16:@116.4]
  wire  _T_46; // @[Mux.scala 46:19:@117.4]
  wire [5:0] _T_47; // @[Mux.scala 46:16:@118.4]
  wire  _T_48; // @[Mux.scala 46:19:@119.4]
  wire [5:0] _T_49; // @[Mux.scala 46:16:@120.4]
  wire  _T_50; // @[Mux.scala 46:19:@121.4]
  wire [5:0] _T_51; // @[Mux.scala 46:16:@122.4]
  wire  _T_52; // @[Mux.scala 46:19:@123.4]
  wire  _T_56; // @[Mux.scala 46:16:@127.4]
  wire  _T_58; // @[Mux.scala 46:16:@129.4]
  wire  _T_61; // @[Mux.scala 46:16:@131.4]
  wire  _T_63; // @[Mux.scala 46:16:@133.4]
  wire  _T_66; // @[Mux.scala 46:16:@135.4]
  wire  _T_68; // @[Mux.scala 46:16:@137.4]
  wire [3:0] _T_71; // @[Cat.scala 30:58:@140.4]
  Adder Adder ( // @[ALU.scala 25:21:@67.4]
    .io_A(Adder_io_A),
    .io_B(Adder_io_B),
    .io_Sum(Adder_io_Sum),
    .io_Cout(Adder_io_Cout)
  );
  Subtractor Subtractor ( // @[ALU.scala 26:21:@70.4]
    .io_A(Subtractor_io_A),
    .io_B(Subtractor_io_B),
    .io_Sum(Subtractor_io_Sum),
    .io_Cout(Subtractor_io_Cout)
  );
  And And ( // @[BitwiseOperators.scala 18:19:@73.4]
    .io_A(And_io_A),
    .io_B(And_io_B),
    .io_S(And_io_S)
  );
  Or Or ( // @[BitwiseOperators.scala 37:19:@78.4]
    .io_A(Or_io_A),
    .io_B(Or_io_B),
    .io_S(Or_io_S)
  );
  Xor Xor ( // @[BitwiseOperators.scala 56:19:@83.4]
    .io_A(Xor_io_A),
    .io_B(Xor_io_B),
    .io_S(Xor_io_S)
  );
  assign _T_15 = io_A[5]; // @[ALU.scala 34:36:@88.4]
  assign _T_16 = io_B[5]; // @[ALU.scala 34:53:@89.4]
  assign _T_17 = Adder_io_Sum[5]; // @[ALU.scala 34:75:@90.4]
  assign addOverflowChecker = {_T_15,_T_16,_T_17}; // @[Cat.scala 30:58:@92.4]
  assign _T_21 = Subtractor_io_Sum[5]; // @[ALU.scala 35:75:@95.4]
  assign subOverflowChecker = {_T_15,_T_16,_T_21}; // @[Cat.scala 30:58:@97.4]
  assign _T_24 = addOverflowChecker == 3'h1; // @[ALU.scala 36:41:@98.4]
  assign _T_26 = addOverflowChecker == 3'h6; // @[ALU.scala 36:73:@99.4]
  assign addOverflow = _T_24 | _T_26; // @[ALU.scala 36:50:@100.4]
  assign _T_28 = subOverflowChecker == 3'h4; // @[ALU.scala 37:41:@101.4]
  assign _T_30 = subOverflowChecker == 3'h3; // @[ALU.scala 37:73:@102.4]
  assign subOverflow = _T_28 | _T_30; // @[ALU.scala 37:50:@103.4]
  assign flagZero = io_Y == 6'h0; // @[ALU.scala 38:23:@104.4]
  assign flagSign = io_Y[5]; // @[ALU.scala 39:22:@105.4]
  assign _T_41 = ~ io_A; // @[ALU.scala 57:23:@112.4]
  assign _T_42 = 3'h5 == io_S; // @[Mux.scala 46:19:@113.4]
  assign _T_43 = _T_42 ? _T_41 : 6'h0; // @[Mux.scala 46:16:@114.4]
  assign _T_44 = 3'h4 == io_S; // @[Mux.scala 46:19:@115.4]
  assign _T_45 = _T_44 ? Xor_io_S : _T_43; // @[Mux.scala 46:16:@116.4]
  assign _T_46 = 3'h3 == io_S; // @[Mux.scala 46:19:@117.4]
  assign _T_47 = _T_46 ? Or_io_S : _T_45; // @[Mux.scala 46:16:@118.4]
  assign _T_48 = 3'h2 == io_S; // @[Mux.scala 46:19:@119.4]
  assign _T_49 = _T_48 ? And_io_S : _T_47; // @[Mux.scala 46:16:@120.4]
  assign _T_50 = 3'h1 == io_S; // @[Mux.scala 46:19:@121.4]
  assign _T_51 = _T_50 ? Subtractor_io_Sum : _T_49; // @[Mux.scala 46:16:@122.4]
  assign _T_52 = 3'h0 == io_S; // @[Mux.scala 46:19:@123.4]
  assign _T_56 = _T_50 ? subOverflow : 1'h0; // @[Mux.scala 46:16:@127.4]
  assign _T_58 = _T_52 ? addOverflow : _T_56; // @[Mux.scala 46:16:@129.4]
  assign _T_61 = _T_50 ? Subtractor_io_Cout : 1'h0; // @[Mux.scala 46:16:@131.4]
  assign _T_63 = _T_52 ? Adder_io_Cout : _T_61; // @[Mux.scala 46:16:@133.4]
  assign _T_66 = _T_50 ? flagSign : 1'h0; // @[Mux.scala 46:16:@135.4]
  assign _T_68 = _T_52 ? flagSign : _T_66; // @[Mux.scala 46:16:@137.4]
  assign _T_71 = {_T_58,_T_63,_T_68,flagZero}; // @[Cat.scala 30:58:@140.4]
  assign io_Y = _T_52 ? Adder_io_Sum : _T_51; // @[ALU.scala 51:8:@125.4]
  assign io_F = _T_71[2:0]; // @[ALU.scala 59:8:@142.4]
  assign Adder_io_A = io_A; // @[ALU.scala 41:11:@106.4]
  assign Adder_io_B = io_B; // @[ALU.scala 44:11:@108.4]
  assign Subtractor_io_A = io_A; // @[ALU.scala 42:11:@107.4]
  assign Subtractor_io_B = io_B; // @[ALU.scala 45:11:@109.4]
  assign And_io_A = io_A; // @[BitwiseOperators.scala 19:9:@76.4]
  assign And_io_B = io_B; // @[BitwiseOperators.scala 20:9:@77.4]
  assign Or_io_A = io_A; // @[BitwiseOperators.scala 38:9:@81.4]
  assign Or_io_B = io_B; // @[BitwiseOperators.scala 39:9:@82.4]
  assign Xor_io_A = io_A; // @[BitwiseOperators.scala 57:9:@86.4]
  assign Xor_io_B = io_B; // @[BitwiseOperators.scala 58:9:@87.4]
endmodule
module Button(
  input   clock,
  input   reset,
  input   io_i,
  input   io_repeat,
  output  io_o
);
  reg [31:0] c; // @[Button.scala 24:18]
  reg [31:0] _RAND_0;
  wire  _T; // @[Button.scala 25:14]
  wire  _T_1; // @[Button.scala 25:29]
  wire  _T_2; // @[Button.scala 25:42]
  wire [31:0] _T_5; // @[Button.scala 28:12]
  assign _T = c == 32'h1; // @[Button.scala 25:14]
  assign _T_1 = c >= 32'h2faf080; // @[Button.scala 25:29]
  assign _T_2 = _T_1 & io_repeat; // @[Button.scala 25:42]
  assign _T_5 = c + 32'h1; // @[Button.scala 28:12]
  assign io_o = _T | _T_2; // @[Button.scala 25:8]
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
  c = _RAND_0[31:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end
  always @(posedge clock) begin
    if (reset) begin
      c <= 32'h0;
    end else begin
      if (io_i) begin
        c <= _T_5;
      end else begin
        c <= 32'h0;
      end
    end
  end
endmodule
module VGA(
  input         clock,
  input         reset,
  output        io_hs,
  output        io_vs,
  output        io_en,
  output [15:0] io_x,
  output [15:0] io_y
);
  reg [15:0] CD; // @[VGA.scala 15:19]
  reg [31:0] _RAND_0;
  reg [15:0] HD; // @[VGA.scala 16:19]
  reg [31:0] _RAND_1;
  reg [15:0] VD; // @[VGA.scala 17:19]
  reg [31:0] _RAND_2;
  wire [16:0] CDNext; // @[VGA.scala 18:28]
  reg  PE; // @[VGA.scala 19:19]
  reg [31:0] _RAND_3;
  wire [15:0] _T_2; // @[VGA.scala 20:15]
  wire  _T_3; // @[VGA.scala 25:16]
  wire  _T_4; // @[VGA.scala 25:31]
  wire  _T_8; // @[VGA.scala 28:18]
  wire  _T_9; // @[VGA.scala 28:41]
  wire  _T_10; // @[VGA.scala 28:34]
  wire  _T_12; // @[VGA.scala 29:18]
  wire  _T_13; // @[VGA.scala 29:41]
  wire  _T_14; // @[VGA.scala 29:34]
  wire  _T_16; // @[VGA.scala 32:14]
  wire  _T_17; // @[VGA.scala 34:16]
  wire [15:0] _T_19; // @[VGA.scala 37:18]
  wire [15:0] _T_21; // @[VGA.scala 40:16]
  assign CDNext = CD + 16'h4000; // @[VGA.scala 18:28]
  assign _T_2 = CDNext[15:0]; // @[VGA.scala 20:15]
  assign _T_3 = HD < 16'h280; // @[VGA.scala 25:16]
  assign _T_4 = VD < 16'h1e0; // @[VGA.scala 25:31]
  assign _T_8 = HD >= 16'h290; // @[VGA.scala 28:18]
  assign _T_9 = HD < 16'h2f0; // @[VGA.scala 28:41]
  assign _T_10 = _T_8 & _T_9; // @[VGA.scala 28:34]
  assign _T_12 = VD >= 16'h1ea; // @[VGA.scala 29:18]
  assign _T_13 = VD < 16'h1ec; // @[VGA.scala 29:41]
  assign _T_14 = _T_12 & _T_13; // @[VGA.scala 29:34]
  assign _T_16 = HD >= 16'h31f; // @[VGA.scala 32:14]
  assign _T_17 = VD >= 16'h20a; // @[VGA.scala 34:16]
  assign _T_19 = VD + 16'h1; // @[VGA.scala 37:18]
  assign _T_21 = HD + 16'h1; // @[VGA.scala 40:16]
  assign io_hs = ~ _T_10; // @[VGA.scala 28:9]
  assign io_vs = ~ _T_14; // @[VGA.scala 29:9]
  assign io_en = _T_3 & _T_4; // @[VGA.scala 25:9]
  assign io_x = io_en ? HD : 16'h0; // @[VGA.scala 26:8]
  assign io_y = io_en ? VD : 16'h0; // @[VGA.scala 27:8]
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
  CD = _RAND_0[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  HD = _RAND_1[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  VD = _RAND_2[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  PE = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end
  always @(posedge clock) begin
    if (reset) begin
      CD <= 16'h0;
    end else begin
      CD <= _T_2;
    end
    if (reset) begin
      HD <= 16'h0;
    end else begin
      if (PE) begin
        if (_T_16) begin
          HD <= 16'h0;
        end else begin
          HD <= _T_21;
        end
      end
    end
    if (reset) begin
      VD <= 16'h0;
    end else begin
      if (PE) begin
        if (_T_16) begin
          if (_T_17) begin
            VD <= 16'h0;
          end else begin
            VD <= _T_19;
          end
        end
      end
    end
    PE <= CDNext[16];
  end
endmodule
module Painter(
  input         clock,
  input         reset,
  input  [3:0]  io_btn,
  input  [11:0] io_sw,
  input         io_de,
  output        io_hs,
  output        io_vs,
  output [3:0]  io_vr,
  output [3:0]  io_vg,
  output [3:0]  io_vb
);
  wire  Button_clock; // @[Button.scala 10:19]
  wire  Button_reset; // @[Button.scala 10:19]
  wire  Button_io_i; // @[Button.scala 10:19]
  wire  Button_io_repeat; // @[Button.scala 10:19]
  wire  Button_io_o; // @[Button.scala 10:19]
  wire  Button_1_clock; // @[Button.scala 10:19]
  wire  Button_1_reset; // @[Button.scala 10:19]
  wire  Button_1_io_i; // @[Button.scala 10:19]
  wire  Button_1_io_repeat; // @[Button.scala 10:19]
  wire  Button_1_io_o; // @[Button.scala 10:19]
  wire  Button_2_clock; // @[Button.scala 10:19]
  wire  Button_2_reset; // @[Button.scala 10:19]
  wire  Button_2_io_i; // @[Button.scala 10:19]
  wire  Button_2_io_repeat; // @[Button.scala 10:19]
  wire  Button_2_io_o; // @[Button.scala 10:19]
  wire  Button_3_clock; // @[Button.scala 10:19]
  wire  Button_3_reset; // @[Button.scala 10:19]
  wire  Button_3_io_i; // @[Button.scala 10:19]
  wire  Button_3_io_repeat; // @[Button.scala 10:19]
  wire  Button_3_io_o; // @[Button.scala 10:19]
  wire  VRAM_clock; // @[Painter.scala 31:20]
  wire [15:0] VRAM_ra; // @[Painter.scala 31:20]
  wire [11:0] VRAM_rd; // @[Painter.scala 31:20]
  wire [15:0] VRAM_wa; // @[Painter.scala 31:20]
  wire [11:0] VRAM_wd; // @[Painter.scala 31:20]
  wire  VRAM_we; // @[Painter.scala 31:20]
  wire  VGA_clock; // @[Painter.scala 32:19]
  wire  VGA_reset; // @[Painter.scala 32:19]
  wire  VGA_io_hs; // @[Painter.scala 32:19]
  wire  VGA_io_vs; // @[Painter.scala 32:19]
  wire  VGA_io_en; // @[Painter.scala 32:19]
  wire [15:0] VGA_io_x; // @[Painter.scala 32:19]
  wire [15:0] VGA_io_y; // @[Painter.scala 32:19]
  reg [31:0] cRepeat; // @[Painter.scala 21:24]
  reg [31:0] _RAND_0;
  reg [7:0] x; // @[Painter.scala 24:18]
  reg [31:0] _RAND_1;
  reg [7:0] y; // @[Painter.scala 25:18]
  reg [31:0] _RAND_2;
  wire [15:0] _T_43; // @[Painter.scala 53:15]
  wire [7:0] rx; // @[Painter.scala 36:16 Painter.scala 53:6]
  wire  _T_4; // @[Painter.scala 41:11]
  wire [8:0] _T_5; // @[Painter.scala 41:22]
  wire [15:0] _T_45; // @[Painter.scala 54:15]
  wire [7:0] ry; // @[Painter.scala 37:16 Painter.scala 54:6]
  wire [8:0] _GEN_5; // @[Painter.scala 41:29]
  wire  _T_6; // @[Painter.scala 41:29]
  wire  _T_7; // @[Painter.scala 41:17]
  wire [8:0] _T_8; // @[Painter.scala 41:41]
  wire [8:0] _GEN_6; // @[Painter.scala 41:48]
  wire  _T_9; // @[Painter.scala 41:48]
  wire  _T_10; // @[Painter.scala 41:35]
  wire  _T_11; // @[Painter.scala 41:61]
  wire [8:0] _T_12; // @[Painter.scala 41:72]
  wire [8:0] _GEN_7; // @[Painter.scala 41:79]
  wire  _T_13; // @[Painter.scala 41:79]
  wire  _T_14; // @[Painter.scala 41:67]
  wire [8:0] _T_15; // @[Painter.scala 41:91]
  wire [8:0] _GEN_8; // @[Painter.scala 41:98]
  wire  _T_16; // @[Painter.scala 41:98]
  wire  _T_17; // @[Painter.scala 41:85]
  wire  _T_18; // @[Painter.scala 41:54]
  wire [11:0] _T_19; // @[Painter.scala 42:18]
  wire [11:0] _T_20; // @[Painter.scala 40:8]
  wire  _T_21; // @[Painter.scala 45:14]
  wire  _T_22; // @[Painter.scala 45:47]
  wire  _T_23; // @[Painter.scala 45:38]
  wire  _T_24; // @[Painter.scala 45:81]
  wire  _T_25; // @[Painter.scala 45:115]
  wire  _T_26; // @[Painter.scala 45:106]
  wire  _T_27; // @[Painter.scala 45:71]
  wire  _T_28; // @[Painter.scala 45:152]
  wire  _T_29; // @[Painter.scala 45:185]
  wire  _T_30; // @[Painter.scala 45:176]
  wire  _T_31; // @[Painter.scala 45:219]
  wire  _T_32; // @[Painter.scala 45:253]
  wire  _T_33; // @[Painter.scala 45:244]
  wire  _T_34; // @[Painter.scala 45:209]
  wire  _T_35; // @[Painter.scala 45:142]
  wire [11:0] _T_36; // @[Painter.scala 44:8]
  wire  _T_46; // @[Painter.scala 55:16]
  wire  _T_47; // @[Painter.scala 55:47]
  wire  _T_48; // @[Painter.scala 55:37]
  wire  _T_49; // @[Painter.scala 55:77]
  wire  _T_50; // @[Painter.scala 55:67]
  wire  _T_51; // @[Painter.scala 55:108]
  wire  re; // @[Painter.scala 55:98]
  wire [11:0] rd; // @[Painter.scala 39:15]
  wire [15:0] _GEN_9; // @[Painter.scala 49:18]
  wire [22:0] _T_37; // @[Painter.scala 49:18]
  wire [22:0] _GEN_10; // @[Painter.scala 49:26]
  wire [22:0] _T_38; // @[Painter.scala 49:26]
  wire [15:0] _GEN_11; // @[Painter.scala 50:17]
  wire [22:0] _T_39; // @[Painter.scala 50:17]
  wire [22:0] _GEN_12; // @[Painter.scala 50:25]
  wire [22:0] _T_40; // @[Painter.scala 50:25]
  wire  _T_56; // @[Painter.scala 60:11]
  wire  _T_57; // @[Painter.scala 60:17]
  wire [7:0] _T_59; // @[Painter.scala 61:12]
  wire  _T_60; // @[Painter.scala 63:11]
  wire  _T_61; // @[Painter.scala 63:23]
  wire [7:0] _T_63; // @[Painter.scala 64:12]
  wire  _T_64; // @[Painter.scala 66:11]
  wire  _T_65; // @[Painter.scala 66:23]
  wire [7:0] _T_67; // @[Painter.scala 67:12]
  wire  _T_68; // @[Painter.scala 69:11]
  wire  _T_69; // @[Painter.scala 69:17]
  wire [7:0] _T_71; // @[Painter.scala 70:12]
  wire  _T_72; // @[Painter.scala 72:17]
  wire [31:0] _T_74; // @[Painter.scala 75:24]
  Button Button ( // @[Button.scala 10:19]
    .clock(Button_clock),
    .reset(Button_reset),
    .io_i(Button_io_i),
    .io_repeat(Button_io_repeat),
    .io_o(Button_io_o)
  );
  Button Button_1 ( // @[Button.scala 10:19]
    .clock(Button_1_clock),
    .reset(Button_1_reset),
    .io_i(Button_1_io_i),
    .io_repeat(Button_1_io_repeat),
    .io_o(Button_1_io_o)
  );
  Button Button_2 ( // @[Button.scala 10:19]
    .clock(Button_2_clock),
    .reset(Button_2_reset),
    .io_i(Button_2_io_i),
    .io_repeat(Button_2_io_repeat),
    .io_o(Button_2_io_o)
  );
  Button Button_3 ( // @[Button.scala 10:19]
    .clock(Button_3_clock),
    .reset(Button_3_reset),
    .io_i(Button_3_io_i),
    .io_repeat(Button_3_io_repeat),
    .io_o(Button_3_io_o)
  );
  VRAM VRAM ( // @[Painter.scala 31:20]
    .clock(VRAM_clock),
    .ra(VRAM_ra),
    .rd(VRAM_rd),
    .wa(VRAM_wa),
    .wd(VRAM_wd),
    .we(VRAM_we)
  );
  VGA VGA ( // @[Painter.scala 32:19]
    .clock(VGA_clock),
    .reset(VGA_reset),
    .io_hs(VGA_io_hs),
    .io_vs(VGA_io_vs),
    .io_en(VGA_io_en),
    .io_x(VGA_io_x),
    .io_y(VGA_io_y)
  );
  assign _T_43 = VGA_io_x - 16'hc0; // @[Painter.scala 53:15]
  assign rx = _T_43[7:0]; // @[Painter.scala 36:16 Painter.scala 53:6]
  assign _T_4 = rx == x; // @[Painter.scala 41:11]
  assign _T_5 = y + 8'h3; // @[Painter.scala 41:22]
  assign _T_45 = VGA_io_y - 16'h70; // @[Painter.scala 54:15]
  assign ry = _T_45[7:0]; // @[Painter.scala 37:16 Painter.scala 54:6]
  assign _GEN_5 = {{1'd0}, ry}; // @[Painter.scala 41:29]
  assign _T_6 = _T_5 >= _GEN_5; // @[Painter.scala 41:29]
  assign _T_7 = _T_4 & _T_6; // @[Painter.scala 41:17]
  assign _T_8 = ry + 8'h3; // @[Painter.scala 41:41]
  assign _GEN_6 = {{1'd0}, y}; // @[Painter.scala 41:48]
  assign _T_9 = _T_8 >= _GEN_6; // @[Painter.scala 41:48]
  assign _T_10 = _T_7 & _T_9; // @[Painter.scala 41:35]
  assign _T_11 = ry == y; // @[Painter.scala 41:61]
  assign _T_12 = x + 8'h3; // @[Painter.scala 41:72]
  assign _GEN_7 = {{1'd0}, rx}; // @[Painter.scala 41:79]
  assign _T_13 = _T_12 >= _GEN_7; // @[Painter.scala 41:79]
  assign _T_14 = _T_11 & _T_13; // @[Painter.scala 41:67]
  assign _T_15 = rx + 8'h3; // @[Painter.scala 41:91]
  assign _GEN_8 = {{1'd0}, x}; // @[Painter.scala 41:98]
  assign _T_16 = _T_15 >= _GEN_8; // @[Painter.scala 41:98]
  assign _T_17 = _T_14 & _T_16; // @[Painter.scala 41:85]
  assign _T_18 = _T_10 | _T_17; // @[Painter.scala 41:54]
  assign _T_19 = ~ VRAM_rd; // @[Painter.scala 42:18]
  assign _T_20 = _T_18 ? 12'h0 : _T_19; // @[Painter.scala 40:8]
  assign _T_21 = VGA_io_y >= 16'h6e; // @[Painter.scala 45:14]
  assign _T_22 = VGA_io_y <= 16'h171; // @[Painter.scala 45:47]
  assign _T_23 = _T_21 & _T_22; // @[Painter.scala 45:38]
  assign _T_24 = VGA_io_x == 16'hbe; // @[Painter.scala 45:81]
  assign _T_25 = VGA_io_x == 16'h1c1; // @[Painter.scala 45:115]
  assign _T_26 = _T_24 | _T_25; // @[Painter.scala 45:106]
  assign _T_27 = _T_23 & _T_26; // @[Painter.scala 45:71]
  assign _T_28 = VGA_io_x >= 16'hbe; // @[Painter.scala 45:152]
  assign _T_29 = VGA_io_x <= 16'h1c1; // @[Painter.scala 45:185]
  assign _T_30 = _T_28 & _T_29; // @[Painter.scala 45:176]
  assign _T_31 = VGA_io_y == 16'h6e; // @[Painter.scala 45:219]
  assign _T_32 = VGA_io_y == 16'h171; // @[Painter.scala 45:253]
  assign _T_33 = _T_31 | _T_32; // @[Painter.scala 45:244]
  assign _T_34 = _T_30 & _T_33; // @[Painter.scala 45:209]
  assign _T_35 = _T_27 | _T_34; // @[Painter.scala 45:142]
  assign _T_36 = _T_35 ? 12'hfff : 12'h0; // @[Painter.scala 44:8]
  assign _T_46 = VGA_io_x >= 16'hc0; // @[Painter.scala 55:16]
  assign _T_47 = VGA_io_x < 16'h1c0; // @[Painter.scala 55:47]
  assign _T_48 = _T_46 & _T_47; // @[Painter.scala 55:37]
  assign _T_49 = VGA_io_y >= 16'h70; // @[Painter.scala 55:77]
  assign _T_50 = _T_48 & _T_49; // @[Painter.scala 55:67]
  assign _T_51 = VGA_io_y < 16'h170; // @[Painter.scala 55:108]
  assign re = _T_50 & _T_51; // @[Painter.scala 55:98]
  assign rd = re ? _T_20 : _T_36; // @[Painter.scala 39:15]
  assign _GEN_9 = {ry, 8'h0}; // @[Painter.scala 49:18]
  assign _T_37 = {{7'd0}, _GEN_9}; // @[Painter.scala 49:18]
  assign _GEN_10 = {{15'd0}, rx}; // @[Painter.scala 49:26]
  assign _T_38 = _T_37 | _GEN_10; // @[Painter.scala 49:26]
  assign _GEN_11 = {y, 8'h0}; // @[Painter.scala 50:17]
  assign _T_39 = {{7'd0}, _GEN_11}; // @[Painter.scala 50:17]
  assign _GEN_12 = {{15'd0}, x}; // @[Painter.scala 50:25]
  assign _T_40 = _T_39 | _GEN_12; // @[Painter.scala 50:25]
  assign _T_56 = y > 8'h0; // @[Painter.scala 60:11]
  assign _T_57 = _T_56 & Button_io_o; // @[Painter.scala 60:17]
  assign _T_59 = y - 8'h1; // @[Painter.scala 61:12]
  assign _T_60 = x < 8'hff; // @[Painter.scala 63:11]
  assign _T_61 = _T_60 & Button_1_io_o; // @[Painter.scala 63:23]
  assign _T_63 = x + 8'h1; // @[Painter.scala 64:12]
  assign _T_64 = y < 8'hff; // @[Painter.scala 66:11]
  assign _T_65 = _T_64 & Button_2_io_o; // @[Painter.scala 66:23]
  assign _T_67 = y + 8'h1; // @[Painter.scala 67:12]
  assign _T_68 = x > 8'h0; // @[Painter.scala 69:11]
  assign _T_69 = _T_68 & Button_3_io_o; // @[Painter.scala 69:17]
  assign _T_71 = x - 8'h1; // @[Painter.scala 70:12]
  assign _T_72 = cRepeat >= 32'h26259f; // @[Painter.scala 72:17]
  assign _T_74 = cRepeat + 32'h1; // @[Painter.scala 75:24]
  assign io_hs = VGA_io_hs; // @[Painter.scala 34:9]
  assign io_vs = VGA_io_vs; // @[Painter.scala 35:9]
  assign io_vr = rd[11:8]; // @[Painter.scala 56:9]
  assign io_vg = rd[7:4]; // @[Painter.scala 57:9]
  assign io_vb = rd[3:0]; // @[Painter.scala 58:9]
  assign Button_clock = clock;
  assign Button_reset = reset;
  assign Button_io_i = io_btn[0]; // @[Button.scala 11:9]
  assign Button_io_repeat = cRepeat == 32'h0; // @[Button.scala 12:14]
  assign Button_1_clock = clock;
  assign Button_1_reset = reset;
  assign Button_1_io_i = io_btn[1]; // @[Button.scala 11:9]
  assign Button_1_io_repeat = cRepeat == 32'h0; // @[Button.scala 12:14]
  assign Button_2_clock = clock;
  assign Button_2_reset = reset;
  assign Button_2_io_i = io_btn[2]; // @[Button.scala 11:9]
  assign Button_2_io_repeat = cRepeat == 32'h0; // @[Button.scala 12:14]
  assign Button_3_clock = clock;
  assign Button_3_reset = reset;
  assign Button_3_io_i = io_btn[3]; // @[Button.scala 11:9]
  assign Button_3_io_repeat = cRepeat == 32'h0; // @[Button.scala 12:14]
  assign VRAM_clock = clock; // @[Painter.scala 33:14]
  assign VRAM_ra = _T_38[15:0]; // @[Painter.scala 49:11]
  assign VRAM_wa = _T_40[15:0]; // @[Painter.scala 50:11]
  assign VRAM_wd = ~ io_sw; // @[Painter.scala 51:11]
  assign VRAM_we = io_de; // @[Painter.scala 52:11]
  assign VGA_clock = clock;
  assign VGA_reset = reset;
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
  cRepeat = _RAND_0[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  x = _RAND_1[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  y = _RAND_2[7:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end
  always @(posedge clock) begin
    if (reset) begin
      cRepeat <= 32'h0;
    end else begin
      if (_T_72) begin
        cRepeat <= 32'h0;
      end else begin
        cRepeat <= _T_74;
      end
    end
    if (reset) begin
      x <= 8'h7f;
    end else begin
      if (_T_69) begin
        x <= _T_71;
      end else begin
        if (_T_61) begin
          x <= _T_63;
        end
      end
    end
    if (reset) begin
      y <= 8'h7f;
    end else begin
      if (_T_65) begin
        y <= _T_67;
      end else begin
        if (_T_57) begin
          y <= _T_59;
        end
      end
    end
  end
endmodule

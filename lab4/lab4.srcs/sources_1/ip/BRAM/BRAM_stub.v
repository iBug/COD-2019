// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (lin64) Build 2258646 Thu Jun 14 20:02:38 MDT 2018
// Date        : Fri Apr 12 09:03:24 2019
// Host        : VMware running 64-bit Ubuntu 18.04.2 LTS
// Command     : write_verilog -force -mode synth_stub /home/vmware/cod_lab/lab4/lab4.srcs/sources_1/ip/BRAM/BRAM_stub.v
// Design      : BRAM
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_1,Vivado 2018.2" *)
module BRAM(clka, ena, wea, addra, dina, clkb, enb, addrb, doutb)
/* synthesis syn_black_box black_box_pad_pin="clka,ena,wea[0:0],addra[15:0],dina[11:0],clkb,enb,addrb[15:0],doutb[11:0]" */;
  input clka;
  input ena;
  input [0:0]wea;
  input [15:0]addra;
  input [11:0]dina;
  input clkb;
  input enb;
  input [15:0]addrb;
  output [11:0]doutb;
endmodule

-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.2 (lin64) Build 2258646 Thu Jun 14 20:02:38 MDT 2018
-- Date        : Fri Apr 12 09:03:24 2019
-- Host        : VMware running 64-bit Ubuntu 18.04.2 LTS
-- Command     : write_vhdl -force -mode synth_stub /home/vmware/cod_lab/lab4/lab4.srcs/sources_1/ip/BRAM/BRAM_stub.vhdl
-- Design      : BRAM
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BRAM is
  Port ( 
    clka : in STD_LOGIC;
    ena : in STD_LOGIC;
    wea : in STD_LOGIC_VECTOR ( 0 to 0 );
    addra : in STD_LOGIC_VECTOR ( 15 downto 0 );
    dina : in STD_LOGIC_VECTOR ( 11 downto 0 );
    clkb : in STD_LOGIC;
    enb : in STD_LOGIC;
    addrb : in STD_LOGIC_VECTOR ( 15 downto 0 );
    doutb : out STD_LOGIC_VECTOR ( 11 downto 0 )
  );

end BRAM;

architecture stub of BRAM is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clka,ena,wea[0:0],addra[15:0],dina[11:0],clkb,enb,addrb[15:0],doutb[11:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "blk_mem_gen_v8_4_1,Vivado 2018.2";
begin
end;

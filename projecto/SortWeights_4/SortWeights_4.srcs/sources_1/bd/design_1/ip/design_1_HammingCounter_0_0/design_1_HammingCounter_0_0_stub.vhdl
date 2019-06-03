-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
-- Date        : Wed May 29 06:34:08 2019
-- Host        : DESKTOP-UEV5SH3 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               d:/aulas/cr/projects/projecto/SortWeights_4/SortWeights_4.srcs/sources_1/bd/design_1/ip/design_1_HammingCounter_0_0/design_1_HammingCounter_0_0_stub.vhdl
-- Design      : design_1_HammingCounter_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_HammingCounter_0_0 is
  Port ( 
    enable : in STD_LOGIC;
    data_in : in STD_LOGIC_VECTOR ( 899 downto 0 );
    data_out : out STD_LOGIC_VECTOR ( 399 downto 0 );
    completed : out STD_LOGIC
  );

end design_1_HammingCounter_0_0;

architecture stub of design_1_HammingCounter_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "enable,data_in[899:0],data_out[399:0],completed";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "HammingCounter,Vivado 2018.3";
begin
end;

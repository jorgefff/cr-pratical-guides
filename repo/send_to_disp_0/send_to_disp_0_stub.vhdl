-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
-- Date        : Tue Mar  5 05:25:10 2019
-- Host        : DESKTOP-UEV5SH3 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub d:/aulas/cr/projects/repo/send_to_disp_0/send_to_disp_0_stub.vhdl
-- Design      : send_to_disp_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity send_to_disp_0 is
  Port ( 
    bcd : in STD_LOGIC_VECTOR ( 3 downto 0 );
    select_disp : in STD_LOGIC_VECTOR ( 2 downto 0 );
    segments : out STD_LOGIC_VECTOR ( 6 downto 0 );
    toggle_disp : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );

end send_to_disp_0;

architecture stub of send_to_disp_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "bcd[3:0],select_disp[2:0],segments[6:0],toggle_disp[7:0]";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "send_to_disp,Vivado 2018.3";
begin
end;

-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
-- Date        : Thu May 30 20:07:08 2019
-- Host        : DESKTOP-UEV5SH3 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               d:/aulas/cr/projects/projecto/SortWeights_5/SortWeights_5.srcs/sources_1/bd/design_1/ip/design_1_select_in_0_1/design_1_select_in_0_1_sim_netlist.vhdl
-- Design      : design_1_select_in_0_1
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_select_in_0_1_select_in is
  port (
    output : out STD_LOGIC_VECTOR ( 7 downto 0 );
    in_1 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    in_2 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    sel : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_select_in_0_1_select_in : entity is "select_in";
end design_1_select_in_0_1_select_in;

architecture STRUCTURE of design_1_select_in_0_1_select_in is
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \output[0]_INST_0\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \output[1]_INST_0\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \output[2]_INST_0\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \output[3]_INST_0\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \output[4]_INST_0\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \output[5]_INST_0\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \output[6]_INST_0\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \output[7]_INST_0\ : label is "soft_lutpair3";
begin
\output[0]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => in_1(0),
      I1 => in_2(0),
      I2 => sel,
      O => output(0)
    );
\output[1]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => in_1(1),
      I1 => in_2(1),
      I2 => sel,
      O => output(1)
    );
\output[2]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => in_1(2),
      I1 => in_2(2),
      I2 => sel,
      O => output(2)
    );
\output[3]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => in_1(3),
      I1 => in_2(3),
      I2 => sel,
      O => output(3)
    );
\output[4]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => in_1(4),
      I1 => in_2(4),
      I2 => sel,
      O => output(4)
    );
\output[5]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => in_1(5),
      I1 => in_2(5),
      I2 => sel,
      O => output(5)
    );
\output[6]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => in_1(6),
      I1 => in_2(6),
      I2 => sel,
      O => output(6)
    );
\output[7]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"AC"
    )
        port map (
      I0 => in_1(7),
      I1 => in_2(7),
      I2 => sel,
      O => output(7)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_select_in_0_1 is
  port (
    in_1 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    in_2 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    sel : in STD_LOGIC;
    output : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of design_1_select_in_0_1 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_select_in_0_1 : entity is "design_1_select_in_0_1,select_in,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of design_1_select_in_0_1 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of design_1_select_in_0_1 : entity is "module_ref";
  attribute x_core_info : string;
  attribute x_core_info of design_1_select_in_0_1 : entity is "select_in,Vivado 2018.3";
end design_1_select_in_0_1;

architecture STRUCTURE of design_1_select_in_0_1 is
begin
U0: entity work.design_1_select_in_0_1_select_in
     port map (
      in_1(7 downto 0) => in_1(7 downto 0),
      in_2(7 downto 0) => in_2(7 downto 0),
      output(7 downto 0) => output(7 downto 0),
      sel => sel
    );
end STRUCTURE;

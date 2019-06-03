-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
-- Date        : Wed May 29 06:36:52 2019
-- Host        : DESKTOP-UEV5SH3 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               d:/aulas/cr/projects/projecto/SortWeights_4/SortWeights_4.srcs/sources_1/bd/design_1/ip/design_1_addr_mux_0_0/design_1_addr_mux_0_0_sim_netlist.vhdl
-- Design      : design_1_addr_mux_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_addr_mux_0_0_addr_mux is
  port (
    addr_out : out STD_LOGIC_VECTOR ( 6 downto 0 );
    addr_1 : in STD_LOGIC_VECTOR ( 6 downto 0 );
    sel : in STD_LOGIC;
    addr_2 : in STD_LOGIC_VECTOR ( 6 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_addr_mux_0_0_addr_mux : entity is "addr_mux";
end design_1_addr_mux_0_0_addr_mux;

architecture STRUCTURE of design_1_addr_mux_0_0_addr_mux is
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \addr_out[0]_INST_0\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \addr_out[1]_INST_0\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \addr_out[2]_INST_0\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \addr_out[3]_INST_0\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \addr_out[4]_INST_0\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \addr_out[5]_INST_0\ : label is "soft_lutpair2";
begin
\addr_out[0]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => addr_1(0),
      I1 => sel,
      I2 => addr_2(0),
      O => addr_out(0)
    );
\addr_out[1]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => addr_1(1),
      I1 => sel,
      I2 => addr_2(1),
      O => addr_out(1)
    );
\addr_out[2]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => addr_1(2),
      I1 => sel,
      I2 => addr_2(2),
      O => addr_out(2)
    );
\addr_out[3]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => addr_1(3),
      I1 => sel,
      I2 => addr_2(3),
      O => addr_out(3)
    );
\addr_out[4]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => addr_1(4),
      I1 => sel,
      I2 => addr_2(4),
      O => addr_out(4)
    );
\addr_out[5]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => addr_1(5),
      I1 => sel,
      I2 => addr_2(5),
      O => addr_out(5)
    );
\addr_out[6]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => addr_1(6),
      I1 => sel,
      I2 => addr_2(6),
      O => addr_out(6)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_addr_mux_0_0 is
  port (
    addr_1 : in STD_LOGIC_VECTOR ( 6 downto 0 );
    addr_2 : in STD_LOGIC_VECTOR ( 6 downto 0 );
    sel : in STD_LOGIC;
    addr_out : out STD_LOGIC_VECTOR ( 6 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of design_1_addr_mux_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_addr_mux_0_0 : entity is "design_1_addr_mux_0_0,addr_mux,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of design_1_addr_mux_0_0 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of design_1_addr_mux_0_0 : entity is "module_ref";
  attribute x_core_info : string;
  attribute x_core_info of design_1_addr_mux_0_0 : entity is "addr_mux,Vivado 2018.3";
end design_1_addr_mux_0_0;

architecture STRUCTURE of design_1_addr_mux_0_0 is
begin
U0: entity work.design_1_addr_mux_0_0_addr_mux
     port map (
      addr_1(6 downto 0) => addr_1(6 downto 0),
      addr_2(6 downto 0) => addr_2(6 downto 0),
      addr_out(6 downto 0) => addr_out(6 downto 0),
      sel => sel
    );
end STRUCTURE;

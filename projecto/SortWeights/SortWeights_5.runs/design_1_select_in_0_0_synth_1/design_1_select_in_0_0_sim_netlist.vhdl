-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
-- Date        : Thu May 30 20:10:18 2019
-- Host        : DESKTOP-UEV5SH3 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_select_in_0_0_sim_netlist.vhdl
-- Design      : design_1_select_in_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_select_in is
  port (
    output : out STD_LOGIC_VECTOR ( 6 downto 0 );
    in_1 : in STD_LOGIC_VECTOR ( 6 downto 0 );
    sel : in STD_LOGIC;
    in_2 : in STD_LOGIC_VECTOR ( 6 downto 0 )
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_select_in;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_select_in is
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \output[0]_INST_0\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \output[1]_INST_0\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \output[2]_INST_0\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \output[3]_INST_0\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \output[4]_INST_0\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \output[5]_INST_0\ : label is "soft_lutpair2";
begin
\output[0]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => in_1(0),
      I1 => sel,
      I2 => in_2(0),
      O => output(0)
    );
\output[1]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => in_1(1),
      I1 => sel,
      I2 => in_2(1),
      O => output(1)
    );
\output[2]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => in_1(2),
      I1 => sel,
      I2 => in_2(2),
      O => output(2)
    );
\output[3]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => in_1(3),
      I1 => sel,
      I2 => in_2(3),
      O => output(3)
    );
\output[4]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => in_1(4),
      I1 => sel,
      I2 => in_2(4),
      O => output(4)
    );
\output[5]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => in_1(5),
      I1 => sel,
      I2 => in_2(5),
      O => output(5)
    );
\output[6]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => in_1(6),
      I1 => sel,
      I2 => in_2(6),
      O => output(6)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  port (
    in_1 : in STD_LOGIC_VECTOR ( 6 downto 0 );
    in_2 : in STD_LOGIC_VECTOR ( 6 downto 0 );
    sel : in STD_LOGIC;
    output : out STD_LOGIC_VECTOR ( 6 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "design_1_select_in_0_0,select_in,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "module_ref";
  attribute x_core_info : string;
  attribute x_core_info of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "select_in,Vivado 2018.3";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
begin
U0: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_select_in
     port map (
      in_1(6 downto 0) => in_1(6 downto 0),
      in_2(6 downto 0) => in_2(6 downto 0),
      output(6 downto 0) => output(6 downto 0),
      sel => sel
    );
end STRUCTURE;

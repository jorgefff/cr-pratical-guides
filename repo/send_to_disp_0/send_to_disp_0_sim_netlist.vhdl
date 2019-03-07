-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
-- Date        : Tue Mar  5 05:25:10 2019
-- Host        : DESKTOP-UEV5SH3 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim d:/aulas/cr/projects/repo/send_to_disp_0/send_to_disp_0_sim_netlist.vhdl
-- Design      : send_to_disp_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity send_to_disp_0_send_to_disp is
  port (
    bcd : in STD_LOGIC_VECTOR ( 3 downto 0 );
    select_disp : in STD_LOGIC_VECTOR ( 2 downto 0 );
    segments : out STD_LOGIC_VECTOR ( 6 downto 0 );
    toggle_disp : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of send_to_disp_0_send_to_disp : entity is "send_to_disp";
end send_to_disp_0_send_to_disp;

architecture STRUCTURE of send_to_disp_0_send_to_disp is
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \segments[0]_INST_0\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \segments[1]_INST_0\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \segments[2]_INST_0\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \segments[3]_INST_0\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \segments[4]_INST_0\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \segments[5]_INST_0\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \toggle_disp[0]_INST_0\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \toggle_disp[1]_INST_0\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \toggle_disp[2]_INST_0\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \toggle_disp[3]_INST_0\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \toggle_disp[4]_INST_0\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \toggle_disp[5]_INST_0\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \toggle_disp[6]_INST_0\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \toggle_disp[7]_INST_0\ : label is "soft_lutpair3";
begin
\segments[0]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2094"
    )
        port map (
      I0 => bcd(3),
      I1 => bcd(2),
      I2 => bcd(0),
      I3 => bcd(1),
      O => segments(0)
    );
\segments[1]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A4C8"
    )
        port map (
      I0 => bcd(3),
      I1 => bcd(2),
      I2 => bcd(1),
      I3 => bcd(0),
      O => segments(1)
    );
\segments[2]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A210"
    )
        port map (
      I0 => bcd(3),
      I1 => bcd(0),
      I2 => bcd(1),
      I3 => bcd(2),
      O => segments(2)
    );
\segments[3]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"C214"
    )
        port map (
      I0 => bcd(3),
      I1 => bcd(2),
      I2 => bcd(0),
      I3 => bcd(1),
      O => segments(3)
    );
\segments[4]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5710"
    )
        port map (
      I0 => bcd(3),
      I1 => bcd(1),
      I2 => bcd(2),
      I3 => bcd(0),
      O => segments(4)
    );
\segments[5]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5190"
    )
        port map (
      I0 => bcd(3),
      I1 => bcd(2),
      I2 => bcd(0),
      I3 => bcd(1),
      O => segments(5)
    );
\segments[6]_INST_0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4025"
    )
        port map (
      I0 => bcd(3),
      I1 => bcd(0),
      I2 => bcd(2),
      I3 => bcd(1),
      O => segments(6)
    );
\toggle_disp[0]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => select_disp(2),
      I1 => select_disp(0),
      I2 => select_disp(1),
      O => toggle_disp(0)
    );
\toggle_disp[1]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FB"
    )
        port map (
      I0 => select_disp(2),
      I1 => select_disp(0),
      I2 => select_disp(1),
      O => toggle_disp(1)
    );
\toggle_disp[2]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FB"
    )
        port map (
      I0 => select_disp(2),
      I1 => select_disp(1),
      I2 => select_disp(0),
      O => toggle_disp(2)
    );
\toggle_disp[3]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"BF"
    )
        port map (
      I0 => select_disp(2),
      I1 => select_disp(0),
      I2 => select_disp(1),
      O => toggle_disp(3)
    );
\toggle_disp[4]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"EF"
    )
        port map (
      I0 => select_disp(0),
      I1 => select_disp(1),
      I2 => select_disp(2),
      O => toggle_disp(4)
    );
\toggle_disp[5]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"DF"
    )
        port map (
      I0 => select_disp(0),
      I1 => select_disp(1),
      I2 => select_disp(2),
      O => toggle_disp(5)
    );
\toggle_disp[6]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"DF"
    )
        port map (
      I0 => select_disp(1),
      I1 => select_disp(0),
      I2 => select_disp(2),
      O => toggle_disp(6)
    );
\toggle_disp[7]_INST_0\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"7F"
    )
        port map (
      I0 => select_disp(0),
      I1 => select_disp(1),
      I2 => select_disp(2),
      O => toggle_disp(7)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity send_to_disp_0 is
  port (
    bcd : in STD_LOGIC_VECTOR ( 3 downto 0 );
    select_disp : in STD_LOGIC_VECTOR ( 2 downto 0 );
    segments : out STD_LOGIC_VECTOR ( 6 downto 0 );
    toggle_disp : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of send_to_disp_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of send_to_disp_0 : entity is "send_to_disp_0,send_to_disp,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of send_to_disp_0 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of send_to_disp_0 : entity is "package_project";
  attribute x_core_info : string;
  attribute x_core_info of send_to_disp_0 : entity is "send_to_disp,Vivado 2018.3";
end send_to_disp_0;

architecture STRUCTURE of send_to_disp_0 is
begin
U0: entity work.send_to_disp_0_send_to_disp
     port map (
      bcd(3 downto 0) => bcd(3 downto 0),
      segments(6 downto 0) => segments(6 downto 0),
      select_disp(2 downto 0) => select_disp(2 downto 0),
      toggle_disp(7 downto 0) => toggle_disp(7 downto 0)
    );
end STRUCTURE;

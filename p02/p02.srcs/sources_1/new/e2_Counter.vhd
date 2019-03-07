

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity e2_Counter is
    port (  clk  : in  std_logic;
            btnC : in  std_logic;
            sw   : in  std_logic_vector(1 downto 0);
            seg  : out std_logic_vector(6 downto 0);
            an   : out std_logic_vector(7 downto 0));
    
end e2_Counter;

architecture Structural of e2_Counter is
    signal s_seg_idx : std_logic_vector(2 downto 0) := "000";
    signal s_clk     : std_logic;
    signal s_cnt     : std_logic_vector(3 downto 0);
    
    component freq_div
    port ( clk_in  : in  std_logic;
           reset   : in  std_logic;
           clk_out : out std_logic);
    end component;
    
    component Counter
    port (  clk    : in  std_logic;
            enable : in  std_logic;
            cnt_up : in  std_logic;
            reset  : in  std_logic;
            output : out std_logic_vector(3 downto 0));
    end component;
    
    component send_to_seg
    port(   bin : in std_logic_vector(3 downto 0);
            sel : in std_logic_vector(2 downto 0);
            seg : out std_logic_vector(6 downto 0);
            an  : out std_logic_vector(7 downto 0));
    end component;
    
begin
    
    div : freq_div
    port map (  clk_in => clk,
                reset => btnC,
                clk_out => s_clk);
    
    cnt : Counter
    port map (  clk => s_clk,
                reset => btnC,
                enable => sw(0),
                cnt_up => sw(1),
                output => s_cnt);
    
    to_seg : send_to_seg
    port map (  bin => s_cnt,
                sel => s_seg_idx,
                seg => seg,
                an => an );
    
end Structural;

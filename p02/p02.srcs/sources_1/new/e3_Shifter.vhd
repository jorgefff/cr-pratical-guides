

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity e3_Shifter is
    port (  sw   : in  std_logic_vector(15 downto 0);
            clk  : in  std_logic;
            btnL : in  std_logic;       -- clk en
            btnC : in  std_logic;       -- clk res
            btnU : in  std_logic;       -- shift left/right
            btnR : in  std_logic;       -- set
            led  : out std_logic_vector(15 downto 0));     
            
end e3_Shifter;

architecture Behavioral of e3_Shifter is
    signal s_clk : std_logic;
    signal s_clk_en : std_logic;
    signal s_clk_res : std_logic;
    signal s_set : std_logic;
    signal s_right : std_logic;
    signal s_val   : std_logic_vector(15 downto 0);
    
    component freq_div
    port ( clk_in  : in  std_logic;
           reset   : in  std_logic;
           clk_out : out std_logic);
    end component;

begin
    
    div : freq_div
    port map (  clk_in => clk,
                reset => btnC,
                clk_out => s_clk);
    
    process(s_clk,s_clk_res, s_set)
    begin
        if (s_clk_res = '1') then
            s_val <= (others => '0');
        elsif (s_set = '1') then
            s_val <= sw;
        elsif (s_clk_en = '1' and rising_edge (s_clk)) then
            if (s_right = '1') then
                s_val <= s_val(1 downto 0) & s_val(15 downto 2);
            else
                s_val <= s_val(13 downto 0) & s_val(15 downto 14);
            end if;
        end if;    
    end process; 
    
    s_clk_en <= btnL;
    s_clk_res <= btnC;
    s_set <= btnR;
    s_right <= btnU;
    led <= s_val;
end Behavioral;

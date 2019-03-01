library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity ex_1_4_ClkDiv is
    port (  clk : in  std_logic;
            led : out std_logic_vector(3 downto 3));
    
end ex_1_4_ClkDiv;

architecture Behavioral of ex_1_4_ClkDiv is
    component ClkDivider
    port (  clk_in   : in  STD_LOGIC;
            clk_out  : out STD_LOGIC);
    end component;
begin
    
    uut : ClkDivider 
    port map( 
        clk_in => clk, 
        clk_out => led(3));
    
end Behavioral;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;


entity freq_div is

    generic (div    : integer := 10**8);
    port (  clk_in  : in  std_logic;
            reset   : in std_logic;
            clk_out : out std_logic);
            
end freq_div;

architecture Behavioral of freq_div is
    
    signal s_clock : std_logic := '0';
    signal s_count : natural := 0;
    
begin
    process(clk_in,reset)
    begin
        
        if (reset = '1') then
            s_count <= 0;
            s_clock <= '0';
                    
        elsif (rising_edge (clk_in)) then
            s_count <= s_count +1;
            if (s_count > div / 2 - 1) then
                s_clock <= not(s_clock);
                s_count <= 0;            
            end if;
        end if;
        
    end process;
    
    clk_out <= s_clock;
    
end Behavioral;

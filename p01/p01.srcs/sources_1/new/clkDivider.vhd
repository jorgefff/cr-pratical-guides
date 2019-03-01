library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity clkDivider is
    generic (clk_div   : integer := 5*10**7);
    port    (clk_in    : in  std_logic;
             clk_out   : out std_logic);
    
end clkDivider;

architecture Behavioral of clkDivider is
    
begin
    div : process(clk_in)
        variable cycleCnt : integer := 0;
        variable output : std_logic := '0';
    begin   
    
        if (rising_edge(clk_in)) then     
            
            if (cycleCnt < clk_div) then
                cycleCnt := cycleCnt +1;
            else
                cycleCnt := 0;
                output := not(output);
            end if;
            
            clk_out <= output;
            
        end if;
    end process;
end Behavioral;

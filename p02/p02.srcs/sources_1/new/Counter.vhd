library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;


entity Counter is
    port(   clk     : in  std_logic;
            enable  : in  std_logic;
            cnt_up  : in  std_logic;
            reset   : in  std_logic;
            output  : out std_logic_vector(3 downto 0));
            
end Counter;


architecture Behavioral of Counter is
begin
    process(clk, reset)
        variable count : integer := 0;
    begin
        if (reset = '1') then
            count := 0;
            
        elsif (rising_edge(clk) and enable ='1') then
            if (cnt_up = '1' and count < 15) then
                count := count +1;
                
            elsif (cnt_up = '0' and count > 0) then
                count := count -1;
                
            end if;
        end if;
        
        output <= std_logic_vector(to_unsigned(count,4));
            
    end process;
    
end Behavioral;
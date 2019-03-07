
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity send_to_disp is
    port (  bcd             : in  std_logic_vector(3 downto 0);
            select_disp     : in  std_logic_vector(2 downto 0);
            segments        : out std_logic_vector(6 downto 0);
            toggle_disp     : out std_logic_vector(7 downto 0));
            
end send_to_disp;

architecture Behavioral of send_to_disp is
    signal s_idx : natural := 0; 
begin
    segments <= "1000000" when bcd = "0000" else -- 0
                "1111001" when bcd = "0001" else -- 1
                "0100100" when bcd = "0010" else -- 2
                "0110000" when bcd = "0011" else -- 3
                "0011001" when bcd = "0100" else -- 4
                "0010010" when bcd = "0101" else -- 5
                "0000010" when bcd = "0110" else -- 6
                "1111000" when bcd = "0111" else -- 7
                "0000000" when bcd = "1000" else -- 8
                "0010000" when bcd = "1001" else -- 9
                "0001000" when bcd = "1010" else -- a
                "0000011" when bcd = "1011" else -- b
                "1000110" when bcd = "1100" else -- c
                "0100001" when bcd = "1101" else -- d
                "0000110" when bcd = "1110" else -- e
                "0001110" when bcd = "1111" else -- f
                "1111111";                       -- off
    
    s_idx <= natural(to_integer(unsigned(select_disp)));
    
    select_display : process(s_idx)
    begin
        toggle_disp <= (others => '1');
        if (s_idx >= 0 and s_idx <= 7) then
            toggle_disp(s_idx) <= '0';
        end if;
    end process;
    
end Behavioral;

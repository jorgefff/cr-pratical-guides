
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity select_in is
    generic (   IN_SIZE   : integer := 7);
                
    port (      in_1      : in  std_logic_vector (IN_SIZE -1 downto 0);
                in_2      : in  std_logic_vector (IN_SIZE -1 downto 0);
                sel         : in  std_logic;
                output    : out std_logic_vector (IN_SIZE -1 downto 0));
            
end select_in;

architecture Behavioral of select_in is

begin
    output <= in_1 when sel = '1' else in_2;

end Behavioral;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity addr_mux is
    generic (   ADDR_BITS   : integer := 7);
    port (      addr_1      : in  std_logic_vector (ADDR_BITS -1 downto 0);
                addr_2      : in  std_logic_vector (ADDR_BITS -1 downto 0);
                sel         : in  std_logic;
                addr_out    : out std_logic_vector (ADDR_BITS -1 downto 0));
            
end addr_mux;

architecture Behavioral of addr_mux is

begin
    addr_out <= addr_1 when sel = '1' else addr_2;

end Behavioral;

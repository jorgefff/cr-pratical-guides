
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;	 

entity Sorter is    
    generic ( M : natural := 8);
    port (  d_in_0    : in  std_logic_vector(M-1 downto 0);
            d_in_1    : in  std_logic_vector(M-1 downto 0);
            max       : out std_logic_vector(M-1 downto 0);
            min       : out std_logic_vector(M-1 downto 0));
end Sorter;

architecture Behavioral of Sorter is
begin
    max <=  d_in_0   when unsigned(d_in_0) > unsigned(d_in_1) else
            d_in_1; 
    min <=  d_in_0   when unsigned(d_in_0) < unsigned(d_in_1) else
            d_in_1;
end Behavioral;

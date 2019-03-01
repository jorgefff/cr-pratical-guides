library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ex_1_2 is
    port (  btnL    : in  std_logic;
            btnC    : in  std_logic;
            btnR    : in  std_logic;
            btnU    : in  std_logic;
            btnD    : in  std_logic; 
            sw      : in  std_logic_vector(15 downto 0); 
            led     : out std_logic_vector(15 downto 0));
end ex_1_2;

architecture Behavioral of ex_1_2 is

begin
    led(0) <=   btnC when sw(3 downto 0) = "0000" else
                btnU when sw(3 downto 0) = "0001" else 
                btnD when sw(3 downto 0) = "0010" else
                btnR when sw(3 downto 0) = "0100" else
                btnL when sw(3 downto 0) = "1000" else
                sw(4) when sw(3 downto 0) = "1111" else
                '0';
                
end Behavioral;
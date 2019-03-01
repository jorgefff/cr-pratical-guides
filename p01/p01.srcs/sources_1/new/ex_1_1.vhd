library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ex_1_1 is
    port (  btnL    : in  std_logic;
            btnC    : in  std_logic;
            btnR    : in  std_logic;
            btnU    : in  std_logic;
            btnD    : in  std_logic;  
            led     : out std_logic_vector(15 downto 0));
end ex_1_1;

architecture Behavioral of ex_1_1 is

begin
    
    led(0) <= btnL;
    led(1) <= btnC;
    led(2) <= btnR;
    led(3) <= btnU;
    led(4) <= btnD;
    
end Behavioral;







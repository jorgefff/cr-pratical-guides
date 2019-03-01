
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity ex_1_3_Adder is

    port (  sw  : in  std_logic_vector(2 downto 0);
            led : out std_logic_vector(1 downto 0));
            
end ex_1_3_Adder;

architecture Behavioral of ex_1_3_Adder is
     
begin
    
    -- sum = carry_in + op1 + op0
    led(0) <= sw(2) xor sw(1) xor sw(0);
    -- carry_out
    led(1) <=   (sw(2) and sw(1)) or
                (sw(1) and sw(0)) or
                (sw(2) and sw(0)); 
    
end Behavioral;

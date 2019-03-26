

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tarefa1 is
    port (  sw  : in std_logic_vector(1 downto 0);
            led : out std_logic_vector(1 downto 0));
end tarefa1;

architecture Behavioral of tarefa1 is
    signal a,b,c : std_logic;
begin
    b <= sw(0) and sw(1);
    
    process(a,b)
    begin
        a <= b;
        c <= a;
    end process;
    
    led <= c & c;
end Behavioral;

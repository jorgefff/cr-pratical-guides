

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tarefa3 is
    port (  sw  : in std_logic_vector(1 downto 0);
            led : out std_logic_vector(1 downto 0));
end tarefa3;

architecture Behavioral of tarefa3 is
    procedure my (  variable s : out std_logic_vector; 
                    signal a,b : std_logic) is
     begin
        s(0) := a and b;
     end procedure
     signal x1,x2 : std_logic;
begin
    
    my(x,x1,x2);
    
end Behavioral;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity HammingCounter is

    generic (   NELEMS      : integer := 100;
                DATA_WIDTH  : integer := 24;
                OUT_WIDTH   : integer := 5);
                
    port (      reset       : in  std_logic;
                data_in     : in  std_logic_vector (DATA_WIDTH*NELEMS-1 downto 0);
                data_out    : out std_logic_vector (OUT_WIDTH*NELEMS-1 downto 0);
                completed   : out std_logic := '0');
    
end HammingCounter;

architecture Behavioral of HammingCounter is
begin
    
    process (data_in, reset)
        variable weight : integer := 0;
    begin
        if (reset = '1') then
            completed <= '0';
        else
            for i in 0 to NELEMS-1 loop

                weight := 0;

                for j in 0 to DATA_WIDTH-1 loop
                    if (data_in(i * DATA_WIDTH + j) = '1') then
                        weight := weight +1;
                    end if;
                end loop;
                
                data_out(i * OUT_WIDTH + OUT_WIDTH- 1 downto i * OUT_WIDTH) 
                        <= std_logic_vector(to_unsigned(weight,OUT_WIDTH));
                   
                if (i = NELEMS-1) then
                    completed <= '1';
                end if;
                
            end loop;
        end if;
    end process;
    
end Behavioral;





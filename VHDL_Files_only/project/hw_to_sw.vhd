
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity hw_to_sw is
    
    generic (   DATA_WIDTH  : integer := 5;
                NELEMS      : integer := 100;
                ADDR_BITS   : integer := 7;
                BLOCK_ID    : std_logic := '0';
                OUT_SIZE    : integer := 7); --data_w + enable + block_id
                
    port (      clk         : in  std_logic;
                enable      : in  std_logic;
                data_in     : in  std_logic_vector (DATA_WIDTH*NELEMS-1 downto 0);
                addr        : in  std_logic_vector (ADDR_BITS-1 downto 0);
                data_out    : out std_logic_vector (OUT_SIZE downto 0));
    
end hw_to_sw;

architecture Behavioral of hw_to_sw is
    signal data, data_N : std_logic_vector(DATA_WIDTH-1 downto 0);
begin

    process(clk)
        variable idx : integer;
    begin
        if (rising_edge (clk)) then
            idx := to_integer(unsigned(addr));
            data_out(DATA_WIDTH) <= enable;
            data_out(DATA_WIDTH-1 downto 0) <= data_in ((idx+1)*DATA_WIDTH-1 downto idx*DATA_WIDTH);
            data_out(OUT_SIZE-1) <= BLOCK_ID;
            data_out(OUT_SIZE) <= '0';
        end if;
    end process;
    
end Behavioral;







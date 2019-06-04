

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top is
    port (  clk     : in  std_logic;
            sw      : in  std_logic_vector(15 downto 0);
            led     : out std_logic_vector(15 downto 0));
end top;

architecture Behavioral of top is
    signal we,rst,got_all,completed : std_logic;
    signal addr : std_logic_vector(6 downto 0);
    signal data_in : std_logic_vector (8 downto 0);
    signal data_out: std_logic_vector (800-1 downto 0);
    type STATE is (INIT, WRITING, COMPLETE);
    signal CS, NS : STATE;
begin

    
    
    unroll :    entity work.unroll_from_sw
                port map (  clk         => clk,
                            we          => we,
                            rst         => rst,
                            got_all     => got_all,
                            addr        => addr,
                            data_in     => data_in,
                            data_out    => data_out,
                            completed   => completed);
                            

end Behavioral;

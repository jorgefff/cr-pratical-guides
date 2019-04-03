
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity Mem is
    generic (   ELEMS : integer := 4;
                SIZE  : integer := 32);                
    port (
        clk       : in std_logic;
        seg       : out std_logic_vector (6 downto 0);
        an        : out std_logic_vector (7 downto 0));
        
end Mem;

architecture Behavioral of Mem is
    signal s_clk : std_logic;
    signal value : std_logic_vector(SIZE-1 downto 0) := (others => '0');
    signal idx   : integer := 0;
    
    type mem_type is array (0 to ELEMS-1) of std_logic_vector (SIZE-1 downto 0);
    signal mem : mem_type := (x"2f52f5d4",x"55555555",x"ffffffff",x"eeea4502");
    
    
    
begin
    
    process(s_clk)
    begin
        if (rising_edge(s_clk)) then
            value <= mem(idx);
            if (idx = (ELEMS-1))
                idx <= 0;
            else
                idx <= idx +1;
            end if;
        end if;
    end process;
    
    freq_divider : entity work.freq_div
    port map(   clk_in  => clk,
                clk_out => s_clk,
                reset => '0');
    
    send_to_disp : entity work.DispCont
    port map (  clk     => clk,
                -- left side
                leftL       => value(31 downto 28),
                near_leftL  => value(27 downto 24),
                near_rightL => value(23 downto 20),
                rightL	    => value(19 downto 16,
                -- right side
                leftR       => value(15 downto 12), 
                near_leftR  => value(11 downto 8),
                near_rightR => value(7 downto 4),
                rightR      => value(3 downto 0),
                -- control
                select_display => an,
                segments     => seg);


end Behavioral;









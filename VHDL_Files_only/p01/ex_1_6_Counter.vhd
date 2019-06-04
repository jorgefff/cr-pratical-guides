library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;


entity ex_1_6_Counter is
    port(   clk     : in  std_logic;
            btnC    : in  std_logic;
            sw      : in  std_logic_vector(1 downto 0);
            led     : out std_logic_vector(3 downto 0));
            
end ex_1_6_Counter;


architecture Behavioral of ex_1_6_Counter is
    signal clk_res  : std_logic;
    signal clk_out  : std_logic;
    signal clk_en   : std_logic;
    signal clk_up   : std_logic;
    signal s_count  : integer := 0;
    
    component ClkDivider
    port (  clk_in   : in  STD_LOGIC;
            clk_out  : out STD_LOGIC);
    end component;

begin
    uut : ClkDivider 
    port map( 
        clk_in => clk, 
        clk_out => clk_out);

    counter:process(clk_out, clk_res)
        variable count : integer := 0;
    begin
        if (clk_res = '1') then
            count := 0;
            
        elsif (rising_edge(clk_out) and clk_en='1') then
            if (clk_up = '1' and count < 15) then
                count := count +1;
                
            elsif (clk_up = '0' and count > 0) then
                count := count -1;
                
            end if;
        end if;
        
        led(3 downto 0) <= std_logic_vector(to_unsigned(count,4));
            
    end process;
    
    clk_res <= btnC;
    clk_en <= sw(0);
    clk_up <= not(sw(1));
    
    
end Behavioral;






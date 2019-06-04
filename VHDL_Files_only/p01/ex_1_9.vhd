
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ex_1_9 is
    port (  clk     : in  std_logic;
            btnC    : in  std_logic; -- clk enable
            btnU    : in  std_logic; -- set
            btnD    : in  std_logic; -- reset
            btnL    : in  std_logic; -- left
            sw      : in  std_logic_vector(15 downto 0);
            led     : out std_logic_vector(15 downto 0));          
end ex_1_9;

architecture Behavioral of ex_1_9 is
    
    signal s_set, s_reset, s_en, s_left, s_clk : std_logic;
    signal s_val : std_logic_vector(15 downto 0) := (others => '0');
    
    component ClkDivider
    port (  clk_in   : in  STD_LOGIC;
            clk_out  : out STD_LOGIC);
    end component;
    
begin
    uut : ClkDivider 
    port map( 
        clk_in => clk, 
        clk_out => s_clk);
        
    shift : process(s_clk)
    begin
        
        if (s_set = '1') then
            s_val <= sw;
        
        elsif (s_reset = '1') then
            s_val <= (Others => '0');
                
        elsif (s_en = '1' and rising_edge(s_clk)) then
            if (s_left = '0') then
                s_val <= s_val(0) & s_val(15 downto 1);
            else
                s_val <= s_val(14 downto 0) & s_val(15);
            end if;
        end if;
        
        s_set <= btnU;
        s_reset <= btnD;
        s_en <= not(btnC);
        s_left <= btnL;
        led <= s_val;
        
    end process;
    
end Behavioral;







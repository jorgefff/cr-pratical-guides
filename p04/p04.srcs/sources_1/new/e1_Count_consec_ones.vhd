
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity e1_Count_consec_ones is
    port (  clk : in std_logic;
            sw  : in  std_logic_vector(15 downto 0);
            led : out std_logic_vector(15 downto 0));
            --seg : out std_logic_vector(6 downto 0);
            --an  : out std_logic_vector(7 downto 0));
            
end e1_Count_consec_ones;

architecture Behavioral of e1_Count_consec_ones is

    type state is (INIT, CHECKING, ONES, FINISH);
    signal vector : std_logic_vector(15 downto 0);    
    signal CS, NS   : state := INIT;
    signal idx, n_idx : integer := 0;
    signal max, n_max : integer := 0;
    
begin

    process (clk)
    begin
        if (rising_edge (clk)) then
            CS <= NS;
            idx <= n_idx;
            max <= n_max;
        end if;
    end process;

    
    process(CS, idx, sw)
        --variable count : integer := 0;
        
    begin
        NS <= CS;
        n_idx <= idx;
        n_max <= max;
    
        case CS is
            -- Initial state
            when INIT =>
                vector <= sw;
                n_idx <= 0;
                NS <= CHECKING;
            
            -- Passing zeros, change when it finds one  
            when CHECKING =>
                if (idx > vector'left) then
                    NS <= FINISH;
                elsif (vector(idx) = '1') then
                    --count := count +1;
                    n_max <= 0;
                    NS <= ONES;
                else
                    n_idx <= idx +1;
                    NS <= CHECKING;
                 end if;
                 
            -- 
            when ONES =>
                if (idx > vector'left) then
                    NS <= FINISH;
                elsif (vector(idx) = '1') then
                    n_max <= n_max + 1;
                    NS <= ONES;
                else
                    NS <= CHECKING;
                end if;
                
                if (n_max > max) then
                    max <= n_max;
                end if;
                
            -- Show the max, restart if SW changes
            when FINISH =>
                --led <= std_logic_vector(to_unsigned(max, 16));
                if (sw /= vector) then
                    NS <= INIT;
                end if;
                
        end case;
    end process;
    
    led <= std_logic_vector(to_unsigned(max, 16));


end Behavioral;

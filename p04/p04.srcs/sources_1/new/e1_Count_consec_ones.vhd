
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity e1_Count_consec_ones is
    port (  clk : in std_logic;
            sw  : in  std_logic_vector(15 downto 0);
            led : out std_logic_vector(15 downto 0);
            seg : out std_logic_vector(6 downto 0);
            an  : out std_logic_vector(7 downto 0));
            
end e1_Count_consec_ones;

architecture Behavioral of e1_Count_consec_ones is

    type state is (INIT, CHECKING, ONES, FINISH);
    signal vector : std_logic_vector(15 downto 0);    
    signal CS, NS   : state := INIT;
    signal idx, n_idx : integer := 0;
    signal max, n_max : integer := 0;
    signal new_max, n_new_max : integer := 0;
    signal s_max : std_logic_vector(15 downto 0);
    
begin

    process (clk)
    begin
        if (rising_edge (clk)) then
            CS <= NS;
            idx <= n_idx;
            max <= n_max;
            s_max <= std_logic_vector(to_unsigned(n_max, 16));
            new_max <= n_new_max;
        end if;
    end process;

    
    process(CS, sw, idx)
    begin
        NS <= CS;
        n_max <= max;
        n_new_max <= new_max;
        n_idx <= idx;
        
        case CS is
            -- Initial state
            when INIT =>
                NS <= CHECKING;
                vector <= sw;
                n_idx <= 0;
                n_max <= 0;
                n_new_max <= 0;
                
            -- Passing zeros, change when it finds one  
            when CHECKING =>
                if (new_max > max) then
                    n_max <= new_max;
                end if;
                
                if (idx > 15) then
                    NS <= FINISH;
                elsif (vector(idx) = '0') then
                    NS <= CHECKING;
                    n_idx <= idx +1;
                else
                    NS <= ONES;
                end if;
                
            -- 
            when ONES =>
                if (new_max > max) then
                    n_max <= new_max;
                end if;
                
                if (idx > 15) then
                    NS <= FINISH;
                elsif (vector(idx) = '1') then
                    NS <= ONES;
                    n_idx <= idx +1;
                    n_new_max <= new_max +1;
                else
                    NS <= CHECKING;
                    n_new_max <= 0;
                end if;
                
            -- Show the max, restart if SW changes
            when FINISH =>
                if (sw /= vector) then
                    NS <= INIT;
                else
                    NS <= FINISH;
                end if;
        end case;
        
        led <= s_max;
                     
    end process;
    
    send_to_disp : entity work.BCD_disp
    port map (  clk     => clk,
                input   => s_max,
                an      => an,
                seg     => seg);
    

end Behavioral;

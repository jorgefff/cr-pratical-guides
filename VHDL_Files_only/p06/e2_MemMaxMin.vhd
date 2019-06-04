
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity MemMaxMin is
    generic (   ELEMS : integer := 5;
                SIZE  : integer := 32);
    port (
        clk     : in std_logic;
        btnC    : in std_logic;
        btnR    : in std_logic;
        btnL    : in std_logic;   
        led     : out std_logic_vector (15 downto 0);    
        seg     : out std_logic_vector (6 downto 0);
        an      : out std_logic_vector (7 downto 0));
        
end MemMaxMin;

architecture Behavioral of MemMaxMin is
    signal disp_en, n_disp_en : std_logic;
    type STATE is (INIT, MAX, MIN, SHOW);
    signal CS, NS : STATE := INIT;
    signal value, n_value : std_logic_vector(SIZE-1 downto 0);
    type mem_type is array (0 to ELEMS-1) of std_logic_vector (SIZE-1 downto 0);
    signal mem : mem_type := (x"b0000321", x"a0000321", x"ffffaaaa", x"00000666", x"11111111");
    
begin

    process(clk)
    begin
        if (rising_edge(clk)) then
            if (btnC = '0') then
                CS <= NS;
            else
                CS <= INIT;
            end if;
            value <= n_value;
            --disp_en <= n_disp_en;
        end if;
    end process;
    
    process(CS, btnR, btnL)
        variable curr_value : std_logic_vector(SIZE-1 downto 0);
    begin
        
        NS <= CS;
        n_value <= value;
        
        case CS is
        
            when INIT =>
                NS <= INIT;
                if (btnR = '1') then
                    NS <= MAX;
                elsif (btnL = '1') then
                    NS <= MIN;
                end if;
                disp_en <= '0';
                
            when MIN =>
                NS <= SHOW;
                curr_value := mem(0);
                for i in mem'reverse_range loop
                    if (mem(i) < curr_value) then
                        curr_value := mem(i);
                    end if;
                end loop;
                n_value <= curr_value;
                disp_en <= '0';
            
            when MAX =>
                NS <= SHOW;
                curr_value := mem(0);
                for i in mem'reverse_range loop
                    if (mem(i) > curr_value) then
                        curr_value := mem(i);
                    end if;
                end loop;
                n_value <= curr_value;
                disp_en <= '0';
                
            when SHOW =>
                disp_en <= '1';
                
        end case;
    end process;
    
    send_to_disp : entity work.DispCont
    port map (  clk     => clk,
                enable  => disp_en,
                -- left side
                leftL       => value(31 downto 28),
                near_leftL  => value(27 downto 24),
                near_rightL => value(23 downto 20),
                rightL	    => value(19 downto 16),
                -- right side
                leftR       => value(15 downto 12), 
                near_leftR  => value(11 downto 8),
                near_rightR => value(7 downto 4),
                rightR      => value(3 downto 0),
                -- control
                select_display  => an,
                segments        => seg);
    
    
end Behavioral;













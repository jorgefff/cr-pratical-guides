library IEEE;	
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;	 

entity top is
    generic (   N : integer := 16;  -- num elems
                M : integer := 8; -- elem size
                L : integer := 4); -- addr bits
                
    port (  clk     : in  std_logic;
            sw      : in  std_logic_vector(4 downto 0);
            seg     : out std_logic_vector(6 downto 0);
            an      : out std_logic_vector(7 downto 0));
            
end top;


architecture Behavioral of top is
    signal val, n_val           : std_logic_vector(M-1 downto 0);
    signal spo_1, n_spo_1       : std_logic_vector(M-1 downto 0);
    signal spo_2, n_spo_2       : std_logic_vector(M-1 downto 0);
    signal addr_1, addr_2       : std_logic_vector(3 downto 0);
    signal idx, n_idx           : natural := 0; 
    signal start_load,loaded    : std_logic;
    signal clk_d                : std_logic;
    signal comp_1, comp_2         : std_logic;
    
    type for_out is array (0 to 2*N-1) of std_logic_vector(M-1 downto 0);
    signal data_out : for_out;
    
    signal data : std_logic_vector(2*N*M-1 downto 0);
    --signal data : std_logic_vector(2*M*2**L-1 downto 0);
    
    type STATE is (INIT, LOAD, SORTING, FINISH);
    signal CS, NS : STATE  := INIT;
    
    component dist_mem_gen_0 is 
    port (  a   : in std_logic_vector;
            spo : out std_logic_vector);
    end component;
    
    component dist_mem_gen_1 is 
    port (  a   : in std_logic_vector;
            spo : out std_logic_vector);
    end component;
    
begin
    
    -- FSM Clock
    process (clk) begin
        if (rising_edge (clk)) then
            CS <= NS;
            idx <= n_idx;
            val <= n_val;
--            addr <= std_logic_vector(to_unsigned(n_idx, addr'left+1));
            spo_1 <= n_spo_1;
            spo_2 <= n_spo_2;
        end if;
    end process;
    
    -- FSM
    process (CS, idx, sw, comp_1, comp_2) begin
        NS <= CS;
        n_idx <= idx;
        n_val <= val;
       
        case CS is
            when INIT =>
                n_idx <= 0;
                if (comp_1 = '1' and comp_2 = '1') then
                    NS <= LOAD;
                end if;
                
            when LOAD =>
                
--                if (idx > N-1) then
--                    NS <= SORTING;
--                    n_idx <= 0;
--                else
--                    data_out (idx)   <= spo_1;
--                    data_out (N+idx) <= spo_2;
--                    n_idx <= idx +1;
--                end if;
                NS <= SORTING;
                
            when SORTING =>
--                for i in 0 to data_out'left/2-1 loop
--                    if (unsigned(data_out(i)) > unsigned(data_out(N*2-i))) then
--                        data_out(i) <= data_out(N*2-i);
--                        data_out(N*2-i) <= data_out(i);
--                    end if;
--                end loop;
                NS <= FINISH;
            when FINISH =>
                n_val <= data(
                    to_integer(unsigned(sw))*M+M-1 
                    downto 
                    to_integer(unsigned(sw))*M);
--                n_val <= data(23 downto 16);
--                pos_f := to_integer(unsigned(sw))*M+M-1;
--                pos_i := to_integer(unsigned(sw))*M;
                --n_val <= data_out(to_integer(unsigned(sw)));
                
        end case;
    end process;

    mem_1 : dist_mem_gen_0
    port map (  a => addr_1,
                spo => n_spo_1);
    
    mem_2 : dist_mem_gen_1
    port map (  a => addr_2,
                spo => n_spo_2);
    
    unroll_1 : entity work.Unroll_ROM
    generic map (  data_width => M,
                   address_bits => L)
    port map (  clk => clk,
                addr => addr_1,
                data_in => n_spo_1,
                rst => '0',
                data_out => data(N*M-1 downto 0),
                completed => comp_1);
    
    unrol_2 : entity work.Unroll_ROM
    generic map (  data_width => M,
                   address_bits => L)
    port map (  clk => clk,
                addr => addr_2,
                data_in => n_spo_2,
                rst => '0',
                data_out => data(2*M*N-1 downto N*M),
                completed => comp_2);
    
    sendToDisp : entity work.sendToDisp
    port map (  clk => clk,
                en => "00000011",
                leftL       => "1111", 
                near_leftL  => "1111",
                near_rightL => "1111", 
                rightL      => "1111",
                leftR       => "1111", 
                near_leftR  => "1111",
                near_rightR => val(7 downto 4), 
                rightR	    => val(3 downto 0),
                select_display => an,
                segments => seg);
    
end Behavioral;

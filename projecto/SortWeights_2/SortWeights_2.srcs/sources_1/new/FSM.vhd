
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity TopFSM is

    generic (   NELEMS          : integer := 100;   -- Num of words
                DATA_WIDTH      : integer := 9;     -- Num of bits per word
                WEIGHT_WIDTH    : integer := 4;     -- ceiling (log2 (DATA_WIDTH))
                MEM_ADDR_BITS   : integer := 7);    -- ceiling (log2 (NELEMS))
                
    port (      clk     : in  std_logic;
                btnC    : in  std_logic;
                btnU    : in  std_logic;
                btnD    : in  std_logic;
                btnL    : in  std_logic;
                btnR    : in  std_logic;
                sw      : in  std_logic_vector (15 downto 0);
                led     : out std_logic_vector (15 downto 0));
end TopFSM;

architecture  Behavioral of TopFSM is
    
    type STATE is (INIT, UNROLLING, GET_WEIGHTS, SORTING, DISPLAY);
    signal CS, NS : STATE := INIT;
    
    signal unrolled         : std_logic_vector (NELEMS*DATA_WIDTH-1 downto 0);
    signal sorted_unr       : std_logic_vector (NELEMS*DATA_WIDTH-1 downto 0);
    signal unused_unr       : std_logic_vector (DATA_WIDTH*2**MEM_ADDR_BITS-NELEMS*DATA_WIDTH-1 downto 0); 
    signal weights          : std_logic_vector (NELEMS*WEIGHT_WIDTH-1 downto 0);
    signal sorted_weights   : std_logic_vector (NELEMS*WEIGHT_WIDTH-1 downto 0);
    signal sorter_data_out  : std_logic_vector (NELEMS*WEIGHT_WIDTH-1 downto 0);
    
    signal is_sorted        : std_logic := '0';
    signal got_weights      : std_logic := '0';
    signal is_unrolled      : std_logic := '0';
    
    signal mem_spo          : std_logic_vector (DATA_WIDTH-1 downto 0);
    signal mem_addr         : std_logic_vector (MEM_ADDR_BITS-1 downto 0);
    
    signal reset            : std_logic;
    
    signal reset_sort       : std_logic := '1';
    signal reset_weights    : std_logic := '1';
    signal reset_unroll     : std_logic := '1';
    signal n_reset_sort     : std_logic := '1'; --next
    signal n_reset_weights  : std_logic := '1'; --next
    signal n_reset_unroll   : std_logic := '1'; --next
    
    signal idx              : integer := 0;
     
    component dist_mem_gen_0 is 
    port (  a   : in std_logic_vector;
            spo : out std_logic_vector);
    end component;
    
begin
    
    reset <= btnC;
    idx   <= to_integer(unsigned(sw)); 
    
    
    process (clk)
    begin
        if (rising_edge (clk)) then
            if (reset = '1') then
                CS <= INIT;
            else
                CS <= NS;
                reset_unroll <= n_reset_unroll;
                reset_weights <= n_reset_weights;
                reset_sort <= n_reset_sort;
            end if;
        end if;        
    end process;
    
    
    process (CS, is_sorted, got_weights, is_unrolled, idx)        
    begin
        
        NS <= CS;
        led <= (others => '0');
        
        n_reset_unroll <= reset_unroll;
        n_reset_weights <= reset_weights; 
        n_reset_sort  <= reset_sort;
        
        case CS is
        when INIT =>
            led(15 downto 11) <= "00001";   --DEBUG
            led(DATA_WIDTH-1 downto 0)      --DEBUG
                    <= unrolled(idx * DATA_WIDTH + DATA_WIDTH - 1 downto idx * DATA_WIDTH);
            
            n_reset_unroll <= '1';
            n_reset_weights <= '1';
            n_reset_sort  <= '1';
            
            if (btnU = '1') then
                NS <= UNROLLING;
            end if;
            
        when UNROLLING =>
            led(15 downto 11) <= "00010";   --DEBUG
            led(DATA_WIDTH-1 downto 0)      --DEBUG
                    <= unrolled(idx * DATA_WIDTH + DATA_WIDTH - 1 downto idx * DATA_WIDTH);
            
            n_reset_unroll <= '0';
            if (is_unrolled = '1') then
                if (btnR = '1') then
                    NS <= GET_WEIGHTS;
                end if;
            end if;
            
        when GET_WEIGHTS =>
            led(15 downto 11) <= "00100";   --DEBUG
            led(WEIGHT_WIDTH-1 downto 0)    --DEBUG
                    <= weights(idx * WEIGHT_WIDTH + WEIGHT_WIDTH - 1 downto idx * WEIGHT_WIDTH);
            
            n_reset_weights <= '0';
            if (got_weights = '1') then
                if (btnD = '1') then
                    NS <= SORTING;
                end if;
            end if;
            
        when SORTING =>
            led(15 downto 11) <= "01000";   --DEBUG
            led(WEIGHT_WIDTH-1 downto 0)    --DEBUG
                    <= sorted_weights(idx * WEIGHT_WIDTH + WEIGHT_WIDTH - 1 downto idx * WEIGHT_WIDTH);
                    
            n_reset_sort <= '0';
            if (is_sorted = '1') then
                if (btnL = '1') then
                    NS <= DISPLAY;
                end if;
            end if;
            
        when DISPLAY =>            
            led(15 downto 11) <= "10000";   --DEBUG
            led(WEIGHT_WIDTH-1 downto 0)    --DEBUG
                    <= sorted_weights(idx * WEIGHT_WIDTH + WEIGHT_WIDTH - 1 downto idx * WEIGHT_WIDTH);
            
        end case;
    end process;
    
            
    Sorter :    entity work.IterativeSorter
                generic map (   NELEMS      => NELEMS,
                                DATA_WIDTH  => WEIGHT_WIDTH)
                port map (      clk         => clk,
                                reset       => reset_sort,
                                data_in     => weights,
                                data_out    => sorted_weights,
                                is_sorted   => is_sorted);
    
    
    HammCounter :   entity work.HammingCounter
                    generic map (   NELEMS      => NELEMS,
                                    DATA_WIDTH  => DATA_WIDTH,
                                    OUT_WIDTH   => WEIGHT_WIDTH)
                    port map (      data_in     => unrolled,
                                    data_out    => weights,
                                    reset       => reset_weights,
                                    completed   => got_weights);
                                    
    
    unroll :    entity work.unroll_mem
                generic map (   data_width      => DATA_WIDTH,
                                address_bits    => MEM_ADDR_BITS)
                port map (      clk             => clk,
                                addr            => mem_addr,
                                data_in         => mem_spo,
                                rst             => reset_unroll,
                                data_out(DATA_WIDTH*2**MEM_ADDR_BITS-1 downto NELEMS*DATA_WIDTH)
                                                => unused_unr,
                                data_out(NELEMS*DATA_WIDTH-1 downto 0)        
                                                => unrolled,
                                completed       => is_unrolled);
                              
                                
    ROM :   dist_mem_gen_0
            port map (  a   => mem_addr,
                        spo => mem_spo);
                        
end Behavioral;






library IEEE; 
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all; 
use IEEE.numeric_std.all;

entity unroll_from_sw is
    generic (   DATA_WIDTH : integer := 9;
                ADDR_BITS : integer := 7 );
                
    port (  clk         : in  std_logic;
            we          : in  std_logic;
            got_all     : in  std_logic;
            addr        : in  std_logic_vector (ADDR_BITS-1 downto 0);
            data_in     : in  std_logic_vector (DATA_WIDTH-1 downto 0);
            rst         : in  std_logic;
            data_out    : out std_logic_vector (DATA_WIDTH*2**ADDR_BITS-1 downto 0);
            completed   : out std_logic );
    
end unroll_from_sw;

architecture Behavioral of unroll_from_sw is
    type STATE is (INIT, READING, COMPLETE);
    signal CS, NS : STATE;
    constant depth : integer := 2**ADDR_BITS;
    
    signal data_tmp : std_logic_vector (DATA_WIDTH*2**ADDR_BITS-1 downto 0);
    signal n_data   : std_logic_vector (DATA_WIDTH-1 downto 0);
    signal n_i      : integer;
    signal write    : std_logic;
    signal comp     : std_logic;
    
begin

    process (clk)
    begin
        if falling_edge(clk) then
            if (rst = '1') then 
                CS <= init;
                data_tmp <= (others => '0');
            else 
                CS <= NS;
                write <= we;
                data_tmp((n_i+1)*DATA_WIDTH downto n_i*DATA_WIDTH) <= n_data;
            end if;
        end if;
    end process;

    process (CS, addr)
        variable i : integer range 0 to depth-1;
    begin
        comp <= '0';
        
        case CS is
        when INIT =>
            if (write = '1') then
                NS <= READING;
            end if;
            
        when READING =>
            if (got_all = '1') then
                NS <= COMPLETE;
            else
                n_i <= to_integer(unsigned(addr));
                n_data <= data_in;
            end if;
            
        when COMPLETE =>
            comp <= '1';
        end case;
    end process;
    
    data_out <= data_tmp;
    completed <= comp;

end Behavioral;
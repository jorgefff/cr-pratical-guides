library IEEE; 
use IEEE.std_logic_1164.all; 
use IEEE.STD_LOGIC_ARITH.ALL; 
use IEEE.std_logic_unsigned.all;

entity IterativeSorter is

    generic(    NELEMS      : integer:=8;      
                DATA_WIDTH  : integer:=8);
                
    port (      clk         : in  std_logic;
                reset       : in  std_logic;
                is_sorted   : out std_logic;
                data_in     : in  std_logic_vector (NELEMS*DATA_WIDTH-1 downto 0);
                data_out    : out std_logic_vector (NELEMS*DATA_WIDTH-1 downto 0));
                
end entity IterativeSorter;

architecture Behavioral of IterativeSorter is
    type state_type is (initial_state, even, odd, completed); -- enumeration type for the FSM states
    signal C_S, N_S : state_type;
    type in_data is array (NELEMS-1 downto 0) of std_logic_vector(DATA_WIDTH-1 downto 0);
    signal MyAr, N_MyAr : in_data;
    signal sorting_completed, N_sorting_completed : std_logic;
    
begin

    process (clk) -- this is a sequential process
    begin
        if rising_edge(clk) then
            if (reset = '1') then 
                C_S <= initial_state; 
                MyAr <= (others=>(others => '0'));
            else 
                C_S <= N_S;
                MyAr <= N_MyAr;
                sorting_completed <= N_sorting_completed;
            end if;
        end if;
    end process;
    
    
    process (C_S, data_in, sorting_completed, MyAr) -- this is a combinational process
    begin
        is_sorted <= '0';
        N_S <= C_S;
        N_MyAr <= MyAr;
        N_sorting_completed <= sorting_completed;
        
        case C_S is        
        when initial_state => 
            N_S <= even; 
            N_sorting_completed <= '0'; 
            for i in NELEMS-1 downto 0 loop
                N_MyAr(i) <= data_in(DATA_WIDTH*(i+1)-1 downto DATA_WIDTH*i);
            end loop;
        
        when even => 
            N_S <= odd;
            if (sorting_completed = '0') then 
                N_sorting_completed <= '1';
                for i in 0 to NELEMS/2-1 loop
                    if MyAr(2*i) < MyAr(2*i+1) then
                        N_MyAr(2*i) <= MyAr(2*i+1); 
                        N_MyAr(2*i+1) <= MyAr(2*i);
                    else null;
                    end if;
                end loop;
            else 
                N_S <= completed;
            end if;
            
        when odd => 
            N_S <= even;
            for i in 0 to NELEMS/2-2 loop
                if MyAr(2*i+1) < MyAr(2*i+2) then
                    N_sorting_completed <= '0'; 
                    N_MyAr(2*i+1) <= MyAr(2*i+2); 
                    N_MyAr(2*i+2) <= MyAr(2*i+1);
                else null;
                end if;
            end loop;
        
        when completed =>
            N_S <= completed;
            is_sorted <= '1';
        
        when others => 
            N_S <= initial_state;
        
        end case;
    end process;
    
    process (MyAr)
    begin
        for i in NELEMS-1 downto 0 loop
            data_out(DATA_WIDTH*(i+1)-1 downto DATA_WIDTH*i) <= MyAr(i);
        end loop;
    end process;
    
end Behavioral;






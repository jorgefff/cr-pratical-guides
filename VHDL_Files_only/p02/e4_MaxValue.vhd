

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity e4_MaxValue is
    port (  sw  : in  std_logic_vector(15 downto 0);
            seg : out std_logic_vector(6 downto 0);
            an  : out std_logic_vector(7 downto 0));
            
end e4_MaxValue;

architecture Behavioral of e4_MaxValue is
    --type my_array is array (0 to 3) of std_logic_vector(2 downto 0);
    --constant c_test : my_array := ("000","010","111","101");
    --signal s_test : my_array;
    signal s_v0 : std_logic_vector(3 downto 0);
    signal s_v1 : std_logic_vector(3 downto 0);
    signal s_v2 : std_logic_vector(3 downto 0);
    signal s_v3 : std_logic_vector(3 downto 0);
    signal s_val : std_logic_vector(3 downto 0);
    
    component send_to_disp
    port(   bcd : in std_logic_vector(3 downto 0);
            select_disp : in std_logic_vector(2 downto 0);
            segments : out std_logic_vector(6 downto 0);
            toggle_disp  : out std_logic_vector(7 downto 0));
    end component;
    
begin
    
    s_v0 <= sw(3 downto 0);
    s_v1 <= sw(7 downto 4);
    s_v2 <= sw(11 downto 8);
    s_v3 <= sw(15 downto 12);
    
    to_seg : send_to_disp
    port map (  bcd => s_val,
                select_disp => "000",
                segments => seg,
                toggle_disp => an );
                
    process(sw)
    begin
        if (s_v0 > s_v1 and s_v0 > s_v2 and s_v0 > s_v3) then
            s_val <= s_v0;
        elsif (s_v1 > s_v0 and s_v1 > s_v2 and s_v1 > s_v3) then
            s_val <= s_v1;
        elsif (s_v2 > s_v0 and s_v2 > s_v1 and s_v2 > s_v3) then
            s_val <= s_v2;
        else
            s_val <= s_v3;
        end if;
    end process;
    
    
    
end Behavioral;

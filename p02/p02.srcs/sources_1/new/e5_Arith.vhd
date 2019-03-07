
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity e5_Arith is
    port (  sw : in std_logic_vector(15 downto 0);
            btnL : in std_logic;    -- mod
            btnC : in std_logic;    -- abs
            btnR : in std_logic;    -- rem
            seg : out std_logic_vector(6 downto 0));
            
end e5_Arith;

architecture Behavioral of e5_Arith is
    signal s_v0, s_v1 : integer;
    signal s_res : integer;
    signal s_bin : std_logic_vector(7 downto 0);
    
    component send_to_disp
    port(   bcd : in std_logic_vector(3 downto 0);
            select_disp : in std_logic_vector(2 downto 0);
            segments : out std_logic_vector(6 downto 0);
            toggle_disp  : out std_logic_vector(7 downto 0));
    end component;
    
    
begin
    
    s_v0 <= to_integer(signed(sw(7 downto 0)));
    s_v1 <= to_integer(signed(sw(15 downto 8)));
    
    to_seg : send_to_disp
    port map (  bcd => s_res,
                select_disp => "000",
                segments => seg,
                toggle_disp => an );


    process(btnL, btnC, btnR)
    begin
        if (btnL = '1') then
            s_res <= s_v0 mod s_v1;
        elsif (btnC = '1') then
            s_res <= abs(s_v0);
        elsif (btnR = '1') then
            s_res <= s_v0 rem s_v1;
        end if;
    end process;
    
end Behavioral;


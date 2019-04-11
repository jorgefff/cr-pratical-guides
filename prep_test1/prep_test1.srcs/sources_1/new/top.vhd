library IEEE;	
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;		 

entity top is
    port (  clk     : in  std_logic;
            btnC    : in  std_logic;
            sw      : in  std_logic_vector(3 downto 0);
            seg     : out std_logic_vector(6 downto 0);
            an      : out std_logic_vector(7 downto 0));
            
end top;


architecture Behavioral of top is
    signal s_val : std_logic_vector(7 downto 0);
    signal s_douta1, s_douta2 : std_logic_vector(7 downto 0);
    
    component blk_mem_gen_0 is 
    port (  clka  : in std_logic;
            addra : in std_logic_vector;
            douta : out std_logic_vector);
    end component;
    
    component blk_mem_gen_1 is 
    port (  clka  : in std_logic;
            addra : in std_logic_vector;
            douta : out std_logic_vector);
    end component;
    
begin
    
    
    
    mem_1 : blk_mem_gen_0
    port map (  clka => clk,
                addra => sw,
                douta => s_douta1);
    
    mem_2 : blk_mem_gen_1
    port map (  clka => clk,
                addra => sw,
                douta => s_douta2);
    
    s_val <= s_douta1 when btnC = '0' else s_douta2;
    
    sendToDisp : entity work.sendToDisp
    port map (  clk => clk,
                en => "00000011",
                leftL       => "1111", 
                near_leftL  => "1111",
                near_rightL => "1111", 
                rightL      => "1111",
                leftR       => "1111", 
                near_leftR  => "1111",
                near_rightR => s_val(7 downto 4), 
                rightR	    => s_val(3 downto 0),
                select_display => an,
                segments => seg);

end Behavioral;

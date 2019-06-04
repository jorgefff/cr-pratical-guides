library IEEE;	 
use IEEE.STD_LOGIC_1164.all; 
use IEEE.STD_LOGIC_UNSIGNED.all;
        
entity sendToDisp is 
    port ( 	       clk		            : in  std_logic;
                   en                   : in  std_logic_vector (7 downto 0);
	               leftL, near_leftL	: in std_logic_vector (3 downto 0);
	               near_rightL, rightL 	: in std_logic_vector (3 downto 0);
	               leftR, near_leftR	: in std_logic_vector (3 downto 0);
	               near_rightR, rightR	: in std_logic_vector (3 downto 0);
	               select_display	    : out std_logic_vector (7 downto 0);
	               segments 	        : out std_logic_vector (6 downto 0));
end sendToDisp;
architecture Behavioral of sendToDisp is
   signal Display 	     : std_logic_vector(2 downto 0);
   signal div    	     : std_logic_vector(16 downto 0);
   signal convert_me	 : std_logic_vector(3 downto 0);
   signal enable         : std_logic;
begin
	div<= div + 1 when rising_edge(clk);
	Display <= div(16 downto 14);
process(Display,  leftL, near_leftL, near_rightL, rightL, leftR, near_leftR, near_rightR, rightR)
begin	-- activação sequencial dos displays
   if       	  Display ="111" then	select_display <= "01111111"; convert_me <= leftL; enable <= en(7);
   elsif 	      Display ="110" then	select_display <= "10111111"; convert_me <= near_leftL; enable <= en(6);
   elsif 	      Display ="101" then	select_display <= "11011111"; convert_me <= near_rightL; enable <= en(5);
   elsif 	      Display ="100" then	select_display <= "11101111"; convert_me <= rightL; enable <= en(4);
   elsif	      Display ="011" then	select_display <= "11110111"; convert_me <= leftR; enable <= en(3);
   elsif 	      Display ="010" then	select_display <= "11111011"; convert_me <= near_leftR; enable <= en(2);
   elsif 	      Display ="001" then	select_display <= "11111101"; convert_me <= near_rightR; enable <= en(1);
   else 			                    select_display <= "11111110"; convert_me <= rightR; enable <= en(0);
   end if;	
end process;
decoder : entity work.segment_decoder		-- descodificador de segmentos
	      port map (enable, convert_me, segments);
end Behavioral;

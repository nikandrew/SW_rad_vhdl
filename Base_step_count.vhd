library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity Step_count is
port(   CLK	  		: in std_logic;
        RES     	: in std_logic;
        OUT_STEP   	: out std_logic_vector(2 downto 0)); 
end Step_count;

architecture Step_count_arch of Step_count is  
signal counter : std_logic_vector(2 downto 0);
begin 
	
	OUT_STEP <= counter; 
		   
    process (CLK,RES)
    begin
        if(RES = '1') then
            counter <= "110";            
        elsif(rising_edge(CLK)) then 
            if(counter(1 downto 0) = "10") then
            	counter(1 downto 0) <= (others => '0');
            	counter(2) <= not counter(2);
            else
                counter <= counter + '1';
            end if;        
        end if;
    end process;
end Step_count_arch;
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity Step_count is
port(   CLK	  		: in std_logic;
        RES     	: in std_logic;
        ERROR_COUNT	: in std_logic_vector(1 downto 0);
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
	        if(ERROR_COUNT = "01") then    
	            if(counter(1 downto 0) = "00") then
	            	counter(1 downto 0) <= "10";	            	
	            elsif(counter(1 downto 0) = "01" ) then
	            	counter(1 downto 0) <= "01";	            	
	            else
	                counter(1 downto 0) <= "00";
	            	counter(2) <= not counter(2);
	            end if;   
	      	elsif (ERROR_COUNT = "10") then
	      		if(counter(1 downto 0) = "00") then
	            	counter(1 downto 0) <= "00";
	            	counter(2) <= not counter(2);	            	
	            elsif(counter(1 downto 0) = "01" ) then
	            	counter(1 downto 0) <= "00";
	            	counter(2) <= not counter(2);	            	
	            else
	                counter(1 downto 0) <= "01";
	            end if;  
	      	else
	      		 if(counter(1 downto 0) = "10") then
	            	counter(1 downto 0) <= (others => '0');
	            	counter(2) <= not counter(2);
	            else
	                counter <= counter + '1';
	            end if;   
	       	end if;    
        end if;
    end process;
end Step_count_arch;
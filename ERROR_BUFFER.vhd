library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity Error_buffer is
port(   RES     	: in std_logic;
        ERROR_SYNC	: in std_logic;
        ERROR_BUFFER : in std_logic_vector(1 downto 0);
        IN_BUFFER		: in std_logic_vector(2 downto 0);
        OUT_BUFFER 	: out std_logic_vector(2 downto 0)); 
end Error_buffer;

architecture Error_buffer_arch of Error_buffer is  
begin 
	process (RES, ERROR_SYNC )
    begin
        if(RES = '1') then
            OUT_BUFFER <= (others => '1'); 
        elsif(rising_edge(ERROR_SYNC)) then
        	if(ERROR_BUFFER = "01") then
        		OUT_BUFFER(0) <= not IN_BUFFER(0);
        		OUT_BUFFER(1) <= IN_BUFFER(1);
        		OUT_BUFFER(2) <= IN_BUFFER(2);
          	elsif(ERROR_BUFFER = "10") then 
        		OUT_BUFFER(1) <= not IN_BUFFER(1);
        		OUT_BUFFER(0) <= IN_BUFFER(0);
        		OUT_BUFFER(2) <= IN_BUFFER(2);        		
        	elsif(ERROR_BUFFER = "11") then
        		OUT_BUFFER(2) <= not IN_BUFFER(2);
        		OUT_BUFFER(1) <= IN_BUFFER(1);
        		OUT_BUFFER(0) <= IN_BUFFER(0);
        	end if;  
        end if;
    end process;
end Error_buffer_arch;
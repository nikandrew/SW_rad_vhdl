library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity Form_word is
port(   IN_BUFFER_1	: in std_logic_vector(2 downto 0);
		IN_BUFFER_2	: in std_logic_vector(2 downto 0);
		NUMBER_BUFFER : in std_logic;
		STATUS		: in std_logic_vector(2 downto 0);
        OUT_WORD 	: out std_logic); 
end Form_word;

architecture Form_word_arch of Form_word is  
begin 
	process(STATUS, IN_BUFFER_1, IN_BUFFER_2, NUMBER_BUFFER)
	begin
		if(NUMBER_BUFFER = '0') then
	        if(STATUS = "001") then
	        	OUT_WORD <= IN_BUFFER_1(0) XOR IN_BUFFER_1(1);  
	 		elsif(STATUS = "011") then
	        	OUT_WORD <= IN_BUFFER_1(0) XOR IN_BUFFER_1(2); 
	       	elsif(STATUS = "101") then
	        	OUT_WORD <= IN_BUFFER_1(1) XOR IN_BUFFER_1(2);     
	        end if;
	    else
	        if(STATUS = "001") then
	        	OUT_WORD <= IN_BUFFER_2(0) XOR IN_BUFFER_2(1);  
	 		elsif(STATUS = "011") then
	        	OUT_WORD <= IN_BUFFER_2(0) XOR IN_BUFFER_2(2); 
	       	elsif(STATUS = "101") then
	        	OUT_WORD <= IN_BUFFER_2(1) XOR IN_BUFFER_2(2);     
	        end if;
	    end if;
    end process;
end Form_word_arch;
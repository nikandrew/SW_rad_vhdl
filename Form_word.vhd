library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity Form_word is
port(   IN_BUFFER_1	: in std_logic_vector(2 downto 0);
		IN_BUFFER_2	: in std_logic_vector(2 downto 0);
		NUMBER_BUFFER : in std_logic;
		ERROR_WORD	: in std_logic_vector(1 downto 0);
		STATUS		: in std_logic_vector(2 downto 0);
        OUT_WORD 	: out std_logic); 
end Form_word;

architecture Form_word_arch of Form_word is  
signal inner_buffer_1, inner_buffer_2 : std_logic_vector(2 downto 0);
begin 
	process(IN_BUFFER_2, IN_BUFFER_1, ERROR_WORD)
	begin
		if(ERROR_WORD = "01") then
			inner_buffer_1(0) <= NOT IN_BUFFER_1(0);
			inner_buffer_1(1) <= IN_BUFFER_1(1);
			inner_buffer_1(2) <= IN_BUFFER_1(2);
			inner_buffer_2(0) <= NOT IN_BUFFER_2(0);
			inner_buffer_2(1) <= IN_BUFFER_2(1);
			inner_buffer_2(2) <= IN_BUFFER_2(2);
		elsif(ERROR_WORD = "10") then
			inner_buffer_1(0) <= IN_BUFFER_1(0);
			inner_buffer_1(1) <= NOT IN_BUFFER_1(1);
			inner_buffer_1(2) <= IN_BUFFER_1(2);
			inner_buffer_2(0) <= IN_BUFFER_2(0);
			inner_buffer_2(1) <= NOT IN_BUFFER_2(1);
			inner_buffer_2(2) <= IN_BUFFER_2(2);
		elsif(ERROR_WORD = "11") then
			inner_buffer_1(0) <= IN_BUFFER_1(0);
			inner_buffer_1(1) <= IN_BUFFER_1(1);
			inner_buffer_1(2) <= NOT IN_BUFFER_1(2);
			inner_buffer_2(0) <= IN_BUFFER_2(0);
			inner_buffer_2(1) <= IN_BUFFER_2(1);
			inner_buffer_2(2) <= NOT IN_BUFFER_2(2);
			
		else
			inner_buffer_1 <= IN_BUFFER_1;
			inner_buffer_2 <= IN_BUFFER_2;
		end if;
		
	end process;
		
	
	
	process(STATUS, inner_buffer_1, inner_buffer_2, NUMBER_BUFFER)
	begin
		if(NUMBER_BUFFER = '0') then
	        if(STATUS = "001") then
	        	OUT_WORD <= inner_buffer_1(0) XOR inner_buffer_1(1);  
	 		elsif(STATUS = "011") then
	        	OUT_WORD <= inner_buffer_1(0) XOR inner_buffer_1(2); 
	       	elsif(STATUS = "101") then
	        	OUT_WORD <= inner_buffer_1(1) XOR inner_buffer_1(2);     
	        end if;
	    else
	        if(STATUS = "001") then
	        	OUT_WORD <= inner_buffer_2(0) XOR inner_buffer_2(1);  
	 		elsif(STATUS = "011") then
	        	OUT_WORD <= inner_buffer_2(0) XOR inner_buffer_2(2); 
	       	elsif(STATUS = "101") then
	        	OUT_WORD <= inner_buffer_2(1) XOR inner_buffer_2(2);     
	        end if;
	    end if;
    end process;
end Form_word_arch;
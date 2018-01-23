library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity Form_word_channel is
port(   IN_BUFFER_1	: in std_logic_vector(2 downto 0);
		IN_BUFFER_2	: in std_logic_vector(2 downto 0);
		NUMBER_BUFFER : in std_logic;
		INPUT_DATA	: in std_logic;
		ERROR_WORD	: in std_logic_vector(2 downto 0);
		STATUS		: in std_logic_vector(2 downto 0);
        OUT_WORD 	: out std_logic); 
end Form_word_channel;

architecture Form_word_channel_arch of Form_word_channel is  
signal inner_buffer_1, inner_buffer_2 : std_logic_vector(2 downto 0);
begin 

		inner_buffer_1 <= IN_BUFFER_1;
		inner_buffer_2 <= IN_BUFFER_2;

	process(ERROR_WORD, STATUS, inner_buffer_1, inner_buffer_2, NUMBER_BUFFER, INPUT_DATA)
	begin
		if(NUMBER_BUFFER = '0') then
			if(STATUS = "001") then
				if(ERROR_WORD = "001") then
					OUT_WORD <= NOT (inner_buffer_1(0) XOR inner_buffer_1(1));  
				else
					OUT_WORD <= inner_buffer_1(0) XOR inner_buffer_1(1);
				end if;
			elsif(STATUS = "011") then
				if(ERROR_WORD = "010") then
					OUT_WORD <= NOT (inner_buffer_1(0) XOR inner_buffer_1(2));  
				else
					OUT_WORD <= inner_buffer_1(0) XOR inner_buffer_1(2);
				end if;
			elsif(STATUS = "101") then
				if(ERROR_WORD = "011") then
					OUT_WORD <= NOT (inner_buffer_1(1) XOR inner_buffer_1(2));  
				else
					OUT_WORD <= inner_buffer_1(1) XOR inner_buffer_1(2);
				end if;     
			elsif(STATUS = "111") then
				if(ERROR_WORD = "100") then
					OUT_WORD <= NOT INPUT_DATA;  
				else
					OUT_WORD <= INPUT_DATA;
				end if;  
	        end if;
	    else
	    	if(STATUS = "001") then
	    		if(ERROR_WORD = "001") then
					OUT_WORD <= NOT (inner_buffer_2(0) XOR inner_buffer_1(1));  
				else
					OUT_WORD <= inner_buffer_2(0) XOR inner_buffer_2(1);
				end if;
			elsif(STATUS = "011") then
				if(ERROR_WORD = "010") then
					OUT_WORD <= NOT (inner_buffer_2(0) XOR inner_buffer_1(2));  
				else
					OUT_WORD <= inner_buffer_2(0) XOR inner_buffer_2(2);
				end if;
			elsif(STATUS = "101") then
				if(ERROR_WORD = "011") then
					OUT_WORD <= NOT (inner_buffer_2(1) XOR inner_buffer_1(2));  
				else
					OUT_WORD <= inner_buffer_2(1) XOR inner_buffer_2(2);
				end if;	 
			elsif(STATUS = "111") then
				if(ERROR_WORD = "100") then
					OUT_WORD <= NOT INPUT_DATA;  
				else
					OUT_WORD <= INPUT_DATA;
				end if;         	     
	        end if;
	    end if;
    end process;
end Form_word_channel_arch;
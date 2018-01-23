library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

entity SW_Channel_Coder is
port(		CLK				: in std_logic;
			RES 		    : in std_logic;
						
        	ERROR_BUFFER 	: in std_logic_vector(1 downto 0);
        	ERROR_WORD 		: in std_logic_vector(2 downto 0);
        	
        	INPUT_DATA		: in std_logic;
        	STEP_INPUT		: in std_logic_vector(1 downto 0);
        	
			OUT_WORD		: out std_logic;
			
			TEST_F2M		: out std_logic;
			TEST_BUFFER_1 	: out std_logic_vector(2 downto 0);
			TEST_BUFFER_2 	: out std_logic_vector(2 downto 0);
			TEST_NUMBER_BUFFER : out std_logic;
			TEST_OUTPUT		: out std_logic;
			TEST_WORD		: out std_logic_vector(3 downto 0);
			TEST			: out std_logic_vector(15 downto 0));
end SW_Channel_Coder;

architecture Main_ARCH_CHANNEL_CODER of SW_Channel_Coder is 
signal f2m, number_buffer, output	: std_logic;
signal out_buffer_1, out_buffer_2, status : std_logic_vector(2 downto 0);
begin
	TEST_F2M <= f2m;
	TEST_BUFFER_1 <= out_buffer_1;
	TEST_BUFFER_2 <= out_buffer_2;
	TEST_NUMBER_BUFFER <= number_buffer;
	TEST_OUTPUT <= output;
	
	OUT_WORD <= output;
	DIV: entity work.DIV_F2M
		port map(  	RES			=> RES,
					CLK			=> CLK,
					STATUS		=> status,
					NUMBER_BUFFER => number_buffer,
					F2M			=> f2m);
					
	Form_buffer: entity work.Form_buffer_channel
		port map(
			CLK        		=> f2m,
			RES       	 	=> RES,
			ERROR_BUFFER 	=> ERROR_BUFFER,
			INPUT_STEP    	=> STEP_INPUT,
			INPUT_DATA		=> INPUT_DATA,
			OUT_BUFFER_1 	=> out_buffer_1,
			OUT_BUFFER_2 	=> out_buffer_2);
			
	
	Form_word: entity work.Form_word_channel
		port map(
			IN_BUFFER_1	=> out_buffer_1,
			IN_BUFFER_2 => out_buffer_2, 
			NUMBER_BUFFER => number_buffer,
			INPUT_DATA		=> INPUT_DATA,
			ERROR_WORD => ERROR_WORD,
			STATUS    => status,
			OUT_WORD  => output);
			
	Word_test: entity work.Word_test_channel
		port map(
			IN_BUFFER_1	=> out_buffer_1,
			IN_BUFFER_2 => out_buffer_2, 
			CLK			=> CLK,
			F2M			=> f2m,
			RES			=> RES,
			INPUT_DATA		=> INPUT_DATA,			
			NUMBER_BUFFER => number_buffer,
			ERROR_WORD => ERROR_WORD,
			OUT_WORD  => TEST_WORD,
			TEST => TEST(0));
	
						
end Main_ARCH_CHANNEL_CODER; 
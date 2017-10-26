library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

entity SW_Count_Coder is
port(		CLK				: in std_logic;
			RES 		    : in std_logic;
			
			ERROR_SYNC	: in std_logic;
        	ERROR_BUFFER : in std_logic_vector(1 downto 0);
        	ERROR_COUNTER : in std_logic_vector(1 downto 0);
        	ERROR_WORD : in std_logic_vector(1 downto 0);
        	
			OUT_WORD		: out std_logic;
			TEST			: out std_logic_vector(15 downto 0));
end SW_Count_Coder;

architecture Main_ARCH_COUNT_CODER of SW_Count_Coder is 
signal f2m, number_buffer	: std_logic;
signal step, out_buffer_1, out_buffer_2, status : std_logic_vector(2 downto 0);
begin
	TEST(0) <= f2m;
	TEST(3 downto 1) <= step;
	TEST(6 downto 4) <= out_buffer_1;
	TEST(9 downto 7) <= out_buffer_2;
	TEST(10) <= number_buffer;
	DIV: entity work.DIV_F2M
		port map(  	RES			=> RES,
					CLK			=> CLK,
					STATUS		=> status,
					NUMBER_BUFFER => number_buffer,
					F2M			=> f2m);
					
	COUNT: entity work.Step_count
		port map(  	CLK			=> f2m,
					RES			=> RES,
					ERROR_COUNT => ERROR_COUNTER,
					OUT_STEP	=> step);
	
	Form_buffer: entity work.Form_buffer
		port map(
			CLK        => f2m,
			RES        => RES,
			ERROR_BUFFER => ERROR_BUFFER,
			IN_STEP    => step,
			OUT_BUFFER_1 => out_buffer_1,
			OUT_BUFFER_2 => out_buffer_2);
			
	
	Form_word: entity work.Form_word
		port map(
			IN_BUFFER_1	=> out_buffer_1,
			IN_BUFFER_2 => out_buffer_2, 
			NUMBER_BUFFER => number_buffer,
			ERROR_WORD => ERROR_WORD,
			STATUS    => status,
			OUT_WORD  => OUT_WORD);
	
						
end Main_ARCH_COUNT_CODER; 
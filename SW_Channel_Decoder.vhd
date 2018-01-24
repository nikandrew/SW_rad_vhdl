library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

entity SW_Channel_Decoder is
port(		CLK				: in std_logic;
			RES 		    : in std_logic;
						
			IN_WORD			: in std_logic;
			SYNC			: in std_logic;
			
			OUT_COUNT		: out std_logic_vector(1 downto 0);
			INPUT_WORD		: out std_logic_vector(3 downto 0);
			
			TEST_NUMBER_PART	: out std_logic_vector(2 downto 0);
       		TEST				: out std_logic_vector(15 downto 0));
end SW_Channel_Decoder;

architecture Main_ARCH_SW_Channel_Decoder of SW_Channel_Decoder is 
signal f2m	: std_logic;
signal  input_wort_inner : std_logic_vector(3 downto 0); 
begin
	TEST(8) <= f2m;
	INPUT_WORD <= input_wort_inner;
	
	DIV: entity work.DIV_F2M
		port map(  	RES			=> RES,
					CLK			=> CLK,
					STATUS		=> open,
					NUMBER_BUFFER => open,
					F2M			=> f2m);
					
	READ_WORD: entity work.Decoder_Reader_channel
		port map(
					RES        => RES,
					CLK        => CLK,
					IN_WORD    => IN_WORD,
					SYNC       => SYNC,
					OUT_WORD => input_wort_inner);
					
--	MAIN_ERROR: entity work.Decoder_Main_Error
--		port map(
--			RES              => RES,
--			WORD             => input_wort_inner,
--			SYNC             => sync,
--			OUT_COUNT        => OUT_COUNT,
--			TEST_NUMBER_PART => TEST_NUMBER_PART,
--			TEST             => TEST(7 downto 0));
	
						
end Main_ARCH_SW_Channel_Decoder; 
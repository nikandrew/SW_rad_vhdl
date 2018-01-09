library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

entity Base_SW_Rad is
port(		CLK				: in std_logic;
			RES_COD		    : in std_logic;
			RES_DEC		    : in std_logic;
			
			ERROR_BUFFER 	: in std_logic_vector(1 downto 0);
        	ERROR_COUNTER 	: in std_logic_vector(1 downto 0);
        	ERROR_WORD 		: in std_logic_vector(1 downto 0);
        				
			OUT_COUNT		: out std_logic_vector(2 downto 0);
			
			TEST_CODER_STEP				: out std_logic_vector(2 downto 0);
			TEST_CODER_F2M				: out std_logic;
			TEST_CODER_BUFFER_1 		: out std_logic_vector(2 downto 0);
			TEST_CODER_BUFFER_2 		: out std_logic_vector(2 downto 0);
			TEST_CODER_NUMBER_BUFFER 	: out std_logic;
			TEST_CODER_OUTPUT			: out std_logic;	
			TEST_CODER_WORD				: out std_logic_vector(2 downto 0);		
			TEST_CODER		: out std_logic_vector(15 downto 0);
			
			TEST_DECODER	: out std_logic_vector(15 downto 0));
end Base_SW_Rad;

architecture Main_ARCH_Base_SW_Rad of Base_SW_Rad is 

signal out_word : std_logic;

begin
	
	Coder: entity work.SW_Count_Coder
		port map(
			CLK           => CLK,
			RES           => RES_COD,
			ERROR_BUFFER  => ERROR_BUFFER,
			ERROR_COUNTER => ERROR_COUNTER,
			ERROR_WORD    => ERROR_WORD,
			OUT_WORD      => out_word,
			
			TEST_STEP		=> TEST_CODER_STEP,
			TEST_F2M		=> TEST_CODER_F2M,
			TEST_BUFFER_1 	=> TEST_CODER_BUFFER_1,
			TEST_BUFFER_2 	=> TEST_CODER_BUFFER_2,
			TEST_NUMBER_BUFFER => TEST_CODER_NUMBER_BUFFER,
			TEST_OUTPUT		=> TEST_CODER_OUTPUT,
			TEST_WORD		=> TEST_CODER_WORD,
			TEST          => TEST_CODER);
		
	DEecoder: entity work.SW_Count_Decoder
		port map(
			CLK       => CLK,
			RES       => RES_DEC,
			IN_WORD   => out_word,
			OUT_COUNT => OUT_COUNT,
			TEST      => TEST_DECODER);		
			
							
end Main_ARCH_Base_SW_Rad; 
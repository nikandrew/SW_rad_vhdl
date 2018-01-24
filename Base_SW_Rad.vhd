library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

entity Base_SW_Rad is
port(		CLK				: in std_logic;
			
			RES_COD		    : in std_logic;
			RES_DEC		    : in std_logic;
			
			ERROR_BUFFER_COUNT 			: in std_logic_vector(1 downto 0);
        	ERROR_COUNTER_COUNT 		: in std_logic_vector(1 downto 0);
        	ERROR_WORD_COUNT 			: in std_logic_vector(1 downto 0);
        	
      --Канал 1  	
        	ERROR_BUFFER_CHANNEL_1 		: in std_logic_vector(1 downto 0);
        	ERROR_WORD_CHANNEL_1 		: in std_logic_vector(2 downto 0);
        	
       		INPUT_DATA					: in std_logic;
       		
       		
       		TEST_CODER_CHANNEL_F2M				: out std_logic;
			TEST_CODER_CHANNEL_BUFFER_1 		: out std_logic_vector(2 downto 0);
			TEST_CODER_CHANNEL_BUFFER_2 		: out std_logic_vector(2 downto 0);
			TEST_CODER_CHANNEL_NUMBER_BUFFER 	: out std_logic;
			TEST_CODER_CHANNEL_OUTPUT			: out std_logic;	
			TEST_CODER_CHANNEL_WORD				: out std_logic_vector(3 downto 0);		
			TEST_CODER_CHANNEL		: out std_logic_vector(15 downto 0);
       -- Счетчик			
			DECODER_INPUT_WORD			: out std_logic_vector(2 downto 0);
			DECODER_OUT_COUNT			: out std_logic_vector(1 downto 0);
			DECODER_SYNC_SEND			: out std_logic;
			
			TEST_CODER_STEP				: out std_logic_vector(2 downto 0);
			TEST_CODER_F2M				: out std_logic;
			TEST_CODER_BUFFER_1 		: out std_logic_vector(2 downto 0);
			TEST_CODER_BUFFER_2 		: out std_logic_vector(2 downto 0);
			TEST_CODER_NUMBER_BUFFER 	: out std_logic;
			TEST_CODER_OUTPUT			: out std_logic;	
			TEST_CODER_WORD				: out std_logic_vector(2 downto 0);		
			TEST_CODER		: out std_logic_vector(15 downto 0);
			
			TEST_DECODER_NUMBER_PART	: out std_logic_vector(2 downto 0);
       		TEST_DECODER_SYNC			: out std_logic;
			TEST_DECODER	: out std_logic_vector(15 downto 0);
			
			DECODER_INPUT_WORD_CHANNEL_1	: out std_logic_vector(3 downto 0);
			DECODER_OUT_COUNT_CHANNEL_1		: out std_logic_vector(1 downto 0);
			TEST_DECODER_NUMBER_PART_CHANNEL_1 : out std_logic_vector(2 downto 0);
			TEST_DECODER_CHANNEL_1			: out std_logic_vector(15 downto 0)
			);
end Base_SW_Rad;

architecture Main_ARCH_Base_SW_Rad of Base_SW_Rad is 

signal out_word_line, out_word_channel_1, value_count, sync_dec : std_logic;
signal step_count : std_logic_vector(1 downto 0);

begin
	TEST_CODER_STEP(0) <= value_count;
	TEST_CODER_STEP(2 downto 1) <= step_count;
	TEST_DECODER_SYNC <= sync_dec;
	Coder_Count: entity work.SW_Count_Coder
		port map(
			CLK           => CLK,
			RES           => RES_COD,
			ERROR_BUFFER  => ERROR_BUFFER_COUNT,
			ERROR_COUNTER => ERROR_COUNTER_COUNT,
			ERROR_WORD    => ERROR_WORD_COUNT,
			OUT_WORD      => out_word_line,
			
			TEST_STEP(1 downto 0)	=> step_count,
			TEST_STEP(2)	=> value_count, 		
			TEST_F2M		=> TEST_CODER_F2M,
			TEST_BUFFER_1 	=> TEST_CODER_BUFFER_1,
			TEST_BUFFER_2 	=> TEST_CODER_BUFFER_2,
			TEST_NUMBER_BUFFER => TEST_CODER_NUMBER_BUFFER,
			TEST_OUTPUT		=> TEST_CODER_OUTPUT,
			TEST_WORD		=> TEST_CODER_WORD,
			TEST          	=> TEST_CODER);
		
	Decoder_Count: entity work.SW_Count_Decoder
		port map(
			CLK       => CLK,
			RES       => RES_DEC,
			IN_WORD   => out_word_line,
			
			OUT_COUNT => DECODER_OUT_COUNT,
			SYNC_SEND => DECODER_SYNC_SEND,
			INPUT_WORD => DECODER_INPUT_WORD,
			
			TEST_NUMBER_PART => TEST_DECODER_NUMBER_PART,
			TEST_SYNC	=> sync_dec,
			TEST      => TEST_DECODER);		
			
	Coder_channel_1: entity work.SW_Channel_Coder
		port map(
			CLK                => CLK,
			RES                => RES_COD,
			ERROR_BUFFER       => ERROR_BUFFER_CHANNEL_1,
			ERROR_WORD         => ERROR_WORD_CHANNEL_1,
			INPUT_DATA         => INPUT_DATA,
			STEP_INPUT         => step_count,
			OUT_WORD           => out_word_channel_1,
			TEST_F2M		=> TEST_CODER_CHANNEL_F2M,
			TEST_BUFFER_1 	=> TEST_CODER_CHANNEL_BUFFER_1,
			TEST_BUFFER_2 	=> TEST_CODER_CHANNEL_BUFFER_2,
			TEST_NUMBER_BUFFER => TEST_CODER_CHANNEL_NUMBER_BUFFER,
			TEST_OUTPUT		=> TEST_CODER_CHANNEL_OUTPUT,
			TEST_WORD		=> TEST_CODER_CHANNEL_WORD,
			TEST          	=> TEST_CODER_CHANNEL
		);
	Decoder_channel_1: entity work.SW_Channel_Decoder
		port map(
			CLK       => CLK,
			RES       => RES_DEC,
			
			IN_WORD   => out_word_channel_1,	
			SYNC => sync_dec,
					
			OUT_COUNT => DECODER_OUT_COUNT_CHANNEL_1,			
			INPUT_WORD => DECODER_INPUT_WORD_CHANNEL_1,
			
			TEST_NUMBER_PART => TEST_DECODER_NUMBER_PART_CHANNEL_1,
			TEST      => TEST_DECODER_CHANNEL_1);	
							
end Main_ARCH_Base_SW_Rad; 
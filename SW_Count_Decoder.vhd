library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

entity SW_Count_Decoder is
port(		CLK				: in std_logic;
			RES 		    : in std_logic;
						
			IN_WORD			: in std_logic;
			
			OUT_COUNT		: out std_logic_vector(1 downto 0);
			TEST			: out std_logic_vector(15 downto 0));
end SW_Count_Decoder;

architecture Main_ARCH_SW_Count_Decoder of SW_Count_Decoder is 
signal f2m	: std_logic;
signal status : std_logic_vector(2 downto 0); 
begin
	TEST(0) <= f2m;
	
	DIV: entity work.DIV_F2M
		port map(  	RES			=> RES,
					CLK			=> CLK,
					STATUS		=> status,
					NUMBER_BUFFER => open,
					F2M			=> f2m);
					
	
	
						
end Main_ARCH_SW_Count_Decoder; 
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity Word_test_channel is
port(   IN_BUFFER_1	: in std_logic_vector(2 downto 0);
		IN_BUFFER_2	: in std_logic_vector(2 downto 0);
		CLK			: in std_logic;
		F2M			: in std_logic;
		RES			: in std_logic;
		NUMBER_BUFFER : in std_logic;
		INPUT_DATA	: in std_logic;
		ERROR_WORD	: in std_logic_vector(2 downto 0);
		OUT_WORD 	: out std_logic_vector(3 downto 0);
		TEST		: out std_logic); 
end Word_test_channel;

architecture Word_test_channel_arch of Word_test_channel is  
signal inner_buffer_1, inner_buffer_2 : std_logic_vector(2 downto 0);
signal temp_buffer : std_logic_vector(1 downto 0);
signal inner_f2m : std_logic;
begin 
	inner_buffer_1 <= IN_BUFFER_1;
	inner_buffer_2 <= IN_BUFFER_2;
	TEST <= inner_f2m;
		
	process(CLK, RES)
	begin
		if(RES = '1') then
			inner_f2m <= '0';	
		elsif(falling_edge(CLK)) then
			inner_f2m <= temp_buffer(0);
			temp_buffer(0) <= temp_buffer(1);
			temp_buffer(1) <= F2M;			
		end if;
	end process; 
		
	
	process( inner_f2m, RES)
	begin
		if(RES = '1') then
			OUT_WORD <= "1010";
		elsif(rising_edge(inner_f2m)) then
			if(NUMBER_BUFFER = '0') then
				if(ERROR_WORD = "001") then
					OUT_WORD(0) <= NOT (inner_buffer_1(0) XOR inner_buffer_1(1));
					OUT_WORD(1) <= inner_buffer_1(0) XOR inner_buffer_1(2);
					OUT_WORD(2) <= inner_buffer_1(1) XOR inner_buffer_1(2); 
					OUT_WORD(3) <= INPUT_DATA; 
				elsif(ERROR_WORD = "010") then
					OUT_WORD(0) <= inner_buffer_1(0) XOR inner_buffer_1(1);
					OUT_WORD(1) <= NOT (inner_buffer_1(0) XOR inner_buffer_1(2));
					OUT_WORD(2) <= inner_buffer_1(1) XOR inner_buffer_1(2);  
					OUT_WORD(3) <= INPUT_DATA; 
				elsif(ERROR_WORD = "011") then
					OUT_WORD(0) <= inner_buffer_1(0) XOR inner_buffer_1(1);
					OUT_WORD(1) <= inner_buffer_1(0) XOR inner_buffer_1(2);
					OUT_WORD(2) <= NOT (inner_buffer_1(1) XOR inner_buffer_1(2));  
					OUT_WORD(3) <= INPUT_DATA; 
				elsif(ERROR_WORD = "100") then
					OUT_WORD(0) <= inner_buffer_1(0) XOR inner_buffer_1(1);
					OUT_WORD(1) <= inner_buffer_1(0) XOR inner_buffer_1(2);
					OUT_WORD(2) <= inner_buffer_1(1) XOR inner_buffer_1(2);  
					OUT_WORD(3) <= NOT INPUT_DATA; 
				else
					OUT_WORD(0) <= inner_buffer_1(0) XOR inner_buffer_1(1);
					OUT_WORD(1) <= inner_buffer_1(0) XOR inner_buffer_1(2);
					OUT_WORD(2) <= inner_buffer_1(1) XOR inner_buffer_1(2); 
					OUT_WORD(3) <= INPUT_DATA; 
				end if;	
		    else
		    	if(ERROR_WORD = "01") then
					OUT_WORD(0) <= NOT (inner_buffer_2(0) XOR inner_buffer_2(1));
					OUT_WORD(1) <= inner_buffer_2(0) XOR inner_buffer_2(2);
					OUT_WORD(2) <= inner_buffer_2(1) XOR inner_buffer_2(2); 
					OUT_WORD(3) <= INPUT_DATA;   
				elsif(ERROR_WORD = "10") then
					OUT_WORD(0) <= inner_buffer_2(0) XOR inner_buffer_2(1);
					OUT_WORD(1) <= NOT (inner_buffer_2(0) XOR inner_buffer_2(2));
					OUT_WORD(2) <= inner_buffer_2(1) XOR inner_buffer_2(2);  
					OUT_WORD(3) <= INPUT_DATA; 
				elsif(ERROR_WORD = "11") then
					OUT_WORD(0) <= inner_buffer_2(0) XOR inner_buffer_2(1);
					OUT_WORD(1) <= inner_buffer_2(0) XOR inner_buffer_2(2);
					OUT_WORD(2) <= NOT (inner_buffer_2(1) XOR inner_buffer_2(2));  
					OUT_WORD(3) <= INPUT_DATA; 
				elsif(ERROR_WORD = "100") then
					OUT_WORD(0) <= inner_buffer_2(0) XOR inner_buffer_2(1);
					OUT_WORD(1) <= inner_buffer_2(0) XOR inner_buffer_2(2);
					OUT_WORD(2) <= inner_buffer_2(1) XOR inner_buffer_2(2);  
					OUT_WORD(3) <= NOT INPUT_DATA; 
				else
					OUT_WORD(0) <= inner_buffer_2(0) XOR inner_buffer_2(1);
					OUT_WORD(1) <= inner_buffer_2(0) XOR inner_buffer_2(2);
					OUT_WORD(2) <= inner_buffer_2(1) XOR inner_buffer_2(2); 
					OUT_WORD(3) <= INPUT_DATA; 
				end if;		
		    end if;
		end if;
    end process;
end Word_test_channel_arch;
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity Decoder_Main_Error is
port(   RES     	: in std_logic;
		CLK			: in std_logic;
		WORD		: in std_logic_vector(2 downto 0);
        SYNC		: in std_logic;
        OUT_COUNT 	: out std_logic_vector(1 downto 0);
        TEST_VALUE	: out std_logic;	
        TEST_NUMBER_PART	: out std_logic_vector(2 downto 0);
        TEST		: out std_logic_vector(7 downto 0)); 
end Decoder_Main_Error;

architecture Decoder_Main_Error_arch of Decoder_Main_Error is 

signal error : integer;
signal word_old,	word_2_0, 	word_3_0,	word_temp_1, word_temp_2, word_temp_3, word_temp_4	: std_logic_vector(2 downto 0);
signal buffer_old, 	buffer_2_0,	buffer_3_0, buffer_temp_1, buffer_temp_2, buffer_temp_3, buffer_temp41: std_logic_vector(2 downto 0);
signal number_old, 	number_2_0, number_3_0	: integer range 0 to 2; -- 0 -> 1 -> 2
signal value_old, 	value_2_0,	value_3_0	: std_logic;  -- 0 or 1
signal hemming_out_0, hemming_out_1 : std_logic;
begin

	process(buffer_temp_1, buffer_temp_2, WORD, word_temp_2, word_temp_1)
	begin
		word_temp_1(0) <= buffer_temp_1(0) xor buffer_temp_1(1);
        word_temp_1(1) <= buffer_temp_1(0) xor buffer_temp_1(2);
        word_temp_1(2) <= buffer_temp_1(1) xor buffer_temp_1(2);
        
        if(word_temp_1 = WORD) then
        	hemming_out_1 <='0';
        else
        	hemming_out_1 <= '1';
        end if;  
		
		word_temp_2(0) <= buffer_temp_2(0) xor buffer_temp_2(1);
        word_temp_2(1) <= buffer_temp_2(0) xor buffer_temp_2(2);
        word_temp_2(2) <= buffer_temp_2(1) xor buffer_temp_2(2);
        
        if(word_temp_2 = WORD) then
        	hemming_out_0 <='0';
        else
        	hemming_out_0 <= '1';
        end if; 
	end process;
		
	TEST(0) <=  hemming_out_0;
	TEST(1) <=  hemming_out_1;
	TEST(4 downto 2) <= buffer_temp_1;
	TEST(7 downto 5) <= buffer_temp_2;
	process (RES, SYNC )
    begin
        if(RES = '1') then   			
			TEST_VALUE <= '1';
			TEST_NUMBER_PART <= "111";
			buffer_temp_1 <= "000";
			buffer_temp_2 <= "100";
        elsif(rising_edge(SYNC)) then
        	if(error = 0) then
        		if(word_old = WORD) then
        			TEST_NUMBER_PART <= "001";
        				--решение по доп.2
        			buffer_2_0 <= buffer_old;
        			buffer_2_0(number_old) <= not buffer_old(number_old);
        			if(number_old = 2) then
        				number_2_0 <= 0;
        				value_2_0 <= not value_old;
        			else
        				number_2_0 <=  number_old + 1;
        				value_2_0 <=  value_old;
        			end if;        				
        				--решение по доп.3	
        			number_3_0 <= number_old;
        			value_3_0 <= value_old;
        			buffer_3_0 <= buffer_old;
        		else
        			TEST_NUMBER_PART <= "000";
        			if(number_old = 0) then
        				buffer_temp_1(0) <= '1';
        				buffer_temp_1(1) <= buffer_old(1);
        				buffer_temp_1(2) <= buffer_old(2);
        			elsif(number_old = 1) then
        				buffer_temp_1(0) <= buffer_old(0);
        				buffer_temp_1(1) <= '1';
        				buffer_temp_1(2) <= buffer_old(2);
        			elsif(number_old = 2) then
        				buffer_temp_1(0) <= buffer_old(0);
        				buffer_temp_1(1) <= buffer_old(1);
        				buffer_temp_1(2) <= '1';
        			end if;        			       			       				
        			-- комбинаторика      			
        			
        			if(number_old = 0) then
        				buffer_temp_2(0) <= '0';
        				buffer_temp_2(1) <= buffer_old(1);
        				buffer_temp_2(2) <= buffer_old(2);
        			elsif(number_old = 1) then
        				buffer_temp_2(0) <= buffer_old(0);
        				buffer_temp_2(1) <= '0';
        				buffer_temp_2(2) <= buffer_old(2);
        			elsif(number_old = 2) then
        				buffer_temp_2(0) <= buffer_old(0);
        				buffer_temp_2(1) <= buffer_old(1);
        				buffer_temp_2(2) <= '0';
        			end if;
        			-- комбинаторика
        			       			
        		end if;
        	elsif(error = 1) then
        		
        	elsif(error = 2) then
        		
        	elsif(error = 3) then
        		
        	elsif(error = 4) then
        		
        	else
        		
        	end if;        		
        end if;
    end process;
    
    process (RES, SYNC )		
    begin
        if(RES = '1') then            
			error <= 0;	
			OUT_COUNT <= "11";
			
			buffer_old <= "111";
			value_old <= '1';
			number_old <= 0;			
			word_old <= "000";
        elsif(falling_edge(SYNC)) then
        	if(error = 0) then
        		if(word_old = WORD) then
        			error <= 3;
        		else
        			if(hemming_out_0 ='0') then
        				error <= 0;
        				if(number_old = 0) then
        					OUT_COUNT <= "00";
        				elsif(number_old = 1) then
        					OUT_COUNT <= "01";
        				elsif(number_old = 2) then
        					OUT_COUNT <= "10";
        				else
        					OUT_COUNT <= "11";
        				end if;
        				if(number_old = 2) then
	        				number_old <= 0;	        				
	        			else
	        				number_old <=  number_old + 1;	        				
	        			end if;  
	        			value_old <= '0';     
	        			buffer_old <= buffer_temp_2; 
	        			word_old <= word_temp_2;		
        			elsif(hemming_out_1 ='0') then
        				error <= 0;
        				if(number_old = 0) then
        					OUT_COUNT <= "00";
        				elsif(number_old = 1) then
        					OUT_COUNT <= "01";
        				elsif(number_old = 2) then
        					OUT_COUNT <= "10";
        				else
        					OUT_COUNT <= "11";
        				end if;
        				if(number_old = 2) then
	        				number_old <= 0;	        				
	        			else
	        				number_old <=  number_old + 1;	        				
	        			end if;  
	        			value_old <= '1'; 
	        			buffer_old <= buffer_temp_1;
	        			word_old <= word_temp_1;
        			else
        				error <= 1;
        			end if;
        		end if;
        	elsif(error = 1) then
        		
        	elsif(error = 2) then
        		
        	elsif(error = 3) then
        		
        	elsif(error = 4) then
        		
        	else
        		
        	end if;        		
        end if;
    end process;
    
end Decoder_Main_Error_arch;
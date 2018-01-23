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
signal word_old,	word_2_0, 	word_1_1,  word_3_0,	word_0_1, word_0_2, word_temp_1, word_temp_2, word_temp_1_1, word_temp_1_2, word_temp_1_3, word_temp_1_4	: std_logic_vector(2 downto 0);
signal buffer_old, 	buffer_dop1_0, 	buffer_dop1_1, buffer_2_0,	buffer_3_0, buffer_0_1, buffer_0_2, buffer_temp_1, buffer_temp_2, buffer_temp_1_1, buffer_temp_1_2, buffer_temp_1_3, buffer_temp_1_4: std_logic_vector(2 downto 0);
signal number_old, 	number_dop1_0, number_dop1_1, number_2_0,  number_3_0, number_0	: integer range 0 to 2; -- 0 -> 1 -> 2
signal value_old, 	value_dop1_0, value_dop1_1, value_2_0,	value_3_0, value_0_1, value_0_2	: std_logic;  -- 0 or 1
signal hemming_out_0, hemming_out_1, hemming_out_1_1, hemming_out_1_2, hemming_out_1_3, hemming_out_1_4: std_logic;
signal temp_save_0, temp_save_1, temp_save_2, temp_save_3 : std_logic_vector(1 downto 0);
signal buffer_dop1_1_1, buffer_dop1_1_2, buffer_dop1_0_1, buffer_dop1_0_2, buffer_dop1_0_3, buffer_dop1_0_4, buffer_dop1_0_5, buffer_dop1_0_6 : std_logic_vector(2 downto 0); 
signal word_dop1_1_1,  word_dop1_1_2, word_dop1_0_1, word_dop1_0_2, word_dop1_0_3, word_dop1_0_4, word_dop1_0_5, word_dop1_0_6 : std_logic_vector(2 downto 0); 
signal hemming_dop1_1_1, hemming_dop1_1_2, hemming_dop1_0_1, hemming_dop1_0_2, hemming_dop1_0_3, hemming_dop1_0_4, hemming_dop1_0_5, hemming_dop1_0_6 : std_logic; 
signal error_dop2, error_dop3 : std_logic;
begin
	
	TEST(2 downto 0) <= buffer_temp_1_1;
	TEST(3) <= value_dop1_0;
	TEST(6 downto 4) <= buffer_temp_1_2;
-- Процесс для Error = 0 и Error = 2
	process(buffer_temp_1, buffer_temp_2, number_old, WORD, word_temp_2, word_temp_1, buffer_old )
	begin
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
		
		word_temp_1(0) <= buffer_temp_1(0) xor buffer_temp_1(1);
        word_temp_1(1) <= buffer_temp_1(0) xor buffer_temp_1(2);
        word_temp_1(2) <= buffer_temp_1(1) xor buffer_temp_1(2);
        
        if(word_temp_1 = WORD) then
        	hemming_out_1 <='0';
        else
        	hemming_out_1 <= '1';
        end if;  
		
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
		
		word_temp_2(0) <= buffer_temp_2(0) xor buffer_temp_2(1);
        word_temp_2(1) <= buffer_temp_2(0) xor buffer_temp_2(2);
        word_temp_2(2) <= buffer_temp_2(1) xor buffer_temp_2(2);
        
        if(word_temp_2 = WORD) then
        	hemming_out_0 <='0';
        else
        	hemming_out_0 <= '1';
        end if; 
        
        -- для доп 1
        buffer_dop1_0_1(0) <= '1';
        buffer_dop1_0_1(1) <= buffer_old(1);
        buffer_dop1_0_1(2) <= buffer_old(2);        
        word_dop1_0_1(0) <= buffer_dop1_0_1(0) xor buffer_dop1_0_1(1);
        word_dop1_0_1(1) <= buffer_dop1_0_1(0) xor buffer_dop1_0_1(2);
        word_dop1_0_1(2) <= buffer_dop1_0_1(1) xor buffer_dop1_0_1(2);        
        if(word_dop1_0_1 = WORD) then
        	hemming_dop1_0_1 <='0';
        else
        	hemming_dop1_0_1 <= '1';
        end if;
        
        buffer_dop1_0_2(0) <= '0';
        buffer_dop1_0_2(1) <= buffer_old(1);
        buffer_dop1_0_2(2) <= buffer_old(2);
        word_dop1_0_2(0) <= buffer_dop1_0_2(0) xor buffer_dop1_0_2(1);
        word_dop1_0_2(1) <= buffer_dop1_0_2(0) xor buffer_dop1_0_2(2);
        word_dop1_0_2(2) <= buffer_dop1_0_2(1) xor buffer_dop1_0_2(2);
        if(word_dop1_0_2 = WORD) then
        	hemming_dop1_0_2 <='0';
        else
        	hemming_dop1_0_2 <= '1';
        end if;
        
        buffer_dop1_0_3(0) <= buffer_old(0);
        buffer_dop1_0_3(1) <= '1';
        buffer_dop1_0_3(2) <= buffer_old(2);
        word_dop1_0_3(0) <= buffer_dop1_0_3(0) xor buffer_dop1_0_3(1);
        word_dop1_0_3(1) <= buffer_dop1_0_3(0) xor buffer_dop1_0_3(2);
        word_dop1_0_3(2) <= buffer_dop1_0_3(1) xor buffer_dop1_0_3(2);
        if(word_dop1_0_3 = WORD) then
        	hemming_dop1_0_3 <='0';
        else
        	hemming_dop1_0_3 <= '1';
        end if;
        
        buffer_dop1_0_4(0) <= buffer_old(0);
        buffer_dop1_0_4(1) <= '0';
        buffer_dop1_0_4(2) <= buffer_old(2);
        word_dop1_0_4(0) <= buffer_dop1_0_4(0) xor buffer_dop1_0_4(1);
        word_dop1_0_4(1) <= buffer_dop1_0_4(0) xor buffer_dop1_0_4(2);
        word_dop1_0_4(2) <= buffer_dop1_0_4(1) xor buffer_dop1_0_4(2);
        if(word_dop1_0_4 = WORD) then
        	hemming_dop1_0_4 <='0';
        else
        	hemming_dop1_0_4 <= '1';
        end if;
        
        buffer_dop1_0_5(0) <= buffer_old(0);
        buffer_dop1_0_5(1) <= buffer_old(1);
        buffer_dop1_0_5(2) <= '1';
        word_dop1_0_5(0) <= buffer_dop1_0_5(0) xor buffer_dop1_0_5(1);
        word_dop1_0_5(1) <= buffer_dop1_0_5(0) xor buffer_dop1_0_5(2);
        word_dop1_0_5(2) <= buffer_dop1_0_5(1) xor buffer_dop1_0_5(2);
        if(word_dop1_0_5 = WORD) then
        	hemming_dop1_0_5 <='0';
        else
        	hemming_dop1_0_5 <= '1';
        end if;
        
        buffer_dop1_0_6(0) <= buffer_old(0);
        buffer_dop1_0_6(1) <= buffer_old(1);
        buffer_dop1_0_6(2) <= '0';
        word_dop1_0_6(0) <= buffer_dop1_0_6(0) xor buffer_dop1_0_6(1);
        word_dop1_0_6(1) <= buffer_dop1_0_6(0) xor buffer_dop1_0_6(2);
        word_dop1_0_6(2) <= buffer_dop1_0_6(1) xor buffer_dop1_0_6(2);
        if(word_dop1_0_6 = WORD) then
        	hemming_dop1_0_6 <='0';
        else
        	hemming_dop1_0_6 <= '1';
        end if; 
	end process;
-- Процесс для Error = 1
	process(buffer_temp_1_1, buffer_temp_1_2, buffer_temp_1_3, buffer_temp_1_4, number_0, WORD, word_temp_1_1, word_temp_1_2, word_temp_1_3, word_temp_1_4, buffer_0_1, buffer_0_2 )
	begin
		
		if(number_0 = 0) then
        	buffer_temp_1_1(0) <= '1';
        	buffer_temp_1_1(1) <= buffer_0_1(1);
        	buffer_temp_1_1(2) <= buffer_0_1(2);
        elsif(number_0 = 1) then
        	buffer_temp_1_1(0) <= buffer_0_1(0);
        	buffer_temp_1_1(1) <= '1';
        	buffer_temp_1_1(2) <= buffer_0_1(2);
        elsif(number_0 = 2) then
        	buffer_temp_1_1(0) <= buffer_0_1(0);
        	buffer_temp_1_1(1) <= buffer_0_1(1);
        	buffer_temp_1_1(2) <= '1';
        end if;  
		
		word_temp_1_1(0) <= buffer_temp_1_1(0) xor buffer_temp_1_1(1);
        word_temp_1_1(1) <= buffer_temp_1_1(0) xor buffer_temp_1_1(2);
        word_temp_1_1(2) <= buffer_temp_1_1(1) xor buffer_temp_1_1(2);
        
        if(word_temp_1_1 = WORD) then
        	hemming_out_1_1 <='0';
        else
        	hemming_out_1_1 <= '1';
        end if;  
		
		if(number_0 = 0) then
        	buffer_temp_1_2(0) <= '0';
        	buffer_temp_1_2(1) <= buffer_0_1(1);
        	buffer_temp_1_2(2) <= buffer_0_1(2);
        elsif(number_0 = 1) then
        	buffer_temp_1_2(0) <= buffer_0_1(0);
        	buffer_temp_1_2(1) <= '0';
        	buffer_temp_1_2(2) <= buffer_0_1(2);
        elsif(number_0 = 2) then
        	buffer_temp_1_2(0) <= buffer_0_1(0);
        	buffer_temp_1_2(1) <= buffer_0_1(1);
        	buffer_temp_1_2(2) <= '0';
        end if;  
		
		word_temp_1_2(0) <= buffer_temp_1_2(0) xor buffer_temp_1_2(1);
        word_temp_1_2(1) <= buffer_temp_1_2(0) xor buffer_temp_1_2(2);
        word_temp_1_2(2) <= buffer_temp_1_2(1) xor buffer_temp_1_2(2);
        
        if(word_temp_1_2 = WORD) then
        	hemming_out_1_2 <='0';
        else
        	hemming_out_1_2 <= '1';
        end if; 
        
        if(number_0 = 0) then
        	buffer_temp_1_3(0) <= '1';
        	buffer_temp_1_3(1) <= buffer_0_2(1);
        	buffer_temp_1_3(2) <= buffer_0_2(2);
        elsif(number_0 = 1) then
        	buffer_temp_1_3(0) <= buffer_0_1(0);
        	buffer_temp_1_3(1) <= '1';
        	buffer_temp_1_3(2) <= buffer_0_2(2);
        elsif(number_0 = 2) then
        	buffer_temp_1_3(0) <= buffer_0_2(0);
        	buffer_temp_1_3(1) <= buffer_0_2(1);
        	buffer_temp_1_3(2) <= '1';
        end if;  
		
		word_temp_1_3(0) <= buffer_temp_1_3(0) xor buffer_temp_1_3(1);
        word_temp_1_3(1) <= buffer_temp_1_3(0) xor buffer_temp_1_3(2);
        word_temp_1_3(2) <= buffer_temp_1_3(1) xor buffer_temp_1_3(2);
        
        if(word_temp_1_3 = WORD) then
        	hemming_out_1_3 <='0';
        else
        	hemming_out_1_3 <= '1';
        end if;  
		
		if(number_0 = 0) then
        	buffer_temp_1_4(0) <= '0';
        	buffer_temp_1_4(1) <= buffer_0_2(1);
        	buffer_temp_1_4(2) <= buffer_0_2(2);
        elsif(number_0 = 1) then
        	buffer_temp_1_4(0) <= buffer_0_2(0);
        	buffer_temp_1_4(1) <= '0';
        	buffer_temp_1_4(2) <= buffer_0_2(2);
        elsif(number_0 = 2) then
        	buffer_temp_1_4(0) <= buffer_0_2(0);
        	buffer_temp_1_4(1) <= buffer_0_2(1);
        	buffer_temp_1_4(2) <= '0';
        end if;  
		
		word_temp_1_4(0) <= buffer_temp_1_4(0) xor buffer_temp_1_4(1);
        word_temp_1_4(1) <= buffer_temp_1_4(0) xor buffer_temp_1_4(2);
        word_temp_1_4(2) <= buffer_temp_1_4(1) xor buffer_temp_1_4(2);
        
        if(word_temp_1_4 = WORD) then
        	hemming_out_1_4 <='0';
        else
        	hemming_out_1_4 <= '1';
        end if;
        
        -- доп 1
        if(number_dop1_0 = 0) then
        	buffer_dop1_1_1(0) <= '1';
        	buffer_dop1_1_1(1) <= buffer_dop1_0(1);
        	buffer_dop1_1_1(2) <= buffer_dop1_0(2);
        elsif(number_dop1_0 = 1) then
        	buffer_dop1_1_1(0) <= buffer_dop1_0(0);
        	buffer_dop1_1_1(1) <= '1';
        	buffer_dop1_1_1(2) <= buffer_dop1_0(2);
        elsif(number_dop1_0 = 2) then
        	buffer_dop1_1_1(0) <= buffer_dop1_0(0);
        	buffer_dop1_1_1(1) <= buffer_dop1_0(1);
        	buffer_dop1_1_1(2) <= '1';
        end if;  
		
		word_dop1_1_1(0) <= buffer_dop1_1_1(0) xor buffer_dop1_1_1(1);
        word_dop1_1_1(1) <= buffer_dop1_1_1(0) xor buffer_dop1_1_1(2);
        word_dop1_1_1(2) <= buffer_dop1_1_1(1) xor buffer_dop1_1_1(2);
        
        if(word_dop1_1_1 = WORD) then
        	hemming_dop1_1_1 <='0';
        else
        	hemming_dop1_1_1 <= '1';
        end if;  
		
		if(number_dop1_0 = 0) then
        	buffer_dop1_1_2(0) <= '0';
        	buffer_dop1_1_2(1) <= buffer_dop1_0(1);
        	buffer_dop1_1_2(2) <= buffer_dop1_0(2);
        elsif(number_dop1_0 = 1) then
        	buffer_dop1_1_2(0) <= buffer_dop1_0(0);
        	buffer_dop1_1_2(1) <= '0';
        	buffer_dop1_1_2(2) <= buffer_dop1_0(2);
        elsif(number_dop1_0 = 2) then
        	buffer_dop1_1_2(0) <= buffer_dop1_0(0);
        	buffer_dop1_1_2(1) <= buffer_dop1_0(1);
        	buffer_dop1_1_2(2) <= '0';
        end if;
		
		word_dop1_1_2(0) <= buffer_dop1_1_2(0) xor buffer_dop1_1_2(1);
        word_dop1_1_2(1) <= buffer_dop1_1_2(0) xor buffer_dop1_1_2(2);
        word_dop1_1_2(2) <= buffer_dop1_1_2(1) xor buffer_dop1_1_2(2);
        
        if(word_dop1_1_2 = WORD) then
        	hemming_dop1_1_2 <='0';
        else
        	hemming_dop1_1_2 <= '1';
        end if; 
	end process;
		
--	TEST(0) <=  hemming_out_0;
--	TEST(1) <=  hemming_out_1;
--	TEST(3 downto 2) <= temp_save_0;
--	TEST(5 downto 4) <= temp_save_1;
--	TEST(7 downto 6) <= temp_save_2;
	OUT_COUNT <= temp_save_0;
	--TEST(7 downto 5) <= buffer_temp_1;
	
    
    process (RES, SYNC )		
    begin
        if(RES = '1') then            
			error <= 0;	
			temp_save_2 <= "10";
			temp_save_1 <= "01";
			temp_save_0 <= "00";
			
			buffer_old <= "111";
			value_old <= '1';
			number_old <= 0;			
			word_old <= "000";
			
			error_dop3 <= '0';
			error_dop2 <= '0';
			
			TEST_NUMBER_PART <= "111";
        elsif(falling_edge(SYNC)) then
        	if(error = 0) then
        		TEST_NUMBER_PART <= "000";
        		error_dop3 <= '0';
        		error_dop2 <= '0';
        		if(word_old = WORD) then
        			error <= 3;
        			temp_save_0 <= temp_save_1;
        			-- решение по Доп.2
        			if(number_old = 0) then
        				buffer_0_1(0) <= not buffer_old(0);
        				buffer_0_1(1) <= buffer_old(1);
        				buffer_0_1(2) <= buffer_old(2);
        				number_0 <= 1;
        				value_0_1 <= value_old; 
        			elsif(number_old = 1) then
        				buffer_0_1(0) <= buffer_old(0);
        				buffer_0_1(1) <= not buffer_old(1);
        				buffer_0_1(2) <= buffer_old(2);
        				number_0 <= 2;
        				value_0_1 <= value_old; 
        			elsif(number_old = 2) then
        				buffer_0_1(0) <= buffer_old(0);
        				buffer_0_1(1) <= buffer_old(1);
        				buffer_0_1(2) <= not buffer_old(2);
        				value_0_1 <= not value_old; 
        				number_0 <= 0;
        			end if;
        			            			
        			word_0_1 <= WORD;        			
        			
        			-- решение по Доп 3 
        			--TEST_NUMBER_PART <= "010";
        			buffer_dop1_0 <= buffer_old;
        			value_dop1_0 <= value_old; 
        			number_dop1_0 <= 2;            			
        			--word_dop1_0 <= WORD;         			
        			
        			
        		else        			
        			if(hemming_out_0 ='0') then
        				error <= 0;
        				temp_save_1 <= temp_save_2;
	        			temp_save_0 <= temp_save_1;
        				if(number_old = 0) then
        					temp_save_2 <= "00";
        				elsif(number_old = 1) then
        					temp_save_2 <= "01";
        				elsif(number_old = 2) then
        					temp_save_2 <= "10";
        				else
        					temp_save_2 <= "11";
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
        				temp_save_1 <= temp_save_2;
	        			temp_save_0 <= temp_save_1;
        				if(number_old = 0) then
        					temp_save_2 <= "00";
        				elsif(number_old = 1) then
        					temp_save_2 <= "01";
        				elsif(number_old = 2) then
        					temp_save_2 <= "10";
        				else
        					temp_save_2 <= "11";
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
        				-- Решение для 4 значений (без дополнений)
        				temp_save_1 <= temp_save_2;
	        			temp_save_0 <= temp_save_1;
        				if(number_old = 2) then
	        				number_0 <= 0;	        				
	        			else
	        				number_0 <=  number_old + 1;	        				
	        			end if;  
	        			value_0_1 <= '1'; 
	        			value_0_2 <= '0'; 
	        			buffer_0_1 <= buffer_temp_1;
	        			buffer_0_2 <= buffer_temp_2;	        			
        				word_0_1 <= word_temp_1;
        				word_0_2 <= word_temp_2;
        				
        				-- Решение по доп. 1
        				if(hemming_dop1_0_1 = '0') then
        					error <= 1;
        					buffer_dop1_0 <= buffer_dop1_0_1;
        					number_dop1_0 <= 1;
        					value_dop1_0 <= '1';
        				elsif(hemming_dop1_0_2 ='0') then 
        					error <= 1;
        					buffer_dop1_0 <= buffer_dop1_0_2;  
        					number_dop1_0 <= 1;
        					value_dop1_0 <= '0';
        				elsif(hemming_dop1_0_3 ='0') then 
        					error <= 1; 
        					buffer_dop1_0 <= buffer_dop1_0_3;
        					number_dop1_0 <= 2;
        					value_dop1_0 <= '1';	
        				elsif(hemming_dop1_0_4 ='0') then  
        					error <= 1;
        					buffer_dop1_0 <= buffer_dop1_0_4;
        					number_dop1_0 <= 2;
        					value_dop1_0 <= '0';	
        				elsif(hemming_dop1_0_5 ='0') then 
        					error <= 1;
        					buffer_dop1_0 <= buffer_dop1_0_5;
        					number_dop1_0 <= 0;
        					value_dop1_0 <= '1';	
        				elsif(hemming_dop1_0_6 ='0') then 
        					error <= 1;
        					buffer_dop1_0 <= buffer_dop1_0_6;
        					number_dop1_0 <= 0;
        					value_dop1_0 <= '0';
        				end if;
        			end if;
        		end if;
        	elsif(error = 1) then     
        		word_old <= WORD;   	
        		error <= 2; 		
        		-- Решение по доп. 1
        		temp_save_0 <= temp_save_1;
        		if(hemming_dop1_1_1 ='0') then  
        			if(number_dop1_0 = 2) then
	        			number_dop1_0 <= 0;	        				
	        		else
	        			number_dop1_0 <=  number_dop1_0 + 1;	        				
	        		end if;  
	        		value_dop1_0 <= '1';     
	        		buffer_dop1_0 <= buffer_dop1_1_1;   -- !!!
	        				
        		elsif(hemming_dop1_1_2 ='0') then        			
        			if(number_dop1_0 = 2) then
	        			number_dop1_0 <= 0;	        				
	        		else
	        			number_dop1_0 <=  number_dop1_0 + 1;	        				
	        		end if;    
	        		value_dop1_0 <= '0';     
	        		buffer_dop1_0 <= buffer_dop1_1_2; -- !!!!!!!!! Обратить внимание если будуд ошибки
	        	end if;
        		-- поиск решений без дополнений
        		if(hemming_out_1_1 ='0') then        			
        			if(number_0 = 2) then
	        			number_old <= 0;	        				
	        		else
	        			number_old <=  number_0 + 1;	        				
	        		end if;  
	        		value_old <= '1';     
	        		buffer_old <= buffer_temp_1_1; 	
        		elsif(hemming_out_1_2 ='0') then
        			if(number_0 = 2) then
	        			number_old <= 0;	        				
	        		else
	        			number_old <=  number_0 + 1;	        				
	        		end if;  
	        		value_old <= '0';     
	        		buffer_old <= buffer_temp_1_2; 
        		elsif(hemming_out_1_3 ='0') then
        			if(number_0 = 2) then
	        			number_old <= 0;	        				
	        		else
	        			number_old <=  number_0 + 1;	        				
	        		end if;  
	        		value_old <= '1';     
	        		buffer_old <= buffer_temp_1_3; 	
        		elsif(hemming_out_1_4 ='0') then
        			if(number_0 = 2) then
	        			number_old <= 0;	        				
	        		else
	        			number_old <=  number_0 + 1;	        				
	        		end if;  
	        		value_old <= '0';     
	        		buffer_old <= buffer_temp_1_4; 
        		else
        			error <= 2;    				        			
        				-- нет решений без дополнений
        				-- дописать полный сброс если нет дополнений
        		end if;
        	elsif(error = 2) then
        		temp_save_0 <= temp_save_1;
        		if(word_old /= WORD ) then -- если одно из 4 решений без дополнений не равно Word 
        			error <= 0;
        				if(number_old = 0) then
        					temp_save_2 <= "00";
	        				temp_save_1 <= "10";
	        				temp_save_0 <= "01";
	        			elsif(number_old = 1) then
	        				temp_save_2 <= "01";
	        				temp_save_1 <= "00";
	        				temp_save_0 <= "10";
	        			elsif(number_old = 2) then
	        				temp_save_2 <= "10";
	        				temp_save_1 <= "01";
	        				temp_save_0 <= "00";
	        			else
	        				temp_save_2 <= "11";
	        				temp_save_1 <= "11";
	        				temp_save_0 <= "11";
	        			end if;
	        			TEST_NUMBER_PART <= "100";
        			if(hemming_out_0 ='0') then
        				error <= 0;
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
						if(number_old = 2) then
	        				number_old <= 0;	        				
	        			else
	        				number_old <=  number_old + 1;	        				
	        			end if;  
	        			value_old <= '1'; 
	        			buffer_old <= buffer_temp_1;
	        			word_old <= word_temp_1;
        			else
        				error <= 0;
        				-- Нет решений
        			end if;
        		else  --если решение по доп.1 равно Word
        			error <= 0;
        			TEST_NUMBER_PART <= "001";
        			if(number_dop1_0 = 0) then
        				temp_save_2 <= "00";
	        			temp_save_1 <= "10";
	        			temp_save_0 <= "01";
	        		elsif(number_dop1_0 = 1) then
	        			temp_save_2 <= "01";
	        			temp_save_1 <= "00";
	        			temp_save_0 <= "10";
	        		elsif(number_dop1_0 = 2) then
	        			temp_save_2 <= "10";
	        			temp_save_1 <= "01";
	        			temp_save_0 <= "00";
	        		else
	        			temp_save_2 <= "11";
	        			temp_save_1 <= "11";
	        			temp_save_0 <= "11";
	        		end if;
        			if(hemming_dop1_1_1 ='0') then        			       			
	        			if(number_dop1_0 = 2) then
		        			number_old <= 0;	        				
		        		else
		        			number_old <=  number_dop1_0 + 1;	        				
		        		end if;  
		        		value_old <= '1';     
		        		buffer_old <= buffer_dop1_1_1;
		        		word_old <= word_dop1_1_1; 
		        				
	        		elsif(hemming_dop1_1_2 ='0') then
	        			if(number_dop1_0 = 2) then
		        			number_old <= 0;	        				
		        		else
		        			number_old <=  number_dop1_0 + 1;	        				
		        		end if;    
		        		value_old <= '0';     
		        		buffer_old <= buffer_dop1_1_2; 
		        		word_old <= word_dop1_1_2;
		        	end if;
        		end if;	
        	elsif(error = 3) then
        		temp_save_0 <= temp_save_2;
        		error <= 4; 		
        		-- Решение по доп. 3        		
        		if(hemming_dop1_1_1 ='0') then  
        			if(number_dop1_0 = 2) then
	        			number_dop1_0 <= 0;	        				
	        		else
	        			number_dop1_0 <=  number_dop1_0 + 1;	        				
	        		end if;  
	        		value_dop1_0 <= '1';     
	        		buffer_dop1_0 <= buffer_dop1_1_1; 		
        		elsif(hemming_dop1_1_2 ='0') then        			
        			if(number_dop1_0 = 2) then
	        			number_dop1_0 <= 0;	        				
	        		else
	        			number_dop1_0 <=  number_dop1_0 + 1;	        				
	        		end if;    
	        		value_dop1_0 <= '0';     
	        		buffer_dop1_0 <= buffer_dop1_1_2; 
	        	else
	        		error_dop3 <= '1';
	        	end if;
        		-- Решение по доп. 2
        		if(hemming_out_1_1 ='0') then        			
        			if(number_0 = 2) then
	        			number_0 <= 0;	        				
	        		else
	        			number_0 <=  number_0 + 1;	        				
	        		end if;  
	        		value_0_1 <= '1';     
	        		buffer_0_1  <= buffer_temp_1_1; 
        		elsif(hemming_out_1_2 ='0') then
        			if(number_0 = 2) then
	        			number_0 <= 0;	        				
	        		else
	        			number_0 <=  number_0 + 1;	        				
	        		end if;  
	        		value_0_1  <= '0';     
	        		buffer_0_1  <= buffer_temp_1_2;
	        	else
	        		error_dop2 <= '1';
        		end if;   
        	elsif(error = 4) then
        		error <= 0;
        		if(error_dop3 = '1') then
        			--по доп. 2
        			TEST_NUMBER_PART <= "010";
        			if(hemming_out_1_1 ='0') then        			
	        			if(number_0 = 2) then
		        			number_old <= 0;	        				
		        		else
		        			number_old <=  number_old + 1;	        				
		        		end if;  
		        		value_old <= '1';     
		        		buffer_old  <= buffer_temp_1_1; 
		        		word_old <= WORD;	
	        		elsif(hemming_out_1_2 ='0') then
	        			if(number_old = 2) then
		        			number_old <= 0;	        				
		        		else
		        			number_old <=  number_0 + 1;	        				
		        		end if;  
		        		value_old  <= '0';     
		        		buffer_old  <= buffer_temp_1_2;

		        		word_old <= WORD;		        	
	        		end if; 
	        		
	        		if(number_0 = 0) then
        				temp_save_2 <= "00";
	        			temp_save_1 <= "10";
	        			temp_save_0 <= "01";
	        		elsif(number_0 = 1) then
	        			temp_save_2 <= "01";
	        			temp_save_1 <= "00";
	        			temp_save_0 <= "10";
	        		elsif(number_0 = 2) then
	        			temp_save_2 <= "10";
	        			temp_save_1 <= "01";
	        			temp_save_0 <= "00";
	        		else
	        			temp_save_2 <= "11";
	        			temp_save_1 <= "11";
	        			temp_save_0 <= "11";
	        		end if;	        		
        		else
        			-- по доп. 3
        			TEST_NUMBER_PART <= "011";
        			if(hemming_dop1_1_1 ='0') then  
	        			if(number_dop1_0 = 2) then
		        			number_old <= 0;	        				
		        		else
		        			number_old <=  number_dop1_0 + 1;	        				
		        		end if;  
		        		value_old <= '1';     
		        		buffer_old <= buffer_dop1_1_1; 
		        		word_old <= WORD;
		        				
	        		elsif(hemming_dop1_1_2 ='0') then        			
	        			if(number_dop1_0 = 2) then
		        			number_old <= 0;	        				
		        		else
		        			number_old <=  number_dop1_0 + 1;	        				
		        		end if;    
		        		value_old <= '0';     
		        		buffer_old <= buffer_dop1_1_2; 
		        		word_old <= WORD;
		        		
		        	else
		        		error_dop3 <= '1';
		        	end if;
		      -- Проверить  	
		        	if(number_dop1_0 = 0) then
        				temp_save_2 <= "00";
	        			temp_save_1 <= "10";
	        			temp_save_0 <= "01";
	        		elsif(number_dop1_0 = 1) then
	        			temp_save_2 <= "01";
	        			temp_save_1 <= "00";
	        			temp_save_0 <= "10";
	        		elsif(number_dop1_0 = 2) then
	        			temp_save_2 <= "10";
	        			temp_save_1 <= "01";
	        			temp_save_0 <= "00";
	        		else
	        			temp_save_2 <= "11";
	        			temp_save_1 <= "11";
	        			temp_save_0 <= "11";
	        		end if;
        		end if;
        	else
        		
        	end if;        		
        end if;
    end process;
    
end Decoder_Main_Error_arch;
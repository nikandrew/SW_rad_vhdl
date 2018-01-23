library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity Form_buffer_channel is
port(   CLK	  			: in std_logic;
        RES     		: in std_logic;
        ERROR_BUFFER 	: in std_logic_vector(1 downto 0);
        INPUT_STEP		: in std_logic_vector(1 downto 0);
        INPUT_DATA		: in std_logic;
        
        OUT_BUFFER_1 	: out std_logic_vector(2 downto 0);
        OUT_BUFFER_2 	: out std_logic_vector(2 downto 0)); 
end Form_buffer_channel;

architecture Form_buffer_channel_arch of Form_buffer_channel is  
signal buffer_temp_1, buffer_temp_2: std_logic_vector(2 downto 0);
begin 
	
	OUT_BUFFER_1 <= buffer_temp_1;
	OUT_BUFFER_2 <= buffer_temp_2;  
		   
    process (CLK,RES)
    begin
        if(RES = '1') then
        	buffer_temp_1 <= (others => '1'); 
        	buffer_temp_2 <= (others => '1'); 
        elsif(falling_edge(CLK)) then 
        	--Новое значение таймера записывается в оба буффера синхронно. В буфер первый записывается значение с ошибкой, а в буффер второй без нее и Form_word выводит значения поочереди из каждого буффера  
            if(ERROR_BUFFER = "01") then
	            if(INPUT_STEP(1 downto 0) = "00") then
	            	buffer_temp_1(0) <= NOT INPUT_DATA;
	            	buffer_temp_2(0) <= INPUT_DATA;
	            elsif(INPUT_STEP(1 downto 0) = "01") then
	            	buffer_temp_1(1) <= INPUT_DATA;
	            	buffer_temp_2(1) <= INPUT_DATA;
	            	buffer_temp_1(0) <= NOT buffer_temp_1(0);
	            else
	            	buffer_temp_1(2) <= INPUT_DATA;
	            	buffer_temp_2(2) <= INPUT_DATA;
	            	buffer_temp_1(0) <= NOT buffer_temp_1(0);
	            end if;    
	        elsif(ERROR_BUFFER = "10") then
	            if(INPUT_STEP(1 downto 0) = "00") then
	            	buffer_temp_1(0) <= INPUT_DATA;
	            	buffer_temp_2(0) <= INPUT_DATA;
	            	buffer_temp_1(1) <= NOT buffer_temp_1(1);
	            elsif(INPUT_STEP(1 downto 0) = "01") then
	            	buffer_temp_1(1) <= NOT INPUT_DATA;
	            	buffer_temp_2(1) <= INPUT_DATA;
	            else
	            	buffer_temp_1(2) <= INPUT_DATA;
	            	buffer_temp_2(2) <= INPUT_DATA;
	            	buffer_temp_1(1) <= NOT buffer_temp_1(1);
	           	end if;  
	        elsif(ERROR_BUFFER = "11") then
	            if(INPUT_STEP(1 downto 0) = "00") then
	            	buffer_temp_1(0) <= INPUT_DATA;
	            	buffer_temp_2(0) <= INPUT_DATA;
	            	buffer_temp_1(2) <= NOT buffer_temp_1(2);
	            elsif(INPUT_STEP(1 downto 0) = "01") then
	            	buffer_temp_1(1) <= INPUT_DATA;
	            	buffer_temp_2(1) <= INPUT_DATA;
	            	buffer_temp_1(2) <= NOT buffer_temp_1(2);
	            else
	            	buffer_temp_1(2) <= NOT INPUT_DATA;
	            	buffer_temp_2(2) <=  INPUT_DATA;
	            end if;   
	        else
	            if(INPUT_STEP(1 downto 0) = "00") then
	            	buffer_temp_1(0) <= INPUT_DATA;
	            	buffer_temp_2(0) <= INPUT_DATA;
	            elsif(INPUT_STEP(1 downto 0) = "01") then
	            	buffer_temp_1(1) <= INPUT_DATA;
	            	buffer_temp_2(1) <= INPUT_DATA;
	            else
	            	buffer_temp_1(2) <= INPUT_DATA;
	            	buffer_temp_2(2) <= INPUT_DATA;
	            end if; 
	        end if;
        end if;
    end process;
end Form_buffer_channel_arch;
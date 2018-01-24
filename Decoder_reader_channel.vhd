library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity Decoder_Reader_channel is
port(   RES     	: in std_logic;
		CLK			: in std_logic;
        IN_WORD		: in std_logic;
        SYNC		: in std_logic;
        OUT_WORD 	: out std_logic_vector(3 downto 0)); 
end Decoder_Reader_channel;

architecture Decoder_Reader_channel_arch of Decoder_Reader_channel is 
signal count_status : std_logic_vector(2 downto 0);
signal word_inner : std_logic_vector(3 downto 0);
signal sync_inner : std_logic; 

begin	 
	process (RES, SYNC )
    begin
        if(RES = '1') then
            sync_inner <= '0';
            OUT_WORD <= "0000"; 
        elsif(rising_edge(SYNC)) then
        	sync_inner <= '1';
        	OUT_WORD <= word_inner;
        end if;
    end process;
    
    process (RES, CLK)
    begin
        if(RES = '1') then           
            count_status <= "000";  
            word_inner <= "0000";           
        elsif(rising_edge(CLK)) then
        	if(sync_inner = '1') then
        		if(count_status = "001") then
        			count_status <= count_status + '1';	
        			word_inner(0) <= IN_WORD;
        		elsif(count_status = "011") then
        			count_status <= count_status + '1';	
        			word_inner(1) <= IN_WORD;
        		elsif(count_status = "101") then
        			count_status <= count_status + '1';	
        			word_inner(2) <= IN_WORD;
        		elsif(count_status = "111") then
        			count_status <= "000";	
        			word_inner(3) <= IN_WORD;
        		else
        			count_status <= count_status + '1';	
        		end if;        	
        	else
        		count_status <= "000";
        		word_inner <= "0000"; 
        	end if;	
        end if;
    end process;
end Decoder_Reader_channel_arch;
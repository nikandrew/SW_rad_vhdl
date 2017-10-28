library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity Decoder_Reader is
port(   RES     	: in std_logic;
		CLK			: in std_logic;
        IN_WORD		: in std_logic;
        SYNC		: out std_logic;
        OUT_WORD 	: out std_logic_vector(2 downto 0)); 
end Decoder_Reader;

architecture Decoder_Reader_arch of Decoder_Reader is 
signal count, count_status : std_logic_vector(2 downto 0);
signal word_inner, status : std_logic_vector(2 downto 0);
signal sync_inner : std_logic; 

begin	 
	process (RES, CLK )
    begin
        if(RES = '1') then
            sync_inner <= '0';
            count <= "000"; 
        elsif(rising_edge(CLK)) then
        	if(IN_WORD = '0') then
        		if(count = "110") then
        			sync_inner <= '1';
        		else
        			count <= count + '1';	        				
        		end if;
        	else
        		count <= "000";        			
        	end if;	
        end if;
    end process;
    
    process (RES, CLK, sync_inner)
    begin
        if(RES = '1') then           
            status <= "000";
            count_status <= "000"; 
            OUT_WORD <= "000";
            SYNC <= '0';
        elsif(rising_edge(CLK)) then
        	if(sync_inner = '1') then
        		if(count_status = "111") then
        			count_status <= "000";
        			OUT_WORD <= word_inner;
        			SYNC <= '1';
        		else
        			count_status <= count_status + '1';	
        			SYNC <= '0';
        			if(count_status = "010")  then
        				word_inner(0) <= IN_WORD;
        			elsif (count_status = "100") then
        			 	word_inner(1) <= IN_WORD;
        			elsif(count_status = "110") then
        				word_inner(2) <= IN_WORD;        				
        			end if;
        		end if;        	
        	else
        		status  <= "000";  			
        	end if;	
        end if;
    end process;
end Decoder_Reader_arch;
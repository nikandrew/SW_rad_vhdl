-- Divide.vhd
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity DIV_F2M is
port(   CLK	  	: in std_logic;
        RES     : in std_logic;
        STATUS	: out std_logic_vector(2 downto 0);
        NUMBER_BUFFER : out std_logic;
        F2M    	: out std_logic); 
end DIV_F2M;

architecture div_f2m_arch of DIV_F2M is  
signal counter : std_logic_vector(2 downto 0);
signal number : std_logic;
begin 
	STATUS <= counter;    
	NUMBER_BUFFER <= number;  
    divide_f2m: process (CLK,RES) 
    begin
        if(RES = '1') then            
        	counter <= (others => '0');
        	number <= '0';
            F2M <= '0';
        elsif(rising_edge(CLK)) then 
            if(counter = "111") then
                counter <= (others => '0');
                F2M <= '0';
                number <= not number;
            elsif(counter = "011") then
            	counter <= counter + '1';
                F2M <= '1';                
            else
            	counter <= counter + '1';
            end if;        
        end if;
    end process;
end div_f2m_arch;
LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY SW_Count_Coder_vhd_tst IS
END SW_Count_Coder_vhd_tst;
ARCHITECTURE SW_Count_Coder_arch OF SW_Count_Coder_vhd_tst IS

                                                 
SIGNAL CLK : STD_LOGIC;
SIGNAL INPUT_ERROR : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL ERROR_BUFFER : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL ERROR_COUNTER : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL ERROR_WORD : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL ERROR_SYNC : STD_LOGIC;
SIGNAL RES : STD_LOGIC;
SIGNAL OUT_WORD : STD_LOGIC;
SIGNAL TEST : STD_LOGIC_VECTOR(15 DOWNTO 0);
COMPONENT SW_Count_Coder
	PORT (
			CLK 		: IN STD_LOGIC;
			ERROR_SYNC 	: IN STD_LOGIC;
			ERROR_BUFFER : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
			ERROR_COUNTER : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
			ERROR_WORD : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
			RES 		: IN STD_LOGIC;
			OUT_WORD 	: OUT STD_LOGIC;
			TEST 		: OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
		);
END COMPONENT;
BEGIN
	i1 : SW_Count_Coder
	PORT MAP (
				CLK 		=> CLK,
				ERROR_SYNC => ERROR_SYNC,
				ERROR_BUFFER => ERROR_BUFFER,
				ERROR_COUNTER => ERROR_COUNTER,
				ERROR_WORD => ERROR_WORD,
				RES 		=> RES,
				OUT_WORD 	=> OUT_WORD,
				TEST 		=> TEST
			);
init : PROCESS                                 
BEGIN                                                        
   	RES <= '0';
    wait for 1 us;
    RES <= '1';
    wait for 1 us;
    RES <= '0';
    wait for 500 ms;                                                       
END PROCESS init;                                           
	
PROCESS                                              
BEGIN                                                         
    CLK <= '0';
    wait for 31.25 ns;
    CLK <= '1';
    wait for 31.25 ns;                                                       
END PROCESS;                                          


-- PROCESS                                              
-- BEGIN                                                         
    -- ERROR_SYNC<= '0';
    -- ERROR_BUFFER <= "00";
    
    -- wait for 6 us;
    -- ERROR_SYNC <= '1';
    -- ERROR_BUFFER <= "10";
    -- wait for 0.5 us;    
    -- ERROR_SYNC<= '0';
    -- ERROR_BUFFER <= "00";
    
    -- wait for 5 us;
    -- ERROR_SYNC <= '1';
    -- ERROR_BUFFER <= "11";
    -- wait for 0.5 us;    
    -- ERROR_SYNC<= '0';
    -- ERROR_BUFFER <= "00";
    
    -- wait for 5 us;
    -- ERROR_SYNC <= '1';
    -- ERROR_BUFFER <= "01";
    -- wait for 0.5 us; 
    -- ERROR_SYNC<= '0';
    -- ERROR_BUFFER <= "00";  
    -- wait for 10000 us;                                                   
-- END PROCESS;      

-- PROCESS                                              
-- BEGIN                                                         
    -- ERROR_COUNTER <= "00";
	-- ERROR_BUFFER <= "00";
    
    -- wait for 6 us;
    -- ERROR_COUNTER <= "10";
    -- wait for 0.5 us; 
    -- ERROR_COUNTER <= "00";
    
    -- wait for 5 us;
    -- ERROR_COUNTER <= "01";
    -- wait for 0.5 us; 
    -- ERROR_COUNTER <= "00";
    
    -- wait for 5 us;
    -- ERROR_COUNTER <= "10";
    -- wait for 0.5 us; 
    -- ERROR_COUNTER <= "00";  
    -- wait for 10000 us;                                                   
 -- END PROCESS;  

 PROCESS                                              
BEGIN                                                         
    ERROR_COUNTER <= "00";
	ERROR_BUFFER <= "00";
	ERROR_WORD <= "00";
    
    wait for 6 us;
    ERROR_WORD <= "10";
    wait for 0.5 us; 
    ERROR_WORD <= "00";
    
    wait for 5 us;
    ERROR_WORD <= "01";
    wait for 0.5 us; 
    ERROR_WORD <= "00";
    
    wait for 5 us;
    ERROR_WORD <= "11";
    wait for 0.5 us; 
    ERROR_WORD <= "00";  
    wait for 10000 us;                                                   
 END PROCESS;  
 
END SW_Count_Coder_arch;

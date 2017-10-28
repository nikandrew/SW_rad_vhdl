

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY Base_SW_Rad_vhd_tst IS
END Base_SW_Rad_vhd_tst;
ARCHITECTURE Base_SW_Rad_arch OF Base_SW_Rad_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL CLK : STD_LOGIC;
SIGNAL ERROR_BUFFER : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL ERROR_COUNTER : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL ERROR_WORD : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL OUT_COUNT : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL RES : STD_LOGIC;
SIGNAL TEST_CODER : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL TEST_DECODER : STD_LOGIC_VECTOR(15 DOWNTO 0);
COMPONENT Base_SW_Rad
	PORT (
	CLK : IN STD_LOGIC;
	ERROR_BUFFER : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	ERROR_COUNTER : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	ERROR_WORD : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	OUT_COUNT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
	RES : IN STD_LOGIC;
	TEST_CODER : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	TEST_DECODER : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : Base_SW_Rad
	PORT MAP (
-- list connections between master ports and signals
	CLK => CLK,
	ERROR_BUFFER => ERROR_BUFFER,
	ERROR_COUNTER => ERROR_COUNTER,
	ERROR_WORD => ERROR_WORD,
	OUT_COUNT => OUT_COUNT,
	RES => RES,
	TEST_CODER => TEST_CODER,
	TEST_DECODER => TEST_DECODER
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
                                       
END Base_SW_Rad_arch;

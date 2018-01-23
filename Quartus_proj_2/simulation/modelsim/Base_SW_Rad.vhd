

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY Base_SW_Rad_vhd_tst IS
END Base_SW_Rad_vhd_tst;
ARCHITECTURE Base_SW_Rad_arch OF Base_SW_Rad_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL CLK : STD_LOGIC;
SIGNAL ERROR_BUFFER 				: STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL ERROR_COUNTER 				: STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL ERROR_WORD 					: STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL RES_COD 						: STD_LOGIC;
SIGNAL RES_DEC 						: STD_LOGIC;



SIGNAL TEST_CODER_STEP				: std_logic_vector(2 downto 0);
--SIGNAL TEST_CODER_F2M				: std_logic;
SIGNAL TEST_CODER_BUFFER_1 			: std_logic_vector(2 downto 0);
SIGNAL TEST_CODER_BUFFER_2 			: std_logic_vector(2 downto 0);
SIGNAL TEST_CODER_NUMBER_BUFFER 	: std_logic;
SIGNAL TEST_CODER_OUTPUT			: std_logic;
SIGNAL TEST_CODER_WORD 				: std_logic_vector(2 downto 0);		
--SIGNAL TEST_CODER 					: STD_LOGIC_VECTOR(15 DOWNTO 0);

SIGNAL DECODER_INPUT_WORD			: std_logic_vector(2 downto 0);					
SIGNAL DECODER_OUT_COUNT			: std_logic_vector(1 downto 0);
SIGNAL DECODER_SYNC_SEND			: std_logic;

SIGNAL TEST_DECODER_VALUE			: std_logic;	
SIGNAL TEST_DECODER_NUMBER_PART		: std_logic_vector(2 downto 0);
SIGNAL TEST_DECODER_SYNC			: std_logic;	
SIGNAL TEST_DECODER 				: STD_LOGIC_VECTOR(15 DOWNTO 0);

SIGNAL TEMP							: integer range 0 to 2;

COMPONENT Base_SW_Rad
	PORT (
	CLK 			: IN STD_LOGIC;
	ERROR_BUFFER 	: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	ERROR_COUNTER 	: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	ERROR_WORD 		: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	
	RES_COD 		: IN STD_LOGIC;
	RES_DEC 		: IN STD_LOGIC;
	
	DECODER_INPUT_WORD			: out std_logic_vector(2 downto 0);
	DECODER_OUT_COUNT			: out std_logic_vector(1 downto 0);
	DECODER_SYNC_SEND			: out std_logic;
		
	
	TEST_CODER_STEP				: out std_logic_vector(2 downto 0);
	TEST_CODER_F2M				: out std_logic;
	TEST_CODER_BUFFER_1 		: out std_logic_vector(2 downto 0);
	TEST_CODER_BUFFER_2 		: out std_logic_vector(2 downto 0);
	TEST_CODER_NUMBER_BUFFER 	: out std_logic;
	TEST_CODER_OUTPUT			: out std_logic;		
	TEST_CODER_WORD 			: out std_logic_vector(2 downto 0);
	TEST_CODER 					: OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	
	TEST_DECODER_VALUE			: out std_logic;	
    TEST_DECODER_NUMBER_PART	: out std_logic_vector(2 downto 0);
    TEST_DECODER_SYNC			: out std_logic;			
	TEST_DECODER 				: OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
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
	
	RES_COD => RES_COD,	
	RES_DEC => RES_DEC,
	
	DECODER_INPUT_WORD => DECODER_INPUT_WORD,
	DECODER_OUT_COUNT => DECODER_OUT_COUNT,
	DECODER_SYNC_SEND => DECODER_SYNC_SEND,
	
	TEST_CODER_STEP		=> TEST_CODER_STEP,
	TEST_CODER_F2M		=> open,--TEST_CODER_F2M,
	TEST_CODER_BUFFER_1 	=> TEST_CODER_BUFFER_1,
	TEST_CODER_BUFFER_2 	=> TEST_CODER_BUFFER_2,
	TEST_CODER_NUMBER_BUFFER => TEST_CODER_NUMBER_BUFFER,
	TEST_CODER_OUTPUT		=> TEST_CODER_OUTPUT,
	TEST_CODER_WORD			=> TEST_CODER_WORD,
	
	TEST_DECODER_VALUE		=> TEST_DECODER_VALUE,	
    TEST_DECODER_NUMBER_PART => TEST_DECODER_NUMBER_PART,
    TEST_DECODER_SYNC	=> 	TEST_DECODER_SYNC,				
			
	TEST_CODER => open,--TEST_CODER,
	TEST_DECODER => TEST_DECODER
	);
init_DEC : PROCESS                                 
BEGIN                                                        
   	RES_DEC <= '0';
    wait for 2 us;
    RES_DEC <= '1';
    wait for 0.5 us;
    RES_DEC <= '0';
    wait for 500 ms;                                                       
END PROCESS init_DEC;                                           
	
init_COD : PROCESS                                 
BEGIN                                                        
   	RES_COD <= '0';
    wait for 1 us;
    RES_COD <= '1';
    wait for 1 us;
    RES_COD <= '0';
    wait for 500 ms;                                                       
END PROCESS init_COD;	
	
PROCESS                                              
BEGIN                                                         
	CLK <= '0';

    wait for 31.25 ns;
    CLK <= '1';
    wait for 31.25 ns;                                                       
END PROCESS;                                          


 PROCESS                                              
 BEGIN                                                         

 	ERROR_BUFFER <= "00";
 	ERROR_COUNTER <= "00";
 	ERROR_WORD <= "00";
    
     wait for 8.8 us;
 
     ERROR_BUFFER <= "10";
     wait for 0.5 us; 
     ERROR_BUFFER <= "00";    
     wait for 5 us;
     
     ERROR_BUFFER <= "11";
     wait for 0.5 us; 
     ERROR_BUFFER <= "00";    
     wait for 5 us;
     
     ERROR_BUFFER <= "01";
     wait for 0.5 us; 
     ERROR_BUFFER <= "00";  
     wait for 10000 us;                                                   
 END PROCESS;      

-- PROCESS                                              
-- BEGIN                                                         
--     ERROR_COUNTER <= "00";
--	 ERROR_BUFFER <= "00";
--	 ERROR_WORD <= "00";
--    
--     wait for 5 us;
--     ERROR_COUNTER <= "10";
--     wait for 0.5 us; 
--     ERROR_COUNTER <= "00";
--    
--     wait for 5 us;
--     ERROR_COUNTER <= "01";
--     wait for 0.5 us; 
--     ERROR_COUNTER <= "00";
--    
--     wait for 5 us;
--     ERROR_COUNTER <= "10";
--     wait for 0.5 us; 
--     ERROR_COUNTER <= "00";  
--     wait for 10000 us;                                                   
--  END PROCESS;  

-- PROCESS                                              
--BEGIN                                                         
--    ERROR_COUNTER <= "00";
--	ERROR_BUFFER <= "00";
--	ERROR_WORD <= "00";
--    
--    wait for 5.5 us;
--    ERROR_WORD <= "10";
--    wait for 0.5 us; 
--    ERROR_WORD <= "00";
--    
--    wait for 5 us;
--    ERROR_WORD <= "01";
--    wait for 0.5 us; 
--    ERROR_WORD <= "00";
--    
--    wait for 5 us;
--    ERROR_WORD <= "11";
--    wait for 0.5 us; 
--    ERROR_WORD <= "00";  
--    wait for 10000 us;                                                   
-- END PROCESS;  
                                       
END Base_SW_Rad_arch;

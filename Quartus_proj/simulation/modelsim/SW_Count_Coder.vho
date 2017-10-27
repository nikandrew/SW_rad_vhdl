-- Copyright (C) 1991-2009 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II"
-- VERSION "Version 9.0 Build 235 06/17/2009 Service Pack 2 SJ Web Edition"

-- DATE "10/27/2017 22:46:07"

-- 
-- Device: Altera EPF10K30EFC256-3 Package FBGA256
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY IEEE, flex10ke;
USE IEEE.std_logic_1164.all;
USE flex10ke.flex10ke_components.all;

ENTITY 	Base_SW_Rad IS
    PORT (
	CLK : IN std_logic;
	RES : IN std_logic;
	ERROR_BUFFER : IN std_logic_vector(1 DOWNTO 0);
	ERROR_COUNTER : IN std_logic_vector(1 DOWNTO 0);
	ERROR_WORD : IN std_logic_vector(1 DOWNTO 0);
	OUT_COUNT : OUT std_logic_vector(1 DOWNTO 0);
	TEST_CODER : OUT std_logic_vector(15 DOWNTO 0);
	TEST_DECODER : OUT std_logic_vector(15 DOWNTO 0)
	);
END Base_SW_Rad;

ARCHITECTURE structure OF Base_SW_Rad IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_CLK : std_logic;
SIGNAL ww_RES : std_logic;
SIGNAL ww_ERROR_BUFFER : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_ERROR_COUNTER : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_ERROR_WORD : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_OUT_COUNT : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_TEST_CODER : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_TEST_DECODER : std_logic_vector(15 DOWNTO 0);
SIGNAL \Coder|Form_word|OUT_WORD~17_combout\ : std_logic;
SIGNAL \Coder|Form_word|OUT_WORD~10_combout\ : std_logic;
SIGNAL \Coder|Form_buffer|buffer_temp_1~23_combout\ : std_logic;
SIGNAL \Coder|Form_word|OUT_WORD~27_combout\ : std_logic;
SIGNAL \Coder|Form_word|OUT_WORD~47\ : std_logic;
SIGNAL \Coder|Form_word|OUT_WORD~29_combout\ : std_logic;
SIGNAL \Coder|Form_word|OUT_WORD~32_combout\ : std_logic;
SIGNAL \RES~dataout\ : std_logic;
SIGNAL \CLK~dataout\ : std_logic;
SIGNAL \Coder|DIV|Equal0~0_combout\ : std_logic;
SIGNAL \Coder|DIV|Equal1~0_combout\ : std_logic;
SIGNAL \Coder|DIV|F2M~regout\ : std_logic;
SIGNAL \Coder|Form_buffer|Equal3~0_combout\ : std_logic;
SIGNAL \Coder|Form_buffer|Equal3~1_combout\ : std_logic;
SIGNAL \Coder|Form_buffer|buffer_temp_1~33\ : std_logic;
SIGNAL \Coder|Form_buffer|buffer_temp_1~26_combout\ : std_logic;
SIGNAL \Coder|Form_buffer|buffer_temp_1~17_combout\ : std_logic;
SIGNAL \Coder|Form_buffer|Equal1~0_combout\ : std_logic;
SIGNAL \Coder|Form_buffer|buffer_temp_2[0]~5_combout\ : std_logic;
SIGNAL \Coder|Form_buffer|buffer_temp_2[2]~6_combout\ : std_logic;
SIGNAL \Coder|DIV|number~regout\ : std_logic;
SIGNAL \Coder|Form_word|OUT_WORD~20_combout\ : std_logic;
SIGNAL \Coder|Form_word|OUT_WORD~44\ : std_logic;
SIGNAL \Coder|Form_word|OUT_WORD~31_combout\ : std_logic;
SIGNAL \Coder|Form_word|OUT_WORD~15_combout\ : std_logic;
SIGNAL \Coder|Form_word|Equal3~0_combout\ : std_logic;
SIGNAL \Coder|Form_word|OUT_WORD~18_combout\ : std_logic;
SIGNAL \Coder|Form_word|OUT_WORD~3_combout\ : std_logic;
SIGNAL \Coder|Form_word|OUT_WORD~19_combout\ : std_logic;
SIGNAL \Coder|Form_word|OUT_WORD~combout\ : std_logic;
SIGNAL \Coder|DIV|F2M~3_regout\ : std_logic;
SIGNAL \Coder|Form_buffer|buffer_temp_1\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \Coder|Form_buffer|buffer_temp_2\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \Coder|COUNT|counter\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \Coder|DIV|counter\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \ERROR_BUFFER~dataout\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \ERROR_COUNTER~dataout\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \ERROR_WORD~dataout\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \Coder|DIV|ALT_INV_F2M~regout\ : std_logic;
SIGNAL \Coder|COUNT|ALT_INV_counter\ : std_logic_vector(2 DOWNTO 1);
SIGNAL \Coder|Form_buffer|ALT_INV_buffer_temp_1\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \Coder|Form_buffer|ALT_INV_buffer_temp_2\ : std_logic_vector(2 DOWNTO 0);

BEGIN

ww_CLK <= CLK;
ww_RES <= RES;
ww_ERROR_BUFFER <= ERROR_BUFFER;
ww_ERROR_COUNTER <= ERROR_COUNTER;
ww_ERROR_WORD <= ERROR_WORD;
OUT_COUNT <= ww_OUT_COUNT;
TEST_CODER <= ww_TEST_CODER;
TEST_DECODER <= ww_TEST_DECODER;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\Coder|DIV|ALT_INV_F2M~regout\ <= NOT \Coder|DIV|F2M~regout\;
\Coder|COUNT|ALT_INV_counter\(1) <= NOT \Coder|COUNT|counter\(1);
\Coder|COUNT|ALT_INV_counter\(2) <= NOT \Coder|COUNT|counter\(2);
\Coder|Form_buffer|ALT_INV_buffer_temp_1\(0) <= NOT \Coder|Form_buffer|buffer_temp_1\(0);
\Coder|Form_buffer|ALT_INV_buffer_temp_1\(1) <= NOT \Coder|Form_buffer|buffer_temp_1\(1);
\Coder|Form_buffer|ALT_INV_buffer_temp_1\(2) <= NOT \Coder|Form_buffer|buffer_temp_1\(2);
\Coder|Form_buffer|ALT_INV_buffer_temp_2\(0) <= NOT \Coder|Form_buffer|buffer_temp_2\(0);
\Coder|Form_buffer|ALT_INV_buffer_temp_2\(1) <= NOT \Coder|Form_buffer|buffer_temp_2\(1);
\Coder|Form_buffer|ALT_INV_buffer_temp_2\(2) <= NOT \Coder|Form_buffer|buffer_temp_2\(2);

\Coder|Form_word|OUT_WORD~17\ : flex10ke_lcell
-- Equation(s):
-- \Coder|Form_word|OUT_WORD~17_combout\ = \Coder|Form_buffer|buffer_temp_1\(2) $ \Coder|Form_word|OUT_WORD~32_combout\ $ (\ERROR_WORD~dataout\(0) & \ERROR_WORD~dataout\(1))

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "9666",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \Coder|Form_buffer|buffer_temp_1\(2),
	datab => \Coder|Form_word|OUT_WORD~32_combout\,
	datac => \ERROR_WORD~dataout\(0),
	datad => \ERROR_WORD~dataout\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Coder|Form_word|OUT_WORD~17_combout\);

\Coder|Form_word|OUT_WORD~10\ : flex10ke_lcell
-- Equation(s):
-- \Coder|Form_word|OUT_WORD~10_combout\ = \Coder|Form_buffer|buffer_temp_2\(0) $ \ERROR_WORD~dataout\(1) $ \ERROR_WORD~dataout\(0) $ \Coder|Form_buffer|buffer_temp_2\(1)

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "6996",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \Coder|Form_buffer|buffer_temp_2\(0),
	datab => \ERROR_WORD~dataout\(1),
	datac => \ERROR_WORD~dataout\(0),
	datad => \Coder|Form_buffer|buffer_temp_2\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Coder|Form_word|OUT_WORD~10_combout\);

\Coder|Form_word|OUT_WORD~29\ : flex10ke_lcell
-- Equation(s):
-- \Coder|Form_word|OUT_WORD~47\ = \Coder|DIV|Equal1~0_combout\ # \Coder|Form_buffer|buffer_temp_1\(1) $ (\ERROR_WORD~dataout\(1) & !\ERROR_WORD~dataout\(0))

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "ffd2",
	operation_mode => "normal",
	output_mode => "none",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \ERROR_WORD~dataout\(1),
	datab => \ERROR_WORD~dataout\(0),
	datac => \Coder|Form_buffer|buffer_temp_1\(1),
	datad => \Coder|DIV|Equal1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Coder|Form_word|OUT_WORD~29_combout\,
	cascout => \Coder|Form_word|OUT_WORD~47\);

\Coder|Form_word|OUT_WORD~32\ : flex10ke_lcell
-- Equation(s):
-- \Coder|Form_word|OUT_WORD~32_combout\ = (\Coder|Form_buffer|buffer_temp_1\(0) $ (\ERROR_WORD~dataout\(0) & !\ERROR_WORD~dataout\(1)) # !\Coder|DIV|Equal1~0_combout\) & CASCADE(\Coder|Form_word|OUT_WORD~47\)

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "f75d",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \Coder|DIV|Equal1~0_combout\,
	datab => \ERROR_WORD~dataout\(0),
	datac => \ERROR_WORD~dataout\(1),
	datad => \Coder|Form_buffer|buffer_temp_1\(0),
	cascin => \Coder|Form_word|OUT_WORD~47\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Coder|Form_word|OUT_WORD~32_combout\);

\RES~I\ : flex10ke_io
-- pragma translate_off
GENERIC MAP (
	feedback_mode => "from_pin",
	operation_mode => "input",
	reg_source_mode => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	ena => VCC,
	padio => ww_RES,
	dataout => \RES~dataout\);

\CLK~I\ : flex10ke_io
-- pragma translate_off
GENERIC MAP (
	feedback_mode => "from_pin",
	operation_mode => "input",
	reg_source_mode => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	ena => VCC,
	padio => ww_CLK,
	dataout => \CLK~dataout\);

\Coder|DIV|counter[0]\ : flex10ke_lcell
-- Equation(s):
-- \Coder|DIV|counter\(0) = DFFEA(!\Coder|DIV|counter\(0), GLOBAL(\CLK~dataout\), !GLOBAL(\RES~dataout\), , , , )

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "00ff",
	operation_mode => "normal",
	output_mode => "reg_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	datad => \Coder|DIV|counter\(0),
	aclr => \RES~dataout\,
	clk => \CLK~dataout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Coder|DIV|counter\(0));

\Coder|DIV|counter[1]\ : flex10ke_lcell
-- Equation(s):
-- \Coder|DIV|counter\(1) = DFFEA(\Coder|DIV|counter\(0) $ \Coder|DIV|counter\(1), GLOBAL(\CLK~dataout\), !GLOBAL(\RES~dataout\), , , , )

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "0ff0",
	operation_mode => "normal",
	output_mode => "reg_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	datac => \Coder|DIV|counter\(0),
	datad => \Coder|DIV|counter\(1),
	aclr => \RES~dataout\,
	clk => \CLK~dataout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Coder|DIV|counter\(1));

\Coder|DIV|counter[2]\ : flex10ke_lcell
-- Equation(s):
-- \Coder|DIV|counter\(2) = DFFEA(\Coder|DIV|counter\(2) $ (\Coder|DIV|counter\(0) & \Coder|DIV|counter\(1)), GLOBAL(\CLK~dataout\), !GLOBAL(\RES~dataout\), , , , )

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "3fc0",
	operation_mode => "normal",
	output_mode => "reg_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	datab => \Coder|DIV|counter\(0),
	datac => \Coder|DIV|counter\(1),
	datad => \Coder|DIV|counter\(2),
	aclr => \RES~dataout\,
	clk => \CLK~dataout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Coder|DIV|counter\(2));

\Coder|DIV|Equal0~0\ : flex10ke_lcell
-- Equation(s):
-- \Coder|DIV|Equal0~0_combout\ = \Coder|DIV|counter\(0) & \Coder|DIV|counter\(1) & \Coder|DIV|counter\(2)

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "c000",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	datab => \Coder|DIV|counter\(0),
	datac => \Coder|DIV|counter\(1),
	datad => \Coder|DIV|counter\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Coder|DIV|Equal0~0_combout\);

\Coder|DIV|Equal1~0\ : flex10ke_lcell
-- Equation(s):
-- \Coder|DIV|Equal1~0_combout\ = !\Coder|DIV|counter\(2) & \Coder|DIV|counter\(0) & \Coder|DIV|counter\(1)

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "3000",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	datab => \Coder|DIV|counter\(2),
	datac => \Coder|DIV|counter\(0),
	datad => \Coder|DIV|counter\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Coder|DIV|Equal1~0_combout\);

\Coder|DIV|F2M\ : flex10ke_lcell
-- Equation(s):
-- \Coder|DIV|F2M~regout\ = DFFEA(!\Coder|DIV|Equal0~0_combout\ & (\Coder|DIV|Equal1~0_combout\ # \Coder|DIV|F2M~regout\), GLOBAL(\CLK~dataout\), !GLOBAL(\RES~dataout\), , , , )

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "3330",
	operation_mode => "normal",
	output_mode => "reg_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	datab => \Coder|DIV|Equal0~0_combout\,
	datac => \Coder|DIV|Equal1~0_combout\,
	datad => \Coder|DIV|F2M~regout\,
	aclr => \RES~dataout\,
	clk => \CLK~dataout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Coder|DIV|F2M~regout\);

\ERROR_COUNTER[1]~I\ : flex10ke_io
-- pragma translate_off
GENERIC MAP (
	feedback_mode => "from_pin",
	operation_mode => "input",
	reg_source_mode => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	ena => VCC,
	padio => ww_ERROR_COUNTER(1),
	dataout => \ERROR_COUNTER~dataout\(1));

\ERROR_COUNTER[0]~I\ : flex10ke_io
-- pragma translate_off
GENERIC MAP (
	feedback_mode => "from_pin",
	operation_mode => "input",
	reg_source_mode => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	ena => VCC,
	padio => ww_ERROR_COUNTER(0),
	dataout => \ERROR_COUNTER~dataout\(0));

\Coder|Form_buffer|Equal3~0\ : flex10ke_lcell
-- Equation(s):
-- \Coder|Form_buffer|Equal3~0_combout\ = \Coder|COUNT|counter\(1) & \Coder|COUNT|counter\(0)

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "f000",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	datac => \Coder|COUNT|counter\(1),
	datad => \Coder|COUNT|counter\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Coder|Form_buffer|Equal3~0_combout\);

\Coder|COUNT|counter[1]\ : flex10ke_lcell
-- Equation(s):
-- \Coder|COUNT|counter\(1) = DFFEA(\ERROR_COUNTER~dataout\(1) & (!\Coder|Form_buffer|Equal3~0_combout\ # !\ERROR_COUNTER~dataout\(0)) # !\ERROR_COUNTER~dataout\(1) & (\ERROR_COUNTER~dataout\(0) & \Coder|Form_buffer|Equal3~1_combout\ # 
-- !\ERROR_COUNTER~dataout\(0) & (!\Coder|Form_buffer|Equal3~0_combout\)), GLOBAL(\Coder|DIV|F2M~regout\), !GLOBAL(\RES~dataout\), , , , )

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "2cef",
	operation_mode => "normal",
	output_mode => "reg_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \Coder|Form_buffer|Equal3~1_combout\,
	datab => \ERROR_COUNTER~dataout\(1),
	datac => \ERROR_COUNTER~dataout\(0),
	datad => \Coder|Form_buffer|Equal3~0_combout\,
	aclr => \RES~dataout\,
	clk => \Coder|DIV|F2M~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Coder|COUNT|counter\(1));

\Coder|COUNT|counter[0]\ : flex10ke_lcell
-- Equation(s):
-- \Coder|COUNT|counter\(0) = DFFEA(\ERROR_COUNTER~dataout\(1) & (\ERROR_COUNTER~dataout\(0) & !\Coder|COUNT|counter\(0) & \Coder|COUNT|counter\(1) # !\ERROR_COUNTER~dataout\(0) & (!\Coder|COUNT|counter\(1))) # !\ERROR_COUNTER~dataout\(1) & 
-- \Coder|COUNT|counter\(1) & (\Coder|COUNT|counter\(0) $ !\ERROR_COUNTER~dataout\(0)), GLOBAL(\Coder|DIV|F2M~regout\), !GLOBAL(\RES~dataout\), , , , )

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "610c",
	operation_mode => "normal",
	output_mode => "reg_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \Coder|COUNT|counter\(0),
	datab => \ERROR_COUNTER~dataout\(1),
	datac => \ERROR_COUNTER~dataout\(0),
	datad => \Coder|COUNT|counter\(1),
	aclr => \RES~dataout\,
	clk => \Coder|DIV|F2M~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Coder|COUNT|counter\(0));

\Coder|COUNT|counter[2]\ : flex10ke_lcell
-- Equation(s):
-- \Coder|COUNT|counter\(2) = DFFEA(\Coder|COUNT|counter\(1) $ \Coder|COUNT|counter\(2) $ (\ERROR_COUNTER~dataout\(0) # !\ERROR_COUNTER~dataout\(1)), GLOBAL(\Coder|DIV|F2M~regout\), !GLOBAL(\RES~dataout\), , , , )

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "9699",
	operation_mode => "normal",
	output_mode => "reg_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \Coder|COUNT|counter\(1),
	datab => \Coder|COUNT|counter\(2),
	datac => \ERROR_COUNTER~dataout\(0),
	datad => \ERROR_COUNTER~dataout\(1),
	aclr => \RES~dataout\,
	clk => \Coder|DIV|F2M~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Coder|COUNT|counter\(2));

\ERROR_BUFFER[0]~I\ : flex10ke_io
-- pragma translate_off
GENERIC MAP (
	feedback_mode => "from_pin",
	operation_mode => "input",
	reg_source_mode => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	ena => VCC,
	padio => ww_ERROR_BUFFER(0),
	dataout => \ERROR_BUFFER~dataout\(0));

\ERROR_BUFFER[1]~I\ : flex10ke_io
-- pragma translate_off
GENERIC MAP (
	feedback_mode => "from_pin",
	operation_mode => "input",
	reg_source_mode => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	ena => VCC,
	padio => ww_ERROR_BUFFER(1),
	dataout => \ERROR_BUFFER~dataout\(1));

\Coder|Form_buffer|Equal3~1\ : flex10ke_lcell
-- Equation(s):
-- \Coder|Form_buffer|Equal3~1_combout\ = \Coder|COUNT|counter\(0) # !\Coder|COUNT|counter\(1)

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "ff0f",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	datac => \Coder|COUNT|counter\(1),
	datad => \Coder|COUNT|counter\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Coder|Form_buffer|Equal3~1_combout\);

\Coder|Form_buffer|buffer_temp_1~23\ : flex10ke_lcell
-- Equation(s):
-- \Coder|Form_buffer|buffer_temp_1~33\ = \Coder|Form_buffer|Equal3~1_combout\ # \Coder|COUNT|counter\(2) $ (\ERROR_BUFFER~dataout\(0) & !\ERROR_BUFFER~dataout\(1))

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "ffd2",
	operation_mode => "normal",
	output_mode => "none",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \ERROR_BUFFER~dataout\(0),
	datab => \ERROR_BUFFER~dataout\(1),
	datac => \Coder|COUNT|counter\(2),
	datad => \Coder|Form_buffer|Equal3~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Coder|Form_buffer|buffer_temp_1~23_combout\,
	cascout => \Coder|Form_buffer|buffer_temp_1~33\);

\Coder|Form_buffer|buffer_temp_1~26\ : flex10ke_lcell
-- Equation(s):
-- \Coder|Form_buffer|buffer_temp_1~26_combout\ = (\Coder|Form_buffer|buffer_temp_1\(0) $ (\ERROR_BUFFER~dataout\(0) & !\ERROR_BUFFER~dataout\(1)) # !\Coder|Form_buffer|Equal3~1_combout\) & CASCADE(\Coder|Form_buffer|buffer_temp_1~33\)

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "f75d",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \Coder|Form_buffer|Equal3~1_combout\,
	datab => \ERROR_BUFFER~dataout\(0),
	datac => \ERROR_BUFFER~dataout\(1),
	datad => \Coder|Form_buffer|buffer_temp_1\(0),
	cascin => \Coder|Form_buffer|buffer_temp_1~33\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Coder|Form_buffer|buffer_temp_1~26_combout\);

\Coder|Form_buffer|buffer_temp_1[0]\ : flex10ke_lcell
-- Equation(s):
-- \Coder|Form_buffer|buffer_temp_1\(0) = DFFEA(\Coder|Form_buffer|buffer_temp_1~26_combout\, !GLOBAL(\Coder|DIV|F2M~regout\), !GLOBAL(\RES~dataout\), , , , )

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "ff00",
	operation_mode => "normal",
	output_mode => "reg_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	datad => \Coder|Form_buffer|buffer_temp_1~26_combout\,
	aclr => \RES~dataout\,
	clk => \Coder|DIV|ALT_INV_F2M~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Coder|Form_buffer|buffer_temp_1\(0));

\Coder|Form_buffer|buffer_temp_1~17\ : flex10ke_lcell
-- Equation(s):
-- \Coder|Form_buffer|buffer_temp_1~17_combout\ = \Coder|COUNT|counter\(1) & (\Coder|COUNT|counter\(0) & !\Coder|COUNT|counter\(2) # !\Coder|COUNT|counter\(0) & (!\Coder|Form_buffer|buffer_temp_1\(1))) # !\Coder|COUNT|counter\(1) & 
-- (!\Coder|Form_buffer|buffer_temp_1\(1))

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "5333",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \Coder|COUNT|counter\(2),
	datab => \Coder|Form_buffer|buffer_temp_1\(1),
	datac => \Coder|COUNT|counter\(1),
	datad => \Coder|COUNT|counter\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Coder|Form_buffer|buffer_temp_1~17_combout\);

\Coder|Form_buffer|buffer_temp_1[1]\ : flex10ke_lcell
-- Equation(s):
-- \Coder|Form_buffer|buffer_temp_1\(1) = DFFEA(\Coder|Form_buffer|buffer_temp_1~17_combout\ $ (\ERROR_BUFFER~dataout\(0) # !\ERROR_BUFFER~dataout\(1)), !GLOBAL(\Coder|DIV|F2M~regout\), !GLOBAL(\RES~dataout\), , , , )

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "0cf3",
	operation_mode => "normal",
	output_mode => "reg_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	datab => \ERROR_BUFFER~dataout\(1),
	datac => \ERROR_BUFFER~dataout\(0),
	datad => \Coder|Form_buffer|buffer_temp_1~17_combout\,
	aclr => \RES~dataout\,
	clk => \Coder|DIV|ALT_INV_F2M~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Coder|Form_buffer|buffer_temp_1\(1));

\Coder|Form_buffer|Equal1~0\ : flex10ke_lcell
-- Equation(s):
-- \Coder|Form_buffer|Equal1~0_combout\ = \ERROR_BUFFER~dataout\(0) & \ERROR_BUFFER~dataout\(1)

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "f000",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	datac => \ERROR_BUFFER~dataout\(0),
	datad => \ERROR_BUFFER~dataout\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Coder|Form_buffer|Equal1~0_combout\);

\Coder|Form_buffer|buffer_temp_1[2]\ : flex10ke_lcell
-- Equation(s):
-- \Coder|Form_buffer|buffer_temp_1\(2) = DFFEA(\Coder|Form_buffer|Equal1~0_combout\ $ (\Coder|COUNT|counter\(1) & (\Coder|Form_buffer|buffer_temp_1\(2)) # !\Coder|COUNT|counter\(1) & \Coder|COUNT|counter\(2)), !GLOBAL(\Coder|DIV|F2M~regout\), 
-- !GLOBAL(\RES~dataout\), , , , )

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "1be4",
	operation_mode => "normal",
	output_mode => "reg_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \Coder|COUNT|counter\(1),
	datab => \Coder|COUNT|counter\(2),
	datac => \Coder|Form_buffer|buffer_temp_1\(2),
	datad => \Coder|Form_buffer|Equal1~0_combout\,
	aclr => \RES~dataout\,
	clk => \Coder|DIV|ALT_INV_F2M~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Coder|Form_buffer|buffer_temp_1\(2));

\Coder|Form_buffer|buffer_temp_2[0]~5\ : flex10ke_lcell
-- Equation(s):
-- \Coder|Form_buffer|buffer_temp_2[0]~5_combout\ = !\Coder|Form_buffer|Equal3~1_combout\

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "00ff",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	datad => \Coder|Form_buffer|Equal3~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Coder|Form_buffer|buffer_temp_2[0]~5_combout\);

\Coder|Form_buffer|buffer_temp_2[0]\ : flex10ke_lcell
-- Equation(s):
-- \Coder|Form_buffer|buffer_temp_2\(0) = DFFEA(\Coder|COUNT|counter\(2), !GLOBAL(\Coder|DIV|F2M~regout\), !GLOBAL(\RES~dataout\), , \Coder|Form_buffer|buffer_temp_2[0]~5_combout\, , )

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "true",
	lut_mask => "ff00",
	operation_mode => "normal",
	output_mode => "reg_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \Coder|Form_buffer|buffer_temp_2[0]~5_combout\,
	datad => \Coder|COUNT|counter\(2),
	aclr => \RES~dataout\,
	clk => \Coder|DIV|ALT_INV_F2M~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Coder|Form_buffer|buffer_temp_2\(0));

\Coder|Form_buffer|buffer_temp_2[1]\ : flex10ke_lcell
-- Equation(s):
-- \Coder|Form_buffer|buffer_temp_2\(1) = DFFEA(\Coder|COUNT|counter\(2), !GLOBAL(\Coder|DIV|F2M~regout\), !GLOBAL(\RES~dataout\), , \Coder|Form_buffer|Equal3~0_combout\, , )

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "true",
	lut_mask => "ff00",
	operation_mode => "normal",
	output_mode => "reg_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \Coder|Form_buffer|Equal3~0_combout\,
	datad => \Coder|COUNT|counter\(2),
	aclr => \RES~dataout\,
	clk => \Coder|DIV|ALT_INV_F2M~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Coder|Form_buffer|buffer_temp_2\(1));

\Coder|Form_buffer|buffer_temp_2[2]~6\ : flex10ke_lcell
-- Equation(s):
-- \Coder|Form_buffer|buffer_temp_2[2]~6_combout\ = !\Coder|COUNT|counter\(1)

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "00ff",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	datad => \Coder|COUNT|counter\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Coder|Form_buffer|buffer_temp_2[2]~6_combout\);

\Coder|Form_buffer|buffer_temp_2[2]\ : flex10ke_lcell
-- Equation(s):
-- \Coder|Form_buffer|buffer_temp_2\(2) = DFFEA(\Coder|COUNT|counter\(2), !GLOBAL(\Coder|DIV|F2M~regout\), !GLOBAL(\RES~dataout\), , \Coder|Form_buffer|buffer_temp_2[2]~6_combout\, , )

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "true",
	lut_mask => "ff00",
	operation_mode => "normal",
	output_mode => "reg_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \Coder|Form_buffer|buffer_temp_2[2]~6_combout\,
	datad => \Coder|COUNT|counter\(2),
	aclr => \RES~dataout\,
	clk => \Coder|DIV|ALT_INV_F2M~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Coder|Form_buffer|buffer_temp_2\(2));

\Coder|DIV|number\ : flex10ke_lcell
-- Equation(s):
-- \Coder|DIV|number~regout\ = DFFEA(!\Coder|DIV|number~regout\, GLOBAL(\CLK~dataout\), !GLOBAL(\RES~dataout\), , \Coder|DIV|Equal0~0_combout\, , )

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "true",
	lut_mask => "00ff",
	operation_mode => "normal",
	output_mode => "reg_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \Coder|DIV|Equal0~0_combout\,
	datad => \Coder|DIV|number~regout\,
	aclr => \RES~dataout\,
	clk => \CLK~dataout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Coder|DIV|number~regout\);

\Coder|Form_word|OUT_WORD~20\ : flex10ke_lcell
-- Equation(s):
-- \Coder|Form_word|OUT_WORD~20_combout\ = \Coder|DIV|counter\(0) & (!\Coder|DIV|counter\(2) # !\Coder|DIV|counter\(1))

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "3f00",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	datab => \Coder|DIV|counter\(1),
	datac => \Coder|DIV|counter\(2),
	datad => \Coder|DIV|counter\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Coder|Form_word|OUT_WORD~20_combout\);

\ERROR_WORD[0]~I\ : flex10ke_io
-- pragma translate_off
GENERIC MAP (
	feedback_mode => "from_pin",
	operation_mode => "input",
	reg_source_mode => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	ena => VCC,
	padio => ww_ERROR_WORD(0),
	dataout => \ERROR_WORD~dataout\(0));

\ERROR_WORD[1]~I\ : flex10ke_io
-- pragma translate_off
GENERIC MAP (
	feedback_mode => "from_pin",
	operation_mode => "input",
	reg_source_mode => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	ena => VCC,
	padio => ww_ERROR_WORD(1),
	dataout => \ERROR_WORD~dataout\(1));

\Coder|Form_word|OUT_WORD~27\ : flex10ke_lcell
-- Equation(s):
-- \Coder|Form_word|OUT_WORD~44\ = \Coder|DIV|Equal1~0_combout\ # \Coder|Form_buffer|buffer_temp_2\(1) $ (\ERROR_WORD~dataout\(1) & !\ERROR_WORD~dataout\(0))

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "ffd2",
	operation_mode => "normal",
	output_mode => "none",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \ERROR_WORD~dataout\(1),
	datab => \ERROR_WORD~dataout\(0),
	datac => \Coder|Form_buffer|buffer_temp_2\(1),
	datad => \Coder|DIV|Equal1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Coder|Form_word|OUT_WORD~27_combout\,
	cascout => \Coder|Form_word|OUT_WORD~44\);

\Coder|Form_word|OUT_WORD~31\ : flex10ke_lcell
-- Equation(s):
-- \Coder|Form_word|OUT_WORD~31_combout\ = (\Coder|Form_buffer|buffer_temp_2\(0) $ (\ERROR_WORD~dataout\(0) & !\ERROR_WORD~dataout\(1)) # !\Coder|DIV|Equal1~0_combout\) & CASCADE(\Coder|Form_word|OUT_WORD~44\)

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "f75d",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \Coder|DIV|Equal1~0_combout\,
	datab => \ERROR_WORD~dataout\(0),
	datac => \ERROR_WORD~dataout\(1),
	datad => \Coder|Form_buffer|buffer_temp_2\(0),
	cascin => \Coder|Form_word|OUT_WORD~44\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Coder|Form_word|OUT_WORD~31_combout\);

\Coder|Form_word|OUT_WORD~15\ : flex10ke_lcell
-- Equation(s):
-- \Coder|Form_word|OUT_WORD~15_combout\ = \Coder|Form_buffer|buffer_temp_2\(2) $ \Coder|Form_word|OUT_WORD~31_combout\ $ (\ERROR_WORD~dataout\(0) & \ERROR_WORD~dataout\(1))

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "9666",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \Coder|Form_buffer|buffer_temp_2\(2),
	datab => \Coder|Form_word|OUT_WORD~31_combout\,
	datac => \ERROR_WORD~dataout\(0),
	datad => \ERROR_WORD~dataout\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Coder|Form_word|OUT_WORD~15_combout\);

\Coder|Form_word|Equal3~0\ : flex10ke_lcell
-- Equation(s):
-- \Coder|Form_word|Equal3~0_combout\ = !\Coder|DIV|counter\(1) & !\Coder|DIV|counter\(2) & \Coder|DIV|counter\(0)

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "0300",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	datab => \Coder|DIV|counter\(1),
	datac => \Coder|DIV|counter\(2),
	datad => \Coder|DIV|counter\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Coder|Form_word|Equal3~0_combout\);

\Coder|Form_word|OUT_WORD~18\ : flex10ke_lcell
-- Equation(s):
-- \Coder|Form_word|OUT_WORD~18_combout\ = \Coder|DIV|number~regout\ & (\Coder|Form_word|OUT_WORD~15_combout\ # \Coder|Form_word|Equal3~0_combout\) # !\Coder|DIV|number~regout\ & \Coder|Form_word|OUT_WORD~17_combout\ & (!\Coder|Form_word|Equal3~0_combout\)

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "cce2",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \Coder|Form_word|OUT_WORD~17_combout\,
	datab => \Coder|DIV|number~regout\,
	datac => \Coder|Form_word|OUT_WORD~15_combout\,
	datad => \Coder|Form_word|Equal3~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Coder|Form_word|OUT_WORD~18_combout\);

\Coder|Form_word|OUT_WORD~3\ : flex10ke_lcell
-- Equation(s):
-- \Coder|Form_word|OUT_WORD~3_combout\ = \Coder|Form_buffer|buffer_temp_1\(1) $ \ERROR_WORD~dataout\(1) $ \ERROR_WORD~dataout\(0) $ \Coder|Form_buffer|buffer_temp_1\(0)

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "6996",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \Coder|Form_buffer|buffer_temp_1\(1),
	datab => \ERROR_WORD~dataout\(1),
	datac => \ERROR_WORD~dataout\(0),
	datad => \Coder|Form_buffer|buffer_temp_1\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Coder|Form_word|OUT_WORD~3_combout\);

\Coder|Form_word|OUT_WORD~19\ : flex10ke_lcell
-- Equation(s):
-- \Coder|Form_word|OUT_WORD~19_combout\ = \Coder|Form_word|OUT_WORD~18_combout\ & (\Coder|Form_word|OUT_WORD~10_combout\ # !\Coder|Form_word|Equal3~0_combout\) # !\Coder|Form_word|OUT_WORD~18_combout\ & (\Coder|Form_word|Equal3~0_combout\ & 
-- \Coder|Form_word|OUT_WORD~3_combout\)

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "bc8c",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \Coder|Form_word|OUT_WORD~10_combout\,
	datab => \Coder|Form_word|OUT_WORD~18_combout\,
	datac => \Coder|Form_word|Equal3~0_combout\,
	datad => \Coder|Form_word|OUT_WORD~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Coder|Form_word|OUT_WORD~19_combout\);

\Coder|Form_word|OUT_WORD\ : flex10ke_lcell
-- Equation(s):
-- \Coder|Form_word|OUT_WORD~combout\ = \Coder|Form_word|OUT_WORD~20_combout\ & (\Coder|Form_word|OUT_WORD~19_combout\) # !\Coder|Form_word|OUT_WORD~20_combout\ & \Coder|Form_word|OUT_WORD~combout\

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "fc30",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	datab => \Coder|Form_word|OUT_WORD~20_combout\,
	datac => \Coder|Form_word|OUT_WORD~combout\,
	datad => \Coder|Form_word|OUT_WORD~19_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Coder|Form_word|OUT_WORD~combout\);

\Coder|DIV|F2M~3\ : flex10ke_lcell
-- Equation(s):
-- \Coder|DIV|F2M~3_regout\ = DFFEA(!\Coder|DIV|Equal0~0_combout\ & (\Coder|DIV|Equal1~0_combout\ # \Coder|DIV|F2M~regout\), GLOBAL(\CLK~dataout\), !GLOBAL(\RES~dataout\), , , , )

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "3330",
	operation_mode => "normal",
	output_mode => "reg_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	datab => \Coder|DIV|Equal0~0_combout\,
	datac => \Coder|DIV|Equal1~0_combout\,
	datad => \Coder|DIV|F2M~regout\,
	aclr => \RES~dataout\,
	clk => \CLK~dataout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Coder|DIV|F2M~3_regout\);

\OUT_COUNT[0]~I\ : flex10ke_io
-- pragma translate_off
GENERIC MAP (
	feedback_mode => "none",
	operation_mode => "output",
	reg_source_mode => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	ena => VCC,
	padio => ww_OUT_COUNT(0));

\OUT_COUNT[1]~I\ : flex10ke_io
-- pragma translate_off
GENERIC MAP (
	feedback_mode => "none",
	operation_mode => "output",
	reg_source_mode => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	ena => VCC,
	padio => ww_OUT_COUNT(1));

\TEST_CODER[0]~I\ : flex10ke_io
-- pragma translate_off
GENERIC MAP (
	feedback_mode => "none",
	operation_mode => "output",
	reg_source_mode => "none")
-- pragma translate_on
PORT MAP (
	datain => \Coder|DIV|F2M~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	ena => VCC,
	padio => ww_TEST_CODER(0));

\TEST_CODER[1]~I\ : flex10ke_io
-- pragma translate_off
GENERIC MAP (
	feedback_mode => "none",
	operation_mode => "output",
	reg_source_mode => "none")
-- pragma translate_on
PORT MAP (
	datain => \Coder|COUNT|counter\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	ena => VCC,
	padio => ww_TEST_CODER(1));

\TEST_CODER[2]~I\ : flex10ke_io
-- pragma translate_off
GENERIC MAP (
	feedback_mode => "none",
	operation_mode => "output",
	reg_source_mode => "none")
-- pragma translate_on
PORT MAP (
	datain => \Coder|COUNT|ALT_INV_counter\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	ena => VCC,
	padio => ww_TEST_CODER(2));

\TEST_CODER[3]~I\ : flex10ke_io
-- pragma translate_off
GENERIC MAP (
	feedback_mode => "none",
	operation_mode => "output",
	reg_source_mode => "none")
-- pragma translate_on
PORT MAP (
	datain => \Coder|COUNT|ALT_INV_counter\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	ena => VCC,
	padio => ww_TEST_CODER(3));

\TEST_CODER[4]~I\ : flex10ke_io
-- pragma translate_off
GENERIC MAP (
	feedback_mode => "none",
	operation_mode => "output",
	reg_source_mode => "none")
-- pragma translate_on
PORT MAP (
	datain => \Coder|Form_buffer|ALT_INV_buffer_temp_1\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	ena => VCC,
	padio => ww_TEST_CODER(4));

\TEST_CODER[5]~I\ : flex10ke_io
-- pragma translate_off
GENERIC MAP (
	feedback_mode => "none",
	operation_mode => "output",
	reg_source_mode => "none")
-- pragma translate_on
PORT MAP (
	datain => \Coder|Form_buffer|ALT_INV_buffer_temp_1\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	ena => VCC,
	padio => ww_TEST_CODER(5));

\TEST_CODER[6]~I\ : flex10ke_io
-- pragma translate_off
GENERIC MAP (
	feedback_mode => "none",
	operation_mode => "output",
	reg_source_mode => "none")
-- pragma translate_on
PORT MAP (
	datain => \Coder|Form_buffer|ALT_INV_buffer_temp_1\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	ena => VCC,
	padio => ww_TEST_CODER(6));

\TEST_CODER[7]~I\ : flex10ke_io
-- pragma translate_off
GENERIC MAP (
	feedback_mode => "none",
	operation_mode => "output",
	reg_source_mode => "none")
-- pragma translate_on
PORT MAP (
	datain => \Coder|Form_buffer|ALT_INV_buffer_temp_2\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	ena => VCC,
	padio => ww_TEST_CODER(7));

\TEST_CODER[8]~I\ : flex10ke_io
-- pragma translate_off
GENERIC MAP (
	feedback_mode => "none",
	operation_mode => "output",
	reg_source_mode => "none")
-- pragma translate_on
PORT MAP (
	datain => \Coder|Form_buffer|ALT_INV_buffer_temp_2\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	ena => VCC,
	padio => ww_TEST_CODER(8));

\TEST_CODER[9]~I\ : flex10ke_io
-- pragma translate_off
GENERIC MAP (
	feedback_mode => "none",
	operation_mode => "output",
	reg_source_mode => "none")
-- pragma translate_on
PORT MAP (
	datain => \Coder|Form_buffer|ALT_INV_buffer_temp_2\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	ena => VCC,
	padio => ww_TEST_CODER(9));

\TEST_CODER[10]~I\ : flex10ke_io
-- pragma translate_off
GENERIC MAP (
	feedback_mode => "none",
	operation_mode => "output",
	reg_source_mode => "none")
-- pragma translate_on
PORT MAP (
	datain => \Coder|DIV|number~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	ena => VCC,
	padio => ww_TEST_CODER(10));

\TEST_CODER[11]~I\ : flex10ke_io
-- pragma translate_off
GENERIC MAP (
	feedback_mode => "none",
	operation_mode => "output",
	reg_source_mode => "none")
-- pragma translate_on
PORT MAP (
	datain => \Coder|Form_word|OUT_WORD~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	ena => VCC,
	padio => ww_TEST_CODER(11));

\TEST_CODER[12]~I\ : flex10ke_io
-- pragma translate_off
GENERIC MAP (
	feedback_mode => "none",
	operation_mode => "output",
	reg_source_mode => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	ena => VCC,
	padio => ww_TEST_CODER(12));

\TEST_CODER[13]~I\ : flex10ke_io
-- pragma translate_off
GENERIC MAP (
	feedback_mode => "none",
	operation_mode => "output",
	reg_source_mode => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	ena => VCC,
	padio => ww_TEST_CODER(13));

\TEST_CODER[14]~I\ : flex10ke_io
-- pragma translate_off
GENERIC MAP (
	feedback_mode => "none",
	operation_mode => "output",
	reg_source_mode => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	ena => VCC,
	padio => ww_TEST_CODER(14));

\TEST_CODER[15]~I\ : flex10ke_io
-- pragma translate_off
GENERIC MAP (
	feedback_mode => "none",
	operation_mode => "output",
	reg_source_mode => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	ena => VCC,
	padio => ww_TEST_CODER(15));

\TEST_DECODER[0]~I\ : flex10ke_io
-- pragma translate_off
GENERIC MAP (
	feedback_mode => "none",
	operation_mode => "output",
	reg_source_mode => "none")
-- pragma translate_on
PORT MAP (
	datain => \Coder|DIV|F2M~3_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	ena => VCC,
	padio => ww_TEST_DECODER(0));

\TEST_DECODER[1]~I\ : flex10ke_io
-- pragma translate_off
GENERIC MAP (
	feedback_mode => "none",
	operation_mode => "output",
	reg_source_mode => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	ena => VCC,
	padio => ww_TEST_DECODER(1));

\TEST_DECODER[2]~I\ : flex10ke_io
-- pragma translate_off
GENERIC MAP (
	feedback_mode => "none",
	operation_mode => "output",
	reg_source_mode => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	ena => VCC,
	padio => ww_TEST_DECODER(2));

\TEST_DECODER[3]~I\ : flex10ke_io
-- pragma translate_off
GENERIC MAP (
	feedback_mode => "none",
	operation_mode => "output",
	reg_source_mode => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	ena => VCC,
	padio => ww_TEST_DECODER(3));

\TEST_DECODER[4]~I\ : flex10ke_io
-- pragma translate_off
GENERIC MAP (
	feedback_mode => "none",
	operation_mode => "output",
	reg_source_mode => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	ena => VCC,
	padio => ww_TEST_DECODER(4));

\TEST_DECODER[5]~I\ : flex10ke_io
-- pragma translate_off
GENERIC MAP (
	feedback_mode => "none",
	operation_mode => "output",
	reg_source_mode => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	ena => VCC,
	padio => ww_TEST_DECODER(5));

\TEST_DECODER[6]~I\ : flex10ke_io
-- pragma translate_off
GENERIC MAP (
	feedback_mode => "none",
	operation_mode => "output",
	reg_source_mode => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	ena => VCC,
	padio => ww_TEST_DECODER(6));

\TEST_DECODER[7]~I\ : flex10ke_io
-- pragma translate_off
GENERIC MAP (
	feedback_mode => "none",
	operation_mode => "output",
	reg_source_mode => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	ena => VCC,
	padio => ww_TEST_DECODER(7));

\TEST_DECODER[8]~I\ : flex10ke_io
-- pragma translate_off
GENERIC MAP (
	feedback_mode => "none",
	operation_mode => "output",
	reg_source_mode => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	ena => VCC,
	padio => ww_TEST_DECODER(8));

\TEST_DECODER[9]~I\ : flex10ke_io
-- pragma translate_off
GENERIC MAP (
	feedback_mode => "none",
	operation_mode => "output",
	reg_source_mode => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	ena => VCC,
	padio => ww_TEST_DECODER(9));

\TEST_DECODER[10]~I\ : flex10ke_io
-- pragma translate_off
GENERIC MAP (
	feedback_mode => "none",
	operation_mode => "output",
	reg_source_mode => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	ena => VCC,
	padio => ww_TEST_DECODER(10));

\TEST_DECODER[11]~I\ : flex10ke_io
-- pragma translate_off
GENERIC MAP (
	feedback_mode => "none",
	operation_mode => "output",
	reg_source_mode => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	ena => VCC,
	padio => ww_TEST_DECODER(11));

\TEST_DECODER[12]~I\ : flex10ke_io
-- pragma translate_off
GENERIC MAP (
	feedback_mode => "none",
	operation_mode => "output",
	reg_source_mode => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	ena => VCC,
	padio => ww_TEST_DECODER(12));

\TEST_DECODER[13]~I\ : flex10ke_io
-- pragma translate_off
GENERIC MAP (
	feedback_mode => "none",
	operation_mode => "output",
	reg_source_mode => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	ena => VCC,
	padio => ww_TEST_DECODER(13));

\TEST_DECODER[14]~I\ : flex10ke_io
-- pragma translate_off
GENERIC MAP (
	feedback_mode => "none",
	operation_mode => "output",
	reg_source_mode => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	ena => VCC,
	padio => ww_TEST_DECODER(14));

\TEST_DECODER[15]~I\ : flex10ke_io
-- pragma translate_off
GENERIC MAP (
	feedback_mode => "none",
	operation_mode => "output",
	reg_source_mode => "none")
-- pragma translate_on
PORT MAP (
	datain => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	ena => VCC,
	padio => ww_TEST_DECODER(15));
END structure;



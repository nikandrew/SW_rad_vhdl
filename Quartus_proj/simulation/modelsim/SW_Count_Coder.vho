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

-- DATE "10/27/2017 00:40:19"

-- 
-- Device: Altera EPF10K30EFC256-3 Package FBGA256
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY IEEE, flex10ke;
USE IEEE.std_logic_1164.all;
USE flex10ke.flex10ke_components.all;

ENTITY 	SW_Count_Coder IS
    PORT (
	CLK : IN std_logic;
	RES : IN std_logic;
	ERROR_SYNC : IN std_logic;
	ERROR_BUFFER : IN std_logic_vector(1 DOWNTO 0);
	ERROR_COUNTER : IN std_logic_vector(1 DOWNTO 0);
	ERROR_WORD : IN std_logic_vector(1 DOWNTO 0);
	OUT_WORD : OUT std_logic;
	TEST : OUT std_logic_vector(15 DOWNTO 0)
	);
END SW_Count_Coder;

ARCHITECTURE structure OF SW_Count_Coder IS
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
SIGNAL ww_ERROR_SYNC : std_logic;
SIGNAL ww_ERROR_BUFFER : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_ERROR_COUNTER : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_ERROR_WORD : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_OUT_WORD : std_logic;
SIGNAL ww_TEST : std_logic_vector(15 DOWNTO 0);
SIGNAL \Form_word|OUT_WORD~17_combout\ : std_logic;
SIGNAL \Form_word|OUT_WORD~10_combout\ : std_logic;
SIGNAL \Form_word|OUT_WORD~27_combout\ : std_logic;
SIGNAL \Form_word|OUT_WORD~47\ : std_logic;
SIGNAL \Form_word|OUT_WORD~29_combout\ : std_logic;
SIGNAL \Form_word|OUT_WORD~32_combout\ : std_logic;
SIGNAL \Form_buffer|buffer_temp_1~23_combout\ : std_logic;
SIGNAL \Form_buffer|buffer_temp_2[0]~5_combout\ : std_logic;
SIGNAL \RES~dataout\ : std_logic;
SIGNAL \CLK~dataout\ : std_logic;
SIGNAL \Form_word|OUT_WORD~20_combout\ : std_logic;
SIGNAL \DIV|number~regout\ : std_logic;
SIGNAL \DIV|Equal0~0_combout\ : std_logic;
SIGNAL \Form_word|Equal4~0_combout\ : std_logic;
SIGNAL \DIV|F2M~regout\ : std_logic;
SIGNAL \Form_word|OUT_WORD~44\ : std_logic;
SIGNAL \Form_word|OUT_WORD~31_combout\ : std_logic;
SIGNAL \Form_word|OUT_WORD~15_combout\ : std_logic;
SIGNAL \Form_word|Equal3~0_combout\ : std_logic;
SIGNAL \Form_word|OUT_WORD~18_combout\ : std_logic;
SIGNAL \Form_buffer|Equal3~0_combout\ : std_logic;
SIGNAL \Form_buffer|Equal3~1_combout\ : std_logic;
SIGNAL \Form_buffer|buffer_temp_1~33\ : std_logic;
SIGNAL \Form_buffer|buffer_temp_1~26_combout\ : std_logic;
SIGNAL \Form_word|OUT_WORD~3_combout\ : std_logic;
SIGNAL \Form_word|OUT_WORD~19_combout\ : std_logic;
SIGNAL \Form_word|OUT_WORD~combout\ : std_logic;
SIGNAL \Form_buffer|buffer_temp_1~17_combout\ : std_logic;
SIGNAL \Form_buffer|Equal1~0_combout\ : std_logic;
SIGNAL \Form_buffer|buffer_temp_2[2]~6_combout\ : std_logic;
SIGNAL \Form_buffer|buffer_temp_1\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \Form_buffer|buffer_temp_2\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \COUNT|counter\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \DIV|counter\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \ERROR_BUFFER~dataout\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \ERROR_COUNTER~dataout\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \ERROR_WORD~dataout\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \DIV|ALT_INV_F2M~regout\ : std_logic;
SIGNAL \COUNT|ALT_INV_counter\ : std_logic_vector(2 DOWNTO 1);
SIGNAL \Form_buffer|ALT_INV_buffer_temp_1\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \Form_buffer|ALT_INV_buffer_temp_2\ : std_logic_vector(2 DOWNTO 0);

BEGIN

ww_CLK <= CLK;
ww_RES <= RES;
ww_ERROR_SYNC <= ERROR_SYNC;
ww_ERROR_BUFFER <= ERROR_BUFFER;
ww_ERROR_COUNTER <= ERROR_COUNTER;
ww_ERROR_WORD <= ERROR_WORD;
OUT_WORD <= ww_OUT_WORD;
TEST <= ww_TEST;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\DIV|ALT_INV_F2M~regout\ <= NOT \DIV|F2M~regout\;
\COUNT|ALT_INV_counter\(1) <= NOT \COUNT|counter\(1);
\COUNT|ALT_INV_counter\(2) <= NOT \COUNT|counter\(2);
\Form_buffer|ALT_INV_buffer_temp_1\(0) <= NOT \Form_buffer|buffer_temp_1\(0);
\Form_buffer|ALT_INV_buffer_temp_1\(1) <= NOT \Form_buffer|buffer_temp_1\(1);
\Form_buffer|ALT_INV_buffer_temp_1\(2) <= NOT \Form_buffer|buffer_temp_1\(2);
\Form_buffer|ALT_INV_buffer_temp_2\(0) <= NOT \Form_buffer|buffer_temp_2\(0);
\Form_buffer|ALT_INV_buffer_temp_2\(1) <= NOT \Form_buffer|buffer_temp_2\(1);
\Form_buffer|ALT_INV_buffer_temp_2\(2) <= NOT \Form_buffer|buffer_temp_2\(2);

\Form_word|OUT_WORD~17\ : flex10ke_lcell
-- Equation(s):
-- \Form_word|OUT_WORD~17_combout\ = \Form_buffer|buffer_temp_1\(2) $ \Form_word|OUT_WORD~32_combout\ $ (\ERROR_WORD~dataout\(0) & \ERROR_WORD~dataout\(1))

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "9666",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \Form_buffer|buffer_temp_1\(2),
	datab => \Form_word|OUT_WORD~32_combout\,
	datac => \ERROR_WORD~dataout\(0),
	datad => \ERROR_WORD~dataout\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Form_word|OUT_WORD~17_combout\);

\Form_word|OUT_WORD~10\ : flex10ke_lcell
-- Equation(s):
-- \Form_word|OUT_WORD~10_combout\ = \Form_buffer|buffer_temp_2\(0) $ \ERROR_WORD~dataout\(1) $ \ERROR_WORD~dataout\(0) $ \Form_buffer|buffer_temp_2\(1)

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "6996",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \Form_buffer|buffer_temp_2\(0),
	datab => \ERROR_WORD~dataout\(1),
	datac => \ERROR_WORD~dataout\(0),
	datad => \Form_buffer|buffer_temp_2\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Form_word|OUT_WORD~10_combout\);

\Form_word|OUT_WORD~29\ : flex10ke_lcell
-- Equation(s):
-- \Form_word|OUT_WORD~47\ = \Form_word|Equal4~0_combout\ # \Form_buffer|buffer_temp_1\(1) $ (\ERROR_WORD~dataout\(1) & !\ERROR_WORD~dataout\(0))

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
	datac => \Form_buffer|buffer_temp_1\(1),
	datad => \Form_word|Equal4~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Form_word|OUT_WORD~29_combout\,
	cascout => \Form_word|OUT_WORD~47\);

\Form_word|OUT_WORD~32\ : flex10ke_lcell
-- Equation(s):
-- \Form_word|OUT_WORD~32_combout\ = (\Form_buffer|buffer_temp_1\(0) $ (\ERROR_WORD~dataout\(0) & !\ERROR_WORD~dataout\(1)) # !\Form_word|Equal4~0_combout\) & CASCADE(\Form_word|OUT_WORD~47\)

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "f75d",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \Form_word|Equal4~0_combout\,
	datab => \ERROR_WORD~dataout\(0),
	datac => \ERROR_WORD~dataout\(1),
	datad => \Form_buffer|buffer_temp_1\(0),
	cascin => \Form_word|OUT_WORD~47\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Form_word|OUT_WORD~32_combout\);

\Form_buffer|buffer_temp_2[0]~5\ : flex10ke_lcell
-- Equation(s):
-- \Form_buffer|buffer_temp_2[0]~5_combout\ = !\Form_buffer|Equal3~1_combout\

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "00ff",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	datad => \Form_buffer|Equal3~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Form_buffer|buffer_temp_2[0]~5_combout\);

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

\DIV|counter[0]\ : flex10ke_lcell
-- Equation(s):
-- \DIV|counter\(0) = DFFEA(!\DIV|counter\(0), GLOBAL(\CLK~dataout\), !GLOBAL(\RES~dataout\), , , , )

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "00ff",
	operation_mode => "normal",
	output_mode => "reg_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	datad => \DIV|counter\(0),
	aclr => \RES~dataout\,
	clk => \CLK~dataout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \DIV|counter\(0));

\DIV|counter[1]\ : flex10ke_lcell
-- Equation(s):
-- \DIV|counter\(1) = DFFEA(\DIV|counter\(0) $ \DIV|counter\(1), GLOBAL(\CLK~dataout\), !GLOBAL(\RES~dataout\), , , , )

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "0ff0",
	operation_mode => "normal",
	output_mode => "reg_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	datac => \DIV|counter\(0),
	datad => \DIV|counter\(1),
	aclr => \RES~dataout\,
	clk => \CLK~dataout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \DIV|counter\(1));

\DIV|counter[2]\ : flex10ke_lcell
-- Equation(s):
-- \DIV|counter\(2) = DFFEA(\DIV|counter\(2) $ (\DIV|counter\(0) & \DIV|counter\(1)), GLOBAL(\CLK~dataout\), !GLOBAL(\RES~dataout\), , , , )

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "3fc0",
	operation_mode => "normal",
	output_mode => "reg_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	datab => \DIV|counter\(0),
	datac => \DIV|counter\(1),
	datad => \DIV|counter\(2),
	aclr => \RES~dataout\,
	clk => \CLK~dataout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \DIV|counter\(2));

\Form_word|OUT_WORD~20\ : flex10ke_lcell
-- Equation(s):
-- \Form_word|OUT_WORD~20_combout\ = \DIV|counter\(0) & (!\DIV|counter\(2) # !\DIV|counter\(1))

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "3f00",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	datab => \DIV|counter\(1),
	datac => \DIV|counter\(2),
	datad => \DIV|counter\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Form_word|OUT_WORD~20_combout\);

\DIV|number\ : flex10ke_lcell
-- Equation(s):
-- \DIV|number~regout\ = DFFEA(!\DIV|number~regout\, GLOBAL(\CLK~dataout\), !GLOBAL(\RES~dataout\), , \DIV|Equal0~0_combout\, , )

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "true",
	lut_mask => "00ff",
	operation_mode => "normal",
	output_mode => "reg_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \DIV|Equal0~0_combout\,
	datad => \DIV|number~regout\,
	aclr => \RES~dataout\,
	clk => \CLK~dataout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \DIV|number~regout\);

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

\DIV|Equal0~0\ : flex10ke_lcell
-- Equation(s):
-- \DIV|Equal0~0_combout\ = \DIV|counter\(0) & \DIV|counter\(1) & \DIV|counter\(2)

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "c000",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	datab => \DIV|counter\(0),
	datac => \DIV|counter\(1),
	datad => \DIV|counter\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \DIV|Equal0~0_combout\);

\Form_word|Equal4~0\ : flex10ke_lcell
-- Equation(s):
-- \Form_word|Equal4~0_combout\ = !\DIV|counter\(2) & \DIV|counter\(0) & \DIV|counter\(1)

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "3000",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	datab => \DIV|counter\(2),
	datac => \DIV|counter\(0),
	datad => \DIV|counter\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Form_word|Equal4~0_combout\);

\DIV|F2M\ : flex10ke_lcell
-- Equation(s):
-- \DIV|F2M~regout\ = DFFEA(!\DIV|Equal0~0_combout\ & (\Form_word|Equal4~0_combout\ # \DIV|F2M~regout\), GLOBAL(\CLK~dataout\), !GLOBAL(\RES~dataout\), , , , )

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "3330",
	operation_mode => "normal",
	output_mode => "reg_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	datab => \DIV|Equal0~0_combout\,
	datac => \Form_word|Equal4~0_combout\,
	datad => \DIV|F2M~regout\,
	aclr => \RES~dataout\,
	clk => \CLK~dataout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \DIV|F2M~regout\);

\COUNT|counter[2]\ : flex10ke_lcell
-- Equation(s):
-- \COUNT|counter\(2) = DFFEA(\COUNT|counter\(1) $ \COUNT|counter\(2) $ (\ERROR_COUNTER~dataout\(0) # !\ERROR_COUNTER~dataout\(1)), GLOBAL(\DIV|F2M~regout\), !GLOBAL(\RES~dataout\), , , , )

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "9699",
	operation_mode => "normal",
	output_mode => "reg_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \COUNT|counter\(1),
	datab => \COUNT|counter\(2),
	datac => \ERROR_COUNTER~dataout\(0),
	datad => \ERROR_COUNTER~dataout\(1),
	aclr => \RES~dataout\,
	clk => \DIV|F2M~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \COUNT|counter\(2));

\Form_buffer|buffer_temp_2[0]\ : flex10ke_lcell
-- Equation(s):
-- \Form_buffer|buffer_temp_2\(0) = DFFEA(\COUNT|counter\(2), !GLOBAL(\DIV|F2M~regout\), !GLOBAL(\RES~dataout\), , \Form_buffer|buffer_temp_2[0]~5_combout\, , )

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "true",
	lut_mask => "ff00",
	operation_mode => "normal",
	output_mode => "reg_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \Form_buffer|buffer_temp_2[0]~5_combout\,
	datad => \COUNT|counter\(2),
	aclr => \RES~dataout\,
	clk => \DIV|ALT_INV_F2M~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Form_buffer|buffer_temp_2\(0));

\Form_buffer|buffer_temp_2[1]\ : flex10ke_lcell
-- Equation(s):
-- \Form_buffer|buffer_temp_2\(1) = DFFEA(\COUNT|counter\(2), !GLOBAL(\DIV|F2M~regout\), !GLOBAL(\RES~dataout\), , \Form_buffer|Equal3~0_combout\, , )

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "true",
	lut_mask => "ff00",
	operation_mode => "normal",
	output_mode => "reg_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \Form_buffer|Equal3~0_combout\,
	datad => \COUNT|counter\(2),
	aclr => \RES~dataout\,
	clk => \DIV|ALT_INV_F2M~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Form_buffer|buffer_temp_2\(1));

\Form_word|OUT_WORD~27\ : flex10ke_lcell
-- Equation(s):
-- \Form_word|OUT_WORD~44\ = \Form_word|Equal4~0_combout\ # \Form_buffer|buffer_temp_2\(1) $ (\ERROR_WORD~dataout\(1) & !\ERROR_WORD~dataout\(0))

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
	datac => \Form_buffer|buffer_temp_2\(1),
	datad => \Form_word|Equal4~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Form_word|OUT_WORD~27_combout\,
	cascout => \Form_word|OUT_WORD~44\);

\Form_word|OUT_WORD~31\ : flex10ke_lcell
-- Equation(s):
-- \Form_word|OUT_WORD~31_combout\ = (\Form_buffer|buffer_temp_2\(0) $ (\ERROR_WORD~dataout\(0) & !\ERROR_WORD~dataout\(1)) # !\Form_word|Equal4~0_combout\) & CASCADE(\Form_word|OUT_WORD~44\)

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "f75d",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \Form_word|Equal4~0_combout\,
	datab => \ERROR_WORD~dataout\(0),
	datac => \ERROR_WORD~dataout\(1),
	datad => \Form_buffer|buffer_temp_2\(0),
	cascin => \Form_word|OUT_WORD~44\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Form_word|OUT_WORD~31_combout\);

\Form_word|OUT_WORD~15\ : flex10ke_lcell
-- Equation(s):
-- \Form_word|OUT_WORD~15_combout\ = \Form_buffer|buffer_temp_2\(2) $ \Form_word|OUT_WORD~31_combout\ $ (\ERROR_WORD~dataout\(0) & \ERROR_WORD~dataout\(1))

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "9666",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \Form_buffer|buffer_temp_2\(2),
	datab => \Form_word|OUT_WORD~31_combout\,
	datac => \ERROR_WORD~dataout\(0),
	datad => \ERROR_WORD~dataout\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Form_word|OUT_WORD~15_combout\);

\Form_word|Equal3~0\ : flex10ke_lcell
-- Equation(s):
-- \Form_word|Equal3~0_combout\ = !\DIV|counter\(1) & !\DIV|counter\(2) & \DIV|counter\(0)

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "0300",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	datab => \DIV|counter\(1),
	datac => \DIV|counter\(2),
	datad => \DIV|counter\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Form_word|Equal3~0_combout\);

\Form_word|OUT_WORD~18\ : flex10ke_lcell
-- Equation(s):
-- \Form_word|OUT_WORD~18_combout\ = \DIV|number~regout\ & (\Form_word|OUT_WORD~15_combout\ # \Form_word|Equal3~0_combout\) # !\DIV|number~regout\ & \Form_word|OUT_WORD~17_combout\ & (!\Form_word|Equal3~0_combout\)

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "cce2",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \Form_word|OUT_WORD~17_combout\,
	datab => \DIV|number~regout\,
	datac => \Form_word|OUT_WORD~15_combout\,
	datad => \Form_word|Equal3~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Form_word|OUT_WORD~18_combout\);

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

\COUNT|counter[0]\ : flex10ke_lcell
-- Equation(s):
-- \COUNT|counter\(0) = DFFEA(\ERROR_COUNTER~dataout\(1) & (\ERROR_COUNTER~dataout\(0) & !\COUNT|counter\(0) & \COUNT|counter\(1) # !\ERROR_COUNTER~dataout\(0) & (!\COUNT|counter\(1))) # !\ERROR_COUNTER~dataout\(1) & \COUNT|counter\(1) & (\COUNT|counter\(0) 
-- $ !\ERROR_COUNTER~dataout\(0)), GLOBAL(\DIV|F2M~regout\), !GLOBAL(\RES~dataout\), , , , )

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "610c",
	operation_mode => "normal",
	output_mode => "reg_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \COUNT|counter\(0),
	datab => \ERROR_COUNTER~dataout\(1),
	datac => \ERROR_COUNTER~dataout\(0),
	datad => \COUNT|counter\(1),
	aclr => \RES~dataout\,
	clk => \DIV|F2M~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \COUNT|counter\(0));

\Form_buffer|Equal3~0\ : flex10ke_lcell
-- Equation(s):
-- \Form_buffer|Equal3~0_combout\ = \COUNT|counter\(1) & \COUNT|counter\(0)

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "f000",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	datac => \COUNT|counter\(1),
	datad => \COUNT|counter\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Form_buffer|Equal3~0_combout\);

\COUNT|counter[1]\ : flex10ke_lcell
-- Equation(s):
-- \COUNT|counter\(1) = DFFEA(\ERROR_COUNTER~dataout\(1) & (!\Form_buffer|Equal3~0_combout\ # !\ERROR_COUNTER~dataout\(0)) # !\ERROR_COUNTER~dataout\(1) & (\ERROR_COUNTER~dataout\(0) & \Form_buffer|Equal3~1_combout\ # !\ERROR_COUNTER~dataout\(0) & 
-- (!\Form_buffer|Equal3~0_combout\)), GLOBAL(\DIV|F2M~regout\), !GLOBAL(\RES~dataout\), , , , )

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "2cef",
	operation_mode => "normal",
	output_mode => "reg_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \Form_buffer|Equal3~1_combout\,
	datab => \ERROR_COUNTER~dataout\(1),
	datac => \ERROR_COUNTER~dataout\(0),
	datad => \Form_buffer|Equal3~0_combout\,
	aclr => \RES~dataout\,
	clk => \DIV|F2M~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \COUNT|counter\(1));

\Form_buffer|Equal3~1\ : flex10ke_lcell
-- Equation(s):
-- \Form_buffer|Equal3~1_combout\ = \COUNT|counter\(0) # !\COUNT|counter\(1)

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "ff0f",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	datac => \COUNT|counter\(1),
	datad => \COUNT|counter\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Form_buffer|Equal3~1_combout\);

\Form_buffer|buffer_temp_1~23\ : flex10ke_lcell
-- Equation(s):
-- \Form_buffer|buffer_temp_1~33\ = \Form_buffer|Equal3~1_combout\ # \COUNT|counter\(2) $ (\ERROR_BUFFER~dataout\(0) & !\ERROR_BUFFER~dataout\(1))

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
	datac => \COUNT|counter\(2),
	datad => \Form_buffer|Equal3~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Form_buffer|buffer_temp_1~23_combout\,
	cascout => \Form_buffer|buffer_temp_1~33\);

\Form_buffer|buffer_temp_1~26\ : flex10ke_lcell
-- Equation(s):
-- \Form_buffer|buffer_temp_1~26_combout\ = (\Form_buffer|buffer_temp_1\(0) $ (\ERROR_BUFFER~dataout\(0) & !\ERROR_BUFFER~dataout\(1)) # !\Form_buffer|Equal3~1_combout\) & CASCADE(\Form_buffer|buffer_temp_1~33\)

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "f75d",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \Form_buffer|Equal3~1_combout\,
	datab => \ERROR_BUFFER~dataout\(0),
	datac => \ERROR_BUFFER~dataout\(1),
	datad => \Form_buffer|buffer_temp_1\(0),
	cascin => \Form_buffer|buffer_temp_1~33\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Form_buffer|buffer_temp_1~26_combout\);

\Form_buffer|buffer_temp_1[0]\ : flex10ke_lcell
-- Equation(s):
-- \Form_buffer|buffer_temp_1\(0) = DFFEA(\Form_buffer|buffer_temp_1~26_combout\, !GLOBAL(\DIV|F2M~regout\), !GLOBAL(\RES~dataout\), , , , )

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "ff00",
	operation_mode => "normal",
	output_mode => "reg_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	datad => \Form_buffer|buffer_temp_1~26_combout\,
	aclr => \RES~dataout\,
	clk => \DIV|ALT_INV_F2M~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Form_buffer|buffer_temp_1\(0));

\Form_word|OUT_WORD~3\ : flex10ke_lcell
-- Equation(s):
-- \Form_word|OUT_WORD~3_combout\ = \Form_buffer|buffer_temp_1\(1) $ \ERROR_WORD~dataout\(1) $ \ERROR_WORD~dataout\(0) $ \Form_buffer|buffer_temp_1\(0)

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "6996",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \Form_buffer|buffer_temp_1\(1),
	datab => \ERROR_WORD~dataout\(1),
	datac => \ERROR_WORD~dataout\(0),
	datad => \Form_buffer|buffer_temp_1\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Form_word|OUT_WORD~3_combout\);

\Form_word|OUT_WORD~19\ : flex10ke_lcell
-- Equation(s):
-- \Form_word|OUT_WORD~19_combout\ = \Form_word|OUT_WORD~18_combout\ & (\Form_word|OUT_WORD~10_combout\ # !\Form_word|Equal3~0_combout\) # !\Form_word|OUT_WORD~18_combout\ & (\Form_word|Equal3~0_combout\ & \Form_word|OUT_WORD~3_combout\)

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "bc8c",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \Form_word|OUT_WORD~10_combout\,
	datab => \Form_word|OUT_WORD~18_combout\,
	datac => \Form_word|Equal3~0_combout\,
	datad => \Form_word|OUT_WORD~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Form_word|OUT_WORD~19_combout\);

\Form_word|OUT_WORD\ : flex10ke_lcell
-- Equation(s):
-- \Form_word|OUT_WORD~combout\ = \Form_word|OUT_WORD~20_combout\ & (\Form_word|OUT_WORD~19_combout\) # !\Form_word|OUT_WORD~20_combout\ & \Form_word|OUT_WORD~combout\

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "fc30",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	datab => \Form_word|OUT_WORD~20_combout\,
	datac => \Form_word|OUT_WORD~combout\,
	datad => \Form_word|OUT_WORD~19_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Form_word|OUT_WORD~combout\);

\Form_buffer|buffer_temp_1~17\ : flex10ke_lcell
-- Equation(s):
-- \Form_buffer|buffer_temp_1~17_combout\ = \COUNT|counter\(1) & (\COUNT|counter\(0) & !\COUNT|counter\(2) # !\COUNT|counter\(0) & (!\Form_buffer|buffer_temp_1\(1))) # !\COUNT|counter\(1) & (!\Form_buffer|buffer_temp_1\(1))

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "5333",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \COUNT|counter\(2),
	datab => \Form_buffer|buffer_temp_1\(1),
	datac => \COUNT|counter\(1),
	datad => \COUNT|counter\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Form_buffer|buffer_temp_1~17_combout\);

\Form_buffer|buffer_temp_1[1]\ : flex10ke_lcell
-- Equation(s):
-- \Form_buffer|buffer_temp_1\(1) = DFFEA(\Form_buffer|buffer_temp_1~17_combout\ $ (\ERROR_BUFFER~dataout\(0) # !\ERROR_BUFFER~dataout\(1)), !GLOBAL(\DIV|F2M~regout\), !GLOBAL(\RES~dataout\), , , , )

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
	datad => \Form_buffer|buffer_temp_1~17_combout\,
	aclr => \RES~dataout\,
	clk => \DIV|ALT_INV_F2M~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Form_buffer|buffer_temp_1\(1));

\Form_buffer|Equal1~0\ : flex10ke_lcell
-- Equation(s):
-- \Form_buffer|Equal1~0_combout\ = \ERROR_BUFFER~dataout\(0) & \ERROR_BUFFER~dataout\(1)

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
	combout => \Form_buffer|Equal1~0_combout\);

\Form_buffer|buffer_temp_1[2]\ : flex10ke_lcell
-- Equation(s):
-- \Form_buffer|buffer_temp_1\(2) = DFFEA(\Form_buffer|Equal1~0_combout\ $ (\COUNT|counter\(1) & (\Form_buffer|buffer_temp_1\(2)) # !\COUNT|counter\(1) & \COUNT|counter\(2)), !GLOBAL(\DIV|F2M~regout\), !GLOBAL(\RES~dataout\), , , , )

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "1be4",
	operation_mode => "normal",
	output_mode => "reg_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \COUNT|counter\(1),
	datab => \COUNT|counter\(2),
	datac => \Form_buffer|buffer_temp_1\(2),
	datad => \Form_buffer|Equal1~0_combout\,
	aclr => \RES~dataout\,
	clk => \DIV|ALT_INV_F2M~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Form_buffer|buffer_temp_1\(2));

\Form_buffer|buffer_temp_2[2]~6\ : flex10ke_lcell
-- Equation(s):
-- \Form_buffer|buffer_temp_2[2]~6_combout\ = !\COUNT|counter\(1)

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "00ff",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	datad => \COUNT|counter\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Form_buffer|buffer_temp_2[2]~6_combout\);

\Form_buffer|buffer_temp_2[2]\ : flex10ke_lcell
-- Equation(s):
-- \Form_buffer|buffer_temp_2\(2) = DFFEA(\COUNT|counter\(2), !GLOBAL(\DIV|F2M~regout\), !GLOBAL(\RES~dataout\), , \Form_buffer|buffer_temp_2[2]~6_combout\, , )

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "true",
	lut_mask => "ff00",
	operation_mode => "normal",
	output_mode => "reg_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \Form_buffer|buffer_temp_2[2]~6_combout\,
	datad => \COUNT|counter\(2),
	aclr => \RES~dataout\,
	clk => \DIV|ALT_INV_F2M~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Form_buffer|buffer_temp_2\(2));

\ERROR_SYNC~I\ : flex10ke_io
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
	padio => ww_ERROR_SYNC);

\OUT_WORD~I\ : flex10ke_io
-- pragma translate_off
GENERIC MAP (
	feedback_mode => "none",
	operation_mode => "output",
	reg_source_mode => "none")
-- pragma translate_on
PORT MAP (
	datain => \Form_word|OUT_WORD~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	ena => VCC,
	padio => ww_OUT_WORD);

\TEST[0]~I\ : flex10ke_io
-- pragma translate_off
GENERIC MAP (
	feedback_mode => "none",
	operation_mode => "output",
	reg_source_mode => "none")
-- pragma translate_on
PORT MAP (
	datain => \DIV|F2M~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	ena => VCC,
	padio => ww_TEST(0));

\TEST[1]~I\ : flex10ke_io
-- pragma translate_off
GENERIC MAP (
	feedback_mode => "none",
	operation_mode => "output",
	reg_source_mode => "none")
-- pragma translate_on
PORT MAP (
	datain => \COUNT|counter\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	ena => VCC,
	padio => ww_TEST(1));

\TEST[2]~I\ : flex10ke_io
-- pragma translate_off
GENERIC MAP (
	feedback_mode => "none",
	operation_mode => "output",
	reg_source_mode => "none")
-- pragma translate_on
PORT MAP (
	datain => \COUNT|ALT_INV_counter\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	ena => VCC,
	padio => ww_TEST(2));

\TEST[3]~I\ : flex10ke_io
-- pragma translate_off
GENERIC MAP (
	feedback_mode => "none",
	operation_mode => "output",
	reg_source_mode => "none")
-- pragma translate_on
PORT MAP (
	datain => \COUNT|ALT_INV_counter\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	ena => VCC,
	padio => ww_TEST(3));

\TEST[4]~I\ : flex10ke_io
-- pragma translate_off
GENERIC MAP (
	feedback_mode => "none",
	operation_mode => "output",
	reg_source_mode => "none")
-- pragma translate_on
PORT MAP (
	datain => \Form_buffer|ALT_INV_buffer_temp_1\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	ena => VCC,
	padio => ww_TEST(4));

\TEST[5]~I\ : flex10ke_io
-- pragma translate_off
GENERIC MAP (
	feedback_mode => "none",
	operation_mode => "output",
	reg_source_mode => "none")
-- pragma translate_on
PORT MAP (
	datain => \Form_buffer|ALT_INV_buffer_temp_1\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	ena => VCC,
	padio => ww_TEST(5));

\TEST[6]~I\ : flex10ke_io
-- pragma translate_off
GENERIC MAP (
	feedback_mode => "none",
	operation_mode => "output",
	reg_source_mode => "none")
-- pragma translate_on
PORT MAP (
	datain => \Form_buffer|ALT_INV_buffer_temp_1\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	ena => VCC,
	padio => ww_TEST(6));

\TEST[7]~I\ : flex10ke_io
-- pragma translate_off
GENERIC MAP (
	feedback_mode => "none",
	operation_mode => "output",
	reg_source_mode => "none")
-- pragma translate_on
PORT MAP (
	datain => \Form_buffer|ALT_INV_buffer_temp_2\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	ena => VCC,
	padio => ww_TEST(7));

\TEST[8]~I\ : flex10ke_io
-- pragma translate_off
GENERIC MAP (
	feedback_mode => "none",
	operation_mode => "output",
	reg_source_mode => "none")
-- pragma translate_on
PORT MAP (
	datain => \Form_buffer|ALT_INV_buffer_temp_2\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	ena => VCC,
	padio => ww_TEST(8));

\TEST[9]~I\ : flex10ke_io
-- pragma translate_off
GENERIC MAP (
	feedback_mode => "none",
	operation_mode => "output",
	reg_source_mode => "none")
-- pragma translate_on
PORT MAP (
	datain => \Form_buffer|ALT_INV_buffer_temp_2\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	ena => VCC,
	padio => ww_TEST(9));

\TEST[10]~I\ : flex10ke_io
-- pragma translate_off
GENERIC MAP (
	feedback_mode => "none",
	operation_mode => "output",
	reg_source_mode => "none")
-- pragma translate_on
PORT MAP (
	datain => \DIV|number~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	ena => VCC,
	padio => ww_TEST(10));

\TEST[11]~I\ : flex10ke_io
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
	padio => ww_TEST(11));

\TEST[12]~I\ : flex10ke_io
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
	padio => ww_TEST(12));

\TEST[13]~I\ : flex10ke_io
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
	padio => ww_TEST(13));

\TEST[14]~I\ : flex10ke_io
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
	padio => ww_TEST(14));

\TEST[15]~I\ : flex10ke_io
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
	padio => ww_TEST(15));
END structure;



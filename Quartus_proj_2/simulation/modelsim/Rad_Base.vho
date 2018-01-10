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

-- DATE "01/10/2018 14:51:09"

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
	RES_COD : IN std_logic;
	RES_DEC : IN std_logic;
	ERROR_BUFFER : IN std_logic_vector(1 DOWNTO 0);
	ERROR_COUNTER : IN std_logic_vector(1 DOWNTO 0);
	ERROR_WORD : IN std_logic_vector(1 DOWNTO 0);
	DECODER_INPUT_WORD : OUT std_logic_vector(2 DOWNTO 0);
	DECODER_OUT_COUNT : OUT std_logic_vector(1 DOWNTO 0);
	TEST_CODER_STEP : OUT std_logic_vector(2 DOWNTO 0);
	TEST_CODER_F2M : OUT std_logic;
	TEST_CODER_BUFFER_1 : OUT std_logic_vector(2 DOWNTO 0);
	TEST_CODER_BUFFER_2 : OUT std_logic_vector(2 DOWNTO 0);
	TEST_CODER_NUMBER_BUFFER : OUT std_logic;
	TEST_CODER_OUTPUT : OUT std_logic;
	TEST_CODER_WORD : OUT std_logic_vector(2 DOWNTO 0);
	TEST_CODER : OUT std_logic_vector(15 DOWNTO 0);
	TEST_DECODER_VALUE : OUT std_logic;
	TEST_DECODER_NUMBER_PART : OUT std_logic_vector(2 DOWNTO 0);
	TEST_DECODER_SYNC : OUT std_logic;
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
SIGNAL ww_RES_COD : std_logic;
SIGNAL ww_RES_DEC : std_logic;
SIGNAL ww_ERROR_BUFFER : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_ERROR_COUNTER : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_ERROR_WORD : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_DECODER_INPUT_WORD : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_DECODER_OUT_COUNT : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_TEST_CODER_STEP : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_TEST_CODER_F2M : std_logic;
SIGNAL ww_TEST_CODER_BUFFER_1 : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_TEST_CODER_BUFFER_2 : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_TEST_CODER_NUMBER_BUFFER : std_logic;
SIGNAL ww_TEST_CODER_OUTPUT : std_logic;
SIGNAL ww_TEST_CODER_WORD : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_TEST_CODER : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_TEST_DECODER_VALUE : std_logic;
SIGNAL ww_TEST_DECODER_NUMBER_PART : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_TEST_DECODER_SYNC : std_logic;
SIGNAL ww_TEST_DECODER : std_logic_vector(15 DOWNTO 0);
SIGNAL \Coder|Form_word|OUT_WORD~28_combout\ : std_logic;
SIGNAL \DEecoder|READ_WORD|word_inner[2]~12_combout\ : std_logic;
SIGNAL \DEecoder|READ_WORD|word_inner[0]~13_combout\ : std_logic;
SIGNAL \DEecoder|READ_WORD|word_inner[1]~14_combout\ : std_logic;
SIGNAL \DEecoder|READ_WORD|word_inner[2]~15_combout\ : std_logic;
SIGNAL \DEecoder|READ_WORD|sync_inner~2_combout\ : std_logic;
SIGNAL \Coder|Form_buffer|buffer_temp_1~23_combout\ : std_logic;
SIGNAL \Coder|Form_word|OUT_WORD~50\ : std_logic;
SIGNAL \Coder|Form_word|OUT_WORD~34_combout\ : std_logic;
SIGNAL \Coder|Form_word|OUT_WORD~36_combout\ : std_logic;
SIGNAL \Coder|Form_buffer|buffer_temp_2[0]~5_combout\ : std_logic;
SIGNAL \Coder|Word_test|temp_buffer[0]~2_combout\ : std_logic;
SIGNAL \RES_DEC~dataout\ : std_logic;
SIGNAL \CLK~dataout\ : std_logic;
SIGNAL \DEecoder|READ_WORD|Equal1~0_combout\ : std_logic;
SIGNAL \RES_COD~dataout\ : std_logic;
SIGNAL \Coder|Form_word|OUT_WORD~30_combout\ : std_logic;
SIGNAL \Coder|DIV|number~regout\ : std_logic;
SIGNAL \Coder|DIV|Equal0~0_combout\ : std_logic;
SIGNAL \Coder|DIV|Equal1~0_combout\ : std_logic;
SIGNAL \Coder|DIV|F2M~regout\ : std_logic;
SIGNAL \Coder|Form_word|OUT_WORD~24_combout\ : std_logic;
SIGNAL \Coder|Form_word|Equal0~0_combout\ : std_logic;
SIGNAL \Coder|Form_buffer|Equal1~0_combout\ : std_logic;
SIGNAL \Coder|Form_word|OUT_WORD~25_combout\ : std_logic;
SIGNAL \Coder|Form_word|Equal2~0_combout\ : std_logic;
SIGNAL \Coder|Form_word|OUT_WORD~27_combout\ : std_logic;
SIGNAL \Coder|COUNT|Equal2~0_combout\ : std_logic;
SIGNAL \Coder|COUNT|Equal2~1_combout\ : std_logic;
SIGNAL \Coder|Form_buffer|buffer_temp_1~33\ : std_logic;
SIGNAL \Coder|Form_buffer|buffer_temp_1~26_combout\ : std_logic;
SIGNAL \Coder|Form_word|OUT_WORD~23_combout\ : std_logic;
SIGNAL \Coder|Form_word|OUT_WORD~29_combout\ : std_logic;
SIGNAL \Coder|Form_word|OUT_WORD~combout\ : std_logic;
SIGNAL \DEecoder|READ_WORD|sync_inner~regout\ : std_logic;
SIGNAL \Coder|Form_buffer|buffer_temp_1~17_combout\ : std_logic;
SIGNAL \Coder|Form_buffer|buffer_temp_2[2]~6_combout\ : std_logic;
SIGNAL \Coder|Word_test|OUT_WORD~9_combout\ : std_logic;
SIGNAL \Coder|Form_word|OUT_WORD~0_combout\ : std_logic;
SIGNAL \Coder|Word_test|inner_f2m~regout\ : std_logic;
SIGNAL \Coder|Form_word|OUT_WORD~3_combout\ : std_logic;
SIGNAL \Coder|Word_test|OUT_WORD~22_combout\ : std_logic;
SIGNAL \Coder|Form_word|OUT_WORD~8_combout\ : std_logic;
SIGNAL \Coder|Word_test|OUT_WORD~24_combout\ : std_logic;
SIGNAL \DEecoder|READ_WORD|SYNC~regout\ : std_logic;
SIGNAL \DEecoder|DIV|F2M~regout\ : std_logic;
SIGNAL \DEecoder|READ_WORD|OUT_WORD\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \DEecoder|READ_WORD|count\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \DEecoder|READ_WORD|count_status\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \DEecoder|READ_WORD|word_inner\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \Coder|Word_test|OUT_WORD\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \Coder|Word_test|temp_buffer\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \Coder|Form_buffer|buffer_temp_1\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \Coder|Form_buffer|buffer_temp_2\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \Coder|COUNT|counter\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \Coder|DIV|counter\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \ERROR_BUFFER~dataout\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \ERROR_COUNTER~dataout\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \ERROR_WORD~dataout\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \DEecoder|DIV|counter\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \Coder|COUNT|ALT_INV_counter\ : std_logic_vector(2 DOWNTO 1);
SIGNAL \Coder|DIV|ALT_INV_F2M~regout\ : std_logic;
SIGNAL \Coder|Form_buffer|ALT_INV_buffer_temp_1\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \Coder|Form_buffer|ALT_INV_buffer_temp_2\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \Coder|Word_test|ALT_INV_OUT_WORD\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \ALT_INV_CLK~dataout\ : std_logic;

BEGIN

ww_CLK <= CLK;
ww_RES_COD <= RES_COD;
ww_RES_DEC <= RES_DEC;
ww_ERROR_BUFFER <= ERROR_BUFFER;
ww_ERROR_COUNTER <= ERROR_COUNTER;
ww_ERROR_WORD <= ERROR_WORD;
DECODER_INPUT_WORD <= ww_DECODER_INPUT_WORD;
DECODER_OUT_COUNT <= ww_DECODER_OUT_COUNT;
TEST_CODER_STEP <= ww_TEST_CODER_STEP;
TEST_CODER_F2M <= ww_TEST_CODER_F2M;
TEST_CODER_BUFFER_1 <= ww_TEST_CODER_BUFFER_1;
TEST_CODER_BUFFER_2 <= ww_TEST_CODER_BUFFER_2;
TEST_CODER_NUMBER_BUFFER <= ww_TEST_CODER_NUMBER_BUFFER;
TEST_CODER_OUTPUT <= ww_TEST_CODER_OUTPUT;
TEST_CODER_WORD <= ww_TEST_CODER_WORD;
TEST_CODER <= ww_TEST_CODER;
TEST_DECODER_VALUE <= ww_TEST_DECODER_VALUE;
TEST_DECODER_NUMBER_PART <= ww_TEST_DECODER_NUMBER_PART;
TEST_DECODER_SYNC <= ww_TEST_DECODER_SYNC;
TEST_DECODER <= ww_TEST_DECODER;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\Coder|COUNT|ALT_INV_counter\(1) <= NOT \Coder|COUNT|counter\(1);
\Coder|COUNT|ALT_INV_counter\(2) <= NOT \Coder|COUNT|counter\(2);
\Coder|DIV|ALT_INV_F2M~regout\ <= NOT \Coder|DIV|F2M~regout\;
\Coder|Form_buffer|ALT_INV_buffer_temp_1\(0) <= NOT \Coder|Form_buffer|buffer_temp_1\(0);
\Coder|Form_buffer|ALT_INV_buffer_temp_1\(1) <= NOT \Coder|Form_buffer|buffer_temp_1\(1);
\Coder|Form_buffer|ALT_INV_buffer_temp_1\(2) <= NOT \Coder|Form_buffer|buffer_temp_1\(2);
\Coder|Form_buffer|ALT_INV_buffer_temp_2\(0) <= NOT \Coder|Form_buffer|buffer_temp_2\(0);
\Coder|Form_buffer|ALT_INV_buffer_temp_2\(1) <= NOT \Coder|Form_buffer|buffer_temp_2\(1);
\Coder|Form_buffer|ALT_INV_buffer_temp_2\(2) <= NOT \Coder|Form_buffer|buffer_temp_2\(2);
\Coder|Word_test|ALT_INV_OUT_WORD\(0) <= NOT \Coder|Word_test|OUT_WORD\(0);
\Coder|Word_test|ALT_INV_OUT_WORD\(2) <= NOT \Coder|Word_test|OUT_WORD\(2);
\ALT_INV_CLK~dataout\ <= NOT \CLK~dataout\;

\Coder|Form_word|OUT_WORD~28\ : flex10ke_lcell
-- Equation(s):
-- \Coder|Form_word|OUT_WORD~28_combout\ = \Coder|Form_buffer|buffer_temp_2\(0) $ (\Coder|Form_word|Equal0~0_combout\ & \Coder|Form_buffer|buffer_temp_1\(1) # !\Coder|Form_word|Equal0~0_combout\ & (!\Coder|Form_buffer|buffer_temp_2\(1)))

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "6c63",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \Coder|Form_buffer|buffer_temp_1\(1),
	datab => \Coder|Form_buffer|buffer_temp_2\(0),
	datac => \Coder|Form_word|Equal0~0_combout\,
	datad => \Coder|Form_buffer|buffer_temp_2\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Coder|Form_word|OUT_WORD~28_combout\);

\DEecoder|READ_WORD|word_inner[2]~12\ : flex10ke_lcell
-- Equation(s):
-- \DEecoder|READ_WORD|word_inner[2]~12_combout\ = !\RES_DEC~dataout\ & !\DEecoder|READ_WORD|count_status\(0) & \DEecoder|READ_WORD|sync_inner~regout\

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "0300",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	datab => \RES_DEC~dataout\,
	datac => \DEecoder|READ_WORD|count_status\(0),
	datad => \DEecoder|READ_WORD|sync_inner~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \DEecoder|READ_WORD|word_inner[2]~12_combout\);

\DEecoder|READ_WORD|word_inner[0]~13\ : flex10ke_lcell
-- Equation(s):
-- \DEecoder|READ_WORD|word_inner[0]~13_combout\ = !\DEecoder|READ_WORD|count_status\(2) & \DEecoder|READ_WORD|word_inner[2]~12_combout\ & \DEecoder|READ_WORD|count_status\(1)

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "3000",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	datab => \DEecoder|READ_WORD|count_status\(2),
	datac => \DEecoder|READ_WORD|word_inner[2]~12_combout\,
	datad => \DEecoder|READ_WORD|count_status\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \DEecoder|READ_WORD|word_inner[0]~13_combout\);

\DEecoder|READ_WORD|word_inner[1]~14\ : flex10ke_lcell
-- Equation(s):
-- \DEecoder|READ_WORD|word_inner[1]~14_combout\ = !\DEecoder|READ_WORD|count_status\(1) & \DEecoder|READ_WORD|word_inner[2]~12_combout\ & \DEecoder|READ_WORD|count_status\(2)

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "3000",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	datab => \DEecoder|READ_WORD|count_status\(1),
	datac => \DEecoder|READ_WORD|word_inner[2]~12_combout\,
	datad => \DEecoder|READ_WORD|count_status\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \DEecoder|READ_WORD|word_inner[1]~14_combout\);

\DEecoder|READ_WORD|word_inner[2]~15\ : flex10ke_lcell
-- Equation(s):
-- \DEecoder|READ_WORD|word_inner[2]~15_combout\ = \DEecoder|READ_WORD|word_inner[2]~12_combout\ & \DEecoder|READ_WORD|count_status\(1) & \DEecoder|READ_WORD|count_status\(2)

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "c000",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	datab => \DEecoder|READ_WORD|word_inner[2]~12_combout\,
	datac => \DEecoder|READ_WORD|count_status\(1),
	datad => \DEecoder|READ_WORD|count_status\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \DEecoder|READ_WORD|word_inner[2]~15_combout\);

\DEecoder|READ_WORD|count[2]\ : flex10ke_lcell
-- Equation(s):
-- \DEecoder|READ_WORD|count\(2) = DFFEA(!\Coder|Form_word|OUT_WORD~combout\ & (\DEecoder|READ_WORD|count\(2) $ (\DEecoder|READ_WORD|count\(0) & \DEecoder|READ_WORD|count\(1))), GLOBAL(\CLK~dataout\), !GLOBAL(\RES_DEC~dataout\), , , , )

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "1540",
	operation_mode => "normal",
	output_mode => "reg_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \Coder|Form_word|OUT_WORD~combout\,
	datab => \DEecoder|READ_WORD|count\(0),
	datac => \DEecoder|READ_WORD|count\(1),
	datad => \DEecoder|READ_WORD|count\(2),
	aclr => \RES_DEC~dataout\,
	clk => \CLK~dataout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \DEecoder|READ_WORD|count\(2));

\DEecoder|READ_WORD|count[1]\ : flex10ke_lcell
-- Equation(s):
-- \DEecoder|READ_WORD|count\(1) = DFFEA(!\Coder|Form_word|OUT_WORD~combout\ & (\DEecoder|READ_WORD|count\(0) $ \DEecoder|READ_WORD|count\(1)), GLOBAL(\CLK~dataout\), !GLOBAL(\RES_DEC~dataout\), , , , )

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "0330",
	operation_mode => "normal",
	output_mode => "reg_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	datab => \Coder|Form_word|OUT_WORD~combout\,
	datac => \DEecoder|READ_WORD|count\(0),
	datad => \DEecoder|READ_WORD|count\(1),
	aclr => \RES_DEC~dataout\,
	clk => \CLK~dataout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \DEecoder|READ_WORD|count\(1));

\DEecoder|READ_WORD|count[0]\ : flex10ke_lcell
-- Equation(s):
-- \DEecoder|READ_WORD|count\(0) = DFFEA(!\DEecoder|READ_WORD|count\(0) & !\Coder|Form_word|OUT_WORD~combout\ & (!\DEecoder|READ_WORD|count\(2) # !\DEecoder|READ_WORD|count\(1)), GLOBAL(\CLK~dataout\), !GLOBAL(\RES_DEC~dataout\), , , , )

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "0007",
	operation_mode => "normal",
	output_mode => "reg_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \DEecoder|READ_WORD|count\(1),
	datab => \DEecoder|READ_WORD|count\(2),
	datac => \DEecoder|READ_WORD|count\(0),
	datad => \Coder|Form_word|OUT_WORD~combout\,
	aclr => \RES_DEC~dataout\,
	clk => \CLK~dataout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \DEecoder|READ_WORD|count\(0));

\DEecoder|READ_WORD|sync_inner~2\ : flex10ke_lcell
-- Equation(s):
-- \DEecoder|READ_WORD|sync_inner~2_combout\ = !\DEecoder|READ_WORD|count\(0) & !\Coder|Form_word|OUT_WORD~combout\ & \DEecoder|READ_WORD|count\(1) & \DEecoder|READ_WORD|count\(2)

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "1000",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \DEecoder|READ_WORD|count\(0),
	datab => \Coder|Form_word|OUT_WORD~combout\,
	datac => \DEecoder|READ_WORD|count\(1),
	datad => \DEecoder|READ_WORD|count\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \DEecoder|READ_WORD|sync_inner~2_combout\);

\Coder|Form_word|OUT_WORD~34\ : flex10ke_lcell
-- Equation(s):
-- \Coder|Form_word|OUT_WORD~50\ = \Coder|DIV|Equal1~0_combout\ # \Coder|Form_word|OUT_WORD~8_combout\ $ (!\ERROR_WORD~dataout\(1) # !\ERROR_WORD~dataout\(0))

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "ff95",
	operation_mode => "normal",
	output_mode => "none",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \Coder|Form_word|OUT_WORD~8_combout\,
	datab => \ERROR_WORD~dataout\(0),
	datac => \ERROR_WORD~dataout\(1),
	datad => \Coder|DIV|Equal1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Coder|Form_word|OUT_WORD~34_combout\,
	cascout => \Coder|Form_word|OUT_WORD~50\);

\Coder|Form_word|OUT_WORD~36\ : flex10ke_lcell
-- Equation(s):
-- \Coder|Form_word|OUT_WORD~36_combout\ = (\Coder|Form_word|OUT_WORD~3_combout\ $ (\ERROR_WORD~dataout\(0) # !\ERROR_WORD~dataout\(1)) # !\Coder|DIV|Equal1~0_combout\) & CASCADE(\Coder|Form_word|OUT_WORD~50\)

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "7d77",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \Coder|DIV|Equal1~0_combout\,
	datab => \Coder|Form_word|OUT_WORD~3_combout\,
	datac => \ERROR_WORD~dataout\(0),
	datad => \ERROR_WORD~dataout\(1),
	cascin => \Coder|Form_word|OUT_WORD~50\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Coder|Form_word|OUT_WORD~36_combout\);

\Coder|Form_buffer|buffer_temp_2[0]~5\ : flex10ke_lcell
-- Equation(s):
-- \Coder|Form_buffer|buffer_temp_2[0]~5_combout\ = !\Coder|COUNT|Equal2~1_combout\

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "00ff",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	datad => \Coder|COUNT|Equal2~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Coder|Form_buffer|buffer_temp_2[0]~5_combout\);

\Coder|Word_test|temp_buffer[0]~2\ : flex10ke_lcell
-- Equation(s):
-- \Coder|Word_test|temp_buffer[0]~2_combout\ = !\RES_COD~dataout\

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "00ff",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	datad => \RES_COD~dataout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Coder|Word_test|temp_buffer[0]~2_combout\);

\RES_DEC~I\ : flex10ke_io
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
	padio => ww_RES_DEC,
	dataout => \RES_DEC~dataout\);

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

\DEecoder|READ_WORD|count_status[0]\ : flex10ke_lcell
-- Equation(s):
-- \DEecoder|READ_WORD|count_status\(0) = DFFEA(!\DEecoder|READ_WORD|count_status\(0), GLOBAL(\CLK~dataout\), !GLOBAL(\RES_DEC~dataout\), , \DEecoder|READ_WORD|sync_inner~regout\, , )

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "true",
	lut_mask => "00ff",
	operation_mode => "normal",
	output_mode => "reg_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \DEecoder|READ_WORD|sync_inner~regout\,
	datad => \DEecoder|READ_WORD|count_status\(0),
	aclr => \RES_DEC~dataout\,
	clk => \CLK~dataout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \DEecoder|READ_WORD|count_status\(0));

\DEecoder|READ_WORD|count_status[1]\ : flex10ke_lcell
-- Equation(s):
-- \DEecoder|READ_WORD|count_status\(1) = DFFEA(\DEecoder|READ_WORD|count_status\(1) $ \DEecoder|READ_WORD|count_status\(0), GLOBAL(\CLK~dataout\), !GLOBAL(\RES_DEC~dataout\), , \DEecoder|READ_WORD|sync_inner~regout\, , )

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "true",
	lut_mask => "0ff0",
	operation_mode => "normal",
	output_mode => "reg_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \DEecoder|READ_WORD|sync_inner~regout\,
	datac => \DEecoder|READ_WORD|count_status\(1),
	datad => \DEecoder|READ_WORD|count_status\(0),
	aclr => \RES_DEC~dataout\,
	clk => \CLK~dataout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \DEecoder|READ_WORD|count_status\(1));

\DEecoder|READ_WORD|count_status[2]\ : flex10ke_lcell
-- Equation(s):
-- \DEecoder|READ_WORD|count_status\(2) = DFFEA(\DEecoder|READ_WORD|count_status\(2) $ (\DEecoder|READ_WORD|count_status\(1) & \DEecoder|READ_WORD|count_status\(0)), GLOBAL(\CLK~dataout\), !GLOBAL(\RES_DEC~dataout\), , \DEecoder|READ_WORD|sync_inner~regout\, 
-- , )

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "true",
	lut_mask => "3fc0",
	operation_mode => "normal",
	output_mode => "reg_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \DEecoder|READ_WORD|sync_inner~regout\,
	datab => \DEecoder|READ_WORD|count_status\(1),
	datac => \DEecoder|READ_WORD|count_status\(0),
	datad => \DEecoder|READ_WORD|count_status\(2),
	aclr => \RES_DEC~dataout\,
	clk => \CLK~dataout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \DEecoder|READ_WORD|count_status\(2));

\DEecoder|READ_WORD|Equal1~0\ : flex10ke_lcell
-- Equation(s):
-- \DEecoder|READ_WORD|Equal1~0_combout\ = \DEecoder|READ_WORD|count_status\(1) & \DEecoder|READ_WORD|count_status\(2) & \DEecoder|READ_WORD|count_status\(0)

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "c000",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	datab => \DEecoder|READ_WORD|count_status\(1),
	datac => \DEecoder|READ_WORD|count_status\(2),
	datad => \DEecoder|READ_WORD|count_status\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \DEecoder|READ_WORD|Equal1~0_combout\);

\RES_COD~I\ : flex10ke_io
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
	padio => ww_RES_COD,
	dataout => \RES_COD~dataout\);

\Coder|DIV|counter[0]\ : flex10ke_lcell
-- Equation(s):
-- \Coder|DIV|counter\(0) = DFFEA(!\Coder|DIV|counter\(0), GLOBAL(\CLK~dataout\), !GLOBAL(\RES_COD~dataout\), , , , )

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
	aclr => \RES_COD~dataout\,
	clk => \CLK~dataout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Coder|DIV|counter\(0));

\Coder|DIV|counter[1]\ : flex10ke_lcell
-- Equation(s):
-- \Coder|DIV|counter\(1) = DFFEA(\Coder|DIV|counter\(0) $ \Coder|DIV|counter\(1), GLOBAL(\CLK~dataout\), !GLOBAL(\RES_COD~dataout\), , , , )

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
	aclr => \RES_COD~dataout\,
	clk => \CLK~dataout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Coder|DIV|counter\(1));

\Coder|DIV|counter[2]\ : flex10ke_lcell
-- Equation(s):
-- \Coder|DIV|counter\(2) = DFFEA(\Coder|DIV|counter\(2) $ (\Coder|DIV|counter\(0) & \Coder|DIV|counter\(1)), GLOBAL(\CLK~dataout\), !GLOBAL(\RES_COD~dataout\), , , , )

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
	aclr => \RES_COD~dataout\,
	clk => \CLK~dataout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Coder|DIV|counter\(2));

\Coder|Form_word|OUT_WORD~30\ : flex10ke_lcell
-- Equation(s):
-- \Coder|Form_word|OUT_WORD~30_combout\ = \Coder|DIV|counter\(0) & (!\Coder|DIV|counter\(2) # !\Coder|DIV|counter\(1))

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
	combout => \Coder|Form_word|OUT_WORD~30_combout\);

\Coder|DIV|number\ : flex10ke_lcell
-- Equation(s):
-- \Coder|DIV|number~regout\ = DFFEA(!\Coder|DIV|number~regout\, GLOBAL(\CLK~dataout\), !GLOBAL(\RES_COD~dataout\), , \Coder|DIV|Equal0~0_combout\, , )

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
	aclr => \RES_COD~dataout\,
	clk => \CLK~dataout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Coder|DIV|number~regout\);

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
-- \Coder|DIV|F2M~regout\ = DFFEA(!\Coder|DIV|Equal0~0_combout\ & (\Coder|DIV|Equal1~0_combout\ # \Coder|DIV|F2M~regout\), GLOBAL(\CLK~dataout\), !GLOBAL(\RES_COD~dataout\), , , , )

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
	aclr => \RES_COD~dataout\,
	clk => \CLK~dataout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Coder|DIV|F2M~regout\);

\Coder|COUNT|counter[2]\ : flex10ke_lcell
-- Equation(s):
-- \Coder|COUNT|counter\(2) = DFFEA(\Coder|COUNT|counter\(1) $ \Coder|COUNT|counter\(2) $ (\ERROR_COUNTER~dataout\(0) # !\ERROR_COUNTER~dataout\(1)), GLOBAL(\Coder|DIV|F2M~regout\), !GLOBAL(\RES_COD~dataout\), , , , )

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
	aclr => \RES_COD~dataout\,
	clk => \Coder|DIV|F2M~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Coder|COUNT|counter\(2));

\Coder|Form_buffer|buffer_temp_2[0]\ : flex10ke_lcell
-- Equation(s):
-- \Coder|Form_buffer|buffer_temp_2\(0) = DFFEA(\Coder|COUNT|counter\(2), !GLOBAL(\Coder|DIV|F2M~regout\), !GLOBAL(\RES_COD~dataout\), , \Coder|Form_buffer|buffer_temp_2[0]~5_combout\, , )

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
	aclr => \RES_COD~dataout\,
	clk => \Coder|DIV|ALT_INV_F2M~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Coder|Form_buffer|buffer_temp_2\(0));

\Coder|Form_buffer|buffer_temp_2[1]\ : flex10ke_lcell
-- Equation(s):
-- \Coder|Form_buffer|buffer_temp_2\(1) = DFFEA(\Coder|COUNT|counter\(2), !GLOBAL(\Coder|DIV|F2M~regout\), !GLOBAL(\RES_COD~dataout\), , \Coder|COUNT|Equal2~0_combout\, , )

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "true",
	lut_mask => "ff00",
	operation_mode => "normal",
	output_mode => "reg_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \Coder|COUNT|Equal2~0_combout\,
	datad => \Coder|COUNT|counter\(2),
	aclr => \RES_COD~dataout\,
	clk => \Coder|DIV|ALT_INV_F2M~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Coder|Form_buffer|buffer_temp_2\(1));

\Coder|Form_word|OUT_WORD~24\ : flex10ke_lcell
-- Equation(s):
-- \Coder|Form_word|OUT_WORD~24_combout\ = \Coder|DIV|Equal1~0_combout\ & !\Coder|Form_buffer|buffer_temp_2\(0) # !\Coder|DIV|Equal1~0_combout\ & (!\Coder|Form_buffer|buffer_temp_2\(1))

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "330f",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	datab => \Coder|Form_buffer|buffer_temp_2\(0),
	datac => \Coder|Form_buffer|buffer_temp_2\(1),
	datad => \Coder|DIV|Equal1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Coder|Form_word|OUT_WORD~24_combout\);

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

\Coder|Form_word|Equal0~0\ : flex10ke_lcell
-- Equation(s):
-- \Coder|Form_word|Equal0~0_combout\ = !\ERROR_WORD~dataout\(1) & \ERROR_WORD~dataout\(0)

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "0f00",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	datac => \ERROR_WORD~dataout\(1),
	datad => \ERROR_WORD~dataout\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Coder|Form_word|Equal0~0_combout\);

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
-- !GLOBAL(\RES_COD~dataout\), , , , )

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
	aclr => \RES_COD~dataout\,
	clk => \Coder|DIV|ALT_INV_F2M~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Coder|Form_buffer|buffer_temp_1\(2));

\Coder|Form_word|OUT_WORD~25\ : flex10ke_lcell
-- Equation(s):
-- \Coder|Form_word|OUT_WORD~25_combout\ = \Coder|Form_word|OUT_WORD~24_combout\ $ (\Coder|Form_word|Equal0~0_combout\ & (!\Coder|Form_buffer|buffer_temp_1\(2)) # !\Coder|Form_word|Equal0~0_combout\ & \Coder|Form_buffer|buffer_temp_2\(2))

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "c636",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \Coder|Form_buffer|buffer_temp_2\(2),
	datab => \Coder|Form_word|OUT_WORD~24_combout\,
	datac => \Coder|Form_word|Equal0~0_combout\,
	datad => \Coder|Form_buffer|buffer_temp_1\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Coder|Form_word|OUT_WORD~25_combout\);

\Coder|Form_word|Equal2~0\ : flex10ke_lcell
-- Equation(s):
-- \Coder|Form_word|Equal2~0_combout\ = !\Coder|DIV|counter\(1) & !\Coder|DIV|counter\(2) & \Coder|DIV|counter\(0)

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
	combout => \Coder|Form_word|Equal2~0_combout\);

\Coder|Form_word|OUT_WORD~27\ : flex10ke_lcell
-- Equation(s):
-- \Coder|Form_word|OUT_WORD~27_combout\ = \Coder|DIV|number~regout\ & (\Coder|Form_word|Equal2~0_combout\ # !\Coder|Form_word|OUT_WORD~25_combout\) # !\Coder|DIV|number~regout\ & !\Coder|Form_word|OUT_WORD~36_combout\ & (!\Coder|Form_word|Equal2~0_combout\)

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "cc1d",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \Coder|Form_word|OUT_WORD~36_combout\,
	datab => \Coder|DIV|number~regout\,
	datac => \Coder|Form_word|OUT_WORD~25_combout\,
	datad => \Coder|Form_word|Equal2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Coder|Form_word|OUT_WORD~27_combout\);

\Coder|COUNT|counter[0]\ : flex10ke_lcell
-- Equation(s):
-- \Coder|COUNT|counter\(0) = DFFEA(\ERROR_COUNTER~dataout\(1) & (\ERROR_COUNTER~dataout\(0) & !\Coder|COUNT|counter\(0) & \Coder|COUNT|counter\(1) # !\ERROR_COUNTER~dataout\(0) & (!\Coder|COUNT|counter\(1))) # !\ERROR_COUNTER~dataout\(1) & 
-- \Coder|COUNT|counter\(1) & (\Coder|COUNT|counter\(0) $ !\ERROR_COUNTER~dataout\(0)), GLOBAL(\Coder|DIV|F2M~regout\), !GLOBAL(\RES_COD~dataout\), , , , )

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
	aclr => \RES_COD~dataout\,
	clk => \Coder|DIV|F2M~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Coder|COUNT|counter\(0));

\Coder|COUNT|Equal2~0\ : flex10ke_lcell
-- Equation(s):
-- \Coder|COUNT|Equal2~0_combout\ = \Coder|COUNT|counter\(1) & \Coder|COUNT|counter\(0)

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
	combout => \Coder|COUNT|Equal2~0_combout\);

\Coder|COUNT|counter[1]\ : flex10ke_lcell
-- Equation(s):
-- \Coder|COUNT|counter\(1) = DFFEA(\ERROR_COUNTER~dataout\(1) & (!\Coder|COUNT|Equal2~0_combout\ # !\ERROR_COUNTER~dataout\(0)) # !\ERROR_COUNTER~dataout\(1) & (\ERROR_COUNTER~dataout\(0) & \Coder|COUNT|Equal2~1_combout\ # !\ERROR_COUNTER~dataout\(0) & 
-- (!\Coder|COUNT|Equal2~0_combout\)), GLOBAL(\Coder|DIV|F2M~regout\), !GLOBAL(\RES_COD~dataout\), , , , )

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "2cef",
	operation_mode => "normal",
	output_mode => "reg_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \Coder|COUNT|Equal2~1_combout\,
	datab => \ERROR_COUNTER~dataout\(1),
	datac => \ERROR_COUNTER~dataout\(0),
	datad => \Coder|COUNT|Equal2~0_combout\,
	aclr => \RES_COD~dataout\,
	clk => \Coder|DIV|F2M~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Coder|COUNT|counter\(1));

\Coder|COUNT|Equal2~1\ : flex10ke_lcell
-- Equation(s):
-- \Coder|COUNT|Equal2~1_combout\ = \Coder|COUNT|counter\(0) # !\Coder|COUNT|counter\(1)

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
	combout => \Coder|COUNT|Equal2~1_combout\);

\Coder|Form_buffer|buffer_temp_1~23\ : flex10ke_lcell
-- Equation(s):
-- \Coder|Form_buffer|buffer_temp_1~33\ = \Coder|Form_buffer|buffer_temp_1\(0) $ (\ERROR_BUFFER~dataout\(0) & !\ERROR_BUFFER~dataout\(1)) # !\Coder|COUNT|Equal2~1_combout\

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "f75d",
	operation_mode => "normal",
	output_mode => "none",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \Coder|COUNT|Equal2~1_combout\,
	datab => \ERROR_BUFFER~dataout\(0),
	datac => \ERROR_BUFFER~dataout\(1),
	datad => \Coder|Form_buffer|buffer_temp_1\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Coder|Form_buffer|buffer_temp_1~23_combout\,
	cascout => \Coder|Form_buffer|buffer_temp_1~33\);

\Coder|Form_buffer|buffer_temp_1~26\ : flex10ke_lcell
-- Equation(s):
-- \Coder|Form_buffer|buffer_temp_1~26_combout\ = (\Coder|COUNT|Equal2~1_combout\ # \Coder|COUNT|counter\(2) $ (\ERROR_BUFFER~dataout\(0) & !\ERROR_BUFFER~dataout\(1))) & CASCADE(\Coder|Form_buffer|buffer_temp_1~33\)

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "ffd2",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \ERROR_BUFFER~dataout\(0),
	datab => \ERROR_BUFFER~dataout\(1),
	datac => \Coder|COUNT|counter\(2),
	datad => \Coder|COUNT|Equal2~1_combout\,
	cascin => \Coder|Form_buffer|buffer_temp_1~33\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Coder|Form_buffer|buffer_temp_1~26_combout\);

\Coder|Form_buffer|buffer_temp_1[0]\ : flex10ke_lcell
-- Equation(s):
-- \Coder|Form_buffer|buffer_temp_1\(0) = DFFEA(\Coder|Form_buffer|buffer_temp_1~26_combout\, !GLOBAL(\Coder|DIV|F2M~regout\), !GLOBAL(\RES_COD~dataout\), , , , )

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
	aclr => \RES_COD~dataout\,
	clk => \Coder|DIV|ALT_INV_F2M~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Coder|Form_buffer|buffer_temp_1\(0));

\Coder|Form_word|OUT_WORD~23\ : flex10ke_lcell
-- Equation(s):
-- \Coder|Form_word|OUT_WORD~23_combout\ = \Coder|Form_buffer|buffer_temp_1\(1) $ \Coder|Form_buffer|buffer_temp_1\(0) $ (!\ERROR_WORD~dataout\(1) & \ERROR_WORD~dataout\(0))

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "6966",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \Coder|Form_buffer|buffer_temp_1\(1),
	datab => \Coder|Form_buffer|buffer_temp_1\(0),
	datac => \ERROR_WORD~dataout\(1),
	datad => \ERROR_WORD~dataout\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Coder|Form_word|OUT_WORD~23_combout\);

\Coder|Form_word|OUT_WORD~29\ : flex10ke_lcell
-- Equation(s):
-- \Coder|Form_word|OUT_WORD~29_combout\ = \Coder|Form_word|OUT_WORD~27_combout\ & (!\Coder|Form_word|Equal2~0_combout\ # !\Coder|Form_word|OUT_WORD~28_combout\) # !\Coder|Form_word|OUT_WORD~27_combout\ & (\Coder|Form_word|Equal2~0_combout\ & 
-- \Coder|Form_word|OUT_WORD~23_combout\)

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "7c4c",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \Coder|Form_word|OUT_WORD~28_combout\,
	datab => \Coder|Form_word|OUT_WORD~27_combout\,
	datac => \Coder|Form_word|Equal2~0_combout\,
	datad => \Coder|Form_word|OUT_WORD~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Coder|Form_word|OUT_WORD~29_combout\);

\Coder|Form_word|OUT_WORD\ : flex10ke_lcell
-- Equation(s):
-- \Coder|Form_word|OUT_WORD~combout\ = \Coder|Form_word|OUT_WORD~30_combout\ & (\Coder|Form_word|OUT_WORD~29_combout\) # !\Coder|Form_word|OUT_WORD~30_combout\ & \Coder|Form_word|OUT_WORD~combout\

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "fc30",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	datab => \Coder|Form_word|OUT_WORD~30_combout\,
	datac => \Coder|Form_word|OUT_WORD~combout\,
	datad => \Coder|Form_word|OUT_WORD~29_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Coder|Form_word|OUT_WORD~combout\);

\DEecoder|READ_WORD|word_inner[0]\ : flex10ke_lcell
-- Equation(s):
-- \DEecoder|READ_WORD|word_inner\(0) = DFFEA(\Coder|Form_word|OUT_WORD~combout\, GLOBAL(\CLK~dataout\), , , \DEecoder|READ_WORD|word_inner[0]~13_combout\, , )

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "true",
	lut_mask => "ff00",
	operation_mode => "normal",
	output_mode => "reg_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \DEecoder|READ_WORD|word_inner[0]~13_combout\,
	datad => \Coder|Form_word|OUT_WORD~combout\,
	clk => \CLK~dataout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \DEecoder|READ_WORD|word_inner\(0));

\DEecoder|READ_WORD|sync_inner\ : flex10ke_lcell
-- Equation(s):
-- \DEecoder|READ_WORD|sync_inner~regout\ = DFFEA(VCC, GLOBAL(\CLK~dataout\), !GLOBAL(\RES_DEC~dataout\), , \DEecoder|READ_WORD|sync_inner~2_combout\, , )

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "true",
	lut_mask => "ffff",
	operation_mode => "normal",
	output_mode => "reg_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \DEecoder|READ_WORD|sync_inner~2_combout\,
	aclr => \RES_DEC~dataout\,
	clk => \CLK~dataout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \DEecoder|READ_WORD|sync_inner~regout\);

\DEecoder|READ_WORD|OUT_WORD[0]\ : flex10ke_lcell
-- Equation(s):
-- \DEecoder|READ_WORD|OUT_WORD\(0) = DFFEA(\DEecoder|READ_WORD|sync_inner~regout\ & (\DEecoder|READ_WORD|Equal1~0_combout\ & (\DEecoder|READ_WORD|word_inner\(0)) # !\DEecoder|READ_WORD|Equal1~0_combout\ & \DEecoder|READ_WORD|OUT_WORD\(0)), 
-- GLOBAL(\CLK~dataout\), !GLOBAL(\RES_DEC~dataout\), , , , )

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "e400",
	operation_mode => "normal",
	output_mode => "reg_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \DEecoder|READ_WORD|Equal1~0_combout\,
	datab => \DEecoder|READ_WORD|OUT_WORD\(0),
	datac => \DEecoder|READ_WORD|word_inner\(0),
	datad => \DEecoder|READ_WORD|sync_inner~regout\,
	aclr => \RES_DEC~dataout\,
	clk => \CLK~dataout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \DEecoder|READ_WORD|OUT_WORD\(0));

\DEecoder|READ_WORD|word_inner[1]\ : flex10ke_lcell
-- Equation(s):
-- \DEecoder|READ_WORD|word_inner\(1) = DFFEA(\Coder|Form_word|OUT_WORD~combout\, GLOBAL(\CLK~dataout\), , , \DEecoder|READ_WORD|word_inner[1]~14_combout\, , )

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "true",
	lut_mask => "ff00",
	operation_mode => "normal",
	output_mode => "reg_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \DEecoder|READ_WORD|word_inner[1]~14_combout\,
	datad => \Coder|Form_word|OUT_WORD~combout\,
	clk => \CLK~dataout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \DEecoder|READ_WORD|word_inner\(1));

\DEecoder|READ_WORD|OUT_WORD[1]\ : flex10ke_lcell
-- Equation(s):
-- \DEecoder|READ_WORD|OUT_WORD\(1) = DFFEA(\DEecoder|READ_WORD|sync_inner~regout\ & (\DEecoder|READ_WORD|Equal1~0_combout\ & (\DEecoder|READ_WORD|word_inner\(1)) # !\DEecoder|READ_WORD|Equal1~0_combout\ & \DEecoder|READ_WORD|OUT_WORD\(1)), 
-- GLOBAL(\CLK~dataout\), !GLOBAL(\RES_DEC~dataout\), , , , )

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "e400",
	operation_mode => "normal",
	output_mode => "reg_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \DEecoder|READ_WORD|Equal1~0_combout\,
	datab => \DEecoder|READ_WORD|OUT_WORD\(1),
	datac => \DEecoder|READ_WORD|word_inner\(1),
	datad => \DEecoder|READ_WORD|sync_inner~regout\,
	aclr => \RES_DEC~dataout\,
	clk => \CLK~dataout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \DEecoder|READ_WORD|OUT_WORD\(1));

\DEecoder|READ_WORD|word_inner[2]\ : flex10ke_lcell
-- Equation(s):
-- \DEecoder|READ_WORD|word_inner\(2) = DFFEA(\Coder|Form_word|OUT_WORD~combout\, GLOBAL(\CLK~dataout\), , , \DEecoder|READ_WORD|word_inner[2]~15_combout\, , )

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "true",
	lut_mask => "ff00",
	operation_mode => "normal",
	output_mode => "reg_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \DEecoder|READ_WORD|word_inner[2]~15_combout\,
	datad => \Coder|Form_word|OUT_WORD~combout\,
	clk => \CLK~dataout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \DEecoder|READ_WORD|word_inner\(2));

\DEecoder|READ_WORD|OUT_WORD[2]\ : flex10ke_lcell
-- Equation(s):
-- \DEecoder|READ_WORD|OUT_WORD\(2) = DFFEA(\DEecoder|READ_WORD|sync_inner~regout\ & (\DEecoder|READ_WORD|Equal1~0_combout\ & (\DEecoder|READ_WORD|word_inner\(2)) # !\DEecoder|READ_WORD|Equal1~0_combout\ & \DEecoder|READ_WORD|OUT_WORD\(2)), 
-- GLOBAL(\CLK~dataout\), !GLOBAL(\RES_DEC~dataout\), , , , )

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "e400",
	operation_mode => "normal",
	output_mode => "reg_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \DEecoder|READ_WORD|Equal1~0_combout\,
	datab => \DEecoder|READ_WORD|OUT_WORD\(2),
	datac => \DEecoder|READ_WORD|word_inner\(2),
	datad => \DEecoder|READ_WORD|sync_inner~regout\,
	aclr => \RES_DEC~dataout\,
	clk => \CLK~dataout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \DEecoder|READ_WORD|OUT_WORD\(2));

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
-- \Coder|Form_buffer|buffer_temp_1\(1) = DFFEA(\Coder|Form_buffer|buffer_temp_1~17_combout\ $ (\ERROR_BUFFER~dataout\(0) # !\ERROR_BUFFER~dataout\(1)), !GLOBAL(\Coder|DIV|F2M~regout\), !GLOBAL(\RES_COD~dataout\), , , , )

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
	aclr => \RES_COD~dataout\,
	clk => \Coder|DIV|ALT_INV_F2M~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Coder|Form_buffer|buffer_temp_1\(1));

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
-- \Coder|Form_buffer|buffer_temp_2\(2) = DFFEA(\Coder|COUNT|counter\(2), !GLOBAL(\Coder|DIV|F2M~regout\), !GLOBAL(\RES_COD~dataout\), , \Coder|Form_buffer|buffer_temp_2[2]~6_combout\, , )

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
	aclr => \RES_COD~dataout\,
	clk => \Coder|DIV|ALT_INV_F2M~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Coder|Form_buffer|buffer_temp_2\(2));

\Coder|Word_test|OUT_WORD~9\ : flex10ke_lcell
-- Equation(s):
-- \Coder|Word_test|OUT_WORD~9_combout\ = \Coder|Form_buffer|buffer_temp_2\(1) $ \Coder|Form_buffer|buffer_temp_2\(0)

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "0ff0",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	datac => \Coder|Form_buffer|buffer_temp_2\(1),
	datad => \Coder|Form_buffer|buffer_temp_2\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Coder|Word_test|OUT_WORD~9_combout\);

\Coder|Form_word|OUT_WORD~0\ : flex10ke_lcell
-- Equation(s):
-- \Coder|Form_word|OUT_WORD~0_combout\ = \Coder|Form_buffer|buffer_temp_1\(1) $ \Coder|Form_buffer|buffer_temp_1\(0)

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "0ff0",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	datac => \Coder|Form_buffer|buffer_temp_1\(1),
	datad => \Coder|Form_buffer|buffer_temp_1\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Coder|Form_word|OUT_WORD~0_combout\);

\Coder|Word_test|temp_buffer[1]\ : flex10ke_lcell
-- Equation(s):
-- \Coder|Word_test|temp_buffer\(1) = DFFEA(\Coder|DIV|F2M~regout\, !GLOBAL(\CLK~dataout\), , , \Coder|Word_test|temp_buffer[0]~2_combout\, , )

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "true",
	lut_mask => "ff00",
	operation_mode => "normal",
	output_mode => "reg_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \Coder|Word_test|temp_buffer[0]~2_combout\,
	datad => \Coder|DIV|F2M~regout\,
	clk => \ALT_INV_CLK~dataout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Coder|Word_test|temp_buffer\(1));

\Coder|Word_test|temp_buffer[0]\ : flex10ke_lcell
-- Equation(s):
-- \Coder|Word_test|temp_buffer\(0) = DFFEA(\Coder|Word_test|temp_buffer\(1), !GLOBAL(\CLK~dataout\), , , \Coder|Word_test|temp_buffer[0]~2_combout\, , )

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "true",
	lut_mask => "ff00",
	operation_mode => "normal",
	output_mode => "reg_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \Coder|Word_test|temp_buffer[0]~2_combout\,
	datad => \Coder|Word_test|temp_buffer\(1),
	clk => \ALT_INV_CLK~dataout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Coder|Word_test|temp_buffer\(0));

\Coder|Word_test|inner_f2m\ : flex10ke_lcell
-- Equation(s):
-- \Coder|Word_test|inner_f2m~regout\ = DFFEA(\Coder|Word_test|temp_buffer\(0), !GLOBAL(\CLK~dataout\), !GLOBAL(\RES_COD~dataout\), , , , )

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "ff00",
	operation_mode => "normal",
	output_mode => "reg_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	datad => \Coder|Word_test|temp_buffer\(0),
	aclr => \RES_COD~dataout\,
	clk => \ALT_INV_CLK~dataout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Coder|Word_test|inner_f2m~regout\);

\Coder|Word_test|OUT_WORD[0]\ : flex10ke_lcell
-- Equation(s):
-- \Coder|Word_test|OUT_WORD\(0) = DFFEA(\Coder|Form_word|Equal0~0_combout\ $ (\Coder|DIV|number~regout\ & !\Coder|Word_test|OUT_WORD~9_combout\ # !\Coder|DIV|number~regout\ & (!\Coder|Form_word|OUT_WORD~0_combout\)), \Coder|Word_test|inner_f2m~regout\, 
-- !GLOBAL(\RES_COD~dataout\), , , , )

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "99a5",
	operation_mode => "normal",
	output_mode => "reg_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \Coder|Form_word|Equal0~0_combout\,
	datab => \Coder|Word_test|OUT_WORD~9_combout\,
	datac => \Coder|Form_word|OUT_WORD~0_combout\,
	datad => \Coder|DIV|number~regout\,
	aclr => \RES_COD~dataout\,
	clk => \Coder|Word_test|inner_f2m~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Coder|Word_test|OUT_WORD\(0));

\Coder|Form_word|OUT_WORD~3\ : flex10ke_lcell
-- Equation(s):
-- \Coder|Form_word|OUT_WORD~3_combout\ = \Coder|Form_buffer|buffer_temp_1\(2) $ \Coder|Form_buffer|buffer_temp_1\(0)

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "0ff0",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	datac => \Coder|Form_buffer|buffer_temp_1\(2),
	datad => \Coder|Form_buffer|buffer_temp_1\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Coder|Form_word|OUT_WORD~3_combout\);

\Coder|Word_test|OUT_WORD~22\ : flex10ke_lcell
-- Equation(s):
-- \Coder|Word_test|OUT_WORD~22_combout\ = \Coder|DIV|number~regout\ & (\Coder|Form_buffer|buffer_temp_2\(2) $ \Coder|Form_buffer|buffer_temp_2\(0)) # !\Coder|DIV|number~regout\ & (\Coder|Form_word|OUT_WORD~3_combout\)

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "6f60",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \Coder|Form_buffer|buffer_temp_2\(2),
	datab => \Coder|Form_buffer|buffer_temp_2\(0),
	datac => \Coder|DIV|number~regout\,
	datad => \Coder|Form_word|OUT_WORD~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Coder|Word_test|OUT_WORD~22_combout\);

\Coder|Word_test|OUT_WORD[1]\ : flex10ke_lcell
-- Equation(s):
-- \Coder|Word_test|OUT_WORD\(1) = DFFEA(\Coder|Word_test|OUT_WORD~22_combout\ $ (\ERROR_WORD~dataout\(1) & !\ERROR_WORD~dataout\(0)), \Coder|Word_test|inner_f2m~regout\, !GLOBAL(\RES_COD~dataout\), , , , )

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "f30c",
	operation_mode => "normal",
	output_mode => "reg_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	datab => \ERROR_WORD~dataout\(1),
	datac => \ERROR_WORD~dataout\(0),
	datad => \Coder|Word_test|OUT_WORD~22_combout\,
	aclr => \RES_COD~dataout\,
	clk => \Coder|Word_test|inner_f2m~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Coder|Word_test|OUT_WORD\(1));

\Coder|Form_word|OUT_WORD~8\ : flex10ke_lcell
-- Equation(s):
-- \Coder|Form_word|OUT_WORD~8_combout\ = \Coder|Form_buffer|buffer_temp_1\(2) $ \Coder|Form_buffer|buffer_temp_1\(1)

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "0ff0",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	datac => \Coder|Form_buffer|buffer_temp_1\(2),
	datad => \Coder|Form_buffer|buffer_temp_1\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Coder|Form_word|OUT_WORD~8_combout\);

\Coder|Word_test|OUT_WORD~24\ : flex10ke_lcell
-- Equation(s):
-- \Coder|Word_test|OUT_WORD~24_combout\ = \Coder|DIV|number~regout\ & (\Coder|Form_buffer|buffer_temp_2\(2) $ \Coder|Form_buffer|buffer_temp_2\(1)) # !\Coder|DIV|number~regout\ & (\Coder|Form_word|OUT_WORD~8_combout\)

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "6f60",
	operation_mode => "normal",
	output_mode => "comb_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \Coder|Form_buffer|buffer_temp_2\(2),
	datab => \Coder|Form_buffer|buffer_temp_2\(1),
	datac => \Coder|DIV|number~regout\,
	datad => \Coder|Form_word|OUT_WORD~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	combout => \Coder|Word_test|OUT_WORD~24_combout\);

\Coder|Word_test|OUT_WORD[2]\ : flex10ke_lcell
-- Equation(s):
-- \Coder|Word_test|OUT_WORD\(2) = DFFEA(\Coder|Word_test|OUT_WORD~24_combout\ $ (!\ERROR_WORD~dataout\(1) # !\ERROR_WORD~dataout\(0)), \Coder|Word_test|inner_f2m~regout\, !GLOBAL(\RES_COD~dataout\), , , , )

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "c03f",
	operation_mode => "normal",
	output_mode => "reg_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	datab => \ERROR_WORD~dataout\(0),
	datac => \ERROR_WORD~dataout\(1),
	datad => \Coder|Word_test|OUT_WORD~24_combout\,
	aclr => \RES_COD~dataout\,
	clk => \Coder|Word_test|inner_f2m~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \Coder|Word_test|OUT_WORD\(2));

\DEecoder|READ_WORD|SYNC\ : flex10ke_lcell
-- Equation(s):
-- \DEecoder|READ_WORD|SYNC~regout\ = DFFEA(\DEecoder|READ_WORD|count_status\(0) & \DEecoder|READ_WORD|count_status\(1) & \DEecoder|READ_WORD|count_status\(2), GLOBAL(\CLK~dataout\), !GLOBAL(\RES_DEC~dataout\), , \DEecoder|READ_WORD|sync_inner~regout\, , )

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "true",
	lut_mask => "c000",
	operation_mode => "normal",
	output_mode => "reg_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \DEecoder|READ_WORD|sync_inner~regout\,
	datab => \DEecoder|READ_WORD|count_status\(0),
	datac => \DEecoder|READ_WORD|count_status\(1),
	datad => \DEecoder|READ_WORD|count_status\(2),
	aclr => \RES_DEC~dataout\,
	clk => \CLK~dataout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \DEecoder|READ_WORD|SYNC~regout\);

\DEecoder|DIV|counter[0]\ : flex10ke_lcell
-- Equation(s):
-- \DEecoder|DIV|counter\(0) = DFFEA(!\DEecoder|DIV|counter\(0), GLOBAL(\CLK~dataout\), !GLOBAL(\RES_DEC~dataout\), , , , )

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "00ff",
	operation_mode => "normal",
	output_mode => "reg_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	datad => \DEecoder|DIV|counter\(0),
	aclr => \RES_DEC~dataout\,
	clk => \CLK~dataout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \DEecoder|DIV|counter\(0));

\DEecoder|DIV|counter[1]\ : flex10ke_lcell
-- Equation(s):
-- \DEecoder|DIV|counter\(1) = DFFEA(\DEecoder|DIV|counter\(0) $ \DEecoder|DIV|counter\(1), GLOBAL(\CLK~dataout\), !GLOBAL(\RES_DEC~dataout\), , , , )

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "0ff0",
	operation_mode => "normal",
	output_mode => "reg_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	datac => \DEecoder|DIV|counter\(0),
	datad => \DEecoder|DIV|counter\(1),
	aclr => \RES_DEC~dataout\,
	clk => \CLK~dataout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \DEecoder|DIV|counter\(1));

\DEecoder|DIV|counter[2]\ : flex10ke_lcell
-- Equation(s):
-- \DEecoder|DIV|counter\(2) = DFFEA(\DEecoder|DIV|counter\(2) $ (\DEecoder|DIV|counter\(0) & \DEecoder|DIV|counter\(1)), GLOBAL(\CLK~dataout\), !GLOBAL(\RES_DEC~dataout\), , , , )

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "3fc0",
	operation_mode => "normal",
	output_mode => "reg_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	datab => \DEecoder|DIV|counter\(0),
	datac => \DEecoder|DIV|counter\(1),
	datad => \DEecoder|DIV|counter\(2),
	aclr => \RES_DEC~dataout\,
	clk => \CLK~dataout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \DEecoder|DIV|counter\(2));

\DEecoder|DIV|F2M\ : flex10ke_lcell
-- Equation(s):
-- \DEecoder|DIV|F2M~regout\ = DFFEA(\DEecoder|DIV|counter\(0) & (\DEecoder|DIV|counter\(1) & !\DEecoder|DIV|counter\(2) # !\DEecoder|DIV|counter\(1) & (\DEecoder|DIV|F2M~regout\)) # !\DEecoder|DIV|counter\(0) & (\DEecoder|DIV|F2M~regout\), 
-- GLOBAL(\CLK~dataout\), !GLOBAL(\RES_DEC~dataout\), , , , )

-- pragma translate_off
GENERIC MAP (
	clock_enable_mode => "false",
	lut_mask => "7f40",
	operation_mode => "normal",
	output_mode => "reg_only",
	packed_mode => "false")
-- pragma translate_on
PORT MAP (
	dataa => \DEecoder|DIV|counter\(2),
	datab => \DEecoder|DIV|counter\(0),
	datac => \DEecoder|DIV|counter\(1),
	datad => \DEecoder|DIV|F2M~regout\,
	aclr => \RES_DEC~dataout\,
	clk => \CLK~dataout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \DEecoder|DIV|F2M~regout\);

\DECODER_INPUT_WORD[0]~I\ : flex10ke_io
-- pragma translate_off
GENERIC MAP (
	feedback_mode => "none",
	operation_mode => "output",
	reg_source_mode => "none")
-- pragma translate_on
PORT MAP (
	datain => \DEecoder|READ_WORD|OUT_WORD\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	ena => VCC,
	padio => ww_DECODER_INPUT_WORD(0));

\DECODER_INPUT_WORD[1]~I\ : flex10ke_io
-- pragma translate_off
GENERIC MAP (
	feedback_mode => "none",
	operation_mode => "output",
	reg_source_mode => "none")
-- pragma translate_on
PORT MAP (
	datain => \DEecoder|READ_WORD|OUT_WORD\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	ena => VCC,
	padio => ww_DECODER_INPUT_WORD(1));

\DECODER_INPUT_WORD[2]~I\ : flex10ke_io
-- pragma translate_off
GENERIC MAP (
	feedback_mode => "none",
	operation_mode => "output",
	reg_source_mode => "none")
-- pragma translate_on
PORT MAP (
	datain => \DEecoder|READ_WORD|OUT_WORD\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	ena => VCC,
	padio => ww_DECODER_INPUT_WORD(2));

\DECODER_OUT_COUNT[0]~I\ : flex10ke_io
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
	padio => ww_DECODER_OUT_COUNT(0));

\DECODER_OUT_COUNT[1]~I\ : flex10ke_io
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
	padio => ww_DECODER_OUT_COUNT(1));

\TEST_CODER_STEP[0]~I\ : flex10ke_io
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
	padio => ww_TEST_CODER_STEP(0));

\TEST_CODER_STEP[1]~I\ : flex10ke_io
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
	padio => ww_TEST_CODER_STEP(1));

\TEST_CODER_STEP[2]~I\ : flex10ke_io
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
	padio => ww_TEST_CODER_STEP(2));

\TEST_CODER_F2M~I\ : flex10ke_io
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
	padio => ww_TEST_CODER_F2M);

\TEST_CODER_BUFFER_1[0]~I\ : flex10ke_io
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
	padio => ww_TEST_CODER_BUFFER_1(0));

\TEST_CODER_BUFFER_1[1]~I\ : flex10ke_io
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
	padio => ww_TEST_CODER_BUFFER_1(1));

\TEST_CODER_BUFFER_1[2]~I\ : flex10ke_io
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
	padio => ww_TEST_CODER_BUFFER_1(2));

\TEST_CODER_BUFFER_2[0]~I\ : flex10ke_io
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
	padio => ww_TEST_CODER_BUFFER_2(0));

\TEST_CODER_BUFFER_2[1]~I\ : flex10ke_io
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
	padio => ww_TEST_CODER_BUFFER_2(1));

\TEST_CODER_BUFFER_2[2]~I\ : flex10ke_io
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
	padio => ww_TEST_CODER_BUFFER_2(2));

\TEST_CODER_NUMBER_BUFFER~I\ : flex10ke_io
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
	padio => ww_TEST_CODER_NUMBER_BUFFER);

\TEST_CODER_OUTPUT~I\ : flex10ke_io
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
	padio => ww_TEST_CODER_OUTPUT);

\TEST_CODER_WORD[0]~I\ : flex10ke_io
-- pragma translate_off
GENERIC MAP (
	feedback_mode => "none",
	operation_mode => "output",
	reg_source_mode => "none")
-- pragma translate_on
PORT MAP (
	datain => \Coder|Word_test|ALT_INV_OUT_WORD\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	ena => VCC,
	padio => ww_TEST_CODER_WORD(0));

\TEST_CODER_WORD[1]~I\ : flex10ke_io
-- pragma translate_off
GENERIC MAP (
	feedback_mode => "none",
	operation_mode => "output",
	reg_source_mode => "none")
-- pragma translate_on
PORT MAP (
	datain => \Coder|Word_test|OUT_WORD\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	ena => VCC,
	padio => ww_TEST_CODER_WORD(1));

\TEST_CODER_WORD[2]~I\ : flex10ke_io
-- pragma translate_off
GENERIC MAP (
	feedback_mode => "none",
	operation_mode => "output",
	reg_source_mode => "none")
-- pragma translate_on
PORT MAP (
	datain => \Coder|Word_test|ALT_INV_OUT_WORD\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	ena => VCC,
	padio => ww_TEST_CODER_WORD(2));

\TEST_CODER[0]~I\ : flex10ke_io
-- pragma translate_off
GENERIC MAP (
	feedback_mode => "none",
	operation_mode => "output",
	reg_source_mode => "none")
-- pragma translate_on
PORT MAP (
	datain => \Coder|Word_test|inner_f2m~regout\,
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
	datain => GND,
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
	datain => GND,
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
	datain => GND,
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
	datain => GND,
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
	datain => GND,
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
	datain => GND,
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
	datain => GND,
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
	datain => GND,
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
	datain => GND,
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
	datain => GND,
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
	datain => GND,
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

\TEST_DECODER_VALUE~I\ : flex10ke_io
-- pragma translate_off
GENERIC MAP (
	feedback_mode => "none",
	operation_mode => "output",
	reg_source_mode => "none")
-- pragma translate_on
PORT MAP (
	datain => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	ena => VCC,
	padio => ww_TEST_DECODER_VALUE);

\TEST_DECODER_NUMBER_PART[0]~I\ : flex10ke_io
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
	padio => ww_TEST_DECODER_NUMBER_PART(0));

\TEST_DECODER_NUMBER_PART[1]~I\ : flex10ke_io
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
	padio => ww_TEST_DECODER_NUMBER_PART(1));

\TEST_DECODER_NUMBER_PART[2]~I\ : flex10ke_io
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
	padio => ww_TEST_DECODER_NUMBER_PART(2));

\TEST_DECODER_SYNC~I\ : flex10ke_io
-- pragma translate_off
GENERIC MAP (
	feedback_mode => "none",
	operation_mode => "output",
	reg_source_mode => "none")
-- pragma translate_on
PORT MAP (
	datain => \DEecoder|READ_WORD|SYNC~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	ena => VCC,
	padio => ww_TEST_DECODER_SYNC);

\TEST_DECODER[0]~I\ : flex10ke_io
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
	datain => \DEecoder|DIV|F2M~regout\,
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



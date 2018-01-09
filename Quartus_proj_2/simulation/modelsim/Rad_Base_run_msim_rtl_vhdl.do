transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {E:/Project/SWork/SW_rad_vhdl/Quartus_proj_2/Decoder_Read_Word.vhd}
vcom -93 -work work {E:/Project/SWork/SW_rad_vhdl/Base_step_count.vhd}
vcom -93 -work work {E:/Project/SWork/SW_rad_vhdl/Div_F2M.vhd}
vcom -93 -work work {E:/Project/SWork/SW_rad_vhdl/Form_buffer.vhd}
vcom -93 -work work {E:/Project/SWork/SW_rad_vhdl/Form_word.vhd}
vcom -93 -work work {E:/Project/SWork/SW_rad_vhdl/SW_Count_Coder.vhd}
vcom -93 -work work {E:/Project/SWork/SW_rad_vhdl/SW_Count_Decoder.vhd}
vcom -93 -work work {E:/Project/SWork/SW_rad_vhdl/Base_SW_Rad.vhd}

vcom -93 -work work {E:/Project/SWork/SW_rad_vhdl/Quartus_proj_2/simulation/modelsim/Base_SW_Rad.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L flex10ke -L rtl_work -L work -voptargs="+acc" Base_SW_Rad_vhd_tst

add wave *
view structure
view signals
run 100 ms

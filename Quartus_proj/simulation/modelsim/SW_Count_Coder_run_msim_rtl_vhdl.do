transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {E:/Project/SWork/SW_rad_vhdl/Div_F2M.vhd}
vcom -93 -work work {E:/Project/SWork/SW_rad_vhdl/SW_Count_Coder.vhd}

vcom -93 -work work {E:/Project/SWork/SW_rad_vhdl/Quartus_proj/simulation/modelsim/SW_Count_Coder.vht}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L flex10ke -L rtl_work -L work -voptargs="+acc" SW_Count_Coder_vhd_tst

add wave *
view structure
view signals
run 200 ms

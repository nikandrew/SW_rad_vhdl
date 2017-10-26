transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vcom -93 -work work {SW_Count_Coder.vho}

vcom -93 -work work {E:/Project/SWork/SW_rad_git/Quartus_proj/simulation/modelsim/SW_Count_Coder.vht}

vsim -t 1ps +transport_int_delays +transport_path_delays -sdftyp /i1=SW_Count_Coder_vhd.sdo -L flex10ke -L gate_work -L work -voptargs="+acc" SW_Count_Coder_vhd_tst

add wave *
view structure
view signals
run 200 ms

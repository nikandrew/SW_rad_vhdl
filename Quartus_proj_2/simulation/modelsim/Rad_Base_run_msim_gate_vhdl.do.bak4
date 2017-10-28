transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vcom -93 -work work {Rad_Base.vho}

vcom -93 -work work {E:/Project/SWork/SW_rad_git/Quartus_proj_2/simulation/modelsim/Base_SW_Rad.vht}

vsim -t 1ps +transport_int_delays +transport_path_delays -sdftyp /i1=Rad_Base_vhd.sdo -L flex10ke -L gate_work -L work -voptargs="+acc" Base_SW_Rad_vhd_tst

add wave *
view structure
view signals
run 100 ms

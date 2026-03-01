vlib work

vlog ../rtl/shift_register/sipo.v
vlog ../tb/sipo_tb.v

vsim work.sipo_tb

add wave -r /sipo_tb/*
run -all

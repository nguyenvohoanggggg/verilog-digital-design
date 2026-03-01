vlib work

vlog ../rtl/shift_register/pipo.v
vlog ../tb/pipo)tb.v

vsim work.pipo_tb

add wave -r /pipo_tb/*
run -all

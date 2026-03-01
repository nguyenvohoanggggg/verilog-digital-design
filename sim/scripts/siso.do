vlib work

vlog ../rtl/shift_register/siso.v
vlog ../tb/siso_tb.v

vsim work.siso_tb

add wave -r /siso_tb/*
run -all

vlib work

vlog ../rtl/flip_flop/t_ff.v
vlog ../tb/t_ff_tb.v

vsim work.t_ff_tb

add wave -r /t_ff_tb/*
run -all

vlib work

vlog ../rtl/flip_flop/d_ff.v
vlog ../tb/d_ff_tb.v

vsim work.d_ff_tb

add wave -r /d_ff_tb/*
run -all

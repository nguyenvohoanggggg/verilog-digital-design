vlib work

vlog ../rtl/flip_flop/jk_ff.v
vlog ../tb/jk_ff_tb.v

vsim work.jk_ff_tb

add wave -r /jk_ff_tb/*
run -all

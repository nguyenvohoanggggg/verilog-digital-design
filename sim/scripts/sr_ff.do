vlib work

vlog ../rtl/flip_flop/sr_ff.v
vlog ../tb/sr_ff_tb.v

vsim work.sr_ff_tb

add wave -r /sr_ff_tb/*
run -all

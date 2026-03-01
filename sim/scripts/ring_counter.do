vlib work

vlog ../rtl/counter/ring_counter.v
vlog ../tb/ring_counter_tb.v

vsim work.ring_counter_tb

add wave -r /ring_counter_tb/*
run -all

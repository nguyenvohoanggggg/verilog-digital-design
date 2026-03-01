vlib work

vlog ../rtl/counter/johnson_counter.v
vlog ../tb/johnson_counter_tb.v

vsim work.johnson_counter_tb

add wave -r /johnson_counter_tb/*
run -all

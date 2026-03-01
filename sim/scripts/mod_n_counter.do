vlib work

vlog ../rtl/counter/mod_n_counter.v
vlog ../tb/mod_n_counter_tb.v

vsim work.mod_n_counter_tb

add wave -r /mod_n_counter_tb/*
run -all

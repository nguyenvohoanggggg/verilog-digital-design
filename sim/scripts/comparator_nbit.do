vlib work

vlog ../rtl/comparator/comparator_nbit.v
vlog ../tb/comparator_nbit_tb.v

vsim work.comparator_nbit_tb

add wave -r /comparator_nbit_tb/*
run -all

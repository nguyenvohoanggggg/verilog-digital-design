vlib work

vlog ../rtl/comparator/comparator.v
vlog ../tb/comparator_tb.v

vsim work.comparator_tb

add wave -r /comparator_tb/*
run -all

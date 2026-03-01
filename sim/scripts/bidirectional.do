vlib work

vlog ../rtl/shift_register/bidirectional.v
vlog ../tb/bidirectional_tb.v

vsim work.bidirectional_tb

add wave -r /bidirectional_tb/*
run -all

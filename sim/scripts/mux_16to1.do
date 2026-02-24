vlib work

vlog ../rtl/multiplexer/mux_16to1.v
vlog ../tb/mux_16to1_tb.v

vsim work.mux_16to1_tb

add wave -r /mux_16to1_tb/*
run -all

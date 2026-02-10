vlib work

vlog ../rtl/multiplexer/mux_8to1.v
vlog ../tb/mux_8to1_tb.v

vsim work.mux_8to1_tb

add wave -r /mux_8to1_tb/*
run -all

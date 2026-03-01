vlib work

vlog ../rtl/multiplexer/mux_nbit.v
vlog ../tb/mux_nbit_tb.v

vsim work.mux_nbit_tb

add wave -r /mux_nbit_tb/*
run -all

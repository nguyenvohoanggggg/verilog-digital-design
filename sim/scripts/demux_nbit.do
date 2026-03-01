vlib work

vlog ../rtl/demultiplexer/demux_nbit.v
vlog ../tb/demux_nbit_tb.v

vsim work.demux_nbit_tb

add wave -r /demux_nbit_tb/*
run -all
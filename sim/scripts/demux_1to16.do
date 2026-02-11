vlib work

vlog ../rtl/demultiplexer/demux_1to16.v
vlog ../tb/demux_1to16_tb.v 

vsim work.demux_1to16_tb

add wave -r /demux_1to16_tb/*
run -all
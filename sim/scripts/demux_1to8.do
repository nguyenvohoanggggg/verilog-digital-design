vlib work

vlog ../rtl/demultiplexer/demux_1to8.v
vlog ../tb/demux_1to8_tb.v 

vsim work.demux_1to8_tb

add wave -r /demux_1to8_tb/*
run -all
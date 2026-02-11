vlib work

vlog ../rtl/demultiplexer/demux_1to8_en.v
vlog ../tb/demux_1to8_en_tb.v 

vsim work.demux_1to8_en_tb

add wave -r /demux_1to8_en_tb/*
run -all
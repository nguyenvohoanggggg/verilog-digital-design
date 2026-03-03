vlib work

vlog ../rtl/decoder/dec_2to4.v
vlog ../tb/dec_2to4_tb.v

vsim work.dec_2to4_tb

add wave -r /dec_2to4_tb/*
run -all

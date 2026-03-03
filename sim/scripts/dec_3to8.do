vlib work

vlog ../rtl/decoder/dec_3to8.v
vlog ../tb/dec_3to8_tb.v

vsim work.dec_3to8_tb

add wave -r /dec_3to8_tb/*
run -all

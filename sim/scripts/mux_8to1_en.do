vlib work

vlog ../rtl/multiplexer/mux_8to1_en.v
vlog ../tb/mux_8to1_en_tb.v

vsim work.mux_8to1_en_tb

add wave -r /mux_8to1_en_tb/*
run -all

vlib work

vlog ../rtl/encoder/priority_encoder_8to3.v
vlog ../tb/priority_encoder_8to3_tb.v

vsim work.priority_encoder_8to3_tb

add wave -r /priority_encoder_8to3_tb/*
run -all

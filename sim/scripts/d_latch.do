vlib work

vlog ../rtl/latch/d_latch.v
vlog ../tb/d_latch_tb.v

vsim work.d_latch_tb

add wave -r /d_latch_tb/*
run -all

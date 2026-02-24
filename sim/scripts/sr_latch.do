vlib work

vlog ../rtl/latch/sr_latch.v
vlog ../tb/sr_latch_tb.v

vsim work.sr_latch_tb

add wave -r /sr_latch_tb/*
run -all

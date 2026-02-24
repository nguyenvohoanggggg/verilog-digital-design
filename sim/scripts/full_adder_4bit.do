vlib work

vlog ../rtl/adder/full_adder_4bit.v
vlog ../tb/full_adder_4bit_tb.v

vsim work.full_adder_4bit_tb

add wave -r /full_adder_4bit_tb/dut/*
run -all

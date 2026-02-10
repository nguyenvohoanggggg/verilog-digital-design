vlib work

vlog ../rtl/adder/full_adder.v
vlog ../tb/full_adder_tb.v

vsim work.full_adder_tb
add wave -r /full_adder_tb/dut/*
run -all

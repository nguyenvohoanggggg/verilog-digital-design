vlib work

vlog src/adder/Full_adder.v
vlog tb/Full_adder_tb.v

vsim work.full_adder_tb
add wave -r /full_adder_tb/dut/*
run -all

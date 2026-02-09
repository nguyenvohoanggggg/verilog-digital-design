vlib work
vlog src/adder/Half_adder.v
vlog tb/Half_adder_tb.v

vsim work.half_adder_tb
add wave -r /half_adder_tb/dut/*
run -all

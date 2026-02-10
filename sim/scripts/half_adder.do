vlib work
vlog ../rtl/adder/half_adder.v
vlog ../tb/half_adder_tb.v

vsim work.half_adder_tb
add wave -r /half_adder_tb/dut/*
run -all

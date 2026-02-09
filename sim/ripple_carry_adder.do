vlib work
vlog ../src/ripple_carry_adder/ripple_carry_adder.v
vlog ../tb/ripple_carry_adder_tb.v

vsim work.ripple_carry_adder_tb
add wave -r /ripple_carry_adder_tb/dut/*
run -all

vlib work

vlog ../rtl/adder/full_adder.v
vlog ../rtl/adder/ripple_carry_adder.v
vlog ../tb/ripple_carry_adder_tb.v

vsim work.ripple_carry_adder_tb

add wave -divider "TESTBENCH"
add wave /ripple_carry_adder_tb/a
add wave /ripple_carry_adder_tb/b
add wave /ripple_carry_adder_tb/cin
add wave /ripple_carry_adder_tb/expected


add wave -divider "DUT OUTPUT"
add wave /ripple_carry_adder_tb/sum
add wave /ripple_carry_adder_tb/cout


add wave -divider "INTERNAL CARRY"
add wave /ripple_carry_adder_tb/dut/w

run -all

# Tool ModelSim
VSIM = vsim

#  Default 
help:
	@echo "Targets:"
	@echo "  make wave-full_adder"
	@echo "  make wave-half_adder"
	@echo "  make wave-ripple_carry_adder"
	@echo "  make clean"

# Wave 
wave-full_adder:
	$(VSIM) -do sim/full_adder.do

wave-half_adder:
	$(VSIM) -do sim/half_adder.do

wave-ripple_carry_adder:
	$(VSIM) -do sim/ripple_carry_adder.do

clean:
	rm -rf work transcript vsim.wlf

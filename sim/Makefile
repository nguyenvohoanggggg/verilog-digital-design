# Tool ModelSim
VSIM = vsim

#  Default 
help:
	@echo "Targets:"
	@echo "  make wave-full_adder"
	@echo "  make wave-half_adder"
	@echo "  make wave-ripple_carry_adder"
	@echo "  make wave-mux_8to1"
	@echo "  make clean"

# Wave 
wave-full_adder:
	$(VSIM) -do scripts/full_adder.do

wave-half_adder:
	$(VSIM) -do scripts/half_adder.do

wave-ripple_carry_adder:
	$(VSIM) -do scripts/ripple_carry_adder.do
wave-mux_8to1:
	$(VSIM) -do scripts/mux_8to1.do

clean:
	rm -rf work transcript vsim.wlf

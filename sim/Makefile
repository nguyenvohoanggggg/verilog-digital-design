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

wave-full_adder_4bit:
	$(VSIM) -do scripts/full_adder_4bit.do

wave-mux_8to1:
	$(VSIM) -do scripts/mux_8to1.do

wave-mux_16to1:
	$(VSIM) -do scripts/mux_16to1.do

wave-mux_8to1_en:
	$(VSIM) -do scripts/mux_8to1_en.do

wave-demux_1to8:
	$(VSIM) -do scripts/demux_1to8.do

wave-demux_1to8_en:
	$(VSIM) -do scripts/demux_1to8_en.do

wave-demux_1to16:
	$(VSIM) -do scripts/demux_1to16.do

wave-d_ff:
	$(VSIM) -do scripts/d_ff.do

wave-d_latch:
	$(VSIM) -do scripts/d_latch.do

wave-jk_ff:
	$(VSIM) -do scripts/jk_ff.do

wave-t_ff:
	$(VSIM) -do scripts/t_ff.do

wave-sr_latch:
	$(VSIM) -do scripts/sr_latch.do

wave-sr_ff:
	$(VSIM) -do scripts/sr_ff.do

wave-mod_n_counter:
	$(VSIM) -do scripts/mod_n_counter.do

wave-johnson_counter:
	$(VSIM) -do scripts/johnson_counter.do

wave-ring_counter:
	$(VSIM) -do scripts/ring_counter.do

clean:
	rm -rf work transcript vsim.wlf

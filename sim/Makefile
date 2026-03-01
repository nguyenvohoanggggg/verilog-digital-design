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

wave-mux_nbit:
	$(VSIM) -do scripts/mux_nbit.do

wave-demux_1to8:
	$(VSIM) -do scripts/demux_1to8.do

wave-demux_1to8_en:
	$(VSIM) -do scripts/demux_1to8_en.do

wave-demux_1to16:
	$(VSIM) -do scripts/demux_1to16.do

wave-demux_nbit:
	$(VSIM) -do scripts/demux_nbit.do

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

wave-pipo:
	$(VSIM) -do scripts/pipo.do

wave-piso:
	$(VSIM) -do scripts/piso.do

wave-sipo:
	$(VSIM) -do scripts/sipo.do

wave-siso:
	$(VSIM) -do scripts/siso.do

wave-bidirectional:
	$(VSIM) -do scripts/bidirectional.do

wave-comparator:
	$(VSIM) -do scripts/comparator.do

wave-comparator_nbit:
	$(VSIM) -do scripts/comparator_nbit.do

wave-decoder_2to4:
	$(VSIM) -do scripts/dec_2to4.do

wave-decoder_3to8:
	$(VSIM) -do scripts/dec_3to8.do

clean:
	rm -rf work transcript vsim.wlf

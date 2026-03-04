# Verilog Basic RTL Designs

A collection of **fundamental digital logic modules implemented in Verilog/SystemVerilog**, created for practicing **RTL design, simulation, and verification**.

The repository focuses on implementing core digital building blocks and validating their functionality using **ModelSim simulation**.

---

## Simulation Tool

Simulation is performed using **ModelSim FPGA Standard Edition**.

> [Download ModelSim FPGA Standard Edition (v20.1.1)](https://www.altera.com/downloads/simulation-tools/modelsim-fpgas-standard-edition-software-version-20-1-1)


Compatible tools:

* ModelSim
* QuestaSim
* GTKWave (for `.vcd` waveform viewing)

---

# Project Structure

The repository follows a structured layout separating **RTL design**, **testbench**, and **simulation flow**.

```
verilog-basic
│
├ rtl/           # Synthesizable RTL modules
├ tb/            # Testbench files
├ sim/           # Simulation scripts / Makefile
├ docs/          # Documentation and waveform images
│   └ images/
│
└ README.md
```

---

# Module Summary

| Module           | Category      | Description                     |
| ---------------- | ------------- | ------------------------------- |
| half_adder       | Combinational | 1-bit binary addition           |
| full_adder       | Combinational | Full adder with carry           |
| comparator       | Combinational | Magnitude comparator            |
| mux              | Combinational | Multiplexer circuits            |
| demux            | Combinational | Demultiplexer circuits          |
| priority_encoder | Combinational | Priority-based encoding         |
| decoder          | Combinational | Binary decoder                  |
| d_latch          | Sequential    | Level-sensitive storage element |
| sr_latch         | Sequential    | Basic memory latch              |
| d_ff             | Sequential    | Edge-triggered flip-flop        |
| jk_ff            | Sequential    | JK flip-flop                    |
| t_ff             | Sequential    | Toggle flip-flop                |
| shift_registers  | Sequential    | Serial/parallel shift registers |
| ring_counter     | Counter       | One-hot circular counter        |
| johnson_counter  | Counter       | Twisted ring counter            |
| mod_n_counter    | Counter       | Parameterized counter           |

---

# Implemented Modules

## Combinational Circuits

### Half Adder

A basic combinational circuit that performs the addition of two 1-bit inputs.

* Inputs: `A`, `B`
* Outputs: `Sum`, `Carry`

Logic

```
Sum   = A ^ B
Carry = A & B
```

---

### Full Adder

A combinational circuit that adds two bits and a carry input.

* Inputs: `A`, `B`, `Cin`
* Outputs: `Sum`, `Cout`

Used as the building block for multi-bit adders.

---

### Comparator

Compares two input values and determines their relationship.

Outputs indicate:

* greater than
* equal
* less than

Both **1-bit** and **parameterized N-bit versions** are implemented.

---

### Multiplexers

Implemented designs:

* **8-to-1 multiplexer**
* **16-to-1 multiplexer**
* **N-bit parameterized multiplexer**
* **8-to-1 multiplexer with enable**

Multiplexers select one of several inputs and route it to a single output based on a select signal.

---

### Demultiplexers

Implemented designs:

* **1-to-8 demultiplexer**
* **1-to-8 demultiplexer with enable**
* **1-to-16 demultiplexer**
* **parameterized N-bit demultiplexer**

A demultiplexer routes one input signal to one of many outputs.

---

### Priority Encoder (8-to-3)

Encodes the highest-priority active input into a binary output value.

Often used in **interrupt controllers and arbitration logic**.

---

### Decoders

Implemented designs:

* **2-to-4 decoder**
* **3-to-8 decoder**

A decoder converts binary input signals into **one-hot output lines**.

---

# Sequential Circuits

### D Latch

A level-sensitive storage element where the output follows the input when enable is active.

---

### SR Latch

A simple memory element built using **Set** and **Reset** inputs.

---

### D Flip-Flop

A clocked storage element that captures input data on the **rising edge of the clock**.

---

### JK Flip-Flop

A flip-flop that improves the SR latch by removing the invalid state.

When both inputs are high, the output toggles.

---

### T Flip-Flop

A toggle flip-flop where the output toggles on each clock cycle when the input is active.

---

# Shift Registers

Implemented designs:

* **SISO** — Serial In Serial Out
* **SIPO** — Serial In Parallel Out
* **PISO** — Parallel In Serial Out
* **PIPO** — Parallel In Parallel Out
* **Bidirectional Shift Register**

Shift registers are used for **data storage, serialization, and communication interfaces**.

---

# Counters

### Ring Counter

A circular shift register where a single '1' rotates through the register stages.

---

### Johnson Counter

A modified ring counter where the inverted output feeds back to the input.

Produces **twice the number of states** compared to a ring counter.

---

### Mod-N Counter

A counter that cycles through **N states** before resetting.

Commonly used for **clock division and timing generation**.

---

# Example Simulation Waveforms

Example simulation waveforms are shown below.
More waveform images are available in the `docs/` directory.

### Half Adder

### Full Adder

### Multiplexer

---

# Running Simulation

Prerequisites:

* ModelSim
* GNU Make

Run simulation:

```
cd sim

make wave-half_adder
make wave-full_adder
make wave-ripple_carry_adder
make wave-mux_8to1
```

Waveforms can be viewed using **ModelSim** or exported as `.vcd`.

---

# Tools

* Verilog / SystemVerilog
* ModelSim
* GTKWave
* GNU Make

---

# Future Work

Additional RTL modules planned for future updates:

* FIFO
* Arbiter
* Barrel shifter
* Clock divider
* CDC synchronizer
* Simple ALU

---

# Author

GitHub
https://github.com/vohoangnguyennnnn

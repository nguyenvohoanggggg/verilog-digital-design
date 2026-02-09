# Verilog Basic Designs
> **Simulation Tool**:  
> [Download ModelSim FPGA Standard Edition (v20.1.1)](https://www.altera.com/downloads/simulation-tools/modelsim-fpgas-standard-edition-software-version-20-1-1)


This repository contains my practice projects for **Verilog HDL and FPGA design**.
The focus is on implementing basic digital logic modules and verifying them
using **ModelSim** with an automated workflow.

---

## Implemented Modules

### Half Adder

A basic combinational circuit that adds two 1-bit inputs.

- Inputs: `A`, `B`
- Outputs: `Sum`, `Carry`
- Logic:
  - `Sum   = A ^ B`
  - `Carry = A & B`

**Simulation**

![Half Adder Simulation](docs/images/Half_adder_test.png)

### Full Adder

An extension of the Half Adder that includes a carry-in input.

- Inputs: `A`, `B`, `Cin`
- Outputs: `Sum`, `Carry`
- Logic:
  - `Sum   = A ^ B ^ Cin`
  - `Carry = (A & B) | (Cin & (A ^ B))`

**Simulation**

![Full Adder Simulation](docs/images/Full_adder_test.png)

## Bonus: Future Updates

Additional Verilog modules and simulation examples will be added in future updates.



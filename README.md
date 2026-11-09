# 4-Bit ALU Project

A small digital design project built with Verilog to explore basic logic-gate behavior and establish the foundation for a 4-bit arithmetic logic unit (ALU). The repository currently contains a minimal combinational circuit example: a 2-input AND gate and a corresponding testbench used to verify its behavior.

This project is intended as a learning-oriented HDL example and a starting point for expanding into a more complete 4-bit ALU that supports arithmetic and logical operations.

## Project Goals

- Learn the structure of Verilog HDL modules and testbenches
- Simulate digital logic behavior before hardware implementation
- Practice gate-level design and signal verification
- Build a foundation for a larger 4-bit ALU design

## Current Implementation

The current design implements a simple 2-input AND gate:

```verilog
module and_gate(
    input a,
    input b,
    output y
);
    assign y = a & b;
endmodule
```

This module takes two 1-bit inputs and drives a 1-bit output equal to their logical AND.

The matching testbench applies all valid input combinations and generates a VCD waveform dump for analysis:

```verilog
module and_tb;
    reg a, b;
    wire y;

    and_gate uut (.a(a), .b(b), .y(y));

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, and_tb);

        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;

        $finish;
    end
endmodule
```

## Truth Table

| A | B | Y = A & B |
|---|---|-----------|
| 0 | 0 | 0 |
| 0 | 1 | 0 |
| 1 | 0 | 0 |
| 1 | 1 | 1 |

This confirms the expected behavior of the AND gate and validates the logic design.

## Repository Structure

- `and_gate.v` — Verilog source for the AND gate
- `and_tb.v` — Testbench for exercising the design
- `dump.vcd` — Generated waveform output from simulation
- `sim_out` — Compiled simulation binary

## Prerequisites

To run the simulation, you need a Verilog simulator installed on your system.

A common choice is Icarus Verilog:

```bash
sudo apt update
sudo apt install iverilog
```

## How to Run

From the project root:

```bash
iverilog -o sim_out and_tb.v and_gate.v
vvp sim_out
```

This compiles the Verilog files and runs the testbench. The simulation produces `dump.vcd`, which can be opened in a waveform viewer such as GTKWave.

Example:

```bash
gtkwave dump.vcd
```

## What This Project Teaches

This small project helps build familiarity with:

- Verilog module definitions
- Input/output declarations
- Continuous assignments using `assign`
- Testbench structure and stimulus timing
- Simulation execution with VCD waveform output
- Digital logic verification workflow

## Roadmap Toward a Full 4-Bit ALU

The current design is intentionally simple. A full 4-bit ALU would typically include:

- 4-bit input operands (`A` and `B`)
- Control signals for operation selection
- Arithmetic operations such as add, subtract, increment, decrement
- Logical operations such as AND, OR, XOR, NOT
- Overflow and carry handling
- Output register or result bus

A typical ALU operation selector might look like this conceptually:

```text
ALU_OP | Function
------ | --------
0000   | A + B
0001   | A - B
0010   | A AND B
0011   | A OR B
0100   | A XOR B
0101   | NOT A
```

This repository can be extended gradually by implementing each operation as a separate Verilog module or as part of a larger behavioral design.

## Notes

This repository is best understood as a beginner-friendly Verilog project and a starting point for learning digital logic design. The code is intentionally minimal, readable, and easy to expand.

## Future Enhancements

Potential next steps include:

- Designing a true 4-bit adder
- Adding a subtraction capability using two's complement
- Implementing a 4-bit ALU control block
- Adding more logical operations
- Creating a complete testbench for all ALU instructions
- Visualizing waveforms for multiple operation modes

## License

This project is provided for educational purposes. No formal license has been specified unless you choose to add one for your own use.

## Summary

This project demonstrates a simple but important digital logic workflow: describe a circuit in Verilog, simulate it, verify its behavior, and use the result as a foundation for more complex systems such as a 4-bit ALU.

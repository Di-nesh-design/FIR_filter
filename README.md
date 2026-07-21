# FIR_filter
VLSI-oriented design and Verilog HDL implementation of a Finite Impulse Response (FIR) digital filter for DSP applications. Features a tapped-delay line architecture with parallel multiply-accumulate (MAC) units, functionally verified through simulation, designed for low-latency real-time signal processing on FPGA/ASIC platforms

#Project Overview
The design is optimized for FPGA implementation and modular signal processing tasks.

fir_filter: The core module containing the filter logic. It implements an 8-tap structure using parameter definitions for filter coefficients (h0 through h7) and a series of registers to maintain the history of input samples.
fir_tb: A testbench module used to verify the filter's functionality. It drives the clock, reset, and a series of input values (x) into the filter and monitors the output (y) to ensure the convolution logic performs as expected.

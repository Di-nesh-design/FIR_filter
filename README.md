# FIR Filter Implementation (Verilog)

VLSI design and implementation of a **Finite Impulse Response (FIR) digital filter** for DSP applications, developed in Verilog HDL. The design uses a **tapped-delay line architecture** with **multiply-accumulate (MAC)** units to compute the weighted sum of input samples using predefined filter coefficients.

---

## Project Overview

FIR filters are a core building block in Digital Signal Processing (DSP) systems, widely used in audio processing, communication systems, image processing, and biomedical signal filtering. This project implements a synthesizable FIR filter targeting FPGA/ASIC platforms, focused on real-time, low-latency signal processing.

The filter output is computed as:

```
y[n] = Σ h[k] · x[n-k]   for k = 0 to N-1
```

Where:
- `x[n]` = input sample at time n
- `h[k]` = filter coefficients (taps)
- `y[n]` = filtered output
- `N` = filter order (number of taps)

---

## Architecture

### 1. Tapped-Delay Line
A shift-register chain stores the most recent `N` input samples, giving simultaneous access to `x[n], x[n-1], ..., x[n-N+1]` on every clock cycle.

### 2. Multiply-Accumulate (MAC) Units
Each tapped sample is multiplied by its corresponding coefficient `h[k]`, and all products are summed to produce the filter output. This design uses a **parallel MAC** structure for high-throughput, single-cycle output computation.

```
x[n] → [D] → [D] → [D] → [D]
  |      |     |     |     |
 h0     h1    h2    h3    h4
  \      |     |     |     /
   \_____|_____|_____|____/
              |
           Adder Tree
              |
            y[n]
```

---

## Files

| File | Description |
|------|-------------|
| `fir.v` | Main FIR filter Verilog module (tapped-delay line + MAC datapath) |
| `fir_tb.v` | Testbench for functional simulation and verification |
| `simulation_waveform.png` | Vivado simulation waveform showing filter response |
| `README.md` | Project documentation |

---

## Design Highlights

- **Architecture:** Tapped-delay line with parallel MAC datapath
- **Target:** Designed with FPGA/ASIC implementation in mind (functionally verified via simulation)
- **Design Goals:** Low latency, real-time throughput, modular and scalable tap count
- **Language:** Verilog HDL (RTL level)

---


## Simulation Result

The design was simulated and verified functionally in **Xilinx Vivado**.

![FIR Filter Simulation Waveform](FIR_sim.png)

The waveform above shows the filter's response to a ramp/step input (`x`). The output `y` remains at zero during the initial clock cycles while the tapped-delay line fills with input samples — this is the expected pipeline latency of an FIR filter. Once the delay line is full, `y` begins updating and progressively converges to a steady-state value (`002800`) once the input `x` stabilizes, confirming correct operation of the tapped-delay-line and MAC (multiply-accumulate) datapath.

---

## Applications

- Audio signal processing (equalizers, noise filtering)
- Communication systems (channel filtering, pulse shaping)
- Biomedical signal processing (ECG/EEG filtering)
- Image and video signal conditioning

---

## Author

Dinesh Behera




# ECE 128 Lab 5 — Latches and Flip-Flops

This project explores sequential logic through Verilog designs and behavioral simulations in Vivado. It includes one-bit storage elements, a synchronous binary counter, and a clock divider.

**Course:** ECE 128 — FPGA Laboratory  
**Semester:** Fall 2026  
**Team:** Mahir Ashab Enan and Navjot Bains  
**Instructor:** Jannatun Naher, PhD

## Designs

| Design | Description |
|---|---|
| SR Latch | Stores one bit using cross-coupled NOR gates |
| SR Flip-Flop | Performs set, reset, or hold on a rising clock edge |
| DFF with Synchronous Reset | Captures data or resets on a rising clock edge |
| DFF with Asynchronous Reset | Captures data on a rising edge and resets immediately when reset is asserted |
| T Flip-Flop | Holds or toggles its output on a rising clock edge |
| 3-Bit Counter | Counts from 0 through 7 using three T flip-flops |
| Clock Divider | Generates a 25 MHz output from a 100 MHz input |

## Repository Structure

```text
ECE128-Lab5-Latches-FlipFlops/
├── README.md
├── src/
│   ├── sr_latch.v
│   ├── sr_flipflop.v
│   ├── dff_sync_reset.v
│   ├── dff_async_reset.v
│   ├── t_flipflop.v
│   ├── counter_3bit.v
│   └── clock_divider.v
├── tb/
│   ├── sr_latch_tb.v
│   ├── sr_flipflop_tb.v
│   ├── dff_reset_tb.v
│   ├── t_flipflop_tb.v
│   ├── counter_3bit_tb.v
│   └── clock_divider_tb.v
├── waveforms/
│   ├── sr_latch.png
│   ├── sr_flipflop.png
│   ├── dff_reset_comparison.png
│   ├── t_flipflop.png
│   ├── counter_3bit.png
│   └── clock_divider.png
└── report/
    └── ECE128_Lab5_Latches_FlipFlops_Report.pdf
```

## Tools

- Verilog HDL
- Xilinx Vivado 2023.1
- Vivado Simulator (XSim)

## Running the Simulations

1. Create an **RTL Project** in Vivado.
2. Add the files from `src/` as **Design Sources**.
3. Add the files from `tb/` as **Simulation Sources**.
4. Under **Simulation Sources**, right-click the desired testbench and select **Set as Top**.
5. Select **Run Simulation → Run Behavioral Simulation**.
6. Select **Run All** to run until the testbench finishes.
7. Use **Zoom Fit** and inspect the relevant signals.

Repeat these steps for each testbench.

| Simulation Top | Signals to Inspect | Completion Time |
|---|---|---:|
| `sr_latch_tb` | `S`, `R`, `Q`, `Qbar` | 140 ns |
| `sr_flipflop_tb` | `S`, `R`, `clk`, `Q`, `Qbar` | 100 ns |
| `dff_reset_tb` | `d`, `clk`, `rstn`, `q_sync`, `q_async` | 58 ns |
| `t_flipflop_tb` | `clk`, `rstn`, `T`, `Q` | 112 ns |
| `counter_3bit_tb` | `clk`, `rstn`, `count[2:0]` | 162 ns |
| `clock_divider_tb` | `clock_in`, `clock_out` | 200 ns |

The DFF comparison requires both `dff_sync_reset.v` and `dff_async_reset.v`. The counter simulation also requires `t_flipflop.v`.

The supplied testbenches apply directed inputs. Verification is performed by inspecting the waveforms; they do not include automated pass/fail assertions.

## Expected Behavior

### SR Latch

| S | R | Behavior |
|---:|---:|---|
| 0 | 0 | Hold the previous state |
| 0 | 1 | Reset: Q = 0 |
| 1 | 0 | Set: Q = 1 |
| 1 | 1 | Invalid: both NOR-latch outputs are 0 |

The latch responds directly to its inputs without a clock. During valid operation, `Qbar` is the complement of `Q`.

### SR Flip-Flop

The SR flip-flop performs set, reset, or hold only on a rising clock edge. The supplied model assigns an unknown value for `S = R = 1`; the supplied testbench exercises the valid input cases.

### D Flip-Flops

Both designs capture `d` on a rising clock edge during normal operation.

Reset is active low:

- `rstn = 0`: reset asserted.
- `rstn = 1`: normal operation.

In the comparison testbench, reset is asserted at 18 ns:

- `q_async` clears immediately at 18 ns.
- `q_sync` clears at the next rising edge, 25 ns.

### T Flip-Flop

- `T = 0`: hold the previous value.
- `T = 1`: toggle on each rising clock edge.
- `rstn = 0`: clear the output on a rising clock edge.

With T continuously high, the output frequency is half the input clock frequency.

### 3-Bit Counter

The counter instantiates three T flip-flops with a shared clock:

```text
T0 = 1
T1 = Q0
T2 = Q1 AND Q0
```

The counting sequence is:

```text
000 → 001 → 010 → 011 → 100 → 101 → 110 → 111 → 000
```

The active-low reset clears the counter synchronously.

### Clock Divider

The testbench generates a 100 MHz input clock with a 10 ns period.

The divider toggles its output every two input cycles:

```text
Output period = 4 × 10 ns = 40 ns
Output frequency = 100 MHz / 4 = 25 MHz
```

The expected output duty cycle is 50%.

## Waveform Review Status

Before final submission:

- Verify the SR latch waveform during the invalid-input and reset-recovery intervals. The supplied screenshot does not match the NOR-gate source in those intervals.
- Replace the image labeled Clock Divider with a simulation of `clock_divider_tb` showing `clock_in` and `clock_out`. The supplied image displays the counter signals instead.

## Demonstration and FPGA Implementation

This lab was completed through behavioral simulation. The demonstration consisted of showing and explaining the waveforms.

No Basys 3 board was used. FPGA implementation, pin constraints, bitstream generation, and device programming were outside the completed lab scope. No hardware implementation files are included.

## Lab Report

The report includes:

- Objectives and introduction
- Prelab block diagrams and truth/state tables
- Simulation screenshots and analysis
- Conclusion
- Demonstration summary
- Contribution chart
- GitHub repository link
- Verilog design and testbench appendices

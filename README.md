










# Digital Logic Design Lab

Verilog lab work for the Digital Logic Design course.
Designs were written and simulated in Xilinx Vivado and, from Lab 4 on, run on an FPGA board with 7-segment displays.
Each lab folder has its Verilog sources, any constraint (`.xdc`) files, and the lab report.

## Labs

| Lab | Topic | Top module | Main files |
|-----|-------|------------|------------|
| [Lab 1](F11115117_lab1) | Half adder and full adder (gate-level) | `half_adder`, `full_adder` | `half_adder.v`, `full_adder.v` + testbenches |
| [Lab 2](F11115117_lab2) | 4-bit adder and a 4×4 multiplier built from it | `multiplier_4x4` | `bit_adder_4.v`, `multiplier_4x4.v` + testbenches |
| Lab 3 | *Not in this repository* | — | — |
| [Lab 4](F11115117_lab4) | 7-segment display driver: shows a switch-set number at a chosen position | `segment_7` | `segment_7.v`, `segment_7.xdc` |
| [Lab 5](F11115117_lab5) | Counters on the 7-segment display | see below | `Task_1/`, `Task_2/` |
| [Lab 6](F11115117_lab6) | 24-hour clock (HH:MM:SS) on six digits | `display_24h` | `clock_divider.v`, `counter_2digit.v`, `enable_controller.v`, `bcd_to_7segment.v` |
| [Lab 7](F11115117_lab7) | Settable 24-hour clock: a button switches modes, switches set the tens and ones digits | `clock_24h_set` | `clock_24_set.v`, `clk_dividers.v`, `counters.v`, `d_bounce.v`, `bcd_to_7seg.v` |

### Lab 5 tasks
- **Task 1 (`up_counter_0to9`):** a push-button counter from 0 to 9, with a debounced button and a clock divider.
- **Task 2 (`up_counter_00to99`):** a counter that runs from 00 to 99 by itself, scanning two digits.

## Demo videos
<!--
To add a video, replace a "_Coming soon_" line with one of these:
  - A video uploaded to GitHub: edit this file on github.com, drag the .mp4 into the editor, and paste the link it gives you on its own line.
  - A YouTube or Google Drive video: [▶ Watch the demo](https://your-video-link)
-->

### Lab 4: 7-segment display driver

https://github.com/user-attachments/assets/c3a68f1b-80c0-49fa-8fdb-7b6bf5896ba9

### Lab 5: Counters
**Task 1: push-button counter from 0 to 9**

https://github.com/user-attachments/assets/97fa4e69-331d-4c8b-82f8-a5895f1f0f64

**Task 2: automatic counter from 00 to 99**

https://github.com/user-attachments/assets/432e5ffa-94b9-423e-bf2d-82ef42b6fd23

### Lab 6: 24-hour clock

https://github.com/user-attachments/assets/a2fb6b1d-1c3f-48a6-b3fb-77d7f5b04136

### Lab 7: Settable 24-hour clock
_Coming soon_

## How to run
1. Create a Vivado project and add the `.v` files from a lab folder.
2. **Simulation (Labs 1–2):** set the `*_sim.v` file as the simulation top and run Behavioral Simulation.
3. **FPGA (Labs 4–7):** add the `.xdc` file as a constraint, set the top module listed above, then run Synthesis, Implementation and Generate Bitstream, and program the board.

## Concepts covered
Gate-level modeling · structural (hierarchical) design · combinational arithmetic · BCD to 7-segment decoding · clock division · button debouncing · BCD counters with carry · display multiplexing · finite state machines

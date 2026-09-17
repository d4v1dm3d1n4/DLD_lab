`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/13/2023 02:06:29 PM
// Design Name: 
// Module Name: up_counter_00to99
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

// this is the final module, this module combines all previous modules:
// enable_controller(), up_counter(), and bcd_to_7segment(). That way,
// the counter goes from 00 to 99 automatically
module up_counter_00to99(clock, reset, seg_display, position);
    input clock, reset;
    output [7:0] seg_display;
    output [1:0] position;
    
    // Initializing clocks
    //
    // module clock_100Hz(clk, rst, clk_out);
    // module clock_10Hz(clk, rst, clk_out);
    
    wire clk_100_out, clk_10_out;
    clock_100Hz clk_100(clock, reset, clk_100_out);
    clock_10Hz clk_10(clock, reset, clk_10_out);
   
    // Remember that...
    //
    // module enable_controller(scan_clk, reset, seg_tens, seg_ones, segment, position);
    // module up_counter(clk, reset, bcd, carry);
    // module bcd_to_7segment(bcd, segment);
    
    wire [3:0] bcd_ones, bcd_tens;
    wire [1:0] carry;
    wire [7:0] seg_ones, seg_tens;
    
    // ones
    up_counter up_1(clk_10_out, reset, bcd_ones, carry[0]);
    bcd_to_7segment seg_1(bcd_ones, seg_ones);
    
    // tens
    up_counter up_10(carry[0], reset, bcd_tens, carry[1]);
    bcd_to_7segment seg_10(bcd_tens, seg_tens);
    
    enable_controller(clk_100_out, reset, seg_tens, seg_ones, seg_display, position);

endmodule

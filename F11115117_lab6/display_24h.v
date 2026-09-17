`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/20/2023 01:03:43 AM
// Design Name: 
// Module Name: display_24h
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


// module to combine all other modules into one to display a 24hs clock
module display_24h(clk, switch, reset, seg_left, seg_right, position);
    input clk, switch, reset;
    
    output [7:0] seg_left, seg_right;
    output [5:0] position;
    
    // REMEMBER THAT ...
    //
    // mode -> 0 for 1hz, 1 for 10khz
    // clock_divider(clk, mode, reset, clk_out);
    // clock_500hz(clk, reset, clk_out);
    //
    // bcd_to_7segment(bcd, segment);
    //
    // counter_2digit(clk_input, reset, reset_number, bcd_limit, c_out, bcd_tens, bcd_ones);
    //
    // enable_controller(scan_clk, reset, seg_h5, seg_h4, seg_m3, seg_m2, seg_s1, seg_s0, seg_left, seg_right, position);
    
    
    // Initializing clocks
    // mode -> 0 for 1hz, 1 for 1000hz
    wire clk_1hz, clk_10khz, clk_display;
    clock_divider _1hz(clk, 0'b0, rst, clk_1hz); // 1 hz
    clock_divider _10khz(clk, 0'b1, rst, clk_10khz); // 10 khz
    clock_500hz _display(clk, rst, clk_display); // 500 hz
    
    reg clk_count;
    always @(switch) begin
        if(switch) begin
            clk_count <= clk_10khz;
        end
        else begin
            clk_count <= clk_1hz;
        end
    end
    
    // second, minute, and hour limit
    wire [7:0] sec_min_limit = 8'b01011001;
    wire [7:0] hour_limit = 8'b00100011;
    
    // reset value for second, minute, and hour
    wire [7:0] sec_reset = 8'b01000101;
    wire [7:0] min_reset = 8'b01011001;
    wire [7:0] hour_reset = 8'b00100011;
    
    wire carry_sec, carry_min, carry_hour;
    
    wire [3:0] bcd_sec_tens, bcd_sec_ones;
    wire [3:0] bcd_min_tens, bcd_min_ones;
    wire [3:0] bcd_hour_tens, bcd_hour_ones;
    
    // counter for second, minutes, and hour
    counter_2digit sec (clk_count, reset, sec_reset, sec_min_limit, carry_sec, bcd_sec_tens, bcd_sec_ones);
    counter_2digit min (carry_sec, reset, min_reset, sec_min_limit, carry_min, bcd_min_tens, bcd_min_ones);
    counter_2digit hour (carry_min, reset, hour_reset, hour_limit, carry_hour, bcd_hour_tens, bcd_hour_ones);
    
    wire [7:0] seg_h5, seg_h4, seg_m3, seg_m2, seg_s1, seg_s0;
    bcd_to_7segment seg5 (bcd_hour_tens, seg_h5);
    bcd_to_7segment seg4 (bcd_hour_ones, seg_h4);
    bcd_to_7segment seg3 (bcd_min_tens, seg_m3);
    bcd_to_7segment seg2 (bcd_min_ones, seg_m2);
    bcd_to_7segment seg1 (bcd_sec_tens, seg_s1);
    bcd_to_7segment seg0 (bcd_sec_ones, seg_s0);
    
    enable_controller(clk_display, reset, seg_h5, seg_h4, seg_m3, seg_m2, seg_s1, seg_s0, seg_left, seg_right, position);
    
endmodule

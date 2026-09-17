`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/13/2023 07:10:48 AM
// Design Name: 
// Module Name: enable_controller
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

// this module allows the display of 2 different LEDs at the same time. This is done
// by lighting up one LED, and then the other one, at fast velocities, faster than the
// naked eye can process, so we see as if 2 LEDs are light up at the same time
module enable_controller(scan_clk, reset, seg_tens, seg_ones, segment, position);
    input scan_clk, reset;
    input [7:0] seg_tens, seg_ones;
    
    output reg [7:0] segment;
    output reg [1:0] position;
    
    reg counter;
    always @(posedge scan_clk or posedge reset) begin
        if(reset) begin
            counter <= 1'b0;
            position <= 2'b01;
            segment <= seg_ones;
        end
        else begin
            if(counter == 1'b0) begin
                position <= 2'b01;
                segment <= seg_ones;
            end
            else begin
                position <= 2'b10;
                segment <= seg_tens;
            end
            
            counter <= ~counter;
        end
    end

endmodule


// The clock output is defined by the counter set to divide the
// clock of 100 MHz. Dividing clock of 100 MHz by 1.000.000 gives
// a 100 Hz clock
module clock_100Hz(clk, rst, clk_out);
    input clk, rst;
    output reg clk_out;
    
    integer counter;
    always @(posedge clk or posedge rst) begin
        if(rst)
            counter <= 0;
        else if(counter == 1000000) // divide clock by 1.000.000
            counter <= 0;
        else
            counter <= counter + 1;
    end
    
    // create clock signal, the 1st part of 1.000.000 should be 1,
    // and the 2nd part should be 0
    always @(posedge clk or posedge rst) begin
        if(rst)
            clk_out <= 1'b0;
        else if(counter <= 500000) // 1st half of 1.000.000
            clk_out <= 1'b1;
        else
            clk_out <= 1'b0;
    end
endmodule

// The clock output is defined by the counter set to divide the
// clock of 100 MHz. Dividing clock of 100 MHz by 10.000.000 gives
// a 10 Hz clock
module clock_10Hz(clk, rst, clk_out);
    input clk, rst;
    output reg clk_out;
    
    integer counter;
    always @(posedge clk or posedge rst) begin
        if(rst)
            counter <= 0;
        else if(counter == 10000000) // divide clock by 10.000.000
            counter <= 0;
        else
            counter <= counter + 1;
    end
    
    // create clock signal, the 1st part of 10.000.000 should be 1,
    // and the 2nd part should be 0
    always @(posedge clk or posedge rst) begin
        if(rst)
            clk_out <= 1'b0;
        else if(counter <= 5000000) // 1st half of 10.000.000
            clk_out <= 1'b1;
        else
            clk_out <= 1'b0;
    end
endmodule

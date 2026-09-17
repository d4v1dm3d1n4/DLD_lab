`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/19/2023 11:20:49 PM
// Design Name: 
// Module Name: clock_divider
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


// clock divider that takes a 100 MHz, and outputs a modified clock according to the mode:
// mode -> 0 for 1hz, 1 for 10khz
module clock_divider(clk, mode, reset, clk_out);
    input clk, reset;
    input [1:0] mode;
    output reg clk_out;
    
    // divider
    integer counter;
    always @(posedge clk or posedge reset) begin
        if(reset) 
            counter <= 0;
        else if(mode == 1'b0) begin // 1hz
            if(counter == (100000000 - 2))
                counter <= 0;
            else
                counter <= counter + 1;
        end
        else if(mode == 1'b1) begin // 10khz
            if(counter == (10000 - 2))
                counter <= 0;
            else
                counter <= counter + 1;
        end
    end
    
    // signal generation
    always @(posedge clk or posedge reset) begin
        if(reset) 
            clk_out <= 1'b0;
        else if(mode == 1'b0) begin // 1hz
            if(counter < (100000000 / 2))
                clk_out <= 1'b1;
            else
                clk_out <= 1'b0;
        end 
        else if(mode == 1'b1) begin // 10khz
            if(counter < (10000 / 2))
                clk_out <= 1'b1;
            else
                clk_out <= 1'b0;
        end
    end
    
endmodule


// clock divider that takes a 100 MHz and outputs a 500 Hz clock
module clock_500hz(clk, reset, clk_out);
    input clk, reset;
    output reg clk_out;
    
    // divider
    integer counter;
    always @(posedge clk or posedge reset) begin
        if(reset) 
            counter <= 0;
        else begin
            if(counter == (200000 - 2)) // 500 Hz
                counter <= 0;
            else
                counter <= counter + 1;
        end
    end
    
    // signal generation
    always @(posedge clk or posedge reset) begin
        if(reset) 
            clk_out <= 1'b0;
        else begin
            if(counter < (200000 / 2))  // 500 Hz
                clk_out <= 1'b1;
            else
                clk_out <= 1'b0;
        end
    end
    
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/19/2023 11:29:49 PM
// Design Name: 
// Module Name: counter_2digit
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


// counter to display the appropiate up-count for the hour, minutes, or seconds given
// a number-reset and a up-count-limit 
module counter_2digit(clk_input, reset, reset_number, bcd_limit, c_out, bcd_tens, bcd_ones);
    input clk_input, reset;
    input [7:0] reset_number, bcd_limit; // [7:4] limit tens, and [3:0] limit ones
    
    output c_out;
    output [3:0] bcd_tens, bcd_ones;
    
    wire carry_ones;
    
    // determine up-count display
    up_counter count_ones (clk_input, reset, reset_number[3:0], bcd_limit[3:0], bcd_tens, bcd_ones, carry_ones);
    up_counter count_tens (carry_ones, reset, reset_number[7:4], bcd_limit[7:4], 4'b0000, bcd_tens, c_out);
    
endmodule


// up counter that goes from 0 to 9 automatically because of the clock
module up_counter(clk, reset, reset_number, limit, bcd_tens, bcd, carry);
    input clk, reset;
    input [3:0] reset_number, limit, bcd_tens;
    
    output reg [3:0] bcd; // count 0~9
    output reg carry; // to carry to tens
    
    always @(posedge clk or posedge reset) begin
        if(reset) begin
            carry <= 1'b0;
            bcd <= reset_number;
        end
        else if((limit == 4'b0011) && (bcd == 4'b1001) && (bcd_tens < 4'b0010)) begin
            carry <= 1'b1;
            bcd <= 4'b0000;
        end
        else if((limit == 4'b0011) && (bcd == 4'b0011) && (bcd_tens == 4'b0010)) begin
            carry <= 1'b1;
            bcd <= 4'b0000;
        end
        else if((limit != 4'b0011) && (bcd >= limit)) begin // limit != 3
            carry <= 1'b1;
            bcd <= 4'b0000;
        end
        else begin
            carry <= 1'b0;
            bcd <= bcd + 4'b0001;
        end
    end

endmodule

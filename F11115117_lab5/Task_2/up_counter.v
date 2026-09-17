`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/13/2023 06:01:55 AM
// Design Name: 
// Module Name: up_counter
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

// up counter that goes from 0 to 9 automatically because of the clock
module up_counter(clk, reset, bcd, carry);
    input clk, reset;
    output reg [3:0] bcd; // count 0~9
    output reg carry; // to carry to tens
    
    always @(posedge clk or posedge reset) begin
        if(reset) begin
            carry <= 1'b0;
            bcd <= 4'b0000;
        end
        else if(bcd >= 9) begin
            carry <= 1'b1;
            bcd <= 4'b0000;
        end
        else begin
            carry <= 1'b0;
            bcd <= bcd + 1;
        end
    end
endmodule

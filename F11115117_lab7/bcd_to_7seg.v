`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/22/2023 07:48:55 PM
// Design Name: 
// Module Name: bcd_to_7seg
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

// module to display bcd number to corresponding LEDs segment
module bcd_to_7seg(bcd, segment);
    input [3:0] bcd;
    output reg [7:0] segment;
    
    always @(bcd) begin
        case({bcd})
            4'b0001 : segment = {8'b01100000};
            4'b0010 : segment = {8'b11011010};
            4'b0011 : segment = {8'b11110010};
            4'b0100 : segment = {8'b01100110};
            4'b0101 : segment = {8'b10110110};
            4'b0110 : segment = {8'b10111110};
            4'b0111 : segment = {8'b11100000};
            4'b1000 : segment = {8'b11111110};
            4'b1001 : segment = {8'b11110110};
            4'b1010 : segment = {8'b11101110};
            4'b1011 : segment = {8'b00111110};
            4'b1100 : segment = {8'b10011100};
            4'b1101 : segment = {8'b01111010};
            4'b1110 : segment = {8'b10011110};
            4'b1111 : segment = {8'b10001110};
            default: segment = {8'b11111100};
        endcase
    end    
endmodule

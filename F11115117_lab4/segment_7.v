`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/19/2023 12:27:12 AM
// Design Name: 
// Module Name: segment_7
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


module segment_7(num, pos, anode, seg_1, seg_2);
    // input ports -> correspond to the switches 
    input [3:0] num;
    input [2:0] pos;
    
    // output ports -> corresponds to which LED will be displayed,
    // and which number will be shown
    output [7:0] anode;
    output [6:0] seg_1, seg_2; 
    
    reg [7:0] anode;
    reg [6:0] seg_1, seg_2;

    // For the 7 bit binary number, 1 means light up LED
    // This always block displays the number on the LED
    always @(num) 
        case (num)
            4'b0000: {seg_1, seg_2} = {7'b1111110, 7'b1111110}; // "0"
            4'b0001: {seg_1, seg_2} = {7'b0110000, 7'b0110000}; // "1"
            4'b0010: {seg_1, seg_2} = {7'b1101101, 7'b1101101}; // "2"
            4'b0011: {seg_1, seg_2} = {7'b1111001, 7'b1111001}; // "3"
            4'b0100: {seg_1, seg_2} = {7'b0110011, 7'b0110011}; // "4" 
            4'b0101: {seg_1, seg_2} = {7'b1011011, 7'b1011011}; // "5" 
            4'b0110: {seg_1, seg_2} = {7'b1011111, 7'b1011111}; // "6"
            4'b0111: {seg_1, seg_2} = {7'b1110000, 7'b1110000}; // "7" 
            4'b1000: {seg_1, seg_2} = {7'b1111111, 7'b1111111}; // "8"
            4'b1001: {seg_1, seg_2} = {7'b1111011, 7'b1111011}; // "9" 
            4'b1010: {seg_1, seg_2} = {7'b1110111, 7'b1110111}; // A
            4'b1011: {seg_1, seg_2} = {7'b0011111, 7'b0011111}; // B
            4'b1100: {seg_1, seg_2} = {7'b1001110, 7'b1001110}; // C
            4'b1101: {seg_1, seg_2} = {7'b0111101, 7'b0111101}; // D
            4'b1110: {seg_1, seg_2} = {7'b1001111, 7'b1001111}; // E
            default: {seg_1, seg_2} = {7'b1000111, 7'b1000111}; // F
        endcase
   
    // This always block controls which LED will light up
    always @(pos)
        case (pos)
            3'b000: anode = 8'b00000001;
            3'b001: anode = 8'b00000010;
            3'b010: anode = 8'b00000100;
            3'b011: anode = 8'b00001000;
            3'b100: anode = 8'b00010000;
            3'b101: anode = 8'b00100000;
            3'b110: anode = 8'b01000000;
            default: anode = 8'b10000000;
        endcase
endmodule

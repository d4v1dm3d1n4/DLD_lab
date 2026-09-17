`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2023 12:31:42 AM
// Design Name: 
// Module Name: half_adder
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

// Half Adder circuit using Gate Level modeling
module half_adder(x, y, c, s);
    // input ports
    input x, y;
    
    // output ports
    output c, s;
    
    // Gate level implementation of Half Adder
    and AND(c, x, y);
    xor XOR(s, x, y);
    
endmodule

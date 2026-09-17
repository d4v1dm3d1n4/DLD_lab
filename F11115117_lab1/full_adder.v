`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2023 10:11:32 AM
// Design Name: 
// Module Name: full_adder
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

// Full Adder circuit using Gate Level modeling
module full_adder(x, y, c_in, s, c_out);
    // input ports
    input x, y, c_in;
    
    // output ports
    output s, c_out;
    
    // wires for intermediate connections
    wire s1, c1, c2, c3;
    
    // Gate Level implementation of Full Adder
    xor XOR_1 (s1, x, y);
    xor XOR_FINAL (s, s1, c_in);
    
    and AND_1 (c1, x, y);
    and AND_2 (c2, x, c_in);
    and AND_3 (c3, y, c_in);
    or OR_FINAL (c_out, c1, c2, c3);

endmodule

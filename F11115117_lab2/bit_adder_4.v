`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2023 12:58:56 AM
// Design Name: 
// Module Name: bit_adder_4
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

// 4 Bits Adder implemented by using the full_adder module
module bit_adder_4(x, y, sum);
    // input ports
    input [3:0] x, y;
    
    // wire for intermediate variables
    wire [2:0] c;
    wire c4;
    wire [3:0] s;
    
    // output ports
    output [4:0] sum;
    
    // Using 4 full_adder modules
    // NOTE = full_adder(x, y, c_in, s, c_out);
    full_adder FA0 (x[0], y[0], 1'b0, s[0], c[0]);
    full_adder FA1 (x[1], y[1], c[0], s[1], c[1]);
    full_adder FA2 (x[2], y[2], c[1], s[2], c[2]);
    full_adder FA3 (x[3], y[3], c[2], s[3], c4);
    
    assign sum = {c4, s[3:0]};
    
endmodule


// Full Adder implementation using Data Flow modeling
module full_adder(x, y, c_in, s, c_out);
    // input ports
    input x, y, c_in;
    
    // output ports
    output s, c_out;

    // Data Flow implementation
    assign s = x ^ y ^ c_in;
    assign c_out = (x & y) | (x & c_in) | (y & c_in);

endmodule 

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/18/2023 12:30:34 AM
// Design Name: 
// Module Name: multiplier_4x4
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

// 4X4 Multiplier implemented by using the bit_adder_4 module
//
// module bit_adder_4(x, y, sum);
//    input [3:0] x, y;
//    output [4:0] sum;
//
module multiplier_4x4(x, y, p);
    // input ports
    input [3:0] x, y;

    // intermediate wires
    wire [3:0] a, b, c, d; // for AND gate output
    wire [4:0] s1, s2, s3; // for the 4-Bit Adder output
    
    // output ports
    output [7:0] p;


    // 1st. group of AND gates
    assign a[0] = y[0] & x[0]; // this is p[0]
    assign a[1] = y[0] & x[1];
    assign a[2] = y[0] & x[2];
    assign a[3] = y[0] & x[3];
    
    // 2nd. group of AND gates
    assign b[0] = y[1] & x[0];
    assign b[1] = y[1] & x[1];
    assign b[2] = y[1] & x[2];
    assign b[3] = y[1] & x[3];

    // 1st. 4-Bit Adder
    bit_adder_4 add1 ({1'b0, a[3:1]}, b, s1);

    // 3rd. group of AND gates
    assign c[0] = y[2] & x[0];
    assign c[1] = y[2] & x[1];
    assign c[2] = y[2] & x[2];
    assign c[3] = y[2] & x[3];

    // 2nd. 4-Bit Adder
    bit_adder_4 add2 (s1[4:1], c, s2);
    
    // 4th. group of AND gates
    assign d[0] = y[3] & x[0];
    assign d[1] = y[3] & x[1];
    assign d[2] = y[3] & x[2];
    assign d[3] = y[3] & x[3];

    // 3rd. 4-Bit Adder
    bit_adder_4 add3 (s2[4:1], d, s3);
    
    
    // Final output of the product
    assign p = {s3, s2[0], s1[0], a[0]};

endmodule

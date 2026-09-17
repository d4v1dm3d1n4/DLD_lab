`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/22/2023 07:46:51 PM
// Design Name: 
// Module Name: d_bounce
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

// module of debounce module, with frequency of 1000 hz
module d_bounce(clk, rst, button, button_debounce);
    input clk, rst, button;
    output button_debounce;
    
    wire [2:0] Q;
    wire clk_1000hz_out, l;
    
    // generate clock
    clk_1000hz u1(clk, rst, clk_1000hz_out);
    
    dff d1(clk_1000hz_out, rst, button, Q[0]);
    dff d2(clk_1000hz_out, rst, Q[0], Q[1]);
    dff d3(clk_1000hz_out, rst, Q[1], Q[2]);
    
    and_gate and1(Q[0], Q[1], l);
    and_gate and2(Q[2], l, button_debounce);  
endmodule


// d-flip flop module
module dff(clk, rst, D, Q);
    input clk, rst, D;
    output reg Q;
    
    always @(posedge clk or posedge rst) begin
        if (rst)
            Q <= 1'b0;
        else
            Q <= D;
    end     
endmodule


// and gate module
module and_gate(x, y, z);
    input x, y;
    output z;
    
    assign z = x & y;
endmodule 

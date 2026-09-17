`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/13/2023 02:43:42 AM
// Design Name: 
// Module Name: de_bounce
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

// implementation of the debounce circuit for push button
module de_bounce(clk, button, reset, button_debounce);
    input clk, button, reset;
    output button_debounce;
    
    wire [2:0] q_out;
    
    dff dff_1 (button, clk, reset, q_out[0]);
    dff dff_2 (q_out[0], clk, reset, q_out[1]);
    dff dff_3 (q_out[1], clk, reset, q_out[2]);
    
    assign button_debounce = q_out[0] & q_out[1] & q_out[2];
endmodule

// basic d flip-flop used in the de-bounce circuit
module dff(d, c, rst, q);
    input d, c, rst;
    output reg q;
    
    always @(posedge c) begin 
        if(rst)// when reset pressed, q becomes 0
            q <= 1'b0;
        else
            q <= d;
    end
endmodule

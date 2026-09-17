`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2023 12:59:12 AM
// Design Name: 
// Module Name: bit_adder_4_sim
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

// module bit_adder_4(x, y, sum);
//    input [3:0] x, y;
//    output [4:0] sum;
module bit_adder_4_sim();
    // input
    reg [3:0] x, y;
    
    // output
    wire [4:0] sum;
    
    // Unit Under Test
    bit_adder_4 uut (.x(x), .y(y), .sum(sum));
    
    integer i, j;
    
    initial begin
        for (i=0; i<16; i=i+1) begin
            x = i;
            
            for (j=0; j<16; j=j+1) begin
                y = j;
                #100;
                
            end
        end
    end
endmodule

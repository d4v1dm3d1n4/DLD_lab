`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/18/2023 12:30:54 AM
// Design Name: 
// Module Name: multiplier_4x4_sim
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

// module multiplier_4x4(x, y, p);
//    input [3:0] x, y;
//    output [7:0] p;
//
module multiplier_4x4_sim();
    // input
    reg [3:0] x, y;
    
    // output
    wire [7:0] p;
    
    // Unit Under Test
    multiplier_4x4 uut (.x(x), .y(y), .p(p));
    
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

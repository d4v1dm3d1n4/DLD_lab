`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2023 12:31:58 AM
// Design Name: 
// Module Name: half_adder_sim
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


module half_adder_sim();
    // inputs
    reg x, y;
    
    // outputs
    wire c, s;

    // Instantiate the Unit Under Test
    half_adder uut(.x(x), .y(y), .c(c), .s(s));
    
    initial begin
        // Initialize inputs
        x = 0; y = 0;
        #100; // wait 100ns 
        
        x = 0; y = 1;
        #100;
        
        x = 1; y = 0;
        #100;
        
        x = 1; y = 1;
        #100;
    end
    
endmodule

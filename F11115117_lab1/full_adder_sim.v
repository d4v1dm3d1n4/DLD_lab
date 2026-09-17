`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2023 10:11:49 AM
// Design Name: 
// Module Name: full_adder_sim
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


module full_adder_sim();
    // inputs
    reg x, y, c_in;
    
    // outputs
    wire s, c_out;

    // Instantiate the Unit Under Test
    full_adder uut(.x(x), .y(y), .c_in(c_in), .s(s), .c_out(c_out));
    
    initial begin
        // Initialize inputs
        x = 0; y = 0; c_in = 0;
        #100; // wait 100ns 
        x = 0; y = 0; c_in = 1;
        #100;
        x = 0; y = 1; c_in = 0;
        #100;
        x = 0; y = 1; c_in = 1;
        #100;
        
        x = 1; y = 0; c_in = 0;
        #100;
        x = 1; y = 0; c_in = 1;
        #100;
        x = 1; y = 1; c_in = 0;
        #100;
        x = 1; y = 1; c_in = 1;
        #100;
    end
endmodule

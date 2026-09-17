`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/13/2023 02:45:30 AM
// Design Name: 
// Module Name: up_counter
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

// up counter that goes from 0 to 9 with every push of the button
module up_counter(button_clk, reset, bcd);
    input button_clk, reset;
    output reg [3:0] bcd; // count 0~9
    
    always @(posedge button_clk or posedge reset) begin
        if(reset) // when reset pushed, bcd is 0
            bcd <= 4'b0000;
        else if(bcd >= 9) // when bcd exceeds 9, set bcd to 0
            bcd <= 4'b0000;
        else // with every button pushed, increase bcd by 1
            bcd <= bcd + 1;
    end
endmodule

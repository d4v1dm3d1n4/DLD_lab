`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/22/2023 07:48:36 PM
// Design Name: 
// Module Name: clk_dividers
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

// module that takes a 100 mhz, and produces a 1hz clock
module clk_1hz(clk, rst, clk_out);
    input clk, rst;
    output reg clk_out;
    
    integer counter;
    always @(posedge clk or posedge rst) begin
        if (rst) 
            counter <= 0;
        else if (counter == 100000000)
            counter <= 0;
        else 
            counter <= counter + 1;
    end
    
    always @(posedge clk or posedge rst) begin
        if (rst)
            clk_out <= 0;
        else if (counter <= 50000000)  
            clk_out <= 1'b1;
        else
            clk_out <= 1'b0;
    end
endmodule


// module that takes a 100 mhz, and produces a 1000hz clock
module clk_1000hz(clk, rst, clk_out);
    input clk, rst;
    output reg clk_out;
    
    integer counter;
    always @(posedge clk or posedge rst) begin
        if(rst) 
            counter <= 0;
        else if(counter == 100000)
            counter <= 0;
        else
            counter <= counter + 1;
    end
        
    always @(posedge clk or posedge rst) begin
        if (rst) 
            clk_out <= 0;
        else if(counter <= 50000)
            clk_out <= 1'b1;
        else 
            clk_out <= 1'b0;
    end    
endmodule

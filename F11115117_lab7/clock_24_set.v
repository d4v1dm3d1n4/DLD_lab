`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/22/2023 07:48:20 PM
// Design Name: 
// Module Name: clock_24_set
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

// module that takes all other modules to produce a 24 hour clock that you can set
// second, minute, and hour. You can switch modes by pressing a button, and then 
// setting the tens and ones of the clock by changing switches
module clock_24h_set(clk, button, rst, left_segment, right_segment, position, tens, ones);
    input clk, rst, button;
    input [3:0] tens, ones; 
    
    output [7:0] left_segment, right_segment;
    output reg [5:0] position;    
    
    // generate different frequency clocks
    wire clk_1000hz_out, clk_1hz_out, button_debounced;
    
    d_bounce(clk, rst, button, button_debounced);
    clk_1000hz(clk, rst, clk_1000hz_out);
    clk_1hz(clk,rst,clk_1hz_out);
    
    // intermediate variables
    wire [3:0] bcd1, bcd2, bcd3, bcd4, bcd5, bcd6;
    integer x, a, b;
    reg [3:0] bcd_out;
    
    integer state;
    integer idle = 0;
    integer sec = 1;
    integer min = 2;
    integer hr = 3;
    
    always @(posedge clk_1hz_out or posedge rst) begin
        if(rst) 
            state<=idle;
        else begin
            case(state)
                idle:begin
                    if(button_debounced)
                        state<=sec;
                    else 
                        state<=idle;
                end
                sec:begin
                    if(button_debounced)
                        state<=min;
                    else 
                        state<=sec;
                end
                min:begin
                    if(button_debounced)
                        state<=hr;
                    else
                        state<=min;
                end
                hr:begin
                    if(button_debounced)
                        state<=idle;
                    else 
                        state<=hr;
                end    
            endcase
        end
    end 
    
    counters(clk_1hz_out, rst, bcd1, bcd2, bcd3, bcd4, bcd5, bcd6, state, tens, ones);
    
    always @(posedge clk_1000hz_out or posedge rst)begin
        if(rst)
            x<=0;
        else if (x==5)
            x<=0;  
        else
            x<=x+1;
    end
    
    always @(posedge clk_1000hz_out)begin
        case(x)
            0:begin 
                bcd_out<=bcd1; 
                position<=6'b000001;
            end
            1:begin 
                bcd_out<=bcd2; 
                position<=6'b000010;
            end
            2:begin 
                bcd_out<=bcd3; 
                position<=6'b000100;
            end
            3:begin 
                bcd_out<=bcd4; 
                position<=6'b001000;
            end
            4:begin 
                bcd_out<=bcd5; 
                position<=6'b010000;
            end
            5:begin 
                bcd_out<=bcd6; 
                position<=6'b100000;
            end
        endcase
    end
    
    // display LEDs
    bcd_to_7seg seg_left(bcd_out, left_segment);
    bcd_to_7seg seg_right(bcd_out, right_segment);    
endmodule
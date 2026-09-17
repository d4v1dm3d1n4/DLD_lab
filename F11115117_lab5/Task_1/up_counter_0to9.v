`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/13/2023 02:19:38 AM
// Design Name: 
// Module Name: up_counter_0to9
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

// this is the final module, this module combines all previous modules:
// de_bounce(), up_counter(), and bcd_to_7segment(). That way, when
// you push the button, the correct number is displayed
module up_counter_0to9(clock, button, reset, seg_display, position);
    input clock, button, reset;
    output [7:0] seg_display;
    output [7:0] position;
    
    assign position = 8'b00000001; // position of LED being displayed
    
    // Clock divider
    // 100 Hz approx. to div[20]=10.4ms
    reg [31:0] divider;
    
    always @(posedge clock) begin
        if(reset)
            divider <= 0;
        else if(divider[23] == 1'b1)
            divider <= 0;
        else
            divider <= divider + 1;
    end
   
    // Remember that...
    //
    // module de_bounce(clk, button, reset, button_debounce);
    // module up_counter(button_clk, reset, bcd);
    // module bcd_to_7segment(bcd, segment);
    
    wire button_clk;
    de_bounce(divider[20], button, reset, button_clk);
    
    wire [3:0] bcd;
    up_counter(button_clk, reset, bcd);
    
    bcd_to_7segment(bcd, seg_display);

endmodule

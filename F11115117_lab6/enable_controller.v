`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/20/2023 09:43:40 PM
// Design Name: 
// Module Name: enable_controller
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


// this module allows the display of 6 different LEDs at the same time. This is done
// by lighting up one LED, and then the other ones, at fast velocities, faster than the
// naked eye can process, so we see as if 6 LEDs are light up at the same time
module enable_controller(scan_clk, reset, seg_h5, seg_h4, seg_m3, seg_m2, seg_s1, seg_s0, seg_left, seg_right, position);
    input scan_clk, reset;
    input [7:0] seg_h5, seg_h4, seg_m3, seg_m2, seg_s1, seg_s0;
    
    output reg [7:0] seg_left, seg_right;
    output reg [5:0] position;
    
    reg [2:0] count;
    always @(posedge scan_clk or posedge reset) begin
        if(reset) begin
            seg_left <= seg_s0;
            seg_right <= seg_s0;
            count <= 3'b000;
            position <= 6'b000001;
        end
        else if(count == 3'b000) begin // 0
            seg_left <= seg_s0;
            seg_right <= seg_s0;
            count <= count + 3'b001;
            position <= 6'b000001;
        end
        else if(count == 3'b001) begin // 1
            seg_left <= seg_s1;
            seg_right <= seg_s1;
            count <= count + 3'b001;
            position <= 6'b000010;
        end
        else if(count == 3'b010) begin // 2
            seg_left <= seg_m2;
            seg_right <= seg_m2;
            count <= count + 3'b001;
            position <= 6'b000100;
        end
        else if(count == 3'b011) begin // 3
            seg_left <= seg_m3;
            seg_right <= seg_m3;
            count <= count + 3'b001;
            position <= 6'b001000;
        end
        else if(count == 3'b100) begin // 4
            seg_left <= seg_h4;
            seg_right <= seg_h4;
            count <= count + 3'b001;
            position <= 6'b010000;
        end
        else if(count == 3'b101) begin // 5
            seg_left <= seg_h5;
            seg_right <= seg_h5;
            count <= 3'b000;
            position <= 6'b100000;
        end
    end

endmodule

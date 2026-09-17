`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/22/2023 07:48:06 PM
// Design Name: 
// Module Name: counters
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

// module to up-count numbers from 0~59 for seconds and minute, and 0~23 for hours
module counters(clk, rst, bcd1, bcd2, bcd3, bcd4, bcd5, bcd6, state, tens, ones);
    input clk, rst;
    input [3:0]tens, ones;
    input [31:0] state;
    
    output reg [3:0] bcd1, bcd2, bcd3, bcd4, bcd5, bcd6;
    
    integer cnt1, cnt2, cnt3, cnt4, cnt5, cnt6;
    integer a, b;
    
    always@(posedge clk or posedge rst)begin
        if(rst)begin
            a<=0;
            b<=0;
        end
        else begin    
            case(ones)
                4'b0001: a = 1;
                4'b0010: a = 2;
                4'b0011: a = 3;
                4'b0100: a = 4;
                4'b0101: a = 5;
                4'b0110: a = 6;
                4'b0111: a = 7;
                4'b1000: a = 8;
                4'b1001: a = 9;
                4'b1010: a = 9;
                4'b1011: a = 9;
                4'b1100: a = 9;
                4'b1101: a = 9;
                4'b1110: a = 9;
                4'b1111: a = 9;
                default: a = 0;
            endcase
            
            case(tens)
                4'b0001: b = 1;
                4'b0010: b = 2;
                4'b0011: b = 3;
                4'b0100: b = 4;
                4'b0101: b = 5;
                4'b0110: b = 6;
                4'b0111: b = 7;
                4'b1000: b = 8;
                4'b1001: b = 9;
                4'b1010: b = 9;
                4'b1011: b = 9;
                4'b1100: b = 9;
                4'b1101: b = 9;
                4'b1110: b = 9;
                4'b1111: b = 9;
                default: b = 0;
            endcase 
        end       
    end
    
    always@(posedge clk or posedge rst) begin //for counter cnt1
        if(rst) begin
            cnt1<=0;
            cnt2<=0;
            cnt3<=0;
            cnt4<=0;
            cnt5<=0;
            cnt6<=0;
       end
       else           
           case(state)   
                0:begin
                   cnt1<=cnt1+1;
                   if(cnt1>=9)begin
                        cnt1<=0;
                        cnt2<=cnt2+1;
                        if(cnt2>=5)begin
                            cnt2<=0;
                            cnt3<=cnt3+1;
                            if(cnt3>=9)begin
                                cnt3<=0;
                                cnt4<=cnt4+1;
                                if(cnt4>=5)begin
                                    cnt4<=0;
                                    cnt5<=cnt5+1;
                                    if(cnt5>=9)begin
                                        cnt5<=0;
                                        cnt6<=cnt6+1;
                                    end
                                    else if(cnt5>=3 && cnt6>=2)begin
                                        cnt5<=0;
                                        cnt6<=0;
                                    end
                                end
                            end
                        end    
                    end
                end   
                1:begin 
                     cnt1<=a;
                     cnt2<=b;
                    if(a > 9)begin
                          cnt1<=9;
                    end
                    if(b > 5)begin
                        cnt1<=9;
                         cnt2<=5;
                    end    
                end
                2:begin
                     cnt3<=a;
                     cnt4<=b;
                    if(a > 9)begin
                          cnt3<=9;
                    end
                    if(b > 5)begin
                        cnt3 <=9;
                         cnt4<=5;
                    end    
                end
                3:begin
                     cnt5<=a;
                     cnt6<=b;
                    if(b < 2 & a > 9)begin
                          cnt5<=9;
                    end
                    else if(b >= 2 & a >= 3)begin
                         cnt5<=3;
                    end
                    if(b > 2)begin
                        cnt5<=3;
                         cnt6<=2;
                    end    
                end                
            endcase
    end   
               
    always @(cnt1) begin
         case(cnt1)
            1      : bcd1 = {4'b0001};
            2      : bcd1 = {4'b0010};
            3      : bcd1 = {4'b0011};
            4      : bcd1 = {4'b0100};
            5      : bcd1 = {4'b0101};
            6      : bcd1 = {4'b0110};
            7      : bcd1 = {4'b0111};
            8      : bcd1 = {4'b1000};
            9      : bcd1 = {4'b1001};
          default: bcd1 = {4'b0000};
       endcase
    end     
    
    always @(cnt2) begin
         case(cnt2)
            1      : bcd2 = {32'b0001};
            2      : bcd2 = {32'b0010};
            3      : bcd2 = {32'b0011};
            4      : bcd2 = {32'b0100};
            5      : bcd2 = {32'b0101};
          default: bcd2 = {32'b0000};
       endcase
    end    
    
    always @(cnt3) begin
         case(cnt3)
            1      : bcd3 = {4'b0001};
            2      : bcd3 = {4'b0010};
            3      : bcd3 = {4'b0011};
            4      : bcd3 = {4'b0100};
            5      : bcd3 = {4'b0101};
            6      : bcd3 = {4'b0110};
            7      : bcd3 = {4'b0111};
            8      : bcd3 = {4'b1000};
            9      : bcd3 = {4'b1001};
            default: bcd3 = {4'b0000};
       endcase
    end      
    
    always @(cnt4) begin
         case(cnt4)
            1      : bcd4 = {4'b0001};
            2      : bcd4 = {4'b0010};
            3      : bcd4 = {4'b0011};
            4      : bcd4 = {4'b0100};
            5      : bcd4 = {4'b0101};
            default: bcd4 = {4'b0000};
       endcase
    end    
    
    always @(cnt5) begin
         case(cnt5)
            1      : bcd5 = {4'b0001};
            2      : bcd5 = {4'b0010};
            3      : bcd5 = {4'b0011};
            4      : bcd5 = {4'b0100};
            5      : bcd5 = {4'b0101};
            6      : bcd5 = {4'b0110};
            7      : bcd5 = {4'b0111};
            8      : bcd5 = {4'b1000};
            9      : bcd5 = {4'b1001};
            default: bcd5 = {4'b0000};
       endcase
    end     
    
    always @(cnt6) begin
         case(cnt6)
            1      : bcd6 = {4'b0001};
            2      : bcd6 = {4'b0010};
            default: bcd6 = {4'b0000};
       endcase
    end     
endmodule

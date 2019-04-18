`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.11.2018 19:02:06
// Design Name: 
// Module Name: mux_2way
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


module mux_2way(
    input [1:0] CONTROL,
    input [3:0] IN1,
    input [3:0] IN2,
    output reg [3:0] OUT
    );
    
    always@(CONTROL or IN1 or IN2)
            begin
                case(CONTROL)
                    1'b0    : OUT <= IN1;
                    1'b1    : OUT <= IN2;                    
                    default : OUT <= 5'b00000;
                endcase
            end
endmodule

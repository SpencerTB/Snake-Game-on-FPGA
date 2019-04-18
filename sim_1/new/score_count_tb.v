`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.11.2018 19:38:34
// Design Name: 
// Module Name: score_count_tb
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


module score_count_tb(

    );
    
    reg CLK, RESET, TARGET_ATE;
    wire [1:0] STROBE_COUNT;
    wire [3:0] SCORE_COUNT;
   
    
    score_count uut(
        .CLK(CLK),
        .RESET(RESET),
        .TARGET_ATE(TARGET_ATE),
        .STROBE_COUNT(STROBE_COUNT),
        .SCORE_COUNT(SCORE_COUNT)
        );
        
    initial begin
        #100
        CLK = 0;
        forever #1 CLK = ~CLK;
        end
        
    initial begin
        #100
        RESET = 0;
        TARGET_ATE = 0;
        forever #100 TARGET_ATE = ~TARGET_ATE;
        end
        
endmodule

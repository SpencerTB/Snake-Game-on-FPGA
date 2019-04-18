`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.11.2018 22:19:17
// Design Name: 
// Module Name: msm_tb
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


module msm_tb(
    );
    reg CLK, RESET, LEFT, UP, DOWN, RIGHT;
    wire [1:0] M_STATE;
    reg [3:0] score;   
    
    master_sm uut2(
        .CLK(CLK),
        .RESET(RESET),
        .LEFT(LEFT),
        .RIGHT(RIGHT),
        .UP(UP),
        .DOWN(DOWN),
        .SCORE_COUNT(score),
        .STATE(M_STATE)
    );
    
    initial begin
        #100 CLK = 0;
        forever #2 CLK = ~CLK;
        
    end
    
    initial begin
        #100
        RESET = 0;
        score = 0;
        LEFT = 0;
        UP = 0;
        DOWN = 0;
        RIGHT = 0;
        #200
        LEFT = 1;
        #200
        LEFT = 0;
        #100
        score = 10;
    end
    
endmodule

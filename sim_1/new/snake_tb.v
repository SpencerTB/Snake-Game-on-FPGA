`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.11.2018 10:11:20
// Design Name: 
// Module Name: snake_tb
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


module snake_tb(

    );
    
    reg CLK, RESET, LEFT, RIGHT, UP, DOWN;
    wire [11:0] COLOUR_OUT;
    wire HS, VS;
    wire [3:0] SEG_SELECT_OUT;
    wire [7:0] HEX_OUT;
    
    top uut(
        .CLK(CLK),
        .RESET(RESET),
        .LEFT(LEFT),
        .RIGHT(RIGHT),
        .UP(UP),
        .DOWN(DOWN),
        .COLOUR_OUT(COLOUR_OUT),
        .HS(HS),
        .VS(VS),
        .SEG_SELECT_OUT(SEG_SELECT_OUT),
        .HEX_OUT(HEX_OUT)
        );
        
        
    initial begin
    #100
    CLK = 0;
    forever #2 CLK = ~CLK;
    end
    
    initial begin
    #100
    RESET = 0;
    LEFT = 0;
    UP = 0;
    DOWN = 0;
    RIGHT = 0;
    #100
    LEFT = 1;
    #100
    LEFT = 0;
    end
        
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.11.2018 20:10:08
// Design Name: 
// Module Name: rng_tb
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


module lfsr_tb(
    );
    
    reg CLK, RESET; 
    wire [7:0] OUT8;
    wire [6:0] OUT7;
    
    lfsr #(.NUM_BITS(8)) uut (
        .CLK(CLK),
        .RESET(RESET),
        .OUT(OUT8)
        );
    
    lfsr #(.NUM_BITS(7)) uut2 (
        .CLK(CLK),
        .RESET(RESET),
        .OUT(OUT7)
        );
        
initial begin
    CLK = 0;
    #100
    forever #10 CLK = ~CLK;    
    end

initial begin
    RESET = 0;
    #200
    RESET = 1;
    #100
    RESET = 0;
    end
    
endmodule

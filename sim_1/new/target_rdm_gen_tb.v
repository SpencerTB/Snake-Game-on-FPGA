`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.11.2018 12:48:57
// Design Name: 
// Module Name: target_rdm_gen_tb
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


module target_rdm_gen_tb(

    );
    
    reg CLK, RESET;
    reg TARGET_ATE;
    wire [14:0] RND_ADDR;
    
    target_rdm_gen uut(
        .CLK(CLK),
        .RESET(RESET),
        .TARGET_ATE(TARGET_ATE),
        .RND_ADDR(RND_ADDR)
        );
        
    initial begin
        #100
        CLK = 0;
        forever #10 CLK = ~CLK;
        end
        
    initial begin
    #100
    RESET = 0;
    TARGET_ATE = 1;
    #100
    RESET = 1;
    #100 
    RESET = 0;
    forever #100 TARGET_ATE = ~TARGET_ATE;
    end
        
        
endmodule

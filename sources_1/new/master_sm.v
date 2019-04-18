`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.11.2018 11:42:42
// Design Name: 
// Module Name: master_sm
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


module master_sm(
    input CLK,
    input RESET,
    input LEFT,
    input RIGHT,
    input UP,
    input DOWN,
    input [3:0] SCORE_COUNT,
    output [1:0] STATE
    );
    
    // Define parameter definitions for the states
        localparam [1:0] IDLE = 2'd0;
        localparam [1:0] PLAY = 2'd1;
        localparam [1:0] WIN  = 2'd2;
        
        
    // Declare current and next state variables
        reg [1:0] state_r, state_nxt;
        
    // Sequential block
        always@ (posedge CLK)
            begin: seq_pros
                if (RESET == 1'b1)
                    state_r <= IDLE;
                else    
                    state_r <= state_nxt; 
            end
            
    // Combinatorial block
        always@*
            begin: logic_pros
                
                case(state_r)
                    
                    IDLE:    
                    state_nxt = (LEFT == 1'b1 || RIGHT == 1'b1 ||
                                 UP   == 1'b1 || DOWN  == 1'b1)
                                 ? PLAY : IDLE;
                                        
                    PLAY:    
                    state_nxt = (SCORE_COUNT == 4'b1010) ? WIN : PLAY;
                    
                    WIN:     
                    state_nxt = WIN;
                    
                    default: 
                    state_nxt = IDLE;
                
                endcase
                
            end
            
        assign STATE = state_r;
    
endmodule

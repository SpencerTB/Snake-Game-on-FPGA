`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.11.2018 11:42:42
// Design Name: 
// Module Name: nav_sm
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


module nav_sm(
    input CLK,
    input RESET,
    input LEFT,
    input RIGHT,
    input UP,
    input DOWN,
    output [1:0] STATE
    );
    
    // Define parameter definitions for the states
        localparam [1:0] S_UP     = 2'd0;
        localparam [1:0] S_LEFT   = 2'd1;
        localparam [1:0] S_DOWN   = 2'd2;
        localparam [1:0] S_RIGHT  = 2'd3;
        
    // Declare current and next state variables
        reg [1:0] state_r, state_nxt;
                
    // Sequential block
        always@ (posedge CLK, negedge RESET)
            begin: seq_pros
                if (RESET == 1'b1)
                    state_r <= S_UP;
                else
                    state_r <= state_nxt; 
            end
            
    // Combinatorial block
        always@*
            begin: logic_pros
                
                case(state_r)
                    
                        S_UP:
                        begin
                            state_nxt = (LEFT  == 1'b1) ? S_LEFT  : ((RIGHT == 1'b1) ? S_RIGHT : S_UP);
                        end
                                                    
                        S_LEFT:
                        begin
                            state_nxt = (DOWN  == 1'b1) ? S_DOWN  : ((UP    == 1'b1) ? S_UP    : S_LEFT);
                        end
                        
                        S_DOWN:
                        begin
                            state_nxt = (LEFT  == 1'b1) ? S_LEFT  : ((RIGHT == 1'b1) ? S_RIGHT : S_DOWN);
                        end
                        
                        S_RIGHT:
                        begin
                            state_nxt = (DOWN  == 1'b1) ? S_DOWN  : ((UP    == 1'b1) ? S_UP    : S_RIGHT);
                        end
                        
                        default:
                        state_nxt = UP;
                        
                endcase    
                
                
            end
    assign STATE = state_r;

endmodule

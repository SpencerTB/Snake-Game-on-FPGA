`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.11.2018 11:42:42
// Design Name: 
// Module Name: top
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

module top(
    
    /*
        Inputs
    */
       
        // Board base CLK 100MHz (W5)
            input CLK,
        
        // Reset button (U18)
            input RESET,
            
        // Direction control buttons
            input LEFT,     //W19
            input RIGHT,    //T17
            input UP,       //T18
            input DOWN,     //U17
            
    /*
        Outputs
        
    */
        
        // Colour output for current pixel address
            output [11:0] COLOUR_OUT,
            
        // Horizontal and vertical sync
            output HS,
            output VS,
            
        // Selected display segment determined by strobe counter
        // and respective score count for said segement.
            output [3:0] SEG_SELECT_OUT,
            output [7:0] HEX_OUT
            
            );
    
    /*
        Declaration of approriate wires to connect
        all the inner modules together.
    */
    
        // 1 - snake has ate target, 0 - otherwise.
            wire        TARGET_ATE;  
            
        // Strobe count to determine which segment on 
        // the 7 seg display is to be used.
            wire [1:0]  STROBE_COUNT;  
            
        // Score is the current score on the 7
        // seg display.
            wire [3:0]  SCORE_COUNT; 
            
        // Current state in the master state machine,
        // IDLE, PLAY or WIN.
            wire [1:0]  M_STATE;
       
        // Current state in the navigation state machine,
        // UP, LEFT, DOWN or RIGHT (direction of the snake).
            wire [1:0]  N_STATE;
            
        // X and Y pixel address for the VGA controller, 
        // used to determine the colour output for applied pixel.
            wire [9:0]  X_ADDR;
            wire [8:0]  Y_ADDR;
            
        // Random pixel address for the targets random location.
        // {rnd_x, rnd_y} - concatenation of rnd x and y LFSR's.
            wire [14:0] RND_ADDR;
        
        // Colour input for the VGA controller, sent from the 
        // snake control module.
            wire [11:0] COLOUR_IN;
               
    /*
        Instatiation of all the inner modules
        
    */   
     
       // Master state machine:
       master_sm u_master_sm(
            .CLK(CLK),
            .RESET(RESET),
            .LEFT(LEFT),
            .RIGHT(RIGHT),
            .UP(UP),
            .DOWN(DOWN),
            .STATE(M_STATE)
            );
                     
       // Navigation state machine:
       nav_sm u_nav_sm(
            .CLK(CLK),
            .RESET(RESET),
            .LEFT(LEFT),
            .RIGHT(RIGHT),
            .UP(UP),
            .DOWN(DOWN),
            .STATE(N_STATE)
            );
              
       // Snake control
       snake_control u_snake_control(
            .CLK(CLK),
            .RESET(RESET),            
            .M_STATE(M_STATE),
            .N_STATE(N_STATE),
            .X_ADDR(X_ADDR),
            .Y_ADDR(Y_ADDR),
            .RND_ADDR(RND_ADDR),
            .COLOUR_IN(COLOUR_IN),
            .TARGET_ATE(TARGET_ATE)
            );
               
       // Score counter
       score_count u_score_count(
            .CLK(CLK),
            .RESET(RESET),  
            .TARGET_ATE(TARGET_ATE),
            .STROBE_COUNT(STROBE_COUNT),
            .SCORE_COUNT(SCORE_COUNT)
            );
                       
       // Target generator
       target_rdm_gen u_target_rdm_gen(
            .CLK(CLK),
            .RESET(RESET),  
            .TARGET_ATE(TARGET_ATE),
            .RND_ADDR(RND_ADDR)
            );
            
       // 7 segment display interface
       seg_7_disp u_seg_7_disp(
            .SEG_SELECT_IN(STROBE_COUNT),
            .BIN_IN(SCORE_COUNT),
            .DOT_IN(1'b0),
            .SEG_SELECT_OUT(SEG_SELECT_OUT),
            .HEX_OUT(HEX_OUT)
            );
            
       // VGA controller interface
       vga_controller u_vga_controller(
            .CLK(CLK),
            .M_STATE(M_STATE),
            .COLOUR_IN(COLOUR_IN),
            .X_ADDR(X_ADDR),
            .Y_ADDR(Y_ADDR),
            .HS(HS),
            .VS(VS),
            .COLOUR_OUT(COLOUR_OUT)
            );
       
    
endmodule

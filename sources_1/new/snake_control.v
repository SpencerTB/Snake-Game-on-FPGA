`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.11.2018 11:42:42
// Design Name: 
// Module Name: snake_control
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


module snake_control(
    input CLK,
    input RESET,
    input [1:0] M_STATE,
    input [1:0] N_STATE,
    input [9:0] X_ADDR,
    input [8:0] Y_ADDR,
    input [14:0] RND_ADDR,
    output reg [11:0] COLOUR_IN,
    output reg TARGET_ATE
    );
    
    reg [7:0] SNAKE_X [0: 11];
    reg [6:0] SNAKE_Y [0: 11];
    parameter MAX_Y = 119;
    parameter MAX_X = 159;
    
    wire TRIGGER;
    
    // 21-bit counter
        Generic_counter # (
            .COUNTER_WIDTH(21),
            .COUNTER_MAX(2000000)
            ) Bit17Counter (
            .CLK(CLK),
            .RESET(1'b0),
            .ENABLE(1'b1),
            .TRIG_OUT(TRIGGER)                     
            );
            

    
    // Changing the position of the snake registers
    // Shift the Snake State positions
    parameter LENGTH = 12;
    genvar PXL;
    generate
        for (PXL = 0; PXL < LENGTH - 1; PXL = PXL+1)
        begin: PXL_SHIFT
            always@(posedge CLK) 
                begin
                    if (RESET || M_STATE == 2'd0)
                        begin
                            SNAKE_X[PXL+1] <= 80;
                            SNAKE_Y[PXL+1] <= 100;
                        end
                    else if (TRIGGER)
                        begin
                            SNAKE_X[PXL+1] <= SNAKE_X[PXL];
                            SNAKE_Y[PXL+1] <= SNAKE_Y[PXL];
                            
                        end
                            
                end
         end       
    endgenerate
    
    wire SNAKE_HEAD;
    assign SNAKE_HEAD = (X_ADDR > SNAKE_X[0] && X_ADDR < (SNAKE_X[0]+10)) && 
                    (Y_ADDR > SNAKE_Y[0] && Y_ADDR < (SNAKE_Y[0]+10));
                                            
     
     integer PXL2;    
     reg SNAKE_BODY;
     reg found;
     always@(posedge CLK)
        begin
            found <= 0;
            for(PXL2 = 1; PXL2 < LENGTH; PXL2 = PXL2 + 1)
                begin
                    if(~found)
                        begin
                            SNAKE_BODY <= ((X_ADDR > SNAKE_X[PXL2+1] && X_ADDR < (SNAKE_X[PXL2+1]+10)) &&
                                   (Y_ADDR > SNAKE_Y[PXL2+1] && Y_ADDR < (SNAKE_Y[PXL2+1]+10)));
                            found = SNAKE_BODY;
                        end
                end
                              
        end
 

    // Replace top snake state with new one based on direction
    always@(posedge CLK)
        begin
            if (RESET) 
                begin
                    // set the initial state of the snake
                    SNAKE_X[0] <= 80;
                    SNAKE_Y[0] <= 100;
                end
            else if (TRIGGER) 
                begin
                    case (N_STATE)
                        
                        //UP
                        2'd0  :
                                begin
                                    if (SNAKE_Y[0] == 0)
                                        SNAKE_Y[0] <= MAX_Y;
                                    else
                                        SNAKE_Y[0] <= SNAKE_Y[0] - 1;
                                end
                        //LEFT
                        2'd1  :
                                begin
                                    if (SNAKE_X[0] == 0)
                                        SNAKE_X[0] <= MAX_X;
                                    else
                                        SNAKE_X[0] <= SNAKE_X[0] - 1;                            
                                end
                        //DOWN    
                        2'd2  :
                                begin
                                    if (SNAKE_Y[0] == MAX_Y)
                                        SNAKE_Y[0] <= 0;
                                    else
                                       SNAKE_Y[0] <= SNAKE_Y[0] + 1;
                                end
                        //RIGHT                       
                        2'd3  :
                                begin
                                    if (SNAKE_X[0] == MAX_X)
                                        SNAKE_X[0] <= 0;
                                    else
                                        SNAKE_X[0] <= SNAKE_X[0] + 1;                            
                                end  
                                
                         default:
                                SNAKE_X[0] <= SNAKE_X[0];
                    endcase
                end
        end
        
         // Target
                  
           reg TARGET_INX, TARGET_INY;
           wire TARGET;
           wire [7:0] RND_X = RND_ADDR[14:7];       //rnd gen x addr
           wire [6:0] RND_Y = RND_ADDR[6:0];
             
           always@(posedge CLK)
               begin
                    if(M_STATE == 2'd0)
                        begin
                            TARGET_INX <= (X_ADDR > 60 && X_ADDR < (60 + 10));
                            TARGET_INY <= (Y_ADDR > 50 && Y_ADDR < (50 + 10));
                        end
                    else
                        begin
                            TARGET_INX <= (X_ADDR > RND_X && X_ADDR < (RND_X + 10));
                            TARGET_INY <= (Y_ADDR > RND_Y && Y_ADDR < (RND_Y + 10));
                        end
               end      
                
           assign TARGET = TARGET_INX && TARGET_INY;
        
        // Determine if a target has been eaten
            
            // if the snakes head is at the target addr, TARGET_ATE = 1
            
            always@(posedge CLK) 
                begin
                    if (M_STATE == 2'd0)
                        TARGET_ATE <= 0;
                       
                    if (TARGET && SNAKE_HEAD)
                        TARGET_ATE <= 1;
                    else
                        TARGET_ATE <= 0;
                end
        
       
            
        // Colour to display when in the PLAY state
        
            wire [11:0] R, B, G, YE;
            assign R = 12'h00F;
            assign B = 12'h0F0;
            assign G = 12'hF00;
            assign YE = 12'hF0F;
            
            always@(posedge CLK)
                begin
                    if (SNAKE_HEAD)
                        COLOUR_IN <= YE;
                    else if (TARGET)
                        COLOUR_IN <= R;
                    else
                        COLOUR_IN <= B;
                end
            
       
        
      
endmodule

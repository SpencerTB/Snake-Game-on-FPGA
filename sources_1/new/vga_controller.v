`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.11.2018 17:28:47
// Design Name: 
// Module Name: vga_controller
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


module vga_controller(
    input CLK,
    input [1:0] M_STATE,
    input wire [11:0] COLOUR_IN,
    output wire [9:0] X_ADDR,
    output wire [8:0] Y_ADDR,
    output wire HS,
    output wire VS,
    output wire [11:0] COLOUR_OUT
    );
    
    
    //25 MHz pixel strobe (divide base clk by 4)
       reg [15:0] cnt = 16'd0;
       reg strobe;
       always @(posedge CLK)
            begin
                {strobe, cnt} <= cnt + 16'h4000;
            end
                       
    // Instantiate the 640x480 vga interface
        
        // Intermediate colour
            reg [11:0] COLOUR_INT = 12'h000;
    
        vga640x480 u_vga640x480(
            .CLK(strobe),
            .COLOUR_IN(COLOUR_INT),
            .X(X_ADDR),
            .Y(Y_ADDR),
            .COLOUR_OUT(COLOUR_OUT),
            .HS(HS),
            .VS(VS)
            );
        
    // Frame counter
        reg  [15:0] FRAME_COUNT = 0;
        always@(posedge CLK)
            begin
                if(Y_ADDR == 479)
                    FRAME_COUNT <= FRAME_COUNT + 1;                  
            end
            
    // Colour output depending on master state machine
        always@(posedge CLK)
            begin
                case(M_STATE)
                    
                    //IDLE - blue
                    2'd0    : 
                        COLOUR_INT <= 12'h0F0;
                        
                    //PLAY - input from snake control
                    2'd1    :
                        COLOUR_INT <= COLOUR_IN;
                        
                    //WIN
                    2'd2    :
                        // code from previous module
                        if (Y_ADDR[8:0] > 240) 
                            begin
                                if (X_ADDR[9:0] > 320)
                                    COLOUR_INT <= FRAME_COUNT[15:8] + Y_ADDR[7:0] +
                                        X_ADDR[7:0] - 240 - 320;
                                else
                                    COLOUR_INT <= FRAME_COUNT[15:8] + Y_ADDR[7:0] -
                                        X_ADDR[7:0] - 240 + 320;
                            end
                        else
                            begin
                                if (X_ADDR > 320)
                                    COLOUR_INT <= FRAME_COUNT[15:8] - Y_ADDR[7:0] +
                                        X_ADDR[7:0] + 240 - 320;
                                else 
                                    COLOUR_INT <= FRAME_COUNT[15:8] - Y_ADDR[7:0] -
                                        X_ADDR[7:0] + 240 + 320;                                      
                            end
                            
                endcase
            end
            
endmodule

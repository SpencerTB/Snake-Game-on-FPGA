`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.11.2018 10:34:21
// Design Name: 
// Module Name: lfsr
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


module lfsr(
    CLK,
    RESET,
    OUT
    );
    
    parameter NUM_BITS = 8;
    
    input CLK;
    input RESET;
    output [NUM_BITS-1:0] OUT;
    
    // Declare current state variable
    reg [NUM_BITS:1] LFSR_r = 0;
    reg XNOR_r;
    
    wire [NUM_BITS-1:1] one;    
    assign one = ~(LFSR_r && LFSR_r);
    
    // Sequential block
    always@(posedge CLK)
        begin
            if (RESET == 1'b1)
                LFSR_r <= ~one;
            else
                LFSR_r <= {LFSR_r[NUM_BITS-1:1], XNOR_r};
        end
    
    // Combinatorial block
    always@*
        begin
            case (NUM_BITS)
              
                7: XNOR_r = LFSR_r[7] ^ ~LFSR_r[6];
               
                8: XNOR_r = LFSR_r[8] ^ ~LFSR_r[6] ^ ~LFSR_r[5] ^ ~LFSR_r[4];
                
            endcase
        end
        
    assign OUT = LFSR_r[NUM_BITS:1];
    
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.11.2018 11:42:42
// Design Name: 
// Module Name: score_count
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


module score_count(
    input CLK,
    input RESET,
    input TARGET_ATE,
    output [1:0] STROBE_COUNT,
    output [3:0] SCORE_COUNT  
    );
    
    wire out_17bit_counter;
    wire [1:0] out_2bit_counter;
    wire TARGET_TRIGGER;
    and(TARGET_TRIGGER, out_17bit_counter, TARGET_ATE);
    wire out_4bit_counter_0;
    wire out_4bit_counter_1;
    wire [3:0] dec_count_1;
    wire [3:0] dec_count_2;
    wire [3:0] mux_out;
    /* 
        Instantiation of counters
    */
        // 17-bit counter
        Generic_counter # (
            .COUNTER_WIDTH(17),
            .COUNTER_MAX(99999)
            ) Bit17Counter (
            .CLK(CLK),
            .RESET(1'b0),
            .ENABLE(1'b1),
            .TRIG_OUT(out_17bit_counter)                     
            );
        
       
        
        
        // 2-bit strobe counter
        Generic_counter # (
            .COUNTER_WIDTH(2),
            .COUNTER_MAX(4)
            ) Bit2Counter (
            .CLK(CLK),
            .RESET(1'b0),
            .ENABLE(out_17bit_counter),
            .COUNT(out_2bit_counter)
            );       
        
       
        
        // initial 4-bit counter
        Generic_counter # (
            .COUNTER_WIDTH(4),
            .COUNTER_MAX(9)
            ) Bit4Counter0 (
            .CLK(CLK),
            .RESET(RESET),
            .ENABLE(TARGET_TRIGGER),
            .TRIG_OUT(out_4bit_counter_0)          
            );
        
        
        
        // 1st 4 bit couter
       Generic_counter # (
            .COUNTER_WIDTH(4),
            .COUNTER_MAX(9)
            ) Bit4Counter1 (
            .CLK(CLK),
            .RESET(RESET),
            .ENABLE(out_4bit_counter_0),
            .TRIG_OUT(out_4bit_counter_1),
            .COUNT(dec_count_1)
            );
            
        
                              
         // 2nd 4 bit couter
        Generic_counter # (
            .COUNTER_WIDTH(4),
            .COUNTER_MAX(9)
            ) Bit4Counter2 (
            .CLK(CLK),
            .RESET(RESET),
            .ENABLE(out_4bit_counter_1),
            .COUNT(dec_count_2)
            );
            
       
        
    // 2-way MUX
    mux_2way u_mux_2way(
        .CONTROL(out_2bit_counter),
        .IN1(dec_count_1),
        .IN2(dec_count_2),
        .OUT(mux_out)
        );
   
        
    // assignment of module outputs
    assign STROBE_COUNT = out_2bit_counter;
    assign SCORE_COUNT  = mux_out;
    

        
endmodule

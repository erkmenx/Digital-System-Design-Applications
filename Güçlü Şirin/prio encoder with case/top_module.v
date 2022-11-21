`timescale 1ns / 1ps

module top_module(
input [7:0] SW,
output [7:0] LED
    );
    
wire [3:0] SWITCHES;
wire [1:0] LEDS;
wire V;
    
assign SWITCHES = SW[3:0];
assign V = LED[7];
assign LED[6:2] = 0;
priority_encoder_case PRIO_CASE_ENCODER (.SW(SWITCHES),.LED(LED[1:0]),.V(V));


endmodule

`timescale 1ns / 1ps
`timescale 1ns / 1ps


module top_module(
input [7:0] SW,
output [7:0] LED
);
wire [3:0] SWITCHES ;
assign LED[6:2]=0;
wire V;
wire [1:0] OUT;
assign V = LED[7];
assign SWITCHES = SW[3:0];
assign OUT = LED[1:0];
Priority_Encoder PRIO_ENCODER (.SW(SWITCHES),.V(V), .OUT(LED[1:0]));
endmodule

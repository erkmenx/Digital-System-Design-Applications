`timescale 1ns / 1ps

module Priority_Encoder(
input [3:0] SW,
output [1:0] OUT,
output V    );

wire SW2not,LEDo2;
wire [2:0] LED;

assign OUT[1:0] = LED[1:0];
assign V = LED[2];

//LED0 o0
not(SW2not,SW[2]);
and(LEDo2,SW2not,SW[1]);
or(LED[0],LEDo2, SW[3]); 
//LED1 o1
or(LED[1], SW[3], SW[2]);
//(V)
or(LED[2],SW[3],SW[2],SW[1],SW[0]);
endmodule

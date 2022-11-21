`timescale 1ns / 1ps

module top_module(
input [7:0]SW,
input [3:0]BTN,
output [7:0] LED

    );
    
assign LED[7:4] = 0;

demux demux1 (.D(SW[0]),.S(BTN[1:0]),.OUT(LED[3:0]));
endmodule

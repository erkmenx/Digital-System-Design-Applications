`timescale 1ns / 1ps
module top_module(
input [7:0] SW,
input [3:0] BTN,
output [2:0] LED
    );
MUX_gates MUX2 (.D(SW[3:0]),.S(BTN[1:0]),.O(LED[0]));
assign LED[2:1] = 1'b0;
endmodule


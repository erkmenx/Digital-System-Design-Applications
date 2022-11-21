`timescale 1ns / 1ps

module top_module(
input [7:0] SW,         // Switches
//input [3:0] BTN,        // Buttons
output [7:0] LED,       // Leds
output [6:0] cat,       // Cathodes
output [3:0] an,        // Anodes
output dp               
    );

assign an[0] = 1'b0;
assign an[3:1] = 3'b111;    
    
DECODER decoder1(.IN(SW[3:0]),.OUT({dp,cat,LED}));


    
endmodule

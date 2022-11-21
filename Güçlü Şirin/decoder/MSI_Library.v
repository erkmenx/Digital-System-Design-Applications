`timescale 1ns / 1ps

 


module DECODER (
input [3:0] IN,
output reg [15:0] OUT
);

localparam SORRYBUTSHIFTED= 16'b0000_0000_0000_0001;

always @(IN)begin

case(IN)

4'b0000: OUT=   SORRYBUTSHIFTED;
4'b0001: OUT=   SORRYBUTSHIFTED<<1;
4'b0010: OUT=   SORRYBUTSHIFTED<<2;
4'b0011: OUT=   SORRYBUTSHIFTED<<3;
4'b0100: OUT=   SORRYBUTSHIFTED<<4;
4'b0101: OUT=   SORRYBUTSHIFTED<<5;
4'b0110: OUT=   SORRYBUTSHIFTED<<6;
4'b0111: OUT=   SORRYBUTSHIFTED<<7;
4'b1000: OUT=   SORRYBUTSHIFTED<<8;
4'b1001: OUT=   SORRYBUTSHIFTED<<9;
4'b1010: OUT=  SORRYBUTSHIFTED<<10;
4'b1011: OUT=  SORRYBUTSHIFTED<<11;
4'b1100: OUT=  SORRYBUTSHIFTED<<12;
4'b1101: OUT=  SORRYBUTSHIFTED<<13;
4'b1110: OUT=  SORRYBUTSHIFTED<<14;
4'b1111: OUT=  SORRYBUTSHIFTED<<15;
endcase
end



endmodule
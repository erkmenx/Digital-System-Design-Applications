`timescale 1ns / 1ps

module eightbitreg
(
    input [7:0] IN,
    input clk,
    input clear,
    output [7:0] OUT
);
reg [7:0] out_fake;

assign OUT = clear? 0:out_fake; 
always @(posedge clk) begin
if(!clear)
out_fake <= IN;
end

endmodule

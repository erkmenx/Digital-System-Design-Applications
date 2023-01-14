`timescale 1ns / 1ps

module eightbitreg_resetreg(
                                input [7:0] IN,
                                input clk,
                                input clear,
                                output reg [7:0] OUT

    );
    
always @(posedge clk or posedge clear)
begin
if(clear)
OUT <= 0;
else
OUT <= IN;
end
endmodule

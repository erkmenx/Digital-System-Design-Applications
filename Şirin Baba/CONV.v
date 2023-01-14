`timescale 1ns / 1ps

module CONV(
input clk,
input rst,
input [23:0] data,
input [23:0] weight,
output [7:0] result
    );
    
wire [19:0] MACresult;
MAC U1 (.data(data),.clk(clk),.rst(rst),.weight(weight),.resultout(MACresult));
MAC_Normalize U2 (.MACresult(MACresult),.normalized(result));

endmodule

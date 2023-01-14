`timescale 1ns / 1ps


module SHIFT(
input [7:0] A,
output reg [7:0] result
    );

always @(A) begin
result[7:1] <= A[6:0];
result[0] <= A[7];
end
endmodule

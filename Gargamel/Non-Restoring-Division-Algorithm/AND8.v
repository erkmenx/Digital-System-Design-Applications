`timescale 1ns / 1ps


module AND8(
input [7:0] A,
input [7:0] B,
output reg [7:0] result
    );
    
always @(A,B) begin
result <= A&B;
end
endmodule

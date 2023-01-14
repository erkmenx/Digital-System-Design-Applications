`timescale 1ns / 1ps

module ADD(
input [7:0] A,
input [7:0] B,
output reg [7:0] result,
output c
    );
    
reg [8:0] ADDITION;
wire [8:0] fakeA = {1'b0,A};
wire [8:0] fakeB = {B[7],B};
assign c = ADDITION[8];

always @(A,B) begin
result <= A+B;
ADDITION <= fakeA + fakeB;
end
endmodule

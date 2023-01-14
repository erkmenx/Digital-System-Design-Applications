`timescale 1ns / 1ps

module CONV128(
input clk,
input rst,
input [1039:0] data,
input [23:0] weight,
output [1023:0] result
);

genvar i;
generate
for(i=0;i<=127;i=i+1)
begin
CONV convgen (.data(data[23+(8*i):(8*i)]),.weight(weight),.clk(clk),.rst(rst),.result(result[7+(8*i):(8*i)]));
end
endgenerate


endmodule

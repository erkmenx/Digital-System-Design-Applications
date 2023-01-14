`timescale 1ns / 1ps


module MAC(
        input [23:0] data,
        input clk,
        input rst,
        input [23:0] weight,
        output reg signed [19:0] resultout
    );
    
wire signed [15:0] product0,product1;
wire signed [16:0] product2;
wire signed [16:0] sum0;
wire signed [17:0] sum1;
assign product2[16] = product2[15]? 1'b1:1'b0;
reg signed [19:0] result=0;
reg [1:0] count;
MULTB m1 (.A(data[7:0]),.B(weight[7:0]),.result(product0));
MULTB m2 (.A(data[15:8]),.B(weight[15:8]),.result(product1));
MULTB m3 (.A(data[23:16]),.B(weight[23:16]),.result(product2));

ADDB #(16) add1 (.A(product0),.B(product1),.result(sum0));
ADDB #(17) add2 (.A(sum0),.B(product2),.result(sum1));
always @(posedge clk or posedge rst) begin
    if(rst)
    begin
        count <=2'd0;
        result <=20'd0;
    end
    else
        begin
        count <= count+1;
        if(count == 1 || count == 2)
        result <= result + sum1;
        if(count == 3)
        begin
        resultout<=result + sum1;
        result<=20'd0;
        end
        end
    end
endmodule

`timescale 1ns / 1ps



module ADDB#(parameter SIZE=16)(
    input signed [(SIZE-1):0] A,
    input signed [(SIZE-1):0] B,
    output signed [SIZE:0] result
    );
assign result = A+B;
endmodule


module MULTB(
    input signed [7:0] A,
    input signed [7:0] B,
    output signed [15:0] result
    );
assign result = A*B;
endmodule

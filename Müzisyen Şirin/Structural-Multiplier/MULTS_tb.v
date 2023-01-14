`timescale 1ns / 1ps


module MULTS_tb;

reg [7:0] A;
reg [7:0] X;
reg[15:0] real_result;
wire [15:0] result;

MULTS dut (.A(A),.X(X),.result(result));
integer i;
initial begin
#10;

for (i=0;i<=20;i=i+1)
    begin
        A=7*i;
        X=11*i;
        real_result = A*X;
        #10;
        if(A*X == result)
        $display("%d * %d = %d ",A,X,real_result,"and result is %d ",result);
        else
        $display("Operation is wrong");
        
    end
end

endmodule

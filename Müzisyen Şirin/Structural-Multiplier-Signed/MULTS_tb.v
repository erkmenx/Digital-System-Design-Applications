`timescale 1ns / 1ps


module MULTS_tb;

reg signed [7:0] A;
reg signed [7:0] X;
reg signed [15:0] real_result;
wire signed [15:0] result;

MULTS_signed dut (.A(A),.X(X),.result(result));
integer i;
initial begin
#10;

for (i=0;i<=20;i=i+1)
    begin
        A=7*i;
        X=11*i;
        real_result = A*X;
        #10;
        if((A*X) == (result))
        $display("%d * %d = %d ",$signed(A),$signed(X),$signed(real_result),"and result is %d ",$signed(result));
        else
        $display("Operation is wrong");
        
    end
end

endmodule

`timescale 1ns / 1ps
module FSM1_tb;
reg clk = 0;
reg x;
wire z;
FSM1 fatihsultanmehmet (.clk(clk),.x(x),.z(z));
reg [41:0] x_in =42'h131C3C1F03F;
always begin
 #20;
 clk=~clk;
end
integer k;
initial begin
 x<=x_in[41];
 #20;
 for(k=40;k>= 0;k=k-1) begin
 x<=x_in[k];
 #40;
 end
 #20;
 $finish;
end
endmodule

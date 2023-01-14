`timescale 1ns / 1ps
module FSM1(
 input x,
 input clk,
 output reg z
 );

wire q2,q1,q0;
reg Q2;
reg Q1;
reg Q0;
wire zout;
assign q0 = !x | (Q1) | (Q0&!Q2);
assign q1 = (!x & !Q2 & Q0) | (!x & Q1 & Q0);
assign q2 = (Q1 & Q0) | (x&Q0) | (x & Q2 & Q1);
assign zout = ((x & !Q2&!Q1&!Q0) | (!x&Q2&Q1&Q0));
always @(posedge clk) begin
Q2<=q2;
Q1<=q1;
Q0<=q0;
z <=zout;
end
endmodule

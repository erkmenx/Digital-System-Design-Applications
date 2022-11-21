`timescale 1ns / 1ps
module arithmetic_circuits(
input [3:0] x,
input [3:0] y,
input cin,
output cout,
output [3:0] sum
    );
RCA RCA1 (.x(x),.y(y),.cin(cin),.sum(sum),.cout(cout));     
endmodule


module HA (
input x,
input y,
output cout,
output sum
);
assign sum = ((~x)&&y) || (x&&(~y));
assign cout = x&&y;
endmodule

module FA (
input x,
input y,
input cin,
output cout,
output sum);
wire sum1;
wire cout1;
wire sum2;
wire cout2;
HA HA1 (.x(x),.y(y),.sum(sum1),.cout(cout1));
HA HA2 (.x(sum1),.y(cin),.sum(sum2),.cout(cout2));
assign sum = sum2;
assign cout = cout2 || cout1;
endmodule


module RCA (
input [3:0] x,
input [3:0] y,
input cin,
output [3:0] sum,
output cout
);
wire cout1,cout2,cout3;
FA FA1 (.x(x[0]),.y(y[0]),.cin(cin),.sum(sum[0]),.cout(cout1));
FA FA2 (.x(x[1]),.y(y[1]),.cin(cout1),.sum(sum[1]),.cout(cout2));
FA FA3 (.x(x[2]),.y(y[2]),.cin(cout2),.sum(sum[2]),.cout(cout3));
FA FA4 (.x(x[3]),.y(y[3]),.cin(cout3),.sum(sum[3]),.cout(cout));
endmodule
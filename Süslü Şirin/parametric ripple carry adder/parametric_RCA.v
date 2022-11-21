`timescale 1ns / 1ps
module parametric_RCA
#(parameter SIZE = 8)(
input [(SIZE-1):0] x,
input [(SIZE-1):0] y,
input cin,
output cout,
output [(SIZE-1):0] sum);

genvar i;
wire [(SIZE-1):0] cout_inside;
assign cout = cout_inside[SIZE-1];
generate
for (i=0;i<SIZE;i=i+1)
    begin
    if(i==0)
    FA u0 (.x(x[i]),.y(y[i]),.cin(cin),.sum(sum[i]),.cout(cout_inside[i]));
    else
    FA u1 (.x(x[i]),.y(y[i]),.cin(cout_inside[i-1]),.sum(sum[i]),.cout(cout_inside[i]));
    end
endgenerate
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

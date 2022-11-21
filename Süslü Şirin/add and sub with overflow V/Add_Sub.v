`timescale 1ns / 1ps

module Add_Sub(
input [3:0] x,
input [3:0] y,
input cin,
output cout,
output v,
output [3:0] sum
    );
    
wire [3:0] y_n;
wire [3:0] c_inside;
assign y_n = y^{4{cin}};
assign cout = c_inside[3];
assign v = c_inside[3]^c_inside[2];

FA FA1 (.x(x[0]),.y(y_n[0]),.cin(cin),.cout(c_inside[0]),.sum(sum[0]));
FA FA2 (.x(x[1]),.y(y_n[1]),.cin(c_inside[0]),.cout(c_inside[1]),.sum(sum[1]));
FA FA3 (.x(x[2]),.y(y_n[2]),.cin(c_inside[1]),.cout(c_inside[2]),.sum(sum[2]));
FA FA4 (.x(x[3]),.y(y_n[3]),.cin(c_inside[2]),.cout(c_inside[3]),.sum(sum[3]));

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

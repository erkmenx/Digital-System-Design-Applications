`timescale 1ns / 1ps
module arithmetic_circuits(
input x,
input y,
input cin,
output cout,
output sum
    );
FA FA1 (.x(x),.y(y),.cin(cin),.sum(sum),.cout(cout));     
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
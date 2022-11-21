`timescale 1ns / 1ps

module CLA_tb;


reg [3:0] x;
reg [3:0] y;
reg cin;
wire cout;
wire [3:0] sum;
wire [4:0] totalsum;
assign totalsum = {cout,sum};

CLA Y1 (.x(x),.y(y),.cin(cin),.cout(cout),.sum(sum));

initial begin

x= 4'd10;
y = 4'd15;
cin = 1;
#20;
x= 4'd11;
y = 4'd14;
cin = 0;
#20;
x= 4'd8;
y = 4'd4;
cin = 0;
#20;
x= 4'd5;
y = 4'd9;
cin = 1;
#20;
$finish;
end
endmodule

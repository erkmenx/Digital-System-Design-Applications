`timescale 1ns / 1ps

module parametric_RCA_tb;
localparam SIZE = 8;
reg [(SIZE-1):0] x;
reg [(SIZE-1):0] y;
reg cin;
wire cout;
wire [(SIZE-1):0] sum;
wire [SIZE:0] total_sum;

assign total_sum = {cout,sum};

parametric_RCA #(.SIZE(SIZE)) U0 (.x(x),.y(y),.cin(cin),.cout(cout),.sum(sum));



initial begin
x=8'd217;
y=8'd65;
cin=0;
#20;
x=8'd200;
y=8'd150;
cin=0;
#20;
x=8'd110;
y=8'd221;
cin=1;
#20;
x=8'd249;
y=8'd107;
cin=1;
#20;
$finish;
end
endmodule

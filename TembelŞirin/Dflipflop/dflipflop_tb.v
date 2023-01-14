`timescale 1ns / 1ps


module dflipflop_tb;

reg D;
reg clk;
wire q;
wire qn;


dflipflop DUT (.D(D),.clk(clk),.q(q),.qn(qn));

initial begin
D=1;
clk=0;
#20;
D=1;
clk=1;
#20;
clk=0;
D=0;
#20;
clk=0;
D=1;
#20;
clk=1;
D=0;
#20;
clk=1;
D=1;
#20;
$finish;

end
endmodule

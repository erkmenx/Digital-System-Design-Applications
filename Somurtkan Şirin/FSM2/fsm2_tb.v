`timescale 1ns / 1ps
module FSM2_tb;


reg clk=0;
reg x;
wire z;


FSM2 fatihsultanmehmet1 (.clk(clk),.x(x),.z(z));

always begin
#10;
clk = ~clk;
end


initial begin
#5
x=0;#15;
x=1;#20;
x=0;#20;
x=0;#20;
x=1;#20;
x=1;#20;
x=0;#20;
x=0;#20;
x=0;#20;
x=1;#20;
x=1;#20;
x=1;#20;
x=0;#20;
x=0;#20;
x=0;#20;
x=0;#20;
x=1;#20;
x=1;#20;
x=1;#20;
x=1;#20;
x=0;#20;
x=0;#20;
x=0;#20;
x=0;#20;
x=0;#20;
x=1;#20;
x=1;#20;
x=1;#20;
x=1;#20;
x=1;#20;
x=0;#20;
x=0;#20;
x=0;#20;
x=0;#20;
x=0;#20;
x=0;#20;
x=1;#20;
x=1;#20;
x=1;#20;
x=1;#20;
x=1;#20;
x=1;#20;






end
endmodule
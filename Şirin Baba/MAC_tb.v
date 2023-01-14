`timescale 1ns / 1ps


module MAC_tb;

reg [23:0] data;
reg clk=0;
reg rst=1;
reg signed [23:0] weight;
wire signed [19:0] result;

MAC dut (.clk(clk),.data(data),.rst(rst),.weight(weight),.resultout(result));

always begin
#10;
clk = ~clk;
end 

reg [1:0] counter =0;
initial begin
rst=1;

#60;
rst=0;
#10;
data = 24'b0000_0000__0000_0100__0000_0000; // 040
weight = 24'b11111111__11111111__11111111; // -1 -1 -1 
#20;
data = 24'b0000_0001__0000_0111__0000_0000; // 170
weight = 24'b11111111__0000_1000__11111111; // -1 8 -1
$display("Counter: ", counter, " and result1 is: ", result);
#20;
data = 24'b0000_0000__0000_0100__0000_1001; // 049
weight = 24'b11111111__11111111__11111111; // -1 -1 -1
#15;
$display("Counter: ", counter, " and result1 is: ", result);
#5;
data = 24'b0000_0001__0000_0111__0000_0000; // 170
weight = 24'b11111111__0000_1000__11111111; // -1 8 -1
#15;
$display("Counter: ", counter, " and result2 is: ", result);
data = 24'b0000_0001__0000_0111__0000_0000; // 170
weight = 24'b11111111__0000_1000__11111111; // -1 8 -1

#100;
$finish;
end
endmodule

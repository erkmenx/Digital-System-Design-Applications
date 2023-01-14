`timescale 1ns / 1ps

module TOP_tb;

reg [7:0] InA;
reg [7:0] InB;
reg clk = 0;
reg rst=0;
reg Start =0;
wire [7:0] Out_Q,Out_R;
wire Busy;
TOP DUT    (.clk(clk),
            .rst(rst),
            .Start(Start),
            .Out_Q(Out_Q),
            .Out_R(Out_R),
            .Busy(Busy),
            .InA(InA),
            .InB(InB));

always begin
#10;
clk <= ~clk;
end     
         

initial begin
rst=1;
InA = 8'b1111_1111;
InB = 8'b0000_1111;
#100;
rst=0;
#100;
Start=1;
#20;
Start=0;
#15000;
InA = 8'b1000_0011;
InB = 8'b0000_0010;
#20;
Start=1;
#20;
Start=0;
#15000;
InA = 8'b1010_0101;
InB = 8'b0000_0111;
#20;
Start=1;
#20;
Start=0;
#15000;
InA = 8'b1111_1100;
InB = 8'b0000_0111;
#20;
Start=1;
#20;
Start=0;
#15000;
InA = 8'b0101_0101;
InB = 8'b0000_0111;
#20;
Start=1;
#20;
Start=0;
#15000;
InA = 8'b1011_1111;
InB = 8'b0000_1100;
#20;
Start=1;
#20;
Start=0;
end
endmodule

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
InA = 8'b0101_0101;
InB = 8'b0000_0101;
#100;
rst=0;
#100;
Start=1;
#20;
Start=0;
#15000;
InA = 8'b1000_0101;
InB = 8'b0001_0101;
#20;
Start=1;
#20;
Start=0;
#15000;
InA = 8'b1010_0101;
InB = 8'b0000_0011;
#20;
Start=1;
#20;
Start=0;
#15000;
InA = 8'b1000_0011;
InB = 8'b0000_1111;
#20;
Start=1;
#20;
Start=0;
#15000;
InA = 8'b1111_1111;
InB = 8'b0000_0101;
#20;
Start=1;
#20;
Start=0;
#35000;
InA = 8'b1001_1001;
InB = 8'b0000_1110;
#20;
Start=1;
#20;
Start=0;
end
endmodule

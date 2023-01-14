`timescale 1ns / 1ps
module eightbitreg_tb;


reg [7:0] IN;
reg clk=0;
reg clear;
wire [7:0] OUT;

eightbitreg DUT (
                .IN(IN),
                .clk(clk),
                .clear(clear),
                .OUT(OUT)
                );

always begin
clk = ~clk;
#10;
end

initial begin

IN = 8'b0000_0000;
clear = 0;
#20;
IN = 8'b1010_1010;
#20;
IN = 8'b1111_1111;
#10;
clear = 1;
#20;
clear=0;
#20;
$finish;
end



endmodule

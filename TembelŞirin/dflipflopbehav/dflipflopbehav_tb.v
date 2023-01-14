`timescale 1ns / 1ps


module dflipflopbehav_tb;

reg D;
reg clk=0;
wire Q;
wire Qn;


dflipflopbehav DUT (.D(D),.clk(clk),.Q(Q),.Qn(Qn));
always begin
clk = ~clk;
#10;
end


initial begin
#50;
D=1;
#200;
D=0;
#100;
D=1;
#5;
D=0;
#5;


end
endmodule

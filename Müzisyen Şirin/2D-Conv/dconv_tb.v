`timescale 1ns / 1ps


module dconv_tb;

reg clk=0;
reg [39:0] data;
reg signed [23:0] KERNEL;
reg reset = 0;
always begin
#10;
clk = ~clk;
end

dconv CONV2D (.data(data),.rst(reset),.KERNEL(KERNEL),.clk(clk));


initial begin
reset = 1;
#100;
KERNEL = 24'b1111_1111_1111_1111_1111_1111;
data = 40'h7D7D7D7D7D;
#100;
reset = 0;
#15;
KERNEL = 24'b1111_1111_0000_1000_1111_1111;
data = 40'h00007D0000;
#5;
#15;
KERNEL = 24'b1111_1111_1111_1111_1111_1111;
data = 40'h00007D0000;
#20;
data = 40'h00007D0000;
#20;
#5;
data = 40'h00005E0000;
#100;
#10;



end
endmodule

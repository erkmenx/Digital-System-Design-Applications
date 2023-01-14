`timescale 1ns / 1ps

module fsm3_tb;

reg clk=0;
reg x;
wire z;

FSM3 fatihsultanmehmet (.clk(clk),.x(x),.z(z));
reg [41:0] x_in =42'b00_0101_101_0010_0000_010110_0011_1000_0101_1000_11000;
always begin
    #20;
    clk=~clk;
end
integer k;
initial begin
    x<=x_in[41];
    #15;
    for(k=40;k>= 0;k=k-1) begin
        x<=x_in[k];
        #40;
    end
    #20;
    $finish;
end
endmodule

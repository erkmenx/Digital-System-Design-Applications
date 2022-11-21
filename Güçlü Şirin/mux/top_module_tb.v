`timescale 1ns / 1ps
module top_module_tb();


reg [7:0] SW;
reg [3:0] BTN;
wire [2:0] LED;


top_module TOPMUX (.SW(SW),.BTN(BTN),.LED(LED));



initial begin

SW = 8'b0000_1010;
BTN = 4'b0000;
#10
BTN = 4'b0001;
#10
BTN = 4'b0010;
#10
BTN = 4'b0011;



end
endmodule

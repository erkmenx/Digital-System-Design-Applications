`timescale 1ns / 1ps

module demux_tb();

reg [7:0] SW;
reg [3:0] BTN;
wire [7:0] LED;

top_module TOP (.SW(SW),.BTN(BTN),.LED(LED));


initial begin


SW = 8'b0000_0000;
#10;
BTN = 4'b0000;
#10;
BTN = 4'b0001;
#10;
BTN = 4'b0010;
#10;
BTN = 4'b0011;
#10;
BTN= 4'b0000;
SW = 8'b0000_0001;
#10;
BTN = 4'b0001;
#10;
BTN = 4'b0010;
#10;
BTN = 4'b0011;
#10;
end
endmodule

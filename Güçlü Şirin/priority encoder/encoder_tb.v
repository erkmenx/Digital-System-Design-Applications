`timescale 1ns / 1ps

module encoder_tb();

reg [7:0] SW;
wire [2:0] LED;
top_module PRIO(.SW(SW),.LED(LED));



initial begin

SW = 8'bxxxx_0000;
#10;
SW = 8'bxxxx_001x;
#10;
SW = 8'bxxx_01xx;
#10;
SW = 8'bxxxx_1xxx;
#10;

end
endmodule

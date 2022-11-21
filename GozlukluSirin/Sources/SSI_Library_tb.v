`timescale 1ns / 1ps

module SSI_Library_tb;
reg [14:0] IN;
wire [7:0] OUT;

wire OUT_and;
wire OUT_or;
wire OUT_not;
wire OUT_nand;
wire OUT_nor;
wire OUT_xor;
wire OUT_xnor;
wire OUT_TRI;

wire [1:0] IN_and = IN[1:0];
wire [1:0] IN_or = IN[3:2];
wire IN_not = IN[4];
wire [1:0] IN_nand = IN[6:5];
wire [1:0] IN_nor = IN[8:7];
wire [1:0] IN_xor = IN[10:9];
wire [1:0] IN_xnor = IN[12:11];
wire [1:0] IN_TRI = IN[14:13];
assign OUT_and = OUT[0];
assign OUT_or = OUT[1];
assign OUT_not = OUT[2];
assign OUT_nand = OUT[3];
assign OUT_nor = OUT[4];
assign OUT_xor = OUT[5];
assign OUT_xnor = OUT[6];
assign OUT_TRI = OUT[7];


top_module TOP (.IN(IN),.OUT(OUT));
initial begin
IN = 15'b00_00_00_00_00_0_00_00;
#10;
IN = 15'b01_01_01_01_01_1_01_01;
#10;
IN = 15'b10_10_10_10_10_0_10_10;
#10;
IN = 15'b11_11_11_11_11_1_11_11;
end          
endmodule

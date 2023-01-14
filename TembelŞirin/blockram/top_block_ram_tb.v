`timescale 1ns / 1ps

module top_block_ram_tb;

reg clk=0;
reg wea;
reg [3:0] addra;
wire [7:0] douta;

lastmodule DUT (
                    .clk(clk),
                    .wea(wea),
                    .addra(addra),
                    .douta(douta)
                    );
                    

always begin
clk = ~clk;
#5;
end 

initial begin
#20;
addra = 4'd0; #20;
addra = 4'd1; #20;
addra = 4'd2; #20;
addra = 4'd3; #20;
addra = 4'd4; #20;
addra = 4'd5; #20;
addra = 4'd6; #20;
addra = 4'd7; #20;
addra = 4'd8; #20;
addra = 4'd9; #20;
addra = 4'd10; #20;
addra = 4'd11; #20;
addra = 4'd12; #20;
addra = 4'd13; #20;
addra = 4'd14; #20;
addra = 4'd15; #20;
#20;
wea=1;
#640;
wea=0;
#20;
addra = 4'd0; #20;
addra = 4'd1; #20;
addra = 4'd2; #20;
addra = 4'd3; #20;
addra = 4'd4; #20;
addra = 4'd5; #20;
addra = 4'd6; #20;
addra = 4'd7; #20;
addra = 4'd8; #20;
addra = 4'd9; #20;
addra = 4'd10; #20;
addra = 4'd11; #20;
addra = 4'd12; #20;
addra = 4'd13; #20;
addra = 4'd14; #20;
addra = 4'd15; #20;
end                   

endmodule

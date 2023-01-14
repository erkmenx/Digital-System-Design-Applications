`timescale 1ns / 1ps

module Register(
input [7:0] Rin,
input En,
input clk,
input rst,
output reg [7:0] Rout
    );
    

always @(posedge clk or posedge rst) begin
    if(rst)
        Rout <= 8'd0;
    else
    begin
        if(En)
            begin
            Rout <= Rin;
            end
    end
end
endmodule

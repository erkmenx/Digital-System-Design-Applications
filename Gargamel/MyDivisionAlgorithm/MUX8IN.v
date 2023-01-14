`timescale 1ns / 1ps


module MUX8IN(
input [7:0] andresult,exorresult,shiftresult,addresult,
input [1:0] InsSel,
output reg [7:0] ALUout
    );
    
always @(*) begin

case(InsSel)
0: ALUout <= andresult;
1: ALUout <= exorresult;
2: ALUout <= addresult;
3: ALUout <= shiftresult;
endcase

end
endmodule

`timescale 1ns / 1ps

module ALU(
input [7:0] ALUinA,
input [7:0] ALUinB,
input [1:0] InsSel,
output [7:0] ALUout,
output CO,
output reg Z
    );
wire [7:0] addresult, exorresult,shiftresult,andresult;
wire cadder;

ADD ADDER (.A(ALUinA),.B(ALUinB),.result(addresult),.c(cadder));

AND8 AND (.A(ALUinA),.B(ALUinB),.result(andresult));

EXOR XOR (.A(ALUinA),.B(ALUinB),.result(exorresult));

SHIFT SHIFTER (.A(ALUinA),.result(shiftresult));

MUX8IN ALUOUT (.addresult(addresult),
                .exorresult(exorresult),
                .shiftresult(shiftresult),
                .andresult(andresult),
                .InsSel(InsSel),
                .ALUout(ALUout));
                
MUX1IN COUT (.addcout(cadder),
             .shiftr0(shiftresult[0]),
             .InsSel(InsSel),
             .CO(CO));

always @(*) begin

if(ALUout == 8'd0)
Z<=1;
else
Z<=0;

end
endmodule

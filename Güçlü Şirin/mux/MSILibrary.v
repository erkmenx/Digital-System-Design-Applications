`timescale 1ns / 1ps

module MUX(
input [3:0] D,
input [1:0] S,
output reg O
    );
    
    
always @(S,D) begin

case(S)

2'b00: O = D[0];
2'b01: O = D[1];
2'b10: O = D[2];
2'b11: O = D[3];

endcase


end    
    
endmodule

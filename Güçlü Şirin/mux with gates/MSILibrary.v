`timescale 1ns / 1ps

module MUX_gates(
input [3:0] D,
input [1:0] S,
output O
    );
    
assign O = ((~S[1])&(~S[0])&(D[0])) || ((~S[1])&S[0]&D[1]) || (S[1]&(~S[0])&D[2]) || (S[1]&S[0]&D[3]);
  
endmodule

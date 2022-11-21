`timescale 1ns / 1ps
module CLA(
input [3:0] x,
input [3:0] y,
input cin,
output cout,
output [3:0] sum
    );

// P = x^y
// G = x&y
// Digital Design book expressions:
// Si = Pi ^^ Ci
// Ci+1 = Gi + PiCi 

// C1 = G0 + P0Cin
// C2 = G1 + P1(G0+P0Cin)
// C3 = G2 + P2(G1+(P1(G0+P0Cin)))
// C4 = G3 + P3(G2 + P2(G1+(P1(G0+P0Cin))))
wire [3:0] p,g,c;
assign p = x^y; 
assign g = x&y;
assign c[0] = cin;
assign c[1] = g[0] | (p[0]&cin);
assign c[2] = g[1] | (p[1]&(g[0] | (p[0]&cin)));
assign c[3] = g[2] | (p[2]&(g[1] | (p[1]&(g[0] | (p[0]&cin)))));
assign cout = g[3] | (p[3]& (g[2] | (p[2]&(g[1] | (p[1]&(g[0] | (p[0]&cin)))))));
assign sum = p^c;

endmodule

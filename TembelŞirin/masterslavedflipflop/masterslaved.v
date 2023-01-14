`timescale 1ns / 1ps

module masterslaved(
                    input D,
                    input clk,
                    output q,
                    output qn
);
wire qm;
wire qm_n;
wire clk_n;
wire qs;
wire qs_n;

assign q = qs;
assign qn = qs_n;
not_gate not1 (.I(clk),.O(clk_n));
dflipflop MASTER (.D(D),.clk(clk),.q(qm),.qn(qm_n));
dflipflop SLAVE (.D(qm),.clk(clk_n),.q(qs),.qn(qs_n));
endmodule

`timescale 1ns / 1ps
module dflipflop(
                    input D,
                    input clk,
                    output q,
                    output qn
    );  
wire dnot;
wire q_b;
wire qn_b;
not_gate n1 (.I(D),.O(dnot));
nand_gate n2(.I1(dnot),.I2(clk),.O(qn_b));
nand_gate n3(.I1(q),.I2(qn_b),.O(qn));
nand_gate n4(.I1(D),.I2(clk),.O(q_b));
nand_gate n5(.I1(q_b),.I2(qn),.O(q));
endmodule



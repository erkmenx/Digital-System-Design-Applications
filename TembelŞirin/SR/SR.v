`timescale 1ns / 1ps
module SR(
        input s,
        input r,
        output q,
        output qn
    );
wire q_fake;
wire qn_fake;
assign q_fake = q;
assign qn_fake = qn;    
nand_gate NAND1 (.I1(s),.I2(qn_fake),.O(q));
nand_gate NAND2 (.I1(r),.I2(q_fake),.O(qn));
endmodule

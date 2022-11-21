`timescale 1ns / 1ps

module top_module(
    input [14:0] IN,
    output [7:0] OUT

    );
    
    
and_gate AND_GATE (.I1(IN[0]),.I2(IN[1]),.O(OUT[0]));
or_gate OR_GATE (.I1(IN[2]),.I2(IN[3]),.O(OUT[1]));
not_gate NOT_GATE_I1 (.I(IN[4]),.O(OUT[2]));
nand_gate NAND_GATE (.I1(IN[5]),.I2(IN[6]),.O(OUT[3]));
nor_gate NOR_GATE (.I1(IN[7]),.I2(IN[8]),.O(OUT[4]));
xor_gate XOR_GATE (.I1(IN[9]),.I2(IN[10]),.O(OUT[5]));
xnor_gate XNOR_GATE (.I1(IN[11]),.I2(IN[12]),.O(OUT[6]));
TRI TRI_MODULE (.I(IN[13]),.E(IN[14]),.O(OUT[7]));
endmodule
`timescale 1ns / 1ps

module with_mux(
input a,b,c,d,
output f3,f2,f1,f0
    );
    

wire bd;
wire b_not;
wire d_not;

//f0
and_gate AND1(.I1(b),.I2(d),.O(bd));
MUX MUX_f0(.D({bd,bd,bd,bd}),.S({a,c}),.O(f0));

//f1
wire xorf1;
xor_gate XOR1 (.I1(b),.I2(d),.O(xorf1));
MUX MUX_f1(.D({xorf1,d,b,1'b0}),.S({a,c}),.O(f1));
//f2
wire bdnot;
wire bnotorbdnot;
not_gate NOT1(.I(b),.O(b_not));
not_gate NOT2(.I(d),.O(d_not));
and_gate AND2 (.I1(b),.I2(d_not),.O(bdnot));
or_gate OR1 (.I1(bdnot), .I2(b_not),.O(bnotorbdnot));
MUX MUX_f2(.D({bnotorbdnot,1'b0,1'b0,1'b0}),.S({a,c}),.O(f2));
//f3

MUX MUX_f3 (.D({bd,1'b0,1'b0,1'b0}),.S({a,c}),.O(f3));


endmodule

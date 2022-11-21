`timescale 1ns / 1ps


module demux(
input D,
input [1:0] S,
output [3:0] OUT
    );

wire controller0,controller1,controller2,controller3;
wire S0not,S1not;

not_gate not1 (.I(S[0]),.O(S0not));
not_gate not2 (.I(S[1]),.O(S1not));

and_gate and1 (.I1(S1not),.I2(S0not),.O(controller0));
and_gate and2 (.I1(S1not),.I2(S[0]),.O(controller1));
and_gate and3 (.I1(S[1]),.I2(S0not),.O(controller2));
and_gate and4 (.I1(S[1]),.I2(S[0]),.O(controller3));
    
TRI TRI1 (.E(controller0),.I(D),.O(OUT[0]));
TRI TRI2 (.E(controller1),.I(D),.O(OUT[1]));
TRI TRI3 (.E(controller2),.I(D),.O(OUT[2]));
TRI TRI4 (.E(controller3),.I(D),.O(OUT[3]));
endmodule

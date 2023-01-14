`timescale 1ns / 1ps

module FSM2(

    input clk,
    input x,
    output reg z

    );

// Figure 1 next state things  
wire Q1_f1,Q0_f1;
reg q1_f1=1; 
reg q0_f1=0; 
// Figure 2 next state things
wire Q_f2,a;
reg q_f2=1;

// Figure 1
assign Q1_f1 = a & q0_f1;
assign Q0_f1= a;
assign zn = a&q1_f1;
// Figure 2
assign a = (!x & q_f2) | (x & !q_f2);
assign Q_f2 = !x;

always @(posedge clk) begin
q_f2 <= Q_f2;
q1_f1 <= Q1_f1;
q0_f1 <= Q0_f1;
z <= zn;
end
endmodule

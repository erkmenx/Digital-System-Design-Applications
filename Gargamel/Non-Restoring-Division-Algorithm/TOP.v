`timescale 1ns / 1ps


module TOP(
    input clk,
    input rst,
    input Start,
    input [7:0] InA,
    input [7:0] InB,
    output [7:0] Out_Q,
    output [7:0] Out_R,
    output Busy
    );
    
wire [7:0] CUconst;
wire [2:0] InMuxAdd;
wire [3:0] OutMuxAdd;
wire [3:0] RegAdd;
wire WE;
wire [1:0] InsSel;
wire CO;
wire Z;
wire [7:0] ALUinA;
wire [7:0] ALUinB;
wire [7:0] ALUout;  

 
CU CONTROL_UNIT (.clk(clk),                 
                .rst(rst),                 
                .Start(Start),               
                .Busy(Busy),           
                .CUconst(CUconst),  
                .InMuxAdd(InMuxAdd), 
                .OutMuxAdd(OutMuxAdd),
                .RegAdd(RegAdd),   
                .WE(WE),             
                .InsSel(InsSel),   
                .CO(CO),                  
                .Z(Z));

RB REGISTERBLOCK (.clk(clk),
                  .rst(rst),
                  .InMuxAdd(InMuxAdd),
                  .InA(InA),
                  .InB(InB),
                  .CUconst(CUconst),
                  .ALUout(ALUout),
                  .WE(WE),
                  .RegAdd(RegAdd),
                  .ALUinA(ALUinA),
                  .ALUinB(ALUinB),
                  .Out_Q(Out_Q),
                  .Out_R(Out_R),
                  .OutMuxAdd(OutMuxAdd));
                  
ALU LOGICUNIT ( .ALUinA(ALUinA),
                .ALUinB(ALUinB),
                .InsSel(InsSel),
                .ALUout(ALUout),
                .CO(CO),
                .Z(Z)
                );
endmodule

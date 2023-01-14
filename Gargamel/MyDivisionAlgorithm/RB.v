`timescale 1ns / 1ps


module RB(

input clk,
input rst,
//
input [2:0] InMuxAdd,
input [7:0] InA,
input [7:0] InB,
input [7:0] CUconst,
input [7:0] ALUout,
// 
input WE,
input [3:0] RegAdd,
//
output [7:0] ALUinA,
output [7:0] ALUinB,
output [7:0] Out_Q,
output [7:0] Out_R,
input [3:0] OutMuxAdd
    );


wire [15:0] En;
wire [7:0] Rout [15:0];
wire [7:0] RegOut;
wire [7:0] Rin;

//  Input MUX
InMuxAdd_ INPUTMUX (
           .InMuxAdd(InMuxAdd),
           .InA(InA),    
           .InB(InB),    
           .CUConst(CUconst),
           .ALUout(ALUout), 
           .RegOut(RegOut),
           .Rin(Rin) );

// Enable Decoder
RegAddDecoder DECODER (.WE(WE),.RegAdd(RegAdd),.En(En));


// REGISTERS:
Register REGISTER0 (.Rin(Rin),.En(En[0]),.clk(clk),.rst(rst),.Rout(Rout[0]));
Register REGISTER1 (.Rin(Rin),.En(En[1]),.clk(clk),.rst(rst),.Rout(Rout[1]));
Register REGISTER2 (.Rin(Rin),.En(En[2]),.clk(clk),.rst(rst),.Rout(Rout[2]));
Register REGISTER3 (.Rin(Rin),.En(En[3]),.clk(clk),.rst(rst),.Rout(Rout[3]));
Register REGISTER4 (.Rin(Rin),.En(En[4]),.clk(clk),.rst(rst),.Rout(Rout[4]));
Register REGISTER5 (.Rin(Rin),.En(En[5]),.clk(clk),.rst(rst),.Rout(Rout[5]));
Register REGISTER6 (.Rin(Rin),.En(En[6]),.clk(clk),.rst(rst),.Rout(Rout[6]));
Register REGISTER7 (.Rin(Rin),.En(En[7]),.clk(clk),.rst(rst),.Rout(Rout[7]));
Register REGISTER8 (.Rin(Rin),.En(En[8]),.clk(clk),.rst(rst),.Rout(Rout[8]));
Register REGISTER9 (.Rin(Rin),.En(En[9]),.clk(clk),.rst(rst),.Rout(Rout[9]));
Register REGISTER10 (.Rin(Rin),.En(En[10]),.clk(clk),.rst(rst),.Rout(Rout[10]));
Register REGISTER11 (.Rin(Rin),.En(En[11]),.clk(clk),.rst(rst),.Rout(Rout[11]));
Register REGISTER12 (.Rin(Rin),.En(En[12]),.clk(clk),.rst(rst),.Rout(Rout[12]));
Register REGISTER13 (.Rin(Rin),.En(En[13]),.clk(clk),.rst(rst),.Rout(Rout[13]));
Register REGISTER14 (.Rin(Rin),.En(En[14]),.clk(clk),.rst(rst),.Rout(Rout[14]));
Register REGISTER15 (.Rin(Rin),.En(En[15]),.clk(clk),.rst(rst),.Rout(Rout[15]));


// Out Mux 

OutMuxAdd_ MUXING (.OutMuxAdd(OutMuxAdd),
           .Rout0(Rout[0]),  
           .Rout1(Rout[1]), 
           .Rout2(Rout[2]), 
           .Rout3(Rout[3]), 
           .Rout4(Rout[4]), 
           .Rout5(Rout[5]), 
           .Rout6(Rout[6]), 
           .Rout7(Rout[7]), 
           .Rout8(Rout[8]), 
           .Rout9(Rout[9]), 
           .Rout10(Rout[10]),
           .Rout11(Rout[11]),
           .Rout12(Rout[12]),
           .Rout13(Rout[13]),
           .Rout14(Rout[14]),
           .Rout15(Rout[15]),
           .RegOut(RegOut) 
);

assign Out_Q = Rout[0];
assign Out_R = Rout[14];
assign ALUinA = Rout[1];
assign ALUinB = Rout[2];

endmodule


//******************************************************************************************//
//******************************************************************************************//
module RegAddDecoder (
                        input WE,
                        input [3:0] RegAdd,
                        output reg [15:0] En);
                        
                        
always @(*) begin
if(WE)
begin
case(RegAdd)
0: En<= 16'b0000_0000_0000_0001; 
1: En<= 16'b0000_0000_0000_0010;
2: En<= 16'b0000_0000_0000_0100;
3: En<= 16'b0000_0000_0000_1000;
4: En<= 16'b0000_0000_0001_0000;
5: En<= 16'b0000_0000_0010_0000;
6: En<= 16'b0000_0000_0100_0000;
7: En<= 16'b0000_0000_1000_0000;
8: En<= 16'b0000_0001_0000_0000;
9: En<= 16'b0000_0010_0000_0000;
10: En<= 16'b0000_0100_0000_0000;
11: En<= 16'b0000_1000_0000_0000;
12: En<= 16'b0001_0000_0000_0000;
13: En<= 16'b0010_0000_0000_0000;
14: En<= 16'b0100_0000_0000_0000;
15: En<= 16'b1000_0000_0000_0000;
endcase
end
end
endmodule
//******************************************************************************************//
//******************************************************************************************//

//******************************************************************************************//
//******************************************************************************************//
module OutMuxAdd_ (
                        input [3:0] OutMuxAdd,
                        input [7:0] Rout0,
                        input [7:0] Rout1 ,
                        input [7:0] Rout2 ,
                        input [7:0] Rout3 ,
                        input [7:0] Rout4 ,
                        input [7:0] Rout5 ,
                        input [7:0] Rout6 ,
                        input [7:0] Rout7 ,
                        input [7:0] Rout8 ,
                        input [7:0] Rout9 ,
                        input [7:0] Rout10 ,
                        input [7:0] Rout11 ,
                        input [7:0] Rout12 ,
                        input [7:0] Rout13 ,
                        input [7:0] Rout14 ,
                        input [7:0] Rout15 ,
                        output reg [7:0] RegOut);
                        
                        
always @(*) begin

case(OutMuxAdd)
0: RegOut<= Rout0; 
1: RegOut<= Rout1;
2: RegOut<= Rout2;
3: RegOut<= Rout3;
4: RegOut<= Rout4;
5: RegOut<= Rout5;
6: RegOut<= Rout6;
7: RegOut<= Rout7;
8: RegOut<= Rout8;
9: RegOut<= Rout9;
10: RegOut<= Rout10;
11: RegOut<= Rout11;
12: RegOut<= Rout12;
13: RegOut<= Rout13;
14: RegOut<= Rout14;
15: RegOut<= Rout15;
endcase
end
endmodule
//******************************************************************************************//
//******************************************************************************************//

//******************************************************************************************//
//******************************************************************************************//
module InMuxAdd_(
input [2:0] InMuxAdd,
input [7:0] InA,
input [7:0] InB,
input [7:0] CUConst,
input [7:0] ALUout,
input [7:0] RegOut,
output reg [7:0] Rin);

always @(*) begin
case(InMuxAdd)
0: Rin <= InA;
1: Rin <= InB;
2: Rin <= CUConst;
3: Rin <= ALUout;
4: Rin <= RegOut;
5: Rin <= RegOut;
6: Rin <= RegOut;
7: Rin <= RegOut;
endcase
end
endmodule
//******************************************************************************************//
//******************************************************************************************//

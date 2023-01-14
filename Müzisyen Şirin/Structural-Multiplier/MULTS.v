`timescale 1ns / 1ps

module MULTS(
    input [7:0] A,
    input [7:0] X,
    output [15:0] result
    );
    
    
wire [15:0] PP [7:0];

wire [15:0] sum1,sum2,sum3,sum4,sum5,sum6;
wire [15:0] sum7;


//assign PP[0] = X[0] * A * (2**0);   // [XXXXXXXXAAAAAAAA]
//assign PP[1] = X[1] * A * (2**1);   // [XXXXXXXAAAAAAAA0]

//// sum1 = PP[0] + PP[1] = [XXXXXXCAAAAAAAA0]
//assign PP[2] = X[2] * A * (2**2);   // [XXXXXXAAAAAAAA00]
//assign PP[3] = X[3] * A * (2**3);   // [XXXXXAAAAAAAA000]
//// sum2 = PP[2] + PP[3] = [XXXXCAAAAAAAA000]
//assign PP[4] = X[4] * A * (2**4);   // [XXXXAAAAAAAA0000]
//assign PP[5] = X[5] * A * (2**5);   // [XXXAAAAAAAA00000]
//// sum3 = PP[4] + PP[5]= [XXCAAAAAAAA00000]
//assign PP[6] = X[6] * A * (2**6);   // [XXAAAAAAAA000000]
//assign PP[7] = X[7] * A * (2**7);   // [XAAAAAAAA0000000]
//// sum4 = PP[6] + PP[7] = [CAAAAAAAAA000000]
//// sum5 = sum1+sum2
//// sum6 = sum3+sum4

genvar i;

generate
    for (i = 0; i < 8; i = i + 1) begin
        assign PP[i] = ({8{X[i]}} & A) << i;    
    end 
endgenerate

assign result = sum7;

//Stage1
CLA Stg1_CLA1 (.x(PP[0]),.y(PP[1]),.cin(1'b0),.cout(),.sum(sum1));
CLA Stg1_CLA2 (.x(PP[2]),.y(PP[3]),.cin(1'b0),.cout(),.sum(sum2));
CLA Stg1_CLA3 (.x(PP[4]),.y(PP[5]),.cin(1'b0),.cout(),.sum(sum3));
CLA Stg1_CLA4 (.x(PP[6]),.y(PP[7]),.cin(1'b0),.cout(),.sum(sum4));

// Stage2
CLA Stg2_CLA1 (.x(sum1),.y(sum2),.cin(1'b0),.cout(),.sum(sum5));
CLA Stg2_CLA2 (.x(sum3),.y(sum4),.cin(1'b0),.cout(),.sum(sum6));

//Stage3
CLA Stg3_CLA1 (.x(sum5),.y(sum6),.cin(1'b0),.cout(),.sum(sum7));
endmodule

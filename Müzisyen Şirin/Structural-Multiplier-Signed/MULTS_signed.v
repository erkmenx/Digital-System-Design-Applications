`timescale 1ns / 1ps

module MULTS_signed(
    input [7:0] A,
    input [7:0] X,
    output [15:0] result
    );
    
wire [7:0] PP [7:0];
wire [15:0] PPshifted [7:0];  
genvar i;
generate
for (i=0;i<=7;i=i+1)
begin
if(i<7)
    begin
    assign PP[i][6:0] = X[i]*A[6:0];
    assign PP[i][7] = ~(X[i]*A[7]);
    end
else
    begin
    assign PP[i][6:0] = ~(X[i]*A[6:0]);
    assign PP[i][7] = X[i]*A[7];
    end
end
endgenerate

generate
for(i=0;i<=7;i=i+1)
begin
if(i==0)
begin
assign PPshifted[i][8] =1'b1;
assign PPshifted[i][7:0] = PP[i][7:0];
assign PPshifted[i][15:9] = 6'd0;
end
else
assign PPshifted[i]= PP[i] << i;
end
endgenerate

wire [15:0] sum1,sum2,sum3,sum4,sum5,sum6,sum7;


//Stage1
CLA Stg1_CLA1 (.x(PPshifted[0]),.y(PPshifted[1]),.cin(1'b0),.cout(),.sum(sum1));
CLA Stg1_CLA2 (.x(PPshifted[2]),.y(PPshifted[3]),.cin(1'b0),.cout(),.sum(sum2));
CLA Stg1_CLA3 (.x(PPshifted[4]),.y(PPshifted[5]),.cin(1'b0),.cout(),.sum(sum3));
CLA Stg1_CLA4 (.x(PPshifted[6]),.y(PPshifted[7]),.cin(1'b0),.cout(),.sum(sum4));

// Stage2
CLA Stg2_CLA1 (.x(sum1),.y(sum2),.cin(1'b0),.cout(),.sum(sum5));
CLA Stg2_CLA2 (.x(sum3),.y(sum4),.cin(1'b0),.cout(),.sum(sum6));

//Stage3
CLA Stg3_CLA1 (.x(sum5),.y(sum6),.cin(1'b0),.cout(),.sum(sum7));
assign result[15] = 1'b1^sum7[15];
assign result[14:0] = sum7[14:0]; 
endmodule

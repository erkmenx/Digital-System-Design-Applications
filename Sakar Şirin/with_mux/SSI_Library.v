`timescale 1ns / 1ps

//AND GATE
module and_gate(
        input I1,
        input I2,
        output O
    );
assign O = I1&I2; 
endmodule

 //OR GATE
module or_gate(
        input I1,
        input I2,
        output O);
assign O = I1|I2;
endmodule

//NOT GATE
module not_gate(
        input I,
        output O);
assign O = ~I;
endmodule

//NAND
module nand_gate(
        input I1,
        input I2,
        output reg O

);
always @(I1,I2)
begin
O = ~(I1&I2);
end 
endmodule


//NOR
module nor_gate(
        input I1,
        input I2,
        output reg O
);
always @(I1,I2)
begin
O = ~(I1|I2);
end 
endmodule

//XOR
module xor_gate(
        input I1,
        input I2,
        output  O
);
LUT2# (.INIT(4'b0110)) xor_gate(
                                .O(O),
                                .I0(I1),
                                .I1(I2));
endmodule


//XNOR
module xnor_gate(
        input I1,
        input I2,
        output  O
);
LUT2# (.INIT(4'b1001)) xnor_gate(
                                .O(O),
                                .I0(I1),
                                .I1(I2));
endmodule

//TRI
module TRI( 
        input I,
        input E,
        output O);

assign O = E?I:1'bz;
endmodule

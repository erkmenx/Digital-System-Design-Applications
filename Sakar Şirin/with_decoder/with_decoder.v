`timescale 1ns / 1ps

module with_decoder(
input a,b,c,d,
output f3,f2,f1,f0
    );
    
wire [15:0] minterms;
wire [3:0] inputs;



DECODER DLS (.IN({a,b,c,d}),.OUT(minterms));

wire f0_element_1;
wire f0_element_2;
//f0
or_gate or0_1 (.I1(minterms[5]),.I2(minterms[7]),.O(f0_element_1));
or_gate or0_2 (.I1(minterms[13]),.I2(minterms[15]),.O(f0_element_2));
or_gate or0_3 (.I1(f0_element_2),.I2(f0_element_1),.O(f0));

//f1
wire f1_element_1,f1_element_2,f1_element_3,f1_element_4;
or_gate or1_1 (.I1(minterms[6]),.I2(minterms[7]),.O(f1_element_1));
or_gate or1_2 (.I1(minterms[9]),.I2(minterms[11]),.O(f1_element_2));
or_gate or1_3 (.I1(minterms[13]),.I2(minterms[14]),.O(f1_element_3));
or_gate or1_4 (.I1(f1_element_2),.I2(f1_element_1),.O(f1_element_4));
or_gate or1_5 (.I1(f1_element_4),.I2(f1_element_3),.O(f1));

//f2
wire f2_element_1;
or_gate or2_1 (.I1(minterms[10]),.I2(minterms[11]),.O(f2_element_1));
or_gate or2_2 (.I1(minterms[14]),.I2(f2_element_1),.O(f2));

//f3

assign f3 = minterms[15];

endmodule

`timescale 1ns / 1ps
///////////////////////////////////////////////////


module behavioral(
input a,b,c,d,
output f0,f1,f2,f3
    );

wire a_not;
wire b_not;
wire c_not;
wire d_not;
// not calculations
not_gate not1 (.I(a),.O(a_not));
not_gate not2 (.I(b),.O(b_not));
not_gate not3(.I(c),.O(c_not));
not_gate not4 (.I(d),.O(d_not));
// f0 calculation    
and_gate and1 (.I1(b),.I2(d),.O(f0));
// f1 calculation
wire element1_1;
wire element1_2;
wire element1;
wire element2_1;
wire element2_2;
wire element2;
and_gate and2 (.I1(a),.I2(d),.O(element1_1));                 // ad
or_gate or1 (.I1(c_not),.I2(b_not),.O(element1_2));           // b'+c'
and_gate and3 (.I1(element1_1),.I2(element1_2),.O(element1)); // ELEMENT1
and_gate and4 (.I1(b),.I2(c),.O(element2_1));
or_gate or2 (.I1(a_not),.I2(d_not),.O(element2_2));
and_gate and5 (.I1(element2_1),.I2(element2_2),.O(element2));
or_gate or3(.I1(element1),.I2(element2),.O(f1));

//f2 calculation
wire ele1;
wire ele2;
and_gate and6(.I1(a),.I2(c),.O(ele1));
or_gate or4 (.I1(b_not),.I2(d_not),.O(ele2));
and_gate and7 (.I1(ele1),.I2(ele2),.O(f2));

//f3 calculation
wire el1;
wire el2;

and_gate and8 (.I1(a),.I2(b),.O(el1));
and_gate and9 (.I1(c),.I2(d),.O(el2));
and_gate and10 (.I1(el1),.I2(el2),.O(f3)); 
    
endmodule

`timescale 1ns / 1ps
module arithmetic_circuits(
input x,
input y,
output cout,
output sum
    );

HA HA1 (.x(x),.y(y),.sum(sum),.cout(cout));     

endmodule



module HA (
input x,
input y,
output cout,
output sum
);
assign sum = ((~x)&&y) || (x&&(~y));
assign cout = x&&y;
endmodule
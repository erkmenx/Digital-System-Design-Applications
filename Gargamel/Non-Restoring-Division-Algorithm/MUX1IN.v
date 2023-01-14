`timescale 1ns / 1ps

module MUX1IN(
input addcout,
input shiftr0,
input [1:0] InsSel,
output reg CO
    );
    
always @(*) begin

case(InsSel)
0: CO <= 1'b0;
1: CO <= 1'b0;
2: CO <= addcout;
3: CO <= shiftr0;
endcase

end
endmodule

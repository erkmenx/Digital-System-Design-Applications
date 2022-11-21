`timescale 1ns / 1ps

module priority_encoder_case(
input [3:0] SW,
output reg [1:0] LED,
output reg V
    );
    
    
    
always @(SW) begin

casex(SW)

4'b0000 :           //0 
begin
LED[0] = 1'bx;
LED[1] = 1'bx;
V = 1'b0;
end

4'b0001:            //1 
begin
LED[0] = 1'b0;
LED[1] = 1'b0;
V = 1'b1;
end

4'b001x:            //3
begin
LED[0] = 1'b1;
LED[1] = 1'b0;
V = 1'b1;
end

4'b01xx:            //4
begin
LED[0] = 1'b0;
LED[1] = 1'b1;
V = 1'b1;
end

4'b1xxx:            //9
begin
LED[0] = 1'b1;
LED[1] = 1'b1;
V = 1'b1;
end

endcase

end
endmodule

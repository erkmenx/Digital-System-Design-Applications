`timescale 1ns / 1ps

module dflipflopbehav(
                        input D,
                        input clk,
                        output Q,
                        output Qn
    ); 
reg FF;   
assign Q = FF;
assign Qn = ~FF;
always @(posedge clk) begin
FF <= D;
end
endmodule

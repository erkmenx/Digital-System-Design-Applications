`timescale 1ns / 1ps

module MAC_Normalize(
    input signed [19:0] MACresult,
    output reg [7:0] normalized
    );
    


always @(*) begin

if(MACresult >= 255)
normalized<=8'd255;
else if (MACresult <=0)
normalized <=8'd0;
else
normalized <= MACresult[7:0];
end    
endmodule

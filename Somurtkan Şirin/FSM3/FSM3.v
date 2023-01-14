`timescale 1ns / 1ps
module FSM3(
    input x,
    input clk,
    output reg z
    );
localparam S1 = 5'b00001;     // xx0
localparam S2 = 5'b00010;       // xx1
localparam S3 = 5'b00100;       // x10
localparam S4 = 5'b01000;     // 101
localparam S5 = 5'b10000;       // 100

reg [3:0] state=S1;
reg [1:0] counter101=0;
reg [1:0] counter100=0;
always @(posedge clk) begin
case(state)

    S1:             //xx0
    begin
    counter101<=0;
    counter100<=0;
    case(x)
    0: 
        begin
        state <= S1;
        end
    1:  
        begin
        state <= S2;
        end
    endcase
    end
    
    S2:             //xx1
    case(x)
    0: 
        begin
        state <= S3;
        end
    1:  
        begin
        state <= S2;
        counter101<=0;
        counter100<=0;
        end
    endcase
    
    S3:             //x10
    begin
    case(x)
    0: 
        begin
        state <= S5;
        counter101<=0;
        counter100<=counter100+1;
        end
    1:  
        begin
        state <= S4;
        counter100<=0;
        counter101<=counter101+1;
        end
    endcase
    end
    
    S4:             //100
    begin
    case(x)
    0: 
        begin
        state <= S1;
        end
    1:  
        begin
        state <= S2;
        end
    endcase
    end
    
    S5:             //101
    begin
    case(x)
    0: 
        begin
        state <= S1;
        end
    1:  
        begin
        state <= S2;
        end
    endcase
    end
endcase

if(counter101==2 || counter100==2)
z<=1;
else
z<=0;


end
endmodule

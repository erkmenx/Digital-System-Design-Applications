`timescale 1ns / 1ps

module output_control(
    input clk,
    input rst,
    input [1023:0] data,
    output reg [1023:0] dataout,
    output reg conv_done,
    output reg [7:0] bram2_address,
    output reg wen
    );
    
reg [7:0] counter=0;


always @(data,rst) begin
    if(rst)
        begin
        dataout<=0;
        counter<=0;
        end
    else
    begin
        if(counter <=128)
            begin
            wen<=1'b1;
            dataout<=data;
            bram2_address<=counter;
            counter<=counter+1;
            if(counter == 127)
                conv_done <=1;
            else
                conv_done<=0;
            end
        else
            begin
            wen<=1'b0;
            end
        end
    end
      
endmodule

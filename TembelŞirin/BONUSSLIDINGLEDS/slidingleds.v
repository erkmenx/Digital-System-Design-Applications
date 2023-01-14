`timescale 10us / 1ps

module sliding_led #(MAX_CNT_DEST=5000000)(
input clk,
input rst,
input [1:0] SW,
output reg [15:0] LED
    );
// 100Mhz to 1 Hz == 50.000.000 - 1 count.
// 10 Hz => 5.000.000-1 count but for clock, between 2 posedge is 10.000.000-1
// 20 Hz => 2.500.000-1 count but for clock, between 2 posedge is 5.000.000-1
// 50 Hz => 1.000.000 - 1 count but for clock, between 2 posedge is 2.000.000-1
localparam freq10_count = 2*MAX_CNT_DEST-1;
localparam freq20_count = (MAX_CNT_DEST)-1;
localparam freq50_count = ((2*MAX_CNT_DEST)/5)-1;
// I did this counters and MAX_CNT_DEST = 5.000.000 because, the testbench is written 
// more like a creating a clock with counting and toggle. But i did not use that method because
// There is nothing complex.
reg stop = 0;
reg risedge_detect=0;
reg [$clog2(freq10_count+1):0] counter10=0;
reg [$clog2(freq20_count+1):0] counter20=0;
reg [$clog2(freq50_count+1):0] counter50=0;
always @(posedge clk) begin   

if(SW==2'd0)
begin
    LED <=LED;
    counter10<=0;
    counter20<=0;
    counter50<=0;
end

else if(SW == 2'b01)
begin
    counter10<=counter10+1;
    counter20<=0;
    counter50<=0;
        if(counter10 == freq10_count)
            begin
                risedge_detect<=1;
                counter10<=0;
            end
            else
                risedge_detect<=0;
end
        
else if(SW == 2'b10)
begin
    counter20<=counter20+1;
    counter10<=0;
    counter50<=0;
        if(counter20 == freq20_count)
            begin
                risedge_detect<=1;
                counter20<=0;
            end
             else
                risedge_detect<=0;
end

else 
begin
    counter50<=counter50+1;
    counter10<=0;
    counter20<=0;
        if(counter50 == freq50_count)
            begin
                risedge_detect<=1;
                counter50<=0;
            end
             else
                risedge_detect<=0;
end           

end

always @(posedge risedge_detect or posedge rst) begin
if(rst)
begin
LED<=16'd1;
end
else
    if(LED==16'b1000_0000_0000_0000)
            LED <= 16'd1;
    else
        LED <= LED <<1;
       
end

endmodule




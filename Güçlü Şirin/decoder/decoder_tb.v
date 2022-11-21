
module decoder_tb();

reg [7:0] SWITCH;
reg [3:0] BUTTON;
wire [6:0] cat;
wire [7:0] LED;
wire [3:0] an;
wire dp;

top_module BENCH_PRESS (.SW(SWITCH),.LED(LED),.cat(cat),.an(an),.dp(dp));

initial begin
SWITCH = 8'd0;#10;SWITCH= 8'd1;#10;SWITCH = 8'd2;#10;
SWITCH = 8'd3;#10;SWITCH = 8'd4;#10;SWITCH = 8'd5;#10;SWITCH = 8'd6;#10;
SWITCH = 8'd7;#10;SWITCH=8'd8;#10;SWITCH = 8'd9;#10;SWITCH = 8'd10;#10;SWITCH = 8'd11;#10;
SWITCH = 8'd12;#10;SWITCH = 8'd13;#10;SWITCH = 8'd14;#10;SWITCH = 8'd15;#10;
////2nd part
SWITCH = 8'd16;#10;SWITCH= 8'd17;#10;SWITCH = 8'd18;#10;
SWITCH = 8'd19;#10;SWITCH = 8'd20;#10;SWITCH = 8'd21;#10;SWITCH = 8'd22;#10;
SWITCH = 8'd23;#10;SWITCH = 8'd24;#10;SWITCH = 8'd25;#10;SWITCH = 8'd26;#10;
SWITCH = 8'd27;#10;SWITCH = 8'd28;#10;SWITCH = 8'd29;#10;SWITCH = 8'd30;#10;SWITCH=8'd31;


end
endmodule

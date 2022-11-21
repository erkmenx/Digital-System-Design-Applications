`timescale 1ns / 1ps
module Add_Sub_tb;

reg [3:0] x=0;
reg [3:0] y=0;
reg cin=0;
wire cout;
wire [3:0] sum;
wire v;
wire [4:0] totalsum;
assign totalsum = {cout,sum};
Add_Sub AS1 (.x(x),.y(y),.cin(cin),.cout(cout),.sum(sum),.v(v));

integer i;
integer z;
initial begin
cin = 0;
for(i=-8;i<8;i=i+1)
begin
            x=i;
            for(z=-8;z<8;z=z+1)
            begin
            y=z;
            #10;
			end

end
cin=1;
for(i=-8;i<8;i=i+1)
begin
            x=i;
            for(z=-8;z<8;z=z+1)
            begin
            y=z;
            #10;
			end

end
$finish;
end
endmodule

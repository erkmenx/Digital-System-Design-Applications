`timescale 1ns / 1ps

module arithmetic_circuits_tb();

reg [3:0] x;
reg [3:0] y;
reg cin;
wire [3:0] sum;
wire cout;
parameter wait_time = 10;
integer i;
integer a=0;
// true results

reg [4:0] correct_results[31:0];

initial begin
correct_results[0]= 5'd1 ;
correct_results[1]= 5'd3 ;correct_results[2]= 5'd5 ;
correct_results[3]= 5'd7 ;correct_results[4]= 5'd9 ;
correct_results[5]= 5'd11 ;correct_results[6]= 5'd13 ;
correct_results[7]= 5'd15 ;correct_results[8]= 5'd17 ;
correct_results[9]= 5'd19 ;correct_results[ 10]= 5'd21 ;
correct_results[ 11 ]= 5'd23 ;correct_results[ 12 ]= 5'd25 ;
correct_results[ 13 ]= 5'd27 ;correct_results[ 14 ]= 5'd29 ;
correct_results[ 15 ]= 5'd31 ;

end

arithmetic_circuits L1 (.x(x),.y(y),.cin(cin),.sum(sum),.cout(cout));

initial begin

for (i=0;i<16;i=i+1)
begin
x=i;
y=i;
cin=1;
#wait_time;
$write ("{x,y,cin}=%d%d%d => sum = %d, cout= %d",x,y,cin,sum,cout);
if({cout,sum} == correct_results[i])
$display("  TRUE");
else
$display("  FALSE");
end

end
endmodule

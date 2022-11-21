`timescale 1ns / 1ps

module arithmetic_circuits_tb();

reg x;
reg y;
wire sum;
wire cout;
parameter wait_time = 20;
integer i;
// true results

reg [1:0] correct_results_sum[3:0];
reg [1:0] correct_results_cout[3:0];

initial begin
correct_results_sum[0] =0;
correct_results_cout[0] =0 ;
correct_results_sum[1] =1;
correct_results_cout[1] =0 ;
correct_results_sum[2] =1;
correct_results_cout[2] = 0;
correct_results_sum[3] =0;
correct_results_cout[3] = 1; 
end

arithmetic_circuits L1 (.x(x),.y(y),.sum(sum),.cout(cout));

initial begin

for (i=0;i<4;i=i+1)
begin
{x,y} = i;
#wait_time;
$write ("{x,y}=%d%d => sum = %d, cout= %d",x,y,sum,cout);
if(sum== correct_results_sum[i] && cout == correct_results_cout[i])
$display("  TRUE");
else
$display("  FALSE");
end


end
endmodule

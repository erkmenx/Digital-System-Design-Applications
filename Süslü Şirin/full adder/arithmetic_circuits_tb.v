`timescale 1ns / 1ps

module arithmetic_circuits_tb();

reg x;
reg y;
reg cin;
wire sum;
wire cout;
parameter wait_time = 20;
integer i;
// true results

reg [1:0] correct_results_sum[7:0];
reg [1:0] correct_results_cout[7:0];

initial begin
correct_results_sum[0] =0;
correct_results_cout[0] =0 ;
correct_results_sum[1] =1;
correct_results_cout[1] =0 ;
correct_results_sum[2] =1;
correct_results_cout[2] = 0;
correct_results_sum[3] =0;
correct_results_cout[3] = 1; 
//
correct_results_sum[4] =1;
correct_results_cout[4] =0 ;
correct_results_sum[5] =0;
correct_results_cout[5] =1 ;
correct_results_sum[6] =0;
correct_results_cout[6] = 1;
correct_results_sum[7] =1;
correct_results_cout[7] = 1; 


end

arithmetic_circuits L1 (.x(x),.y(y),.cin(cin),.sum(sum),.cout(cout));

initial begin

for (i=0;i<8;i=i+1)
begin
{x,y,cin} = i;
#wait_time;
$write ("{x,y,cin}=%d%d%d => sum = %d, cout= %d",x,y,cin,sum,cout);
if(sum== correct_results_sum[i] && cout == correct_results_cout[i])
$display("  TRUE");
else
$display("  FALSE");
end


end
endmodule

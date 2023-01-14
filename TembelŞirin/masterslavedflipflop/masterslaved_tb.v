`timescale 1ns / 1ps

module masterslaved_tb;

reg clk;
reg D;
wire qs;
wire qs_n;

masterslaved MASTER_SLAVE_D_FF (.D(D),.clk(clk),.q(qs),.qn(qs_n));


initial begin
clk = 0;
D= 0;
#20;
D=1;
#20;
clk=1;
#15;
D=0;
#5;
clk=0;
#20;
clk=1;
#10;
D=1;
#10;
clk = 0;
#20;
$finish;




end
endmodule

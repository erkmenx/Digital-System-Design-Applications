`timescale 1ns / 1ps

module lastmodule(
                    input clk,
                    input wea,
                    input [3:0] addra,
                    output [7:0] douta);
wire clka;
clkdiv clkd (.clk(clk),.clko(clka));
top_block_ram ss (.clk(clka),.wea(wea),.addra(addra),.douta(douta));
endmodule



module top_block_ram(
                        input clk,
                        input wea,
                        input [3:0] addra,
                        output [7:0] douta
    );

wire [7:0] wire_din;
blk_mem_gen_0 MEM1 (.clka(clk),.dina(wire_din),.wea(wea),.addra(addra),.douta(douta));
endmodule

module clkdiv(input clk,
                output reg clko=1);
reg counter=0;
always @(posedge clk)
if(counter==0)
counter <=counter+1;
else
clko<=~clko;
begin

end
               endmodule

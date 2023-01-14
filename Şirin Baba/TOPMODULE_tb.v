`timescale 1ns / 1ps

module TOPMODULE_tb;
    
    
reg clk=0;
reg rst;
reg conv_run;
reg [71:0] kernel;

wire enable_ram;
wire [7:0] address_ram;
wire [23:0] weight;
wire [1039:0] data_out;
wire [1023:0] result;
wire [1023:0] datatomem;
wire wen2;
wire [7:0] bram2_address;
wire macrst;

InputController I (
                   .clk(clk),
                   .rst(rst),
                   .conv_run(conv_run),
                   .kernel(kernel),
                   .enable_ram(enable_ram),
                   .address_ram(address_ram),
                   .weight(weight),
                   .macrst(macrst)
                                 );
                   
blk_mem_gen_0 BRAM1 (
                     .addra(address_ram),
                     .clka(clk),
                     .dina(),
                     .douta(data_out),
                     .ena(enable_ram),
                     .wea(0)
                            );
             
                            
CONV128  convmod (
                    .clk(clk),
                    .rst(macrst),
                    .data(data_out),
                    .weight(weight),
                    .result(result)
                                ); 
                                
output_control OUTCONTR (
                         .clk(clk),
                         .rst(rst),
                         .data(result),
                         .dataout(datatomem),
                         .conv_done(conv_done),
                         .bram2_address(bram2_address),
                         .wen(wen2));
wire [1023:0] resultbram2;                 
blk_mem_gen_1 BRAM2 (
                     .addra(bram2_address),
                     .clka(clk),
                     .dina(datatomem),
                     .douta(resultbram2),
                     .ena(1),
                     .wea(wen2)
                            );
integer n;

initial n = $fopen("outfile.txt","w");

always begin
#10;
clk = ~clk;
end
integer i=0;

always @(bram2_address) begin
if(BRAM2.addra <= 129 & BRAM2.douta !=0) 
    begin
        $fmonitor(n, "%h", BRAM2.douta);
    end

end


initial begin
rst =1;
#200;
rst=0;
conv_run=0;
#200;
kernel = 72'b11111111__11111111__11111111_11111111__0000_1000__11111111_11111111__11111111__11111111;
#100;
conv_run =1;
#2000000;
$fclose(n);
end

endmodule

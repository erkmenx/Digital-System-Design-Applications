`timescale 1ns / 1ps

module InputController(
input clk,
input rst,
input conv_run,
input [71:0] kernel,
output reg macrst=1,
output reg enable_ram,
output reg [7:0] address_ram,
output reg [23:0] weight

    );
    
 

reg [7:0] address_ram_fake=0;


    
reg [7:0] firstline=0;
reg [2:0] counter_line=0; 

always @(posedge clk)begin
if(rst)
        begin
            address_ram<=8'h00;
            enable_ram<=0;
        end 

    if(conv_run)
        begin
            if(!enable_ram)
                begin
                enable_ram<=1;
                end
            else
                begin
                if(!macrst && firstline!=128)
                    begin
                    if(counter_line!=4)
                    begin
                        if(counter_line==0)
                            begin
                            address_ram<=firstline+1;
                            counter_line<=counter_line+1;
                            weight <= kernel[71:48];
                            end
                        if(counter_line==1)
                            begin
                            address_ram<=firstline+2;
                            counter_line<=counter_line+1;
                            weight <= kernel[47:24];
                            end
                        if(counter_line==2)
                            begin
                            address_ram<=firstline+1;
                            counter_line<=counter_line+1;
                            firstline<=firstline+1;
                            weight<=kernel[23:0];
                            end
                        if(counter_line==3)
                            macrst<=1;
                    end
                end
                else
                begin
                macrst<=0;
                counter_line<=0;  
                end
                
                end
        end
    else;  
end

endmodule

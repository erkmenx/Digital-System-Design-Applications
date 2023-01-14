`timescale 1ns / 1ps

module dconv(
input [39:0] data,
input signed [23:0] KERNEL,
input rst,
input clk

    );
// Image will be : [255 255 255 255 255]
//                 [0   0   255 0   0  ]
//                 [0   0   255 0   0  ]
//                 [0   0   255 0   0  ]
//                 [0   0   255 0   0  ]

reg [39:0] IMAGE [4:0];
reg signed [59:0] CONV2D [2:0];
wire signed [19:0] result1;
reg [23:0] IMAGESHIFT;
reg signed [23:0] KERNELIN [2:0];
reg signed [23:0] KERNELSHIFT;
reg [2:0] row=0;
reg [4:0] process=0;
reg [1:0] writerow=0;
reg [2:0] process_counter=0;
reg loaded=0;
reg finish=0;


MAC MAC1 (.data(IMAGESHIFT),.weight(KERNELSHIFT),.clk(clk),.rst(!loaded),.resultout(result1));

always @(posedge clk) begin
    if(rst)
    begin
    IMAGESHIFT <=0;
    KERNELSHIFT <=0;
    row <=0;
    process <=0;
    writerow <=0;
    finish<=0;
    end
    else
    begin
    if(!loaded & !finish)
    begin
        IMAGE[row] <=data;
        KERNELIN[row] <= KERNEL;

            if(row == 4)
                begin
                loaded<=1'b1;
                row<=0;
                end
            else
                row <=row+1;
    end
    
    if(loaded & !finish)
        begin
        case(process)
        0:
            begin
            if(row<=2)
            begin
            IMAGESHIFT <= IMAGE[row][39:16];
            KERNELSHIFT <= KERNELIN[row];
            row <= row+1;
            end
            process_counter <=process_counter+1;  
            if(process_counter==4)
            begin
                process <=1;
                process_counter <=1;
                CONV2D[writerow][59:40]<=result1;
                row<=0;
            end
            end
            
         1: 
            begin
            if(row<=2)
            begin
            IMAGESHIFT <= IMAGE[row][31:8];
            KERNELSHIFT <= KERNELIN[row];
            row <= row+1;
            end
            process_counter <=process_counter+1;  
            if(process_counter==4)
            begin
                process <=2;
                CONV2D[writerow][39:20]<=result1;
                process_counter<=1;
                row<=0;
            end
            end
         
         2:begin
            if(row<=2)
            begin
            IMAGESHIFT <= IMAGE[row][23:0];
            KERNELSHIFT <= KERNELIN[row];
            row <= row+1;
            end
            process_counter <=process_counter+1;  
            if(process_counter==4)
            begin
                process <=3;
                CONV2D[writerow][19:0]<=result1;
                process_counter<=1;
                row<=1;
                writerow<=writerow+1;
            end
            end
         
         3:begin
            if(row<=3)
            begin
            IMAGESHIFT <= IMAGE[row][39:16];
            KERNELSHIFT <= KERNELIN[row-1];
            row <= row+1;
            end
            process_counter <=process_counter+1;  
            if(process_counter==4)
            begin
                process <=4;
                CONV2D[writerow][59:40]<=result1;
                process_counter<=1;
                row<=1;
            end
            end
         4:begin
            if(row<=3)
            begin
            IMAGESHIFT <= IMAGE[row][31:8];
            KERNELSHIFT <= KERNELIN[row-1];
            row <= row+1;
            end
            process_counter <=process_counter+1;  
            if(process_counter==4)
            begin
                process <=5;
                CONV2D[writerow][39:20]<=result1;
                process_counter<=1;
                row<=1;
            end
            end 
          5:begin
            if(row<=3)
            begin
            IMAGESHIFT <= IMAGE[row][23:0];
            KERNELSHIFT <= KERNELIN[row-1];
            row <= row+1;
            end
            process_counter <=process_counter+1;  
            if(process_counter==4)
            begin
                process <=6;
                CONV2D[writerow][19:0]<=result1;
                process_counter<=1;
                row<=2;
                writerow<=writerow+1;
            end
            end
          6:begin
            if(row<=4)
            begin
            IMAGESHIFT <= IMAGE[row][39:16];
            KERNELSHIFT <= KERNELIN[row-2];
            row <= row+1;
            end
            process_counter <=process_counter+1;  
            if(process_counter==4)
            begin
                process <=7;
                CONV2D[writerow][59:40]<=result1;
                process_counter<=1;
                row<=2;
            end
            end
           7:begin
            if(row<=4)
            begin
            IMAGESHIFT <= IMAGE[row][31:8];
            KERNELSHIFT <= KERNELIN[row-2];
            row <= row+1;
            end
            process_counter <=process_counter+1;  
            if(process_counter==4)
            begin
                process <=8;
                CONV2D[writerow][39:20]<=result1;
                process_counter<=1;
                row<=2;
            end
            end 
            
           8: begin
            if(row<=4)
            begin
            IMAGESHIFT <= IMAGE[row][23:0];
            KERNELSHIFT <= KERNELIN[row-2];
            row <= row+1;
            end
            process_counter <=process_counter+1;  
            if(process_counter==4)
            begin
                process <=0;
                finish<=1;
                CONV2D[writerow][19:0]<=result1;
                process_counter<=0;
                row<=2;
                writerow<=0;
            end
            end

        endcase
        
        
        end
    
end

    
end

endmodule

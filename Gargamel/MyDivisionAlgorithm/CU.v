`timescale 1ns / 1ps



module CU(
    input clk,
    input rst,
    input Start,
    output reg Busy,
    output reg [7:0] CUconst,
    output reg [2:0] InMuxAdd,
    output reg [3:0] OutMuxAdd,
    output reg [3:0] RegAdd,
    output reg WE,
    output reg [1:0] InsSel,
    input CO,
    input Z
    );
reg remainder=0;
reg [3:0] caseremainder = 4'd0;
reg [7:0] countcase=8'd0;
reg START_A_SUB_B;
reg [3:0] casesubab = 4'd0;  
reg [4:0] STEP = 5'd0;
reg twoscomplement = 0;
reg REGISTER_LOADS = 0;
reg startprocess = 0;
reg [6:0] casereg = 7'd0;
reg [2:0] casetwoscomplement= 3'd0;
reg zerocompare = 0;
reg [3:0] casezero = 4'd0;
always @(posedge clk or posedge rst) begin
    if(rst)
        begin
            Busy<=0;
            CUconst<=0;
            WE<=0;
            startprocess <= 0;
            remainder <=0;
            caseremainder <=0;
            countcase <=0;
            START_A_SUB_B <=0;
            casesubab<=0;
            STEP <=0;
            twoscomplement<=0;
            REGISTER_LOADS<=0;
            startprocess <=0;
            casereg <=0;
            casetwoscomplement<=0;
        end
    else if(STEP <=7)
        begin
                if(Start & !startprocess)
                begin
                startprocess <=1;
                Busy<=1;
                end
                if(startprocess)
                begin
                WE <=1;
                REGISTER_LOADS<=1;
                end          
                if(REGISTER_LOADS)
                begin
                    case(casereg)
                    0:  begin
                            case(casezero)
                            0: begin
                                InMuxAdd<=3'd0;
                                RegAdd<=4'd1;
                                casezero<=casezero+1;
                               end
                            1:  begin
                                InsSel<=2'd3;
                                casezero<=casezero+1;
                                end   
                            2: begin
                                if(Z)
                                    begin
                                        CUconst<=8'd0;
                                        InMuxAdd<=3'd2;
                                        RegAdd<=4'd14;
                                        casezero<=casezero+1;                                        
                                    end
                                else
                                    begin
                                       InMuxAdd<=3'd0; 
                                       RegAdd <= 4'd3;      // REG3'e bölünen (Q'YA DÖNÜŞECEK)
                                       casereg<=casereg+1;
                                       casezero<=0;
                                    end
                               end
                            3: begin
                                RegAdd<=4'd0;
                                casezero<=casezero+1;
                               end
                            4:begin
                                Busy<=0;
                                WE<=0;
                                startprocess <= 0;
                                remainder <=0;
                                caseremainder <=0;
                                countcase <=0;
                                START_A_SUB_B <=0;
                                casesubab<=0;
                                STEP <=0;
                                twoscomplement<=0;
                                REGISTER_LOADS<=0;
                                startprocess <=0;
                                casereg <=0;
                                casetwoscomplement<=0;
                                casezero<=0;
                              end  
                            endcase

                        end
                    1:  begin
                        case(casezero)
                            0: begin
                                InMuxAdd<=3'd1;
                                RegAdd<=4'd1;
                                casezero<=casezero+1;
                               end
                            1:  begin
                                InsSel<=2'd3;
                                casezero<=casezero+1;
                                end   
                            2: begin
                                if(Z)
                                    begin
                                        CUconst<=8'b1111_1111;
                                        InMuxAdd<=3'd2;
                                        RegAdd<=4'd14;
                                        casezero<=casezero+1;                                        
                                    end
                                else
                                    begin
                                       InMuxAdd<=3'd1; 
                                       RegAdd <= 4'd4;      // REG3'e bölünen (Q'YA DÖNÜŞECEK)
                                       casereg<=casereg+1;
                                       casezero<=0;
                                    end
                               end
                            3: begin
                                RegAdd<=4'd0;
                                casezero<=casezero+1;
                               end
                            4:begin
                                Busy<=0;
                                WE<=0;
                                startprocess <= 0;
                                remainder <=0;
                                caseremainder <=0;
                                countcase <=0;
                                START_A_SUB_B <=0;
                                casesubab<=0;
                                STEP <=0;
                                twoscomplement<=0;
                                REGISTER_LOADS<=0;
                                startprocess <=0;
                                casereg <=0;
                                casetwoscomplement<=0;
                                casezero<=0;
                              end
                            endcase

                        end
                    2:  begin                   // REG5'e XOR için full 1 (Aynı zamanda -1)
                          CUconst<=8'b1111_1111;
                          InMuxAdd <= 3'd2;
                          RegAdd <= 4'd5;
                          casereg <= casereg+1'b1;  
                        end
                    3:  begin                   // REG6ya 2s complement için 1
                           CUconst <= 8'b0000_0001;
                           InMuxAdd<=3'd2; 
                           RegAdd <= 4'd6;
                           casereg <= casereg+1'b1;
                        end
                     4: begin
                            CUconst<= 8'd0;         // REG7'ye üzerinde işlem yapmak için full 0 (A: remainder)
                            InMuxAdd <= 3'd2;
                            RegAdd <= 4'd7;
                            casereg <= casereg+1'b1;
                        end
                     5: begin
                        twoscomplement<=1;
                        casereg <= casereg+1;
                        end
                        
                    default: ;
                    
                    endcase
                    end 
                
                if(twoscomplement)
                    begin
                        case(casetwoscomplement)
                           
                           0:begin 
                                OutMuxAdd <= 4'd4;
                                InMuxAdd <= 4'd4;
                                RegAdd <= 4'd1;         // Bölen A'ya yazıldı
                                casetwoscomplement<=casetwoscomplement+1;
                             end
                          1:begin
                                OutMuxAdd<=4'd5;    //full 1 XOR için
                                InMuxAdd<=4'd4;
                                RegAdd <= 4'd2;
                                casetwoscomplement<=casetwoscomplement+1;
                                InsSel<=2'd1;       // XOR OPERATION
                            end
                          2:begin
                                InMuxAdd<=4'd3;     // ALU result seçildi
                                RegAdd<=4'd1;       //Bölen'in XORu ALUinA'ya yazıldı
                                casetwoscomplement<=casetwoscomplement+1;
                            end
                          3:begin
                                OutMuxAdd<=4'd6;
                                InMuxAdd<=4'd4;
                                RegAdd<=4'd2;       // 0000_0001 B'ye yazıldı
                                InsSel<=2'd2;
                                casetwoscomplement<=casetwoscomplement+1;
                            end
                          4:begin
                                InMuxAdd<=4'd3; //ALUresult seçildi
                                RegAdd<=4'd8; // BÖLENİN 2's COMPLEMENTİ ARTIK REG10DA
                                START_A_SUB_B<=1;
                                casetwoscomplement<=0;
                                twoscomplement<=0;
                            end       
                        endcase
                    end
                    
                    
                    if(START_A_SUB_B)
                    begin
                        case(casesubab)
                        0:  begin
                                OutMuxAdd<=4'd3;        // BÖLÜNEN ALUinA'ya
                                InMuxAdd<=3'd4;
                                RegAdd<=4'd1;
                                casesubab<=casesubab+1;
                            end
                        1:  begin
                                OutMuxAdd<=4'd8;
                                InMuxAdd<=3'd4;
                                RegAdd<=4'd2;
                                InsSel <=2'd2;          // ADD A - B
                                casesubab<=casesubab+1;
                            end
                        2: casesubab<=casesubab+1;
                        3:  begin
                                if(!CO)
                                    begin
                                    countcase<=countcase+1'd1;
                                    casesubab<=1'b1;
                                    InMuxAdd<=3'd3;
                                    RegAdd<=4'd1;
                                    end
                                else
                                    begin
                                    remainder<=1;
                                    InMuxAdd<=3'd3;
                                    RegAdd<=4'd1;
                                    START_A_SUB_B<=0;
                                    end                                        
                            end             
                        endcase
                    end
                    
                     if(remainder)
                                        begin
                                        case(caseremainder)
                                            0:begin
                                                CUconst<= countcase;
                                                InMuxAdd<=3'd2;
                                                RegAdd<=4'd0;
                                                caseremainder<=caseremainder+1;
                                              end
                                            1:begin
                                                OutMuxAdd<=4'd4;
                                                InMuxAdd<=3'd4;
                                                RegAdd<=4'd2;
                                                caseremainder <= caseremainder+1;
                                              end
                                            2:begin
                                                InMuxAdd<=3'd3;
                                                RegAdd<=4'd14;
                                                caseremainder <= caseremainder+1;
                                                Busy<=0;
                                              end
                                            3:begin
                                                CUconst<=0;
                                                WE<=0;
                                                startprocess <= 0;
                                                remainder <=0;
                                                caseremainder <=0;
                                                countcase <=0;
                                                START_A_SUB_B <=0;
                                                casesubab<=0;
                                                STEP <=0;
                                                twoscomplement<=0;
                                                REGISTER_LOADS<=0;
                                                startprocess <=0;
                                                casereg <=0;
                                                casetwoscomplement<=0;            
                                                
                                              end
                                              
                                            
                                        endcase
                                        end   
                
              
              
                        end

end   
    

endmodule

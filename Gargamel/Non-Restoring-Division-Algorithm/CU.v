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
    
// STATE REGISTERS
reg K =0;    
reg ADD = 0;
reg [4:0] STEP = 5'd0;
reg CLEARQLSB=0;
reg [2:0] caseCLEARQLSB=3'd0;    
reg SUBSTRACT = 0;
reg twoscomplement = 0;
reg CLEAR_LSB= 0;
reg REGISTER_LOADS = 0;
reg shiftoperationQ = 0;
reg startprocess = 0;
reg shiftoperationA =0;
reg Aupdate = 0;
reg Qupdate = 0;
reg [2:0] caseADD = 3'd0;
reg [2:0] caseQupdate = 3'd0;
reg [2:0] caseSUBSTRACT =3'd0;
reg [2:0] caseAupdate = 3'd0;
reg [2:0] caseshiftQ = 3'd0;
reg [1:0] caseclearlsb = 2'd0;
reg [5:0] shiftingA = 6'd0;
reg [6:0] casereg = 7'd0;
reg [2:0] shiftB =2'd0;
reg [2:0] casetwoscomplement= 3'd0;
reg [3:0] casezero=4'd0;

always @(posedge clk or posedge rst) begin
    if(rst)
        begin
            Busy<=0;
            CUconst<=0;
            WE<=0;
            startprocess = 0;
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
                                        RegAdd<=4'd3;
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
                                RegAdd<=4'd7;
                                casezero<=casezero+1;
                               end
                            4:begin
                                  K <=0;                         
                                  ADD <= 0;                      
                                  STEP <= 5'd0;            
                                  CLEARQLSB<=0;                  
                                  caseCLEARQLSB<=3'd0;     
                                  SUBSTRACT <= 0;                
                                  twoscomplement <= 0;           
                                  CLEAR_LSB<= 0;                 
                                  REGISTER_LOADS <= 0;           
                                  shiftoperationQ <= 0;          
                                  startprocess <= 0;             
                                  shiftoperationA <=0;           
                                  Aupdate <= 0;                  
                                  Qupdate <= 0;                  
                                  caseADD <= 3'd0;         
                                  caseQupdate <= 3'd0;     
                                  caseSUBSTRACT <=3'd0;    
                                  caseAupdate <= 3'd0;     
                                  caseshiftQ <= 3'd0;      
                                  caseclearlsb <= 2'd0;    
                                  shiftingA <= 6'd0;       
                                  casereg <= 7'd0;         
                                  shiftB <=2'd0;           
                                  casetwoscomplement<= 3'd0;
                                  casezero<=0;
                                  Busy<=0;
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
                                        RegAdd<=4'd3;
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
                                RegAdd<=4'd7;
                                casezero<=casezero+1;
                               end
                            4:begin
                             casezero<=0;
                             K <=0;                         
                             ADD <= 0;                      
                             STEP <= 5'd0;            
                             CLEARQLSB<=0;                  
                             caseCLEARQLSB<=3'd0;     
                             SUBSTRACT <= 0;                
                             twoscomplement <= 0;           
                             CLEAR_LSB<= 0;                 
                             REGISTER_LOADS <= 0;           
                             shiftoperationQ <= 0;          
                             startprocess <= 0;             
                             shiftoperationA <=0;           
                             Aupdate <= 0;                  
                             Qupdate <= 0;                  
                             caseADD <= 3'd0;         
                             caseQupdate <= 3'd0;     
                             caseSUBSTRACT <=3'd0;    
                             caseAupdate <= 3'd0;     
                             caseshiftQ <= 3'd0;      
                             caseclearlsb <= 2'd0;    
                             shiftingA <= 6'd0;       
                             casereg <= 7'd0;         
                             shiftB <=2'd0;           
                             casetwoscomplement<= 3'd0;
                             Busy<=0;
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
                                shiftoperationA<=1;
                                casetwoscomplement<=0;
                                twoscomplement<=0;
                            end       
                        endcase
                    end
 // SHIFTING A
                if(shiftoperationA)
                  begin
                      case(shiftingA)
                      0:begin
                        OutMuxAdd <= 4'd7;     // A SHİFTLEMEK İÇİN A REGISTERI SEÇİLDİ
                        InMuxAdd <=3'd4;       // REGOUTPUT İNPUT OLARAK ALINDI
                        RegAdd<= 4'd1;         // ALUinA'YA YAZILDI
                        shiftingA <= shiftingA +1;    
                        InsSel <= 2'd3;                             
                        end
                      1:begin
                                   // SHIFT INSTRUCTION SEÇİLDİ
                            shiftingA <= shiftingA + 1; 
                        end  
                      2:begin
                          InMuxAdd <= 3'd3;    // Shiftlenen A kaydedilmek için ALUout seçildi
                          RegAdd <= 4'd7;      // A registerına kaydedildi.
                              if(CO)
                                  begin
                                      CLEAR_LSB<=1;
                                      shiftoperationA<=0;
                                      shiftoperationQ<=0;
                                      shiftingA<=0;
                                  end
                              else
                                   begin
                                        CLEAR_LSB<=0;
                                        shiftoperationA<=0;
                                        shiftoperationQ<=1;
                                        shiftingA <= 0;
                                   end    
                        end  
                      endcase
                      end
                                                  
                if(CLEAR_LSB)
                begin
                    case(caseclearlsb)
                    0: caseclearlsb<=caseclearlsb+1;
                    1:  begin
                            OutMuxAdd <= 4'd7;  // Shiftlenen A seçildi
                            InMuxAdd <= 3'd4;
                            RegAdd <= 4'd1;     //Shiftlenen A AluinA'ya yollandı
                            caseclearlsb<=caseclearlsb+1;
                        end
                    2:  begin
                            OutMuxAdd <= 4'd5;  // -1 seçildi
                            InMuxAdd <= 3'd4;
                            RegAdd <= 4'd2;     // -1 ALUinB'ye yollandı
                            caseclearlsb <= caseclearlsb +1;
                            InsSel <=  2'd2;    // Add instructionı seçildi
                        end
                    3:  begin
                            InMuxAdd <= 3'd3;   // ALUdan gelen A-1 sonucu seçildi
                            RegAdd <= 4'd7; // A, ALUinA 'ya yazıldı.
                            caseclearlsb <=0;
                            CLEAR_LSB<=0;
                            shiftoperationQ<=1;
                        end
                    endcase
                end      
                
                if(shiftoperationQ)
                begin
                    case(caseshiftQ)
                    0:  begin
                            OutMuxAdd <=4'd3;
                            InMuxAdd <=3'd4; 
                            RegAdd <= 4'd1;         // Q Shfitlemek için A'ya alındı ve shiftlendi
                            InsSel <= 2'd3;
                            caseshiftQ<=caseshiftQ+1;                         
                        end
                    1:  begin
                            InMuxAdd <=3'd3;
                            RegAdd <=3'd3;          // Shiftlenen Q, Q'ya yazıldı
                            caseshiftQ<=caseshiftQ+1;
                        end
                    2:  begin
                            K <= CO;
                            if(CO)
                                CLEARQLSB<=1;
                            else
                                Aupdate<=1;
                            caseshiftQ<=0; 
                            shiftoperationQ<=0;
                        end
                    endcase
                end
                
                     if(CLEARQLSB)
                    begin
                    case(caseCLEARQLSB)
                    0:begin
                        OutMuxAdd<=4'd3;
                        InMuxAdd<=4'd4;
                        RegAdd<=4'd1;
                        caseCLEARQLSB <=caseCLEARQLSB+1; 
                      end
                    1:begin
                        OutMuxAdd<=4'd5;
                        RegAdd<=4'd2;
                        InsSel<=2'd2;
                        caseCLEARQLSB <=caseCLEARQLSB+1;
                      end
                    2:begin
                        InMuxAdd<=3'd3;
                        RegAdd<=4'd3;
                        caseCLEARQLSB <=0;
                        CLEARQLSB<=0;
                        Aupdate<=1;
                      end       
                        
                    endcase    
                    end   
                
                if(Aupdate)
                begin
                    case(caseAupdate)
                    0:  begin
                            OutMuxAdd<=4'd7;
                            InMuxAdd<=3'd4;
                            RegAdd<=4'd1;
                            caseAupdate<=caseAupdate+1;
                        end
                    1:  begin
                        if(K==1)
                            begin
                            OutMuxAdd<=4'd6;
                            RegAdd<=4'd2;
                            InsSel<=2'd2;
                            end
                        else
                            begin
                                OutMuxAdd<=4'd13;
                                RegAdd<=4'd2;
                                InsSel<=2'd2;
                            end
                        caseAupdate<=caseAupdate+1;
                        end    
                    2:  begin
                            InMuxAdd<=3'd3;
                            RegAdd<=4'd7;           // A UPDATED
                            caseAupdate<=caseAupdate+1;
//                            caseAupdate<=0;
//                            Aupdate<=0;
                        end
                    3: begin
                            OutMuxAdd<=4'd7;
                            InMuxAdd<=3'd4;
                            InsSel<= 2'd3;
                            caseAupdate<=caseAupdate+1;
                        end
                    4:begin
                      if(CO)
                        ADD<=1;
                      else
                        SUBSTRACT<=1;
                      caseAupdate<=0;
                      Aupdate<=0;
                      end
                    endcase
                end
                
                
                if(SUBSTRACT)
                    begin
                        case(caseSUBSTRACT)
                        0:begin
                            OutMuxAdd<=4'd7;
                            InMuxAdd<=3'd4;
                            RegAdd<=4'd1;
                            caseSUBSTRACT<=caseSUBSTRACT+1;
                          end
                        1:begin
                            OutMuxAdd<=4'd8;
                            RegAdd<=4'd2;
                            InsSel<=2'd2;
                            caseSUBSTRACT<=caseSUBSTRACT+1;
                          end
                        2:begin
                            InMuxAdd<=3'd3;
                            RegAdd<=4'd7;
                            caseSUBSTRACT<=caseSUBSTRACT+1;
                          end
                        3:begin
                            caseSUBSTRACT<=0;
                            SUBSTRACT<=0;
                            Qupdate<=1;
                          end
                        endcase
                    end
                    
                    
                    if(ADD)
                    begin
                        case(caseADD)
                        0:begin
                            OutMuxAdd<=4'd7;
                            InMuxAdd<=3'd4;
                            RegAdd<=4'd1;
                            caseADD<=caseADD+1;
                          end
                        1:begin
                            OutMuxAdd<=4'd4;
                            RegAdd<=4'd2;
                            InsSel<=2'd2;
                            caseADD<=caseADD+1;
                          end
                        2:begin
                            InMuxAdd<=3'd3;
                            RegAdd<=4'd7;
                            caseADD<=caseADD+1;
                          end
                        3:begin
                            caseADD<=0;
                            ADD<=0;
                            Qupdate<=1;
                          end
                        endcase
                    end
                    
                    
                    
                    
                    
                    
           
                if(Qupdate)
                    begin
                        case(caseQupdate)
                        0:caseQupdate<=caseQupdate+1;
                        1:begin
                            OutMuxAdd<=4'd7;
                            InMuxAdd<=3'd4;
                            RegAdd<=4'd1;
                            caseQupdate<=caseQupdate+1;
                          end
                        2:begin
                            InsSel<= 2'd3;      // A shifted
                            caseQupdate<=caseQupdate+1;
                            end  
                        3:begin
                            if(!CO)
                                begin
                                    OutMuxAdd<=4'd3;
                                    InMuxAdd<=3'd4;
                                    RegAdd<=4'd1;
                                    caseQupdate<=caseQupdate+1;        
                                end
                            else
                                begin
                                caseQupdate<=0;
                                Qupdate<=0;
                                shiftoperationA<=1;
                                STEP <= STEP+1;
                                end       
                          end
                        4:  begin
                                OutMuxAdd<=4'd6;
                                RegAdd<=4'd2;
                                InsSel <= 2'd2;
                                caseQupdate<=caseQupdate+1;    
                            end
                        5:  begin
                                InMuxAdd <=3'd3;
                                RegAdd<=4'd3;
                                caseQupdate<=0;
                                Qupdate<=0;
                                shiftoperationA<=1;
                                STEP <= STEP+1;
                            end    
                        endcase
                    end
                            //
                        end
      else if(STEP == 8)
      begin
      K <=0;                         
      ADD <= 0;                      
      STEP <= 5'd0;            
      CLEARQLSB<=0;                  
      caseCLEARQLSB<=3'd0;     
      SUBSTRACT <= 0;                
      twoscomplement <= 0;           
      CLEAR_LSB<= 0;                 
      REGISTER_LOADS <= 0;           
      shiftoperationQ <= 0;          
      startprocess <= 0;             
      shiftoperationA <=0;           
      Aupdate <= 0;                  
      Qupdate <= 0;                  
      caseADD <= 3'd0;         
      caseQupdate <= 3'd0;     
      caseSUBSTRACT <=3'd0;    
      caseAupdate <= 3'd0;     
      caseshiftQ <= 3'd0;      
      caseclearlsb <= 2'd0;    
      shiftingA <= 6'd0;       
      casereg <= 7'd0;         
      shiftB <=2'd0;           
      casetwoscomplement<= 3'd0;
      Busy<=0;
      end
      

end   
    

endmodule

module alu (input logic [31:0] SrcA, SrcB,
            input  logic [4:0]  Sa,
            input  logic  [3:0] AluControl,
            output logic [31:0] ALUResult);

    always_comb
        case (AluControl)
            4'b0010: 
               ALUResult = SrcA + SrcB;
            4'b0000:
               ALUResult = SrcA & SrcB;
            4'b0011:
               ALUResult = SrcA ^ SrcB;
            4'b0001:
               ALUResult = SrcA | SrcB;
            4'b0110:
               ALUResult = SrcA - SrcB;
            4'b0111:
               ALUResult = SrcA < SrcB;
            4'b0100:
               ALUResult = SrcB << Sa;
            4'b0101:
               ALUResult = SrcB << SrcA[4:0];
            4'b1000:
               ALUResult = SrcB >> Sa;
            4'b1001:
               ALUResult = SrcB >> SrcA[4:0];
            4'b1010:
               ALUResult = $signed(SrcB) >>> Sa;
            4'b1011:
               ALUResult = $signed(SrcB) >>> SrcA[4:0];
            4'b1100:
               ALUResult = SrcB;
            default:
                ALUResult = 32'b0;
        endcase

endmodule

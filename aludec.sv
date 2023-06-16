module aludec (input logic [5:0] funct, 
               input logic [2:0] aluop,
               output logic ismultiply,
               output logic [3:0] alucontrol,
               output logic Jr, alusrc2);

    always_comb
    begin
        //assign Jr      = 1'b0;
        //assign alusrc2 = 1'b0;
        case (aluop)
            3'b000: {ismultiply, alucontrol, Jr, alusrc2} = 7'b0001000; // addi/addiU
            3'b001: {ismultiply, alucontrol, Jr, alusrc2} = 7'b0000000; // andi
            3'b010: {ismultiply, alucontrol, Jr, alusrc2} = 7'b1000000; // MUL
            3'b011: {ismultiply, alucontrol, Jr, alusrc2} = 7'b0000100; // ori
            3'b100: {ismultiply, alucontrol, Jr, alusrc2} = 7'b0001100; // xori
            3'b101: {ismultiply, alucontrol, Jr, alusrc2} = 7'b0110000; // jal
            default:
                case (funct)
                    6'b100000: {ismultiply, alucontrol, Jr, alusrc2} = 7'b0001000; // ADD
                    6'b100001: {ismultiply, alucontrol, Jr, alusrc2} = 7'b0001000; // ADDU
                    6'b100010: {ismultiply, alucontrol, Jr, alusrc2} = 7'b0011000; // SUB
                    6'b100100: {ismultiply, alucontrol, Jr, alusrc2} = 7'b0000000; // AND
                    6'b100101: {ismultiply, alucontrol, Jr, alusrc2} = 7'b0000100; // OR
                    6'b101010: {ismultiply, alucontrol, Jr, alusrc2} = 7'b0011100; // SLT
                    6'b100110: {ismultiply, alucontrol, Jr, alusrc2} = 7'b0001100; // XOR
                    6'b000000: {ismultiply, alucontrol, Jr, alusrc2} = 7'b0010000; // SLL
                    6'b000100: {ismultiply, alucontrol, Jr, alusrc2} = 7'b0010100; // SLLV
                    6'b000010: {ismultiply, alucontrol, Jr, alusrc2} = 7'b0100000; //SRL
                    6'b000110: {ismultiply, alucontrol, Jr, alusrc2} = 7'b0100100; //SRLV
                    6'b000011: {ismultiply, alucontrol, Jr, alusrc2} = 7'b0101000; //SRA
                    6'b000111: {ismultiply, alucontrol, Jr, alusrc2} = 7'b0101100; //SRAV
                    6'b001000: {ismultiply, alucontrol, Jr, alusrc2} = 7'b0110010; //JR
                    6'b001001: {ismultiply, alucontrol, Jr, alusrc2} = 7'b0110011; //JALR
                    default:   {ismultiply, alucontrol, Jr, alusrc2} = 7'bxxxxxxx; // ??
                endcase
            endcase
    end
endmodule

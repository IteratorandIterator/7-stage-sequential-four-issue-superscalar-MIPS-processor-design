module maindec (input logic [5:0] op,
                output logic       memtoreg, memwrite,
                output logic       branch, alusrc,
                output logic [1:0] regdst, 
                output logic       regwrite,
                output logic       jump,
                output [2:0]       aluop,
                output [1:0]       immchoice,
                output [2:0]       cmppatternchoice);

    logic [15:0] controls;

    assign { cmppatternchoice, immchoice, regwrite, regdst, alusrc, branch, memwrite,
             memtoreg, jump, aluop } = controls;

    always_comb
        case (op)
            6'b000000: controls = 16'b0001110100000110; // Rtype
            6'b100011: controls = 16'b0000010010010000; // LW
            6'b101011: controls = 16'b0000000010100000; // SW
            6'b000100: controls = 16'b0000000001000000; // BEQ
            6'b001000: controls = 16'b0000010010000000; // ADDI
            6'b001001: controls = 16'b0000010010000000; // ADDIU
            6'b000010: controls = 16'b0000000000001000; // J
            6'b011100: controls = 16'b0000010100000010; // MUL
            6'b001100: controls = 16'b0000110010000001; // ANDI
            6'b001101: controls = 16'b0000110010000011; // ORI
            6'b001110: controls = 16'b0000110010000100; // XORI
            6'b001111: controls = 16'b0001010010000000; // LUI
            6'b000101: controls = 16'b0010000001000000; // BNE
            6'b000111: controls = 16'b0100000001000000; // BGTZ
            6'b000110: controls = 16'b0110000001000000; // BLEZ
            6'b000001: controls = 16'b1000000001000000; // BGEZ/BLTZ
            6'b000011: controls = 16'b0001111010001101; // JAL
            default:   controls = 16'b0000000000000000; // ???
        endcase

endmodule

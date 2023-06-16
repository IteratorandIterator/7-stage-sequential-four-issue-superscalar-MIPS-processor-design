module imem (input  logic [31:0] a, 
             output logic [31:0] rd,
             output logic [31:0] rd2,
             output logic [31:0] rd3,
             output logic [31:0] rd4);

    logic [31:0] RAM [19:0];

    initial
    begin
        $readmemh("E://Q-7-MIPS/Instr2.txt", RAM); // word aligned
    end
    
    /*genvar i;
    generate
    for (i = 0; i < 124; i = i + 1) begin : ram_gen
        assign RAM[i] = RAM[i];
        end
    endgenerate*/

    logic [31:0] a2, a3, a4;
    assign a2 = a +  4;
    assign a3 = a +  8;
    assign a4 = a + 12;

    assign rd  =  RAM[a[31:2]];
    assign rd2 = RAM[a2[31:2]];
    assign rd3 = RAM[a3[31:2]];
    assign rd4 = RAM[a4[31:2]];

endmodule

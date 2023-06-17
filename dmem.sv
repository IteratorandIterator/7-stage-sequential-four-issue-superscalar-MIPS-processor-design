module dmem (input  logic clk, we, we2,
             input  logic [31:0] a_1,   wd,
             input  logic [31:0] a_2,  wd2,

             input  logic [31:0] a,   a2,
             input  logic [31:0] a3,  a4,
             output logic [31:0] rd,  rd2,
             output logic [31:0] rd3, rd4);

    logic [31:0] RAM [19:0];

    assign rd  =  RAM[a[31:2]]; // word aligned
    assign rd2 = RAM[a2[31:2]];
    assign rd3 = RAM[a3[31:2]];
    assign rd4 = RAM[a4[31:2]];

    always_ff @(posedge clk)
    begin
        if (we)
            RAM[a_1[31:2]] <= wd;

        if (we2)
            RAM[a_2[31:2]] <= wd2;
    end

endmodule

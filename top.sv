`timescale 1ns / 1ps

module top (input  logic clk, reset,
            output logic we2,
            output logic [31:0] pcF,
            output logic [31:0] dataadrM2,
            output logic [31:0] writedata2M2);

    logic        we, we3, we4;
    logic        we_1, we_2;

    logic [31:0] instrF, instrF2,
                 instrF3, instrF4;

    logic [31:0] dataadrM,   dataadrM3, dataadrM4;
    logic [31:0] dataadrM_1, dataadrM_2;

    logic [31:0] readdataM,  readdataM2,
                 readdataM3, readdataM4;

    logic [31:0] writedata2M,   writedata2M3, writedata2M4;
    logic [31:0] writedata2M_1, writedata2M_2;

    mips mips (clk, reset,
               pcF,

               instrF,  instrF2,
               instrF3, instrF4,

               we, we2, we3, we4,

               dataadrM,  writedata2M,
               dataadrM2, writedata2M2,
               dataadrM3, writedata2M3,
               dataadrM4, writedata2M4,

               readdataM,  readdataM2,
               readdataM3, readdataM4);

    imem imem (pcF, instrF, instrF2, instrF3, instrF4);

    always_comb
    begin
        if      (we == 1'b1 & we2 == 1'b1)
        begin
            {we_1, we_2} = 2'b11;

            {dataadrM_1, dataadrM_2} = {dataadrM,  dataadrM2};

            {writedata2M_1, writedata2M_2} = {writedata2M, writedata2M2};
        end
        else if (we3 == 1'b1 & we4 == 1'b1)
        begin
            {we_1, we_2} = 2'b11;

            {dataadrM_1, dataadrM_2} = {dataadrM3, dataadrM4};

            {writedata2M_1, writedata2M_2} = {writedata2M3, writedata2M4};
        end
        else
        begin
            we_1 = we  ? we  : we2;
            we_2 = we3 ? we3 : we4;

            dataadrM_1 = we ? dataadrM  : dataadrM2;
            dataadrM_2 = we3? dataadrM3 : dataadrM4;

            writedata2M_1 = we ? writedata2M : writedata2M2;
            writedata2M_2 = we3? writedata2M3: writedata2M4;
        end
    end

    dmem dmem (clk, we_1, we_2,

               dataadrM_1, writedata2M_1,
               dataadrM_2, writedata2M_2,

               dataadrM,   dataadrM2,
               dataadrM3,  dataadrM4,
               readdataM,  readdataM2,
               readdataM3, readdataM4);

endmodule

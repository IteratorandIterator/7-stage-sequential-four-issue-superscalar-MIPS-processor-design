module regfile (input  logic  clk, reset,
                input  logic  we, we2, we3, we4,

                input  logic  [4:0]  rs,  rt,  rd,
                input  logic  [4:0]  rs2, rt2, rd2,
                input  logic  [4:0]  rs3, rt3, rd3,
                input  logic  [4:0]  rs4, rt4, rd4,

                input  logic  [31:0] writedata,
                input  logic  [31:0] writedata2,
                input  logic  [31:0] writedata3,
                input  logic  [31:0] writedata4,

                output logic  [31:0] readd1,  readd2,
                output logic  [31:0] readd12, readd22,
                output logic  [31:0] readd13, readd23,
                output logic  [31:0] readd14, readd24);

    logic [31:0] regs [31:0];

    assign readd1  = rs? regs[rs]   : 32'b0;
    assign readd2  = rt? regs[rt]   : 32'b0;

    assign readd12 = rs2? regs[rs2] : 32'b0;
    assign readd22 = rt2? regs[rt2] : 32'b0;

    assign readd13 = rs3? regs[rs3] : 32'b0;
    assign readd23 = rt3? regs[rt3] : 32'b0;

    assign readd14 = rs4? regs[rs4] : 32'b0;
    assign readd24 = rt4? regs[rt4] : 32'b0;

    genvar i;
    always_ff @(posedge clk)
    begin
        if (reset)
            regs[0] <=  '0;
 
        if (we)
            regs[rd] <= writedata;

        if (we2)
            regs[rd2] <= writedata2;

        if (we3)
            regs[rd3] <= writedata3;

        if (we4)
            regs[rd4] <= writedata4;
    end
    
    /*always_ff @(posedge clk)
    begin
        if (we2)
            regs[rd2] <= writedata2;
    end

    always_ff @(posedge clk)
    begin
        if (we3)
            regs[rd3] <= writedata3;
    end
    
    always_ff @(posedge clk)
    begin
        if (we4)
            regs[rd4] <= writedata4;
    end*/

endmodule

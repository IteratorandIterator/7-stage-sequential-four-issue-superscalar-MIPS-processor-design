module mips (input  logic clk, reset,
             output logic [31:0] pcF,
             input  logic [31:0] instrF,  instrF2,
                                 instrF3, instrF4,
             output logic        memwriteM,  memwriteM2,
                                 memwriteM3, memwriteM4,
             output logic [31:0] dataadrM,   writedata2M,
                                 dataadrM2,  writedata2M2,
                                 dataadrM3,  writedata2M3,
                                 dataadrM4,  writedata2M4,
             input  logic [31:0] readdataM,  readdataM2,
                                 readdataM3, readdataM4);
    logic [5:0] opD, functD;
    logic [1:0] regdstE; 
    logic       alusrcE, branchD, branch2D,
                memtoregE, memtoregM, memtoregW, memtoregMUL,
                regwriteE, regwriteM, regwriteMUL, regwriteW;
    logic [1:0] pcsrcD;
    logic [3:0] alucontrolE;
    logic       flushE, equalD;
    logic       ismultiplyE, ismultiplyM, ismultiplyMUL;
    logic [1:0] resultsrcW;
    logic       flushI, equalI, isbypassD, pcsrcI, branchI;                  // Seven-stage
    logic       stallI;                                                      // Seven-stage
    logic       memwriteI;
    logic [1:0] regdstI;
    logic       regwriteI;
    logic       memtoregI;
    logic [1:0] immchoiceD;
    logic [2:0] cmppatternchoiceD;
    logic [2:0] cmppatternchoiceI;
    logic       JrD, JrI;
    logic       isforwardaD;

    controller c1 (clk, reset,
                   opD, functD,
                   flushE, equalD,
                   flushI, equalI,
                   isbypassD,
                   memtoregE, memtoregM,
                   memtoregW, memtoregMUL,
                   memwriteM,
                   branch2D,  branchD, alusrcE,
                   regdstE,
                   regwriteE,   regwriteM,
                   regwriteMUL, regwriteW,
                   ismultiplyE, ismultiplyM, ismultiplyMUL,
                   pcsrcI,
                   branchI,
                   stallI,
                   jumpD,
                   pcsrcD,
                   alucontrolE,
                   resultsrcW,
                   memwriteI,
                   regwriteI,
                   regdstI,
                   memtoregI,
                   immchoiceD,
                   cmppatternchoiceD,
                   cmppatternchoiceI,
                   JrD, JrI,
                   isforwardaD);


    logic [5:0] opD2, functD2;
    logic [1:0] regdstE2;
    logic       alusrcE2, branchD2, branch2D2,
                memtoregE2, memtoregM2, memtoregW2, memtoregMUL2,
                regwriteE2, regwriteM2, regwriteMUL2, regwriteW2;
    logic [1:0] pcsrcD2;
    logic [3:0] alucontrolE2;
    logic       flushE2, equalD2;
    logic       ismultiplyE2, ismultiplyM2, ismultiplyMUL2;
    logic [1:0] resultsrcW2;
    logic       flushI2, equalI2, isbypassD2, pcsrcI2, branchI2;                  // Seven-stage
    logic       stallI2;                                                      // Seven-stage
    logic       memwriteI2;
    logic [1:0] regdstI2;                                         
    logic       regwriteI2;    
    logic       memtoregI2;     
    logic [1:0] immchoiceD2;   
    logic [2:0] cmppatternchoiceD2;
    logic [2:0] cmppatternchoiceI2;      
    logic       JrD2, JrI2;     
    logic       isforwardaD2;                

    controller c2 (clk, reset,
                   opD2, functD2,
                   flushE2,  equalD2,
                   flushI2,  equalI2,
                   isbypassD2,
                   memtoregE2, memtoregM2,
                   memtoregW2, memtoregMUL2,
                   memwriteM2,
                   branch2D2,  branchD2, alusrcE2,
                   regdstE2,
                   regwriteE2,   regwriteM2,
                   regwriteMUL2, regwriteW2,
                   ismultiplyE2, ismultiplyM2, ismultiplyMUL2,
                   pcsrcI2,
                   branchI2,
                   stallI2,
                   jumpD2,
                   pcsrcD2,
                   alucontrolE2,
                   resultsrcW2,
                   memwriteI2,
                   regwriteI2,
                   regdstI2,
                   memtoregI2,
                   immchoiceD2,
                   cmppatternchoiceD2,
                   cmppatternchoiceI2,
                   JrD2, JrI2,
                   isforwardaD2);

    logic [5:0] opD3, functD3;
    logic [1:0] regdstE3;
    logic       alusrcE3, branchD3, branch2D3,
                memtoregE3, memtoregM3, memtoregW3, memtoregMUL3,
                regwriteE3, regwriteM3, regwriteMUL3, regwriteW3;
    logic [1:0] pcsrcD3;
    logic [3:0] alucontrolE3;
    logic       flushE3, equalD3;
    logic       ismultiplyE3, ismultiplyM3, ismultiplyMUL3;
    logic [1:0] resultsrcW3;
    logic       flushI3, equalI3, isbypassD3, pcsrcI3, branchI3;                  // Seven-stage
    logic       stallI3;                                                      // Seven-stage
    logic       memwriteI3;
    logic [1:0] regdstI3;                                         
    logic       regwriteI3;                                       
    logic       memtoregI3;
    logic [1:0] immchoiceD3;
    logic [2:0] cmppatternchoiceD3;
    logic [2:0] cmppatternchoiceI3;
    logic       JrD3, JrI3;
    logic       isforwardaD3;

    controller c3 (clk, reset,
                   opD3, functD3,
                   flushE3,  equalD3,
                   flushI3,  equalI3,
                   isbypassD3,
                   memtoregE3, memtoregM3,
                   memtoregW3, memtoregMUL3,
                   memwriteM3,
                   branch2D3,  branchD3, alusrcE3,
                   regdstE3,
                   regwriteE3,   regwriteM3,
                   regwriteMUL3, regwriteW3,
                   ismultiplyE3, ismultiplyM3, ismultiplyMUL3,
                   pcsrcI3,
                   branchI3,
                   stallI3,
                   jumpD3,
                   pcsrcD3,
                   alucontrolE3,
                   resultsrcW3,
                   memwriteI3,
                   regwriteI3,
                   regdstI3,
                   memtoregI3,
                   immchoiceD3,
                   cmppatternchoiceD3,
                   cmppatternchoiceI3,
                   JrD3, JrI3,
                   isforwardaD3);


    logic [5:0] opD4, functD4;
    logic [1:0] regdstE4;
    logic       alusrcE4, branchD4, branch2D4,
                memtoregE4, memtoregM4, memtoregW4, memtoregMUL4,
                regwriteE4, regwriteM4, regwriteMUL4, regwriteW4;
    logic [1:0] pcsrcD4;
    logic [3:0] alucontrolE4;
    logic       flushE4, equalD4;
    logic       ismultiplyE4, ismultiplyM4, ismultiplyMUL4;
    logic [1:0] resultsrcW4;
    logic       flushI4, equalI4, isbypassD4, pcsrcI4, branchI4;                  // Seven-stage
    logic       stallI4;                                                      // Seven-stage
    logic       memwriteI4;
    logic [1:0] regdstI4;                                         
    logic       regwriteI4;                                       
    logic       memtoregI4;
    logic [1:0] immchoiceD4;
    logic [2:0] cmppatternchoiceD4;
    logic [2:0] cmppatternchoiceI4;
    logic       JrD4, JrI4;
    logic       isforwardaD4;

    controller c4 (clk, reset,
                   opD4, functD4,
                   flushE4,  equalD4,
                   flushI4,  equalI4,
                   isbypassD4,
                   memtoregE4, memtoregM4,
                   memtoregW4, memtoregMUL4,
                   memwriteM4,
                   branch2D4,  branchD4, alusrcE4,
                   regdstE4,
                   regwriteE4,   regwriteM4,
                   regwriteMUL4, regwriteW4,
                   ismultiplyE4, ismultiplyM4, ismultiplyMUL4,
                   pcsrcI4,
                   branchI4,
                   stallI4,
                   jumpD4,
                   pcsrcD4,
                   alucontrolE4,
                   resultsrcW4,
                   memwriteI4,
                   regwriteI4,
                   regdstI4,
                   memtoregI4,
                   immchoiceD4,
                   cmppatternchoiceD4,
                   cmppatternchoiceI4,
                   JrD4, JrI4,
                   isforwardaD4);




    datapath dp (clk, reset, 
                 branchD, 
                 pcsrcD,
                 memtoregE, memtoregM, memtoregMUL,
                 alusrcE, regdstE, 
                 regwriteE, regwriteM, 
                 regwriteMUL, regwriteW,
                 ismultiplyE, ismultiplyM, ismultiplyMUL,
                 resultsrcW,
                 alucontrolE,
                 pcsrcI, branchI,
                 equalI,
                 equalD, 
                 isbypassD,
                 pcF, 
                 instrF,
                 dataadrM, writedata2M, 
                 readdataM,
                 opD, functD, 
                 flushE,
                 stallI,
                 memwriteI,
                 regwriteI,
                 regdstI,
                 memwriteM,
                 flushI,
                 memtoregI,
                 immchoiceD,
                 cmppatternchoiceD,
                 cmppatternchoiceI,
                 JrD, JrI,
                 isforwardaD,
                 
                 // ========signals for channel two=====
                 
                 branchD2, 
                 pcsrcD2,
                 memtoregE2, memtoregM2, memtoregMUL2,
                 alusrcE2, regdstE2, 
                 regwriteE2, regwriteM2, 
                 regwriteMUL2, regwriteW2,
                 ismultiplyE2, ismultiplyM2, ismultiplyMUL2,
                 resultsrcW2,
                 alucontrolE2,
                 pcsrcI2, branchI2,
                 equalI2,
                 equalD2, 
                 isbypassD2,
                 instrF2,
                 dataadrM2, writedata2M2, 
                 readdataM2,
                 opD2, functD2, 
                 flushE2,
                 stallI2,
                 memwriteI2,
                 regwriteI2,
                 regdstI2,
                 memwriteM2,
                 flushI2,
                 memtoregI2,
                 immchoiceD2,
                 cmppatternchoiceD2,
                 cmppatternchoiceI2,
                 JrD2, JrI2,
                 isforwardaD2,


                 // ========signals for channel three=====
                 
                 branchD3, 
                 pcsrcD3,
                 memtoregE3, memtoregM3, memtoregMUL3,
                 alusrcE3, regdstE3, 
                 regwriteE3, regwriteM3, 
                 regwriteMUL3, regwriteW3,
                 ismultiplyE3, ismultiplyM3, ismultiplyMUL3,
                 resultsrcW3,
                 alucontrolE3,
                 pcsrcI3, branchI3,
                 equalI3,
                 equalD3, 
                 isbypassD3,
                 instrF3,
                 dataadrM3, writedata2M3, 
                 readdataM3,
                 opD3, functD3, 
                 flushE3,
                 stallI3,
                 memwriteI3,
                 regwriteI3,
                 regdstI3,
                 memwriteM3,
                 flushI3,
                 memtoregI3,
                 immchoiceD3,
                 cmppatternchoiceD3,
                 cmppatternchoiceI3,
                 JrD3, JrI3,
                 isforwardaD3,


                 // ========signals for channel four=====
                 
                 branchD4, 
                 pcsrcD4,
                 memtoregE4, memtoregM4, memtoregMUL4,
                 alusrcE4, regdstE4, 
                 regwriteE4, regwriteM4, 
                 regwriteMUL4, regwriteW4,
                 ismultiplyE4, ismultiplyM4, ismultiplyMUL4,
                 resultsrcW4,
                 alucontrolE4,
                 pcsrcI4, branchI4,
                 equalI4,
                 equalD4, 
                 isbypassD4,
                 instrF4,
                 dataadrM4, writedata2M4, 
                 readdataM4,
                 opD4, functD4, 
                 flushE4,
                 stallI4,
                 memwriteI4,
                 regwriteI4,
                 regdstI4,
                 memwriteM4,
                 flushI4,
                 memtoregI4,
                 immchoiceD4,
                 cmppatternchoiceD4,
                 cmppatternchoiceI4,
                 JrD4, JrI4,
                 isforwardaD4);

endmodule

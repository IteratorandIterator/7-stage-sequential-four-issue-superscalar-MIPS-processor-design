// input [clk, reset]       fundamental elements
// input [opD, functD]      op-info extracted from instr
// input [flushE, equalD]   the first one come from hazard unit, 
//                          the second one come from E-stage
//  ------------------------------------------------------------------
//         [memtoregD, memwriteD, branchD, alusrcD, regdstD, 
//          regwriteD, jumpD, aluopD, alucontrolD]
//  ==all control signals generated in Decode-stage==
//  output [pcsrcD, branchD, jumpD]
//  ==all control signals will be consumed in Decode-stage==
//
//         [memtoregE, memwriteE, alusrcE, regdstE, regwriteE,
//          alucontrolE]
//  ==all control signals stored in Execute-stage==
//  output [memtoregE, alusrcE, regdstE, regwriteE]
//  ==all control signals will be consumed in Execute-stage==
//  
//         [memtoregM, memwriteM, regwriteM]
//  ==all control signals stored in Memory-stage==
//  output [memtoregM, memwriteM, regwriteM] 
//  ==all control signals will be consumed in Memory-stage==
//
//         [memtoregW, regwriteW]
//  ==all control signals stored in WriteBack-stage==
//  output [memtoregW, regwriteW]
//  ==all control signals will be consumed in WriteBack-stage==
//
module controller (input logic clk, reset,
                   input logic [5:0] opD, functD,
                   input logic       flushE, equalD,
                   input logic       flushI, equalI,            // Seven-stage
                   input logic       isbypassD,                 // Seven-stage
                   output logic      memtoregE, memtoregM,
                   output logic      memtoregW, memtoregMUL,
                   output logic      memwriteM,
                   output logic      branch2D, branchD, alusrcE,
                   output logic [1:0]regdstE, 
                   output logic      regwriteE, regwriteM,
                                     regwriteMUL, regwriteW,
                   output logic      ismultiplyE, ismultiplyM,
                                     ismultiplyMUL,
                   output logic       pcsrcI,                   // Seven-stage
                   output logic       branchI,                  // Seven-stage
                   input  logic       stallI,
                   output logic       jumpD,
                   output logic [1:0] pcsrcD,
                   output logic [3:0] alucontrolE,
                   output logic [1:0] resultsrcW,
                   output logic       memwriteI,
                   output logic       regwriteI,
                   output logic [1:0] regdstI,
                   output logic       memtoregI,
                   output logic [1:0] immchoiceD,
                   output logic [2:0] cmppatternchoiceD,
                   output logic [2:0] cmppatternchoiceI,
                   output logic       JrD, JrI,
                   input  logic       isforwardaD);

    logic       alusrc2D, alusrc3D;
    logic [2:0] aluopD;
    logic       memtoregD, memwriteD, alusrcD,
                regwriteD, ismultiplyD;
    logic [1:0] regdstD;
    logic [3:0] alucontrolD;
    logic       memwriteE;
    logic       alusrcI,                  // Seven-stage
                ismultiplyI;                // Seven-stage
    logic [3:0] alucontrolI;                         // Seven-stage

    // some adjustments are needed
    // all ismultiply signals may need to send to hazard unit from M-stage
    logic ismultiplyW;

    maindec md (opD, memtoregD, memwriteD, branchD,
                alusrcD, regdstD, regwriteD, jumpD,
                aluopD, immchoiceD, cmppatternchoiceD);

    aludec  ad (functD, aluopD, ismultiplyD, alucontrolD, JrD, alusrc2D);

    assign branch2D = (branchD & equalD & isbypassD) | (JrD & isforwardaD);
    assign pcsrcD = {jumpD, branch2D};
    // newly added
    assign resultsrcW = {ismultiplyW, memtoregW};
    // Seven-stage
    assign pcsrcI = ((branchI & equalI) | JrI) & ~stallI;
    assign alusrc3D = alusrcD | alusrc2D;
    

    // pipeline registers
    flopenrc #(16) regI (clk, reset, ~stallI, flushI,                   // Seven-stage
                        {memtoregD, memwriteD, alusrc3D, regdstD,
                        regwriteD, ismultiplyD, alucontrolD, branchD,
                        cmppatternchoiceD, JrD},  // Seven-stage
                        {memtoregI, memwriteI, alusrcI, regdstI,
                        regwriteI, ismultiplyI, alucontrolI, branchI,
                        cmppatternchoiceI, JrI}); // Seven-stage

    floprc #(11)  regE   (clk, reset, flushE,
                        {memtoregI, memwriteI, alusrcI, regdstI,
                        regwriteI, ismultiplyI, alucontrolI},
                        {memtoregE, memwriteE, alusrcE, regdstE,
                        regwriteE, ismultiplyE, alucontrolE});
                        
    flopr  #(4)  regM    (clk, reset,
                        {memtoregE, memwriteE, regwriteE, ismultiplyE},
                        {memtoregM, memwriteM, regwriteM, ismultiplyM});

    flopr #(3)  regMUL  (clk, reset,
                        {memtoregM, regwriteM, ismultiplyM},
                        {memtoregMUL, regwriteMUL, ismultiplyMUL});
                        
    flopr  #(3)  regW   (clk, reset,
                        {memtoregMUL, regwriteMUL, ismultiplyMUL},
                        {memtoregW, regwriteW, ismultiplyW}); 

endmodule

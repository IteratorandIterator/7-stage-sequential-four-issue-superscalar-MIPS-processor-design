module datapath (input  logic       clk, reset,
                 input  logic       branchD,
                 input  logic [1:0] pcsrcD,
                 input  logic       memtoregE, memtoregM, memtoregMUL,
                 input  logic       alusrcE,
                 input  logic [1:0] regdstE,
                 input  logic       regwriteE, regwriteM, regwriteMUL, regwriteW,
                 input  logic       ismultiplyE, ismultiplyM, ismultiplyMUL,
                 input  logic [1:0] resultsrcW,
                 input  logic [3:0] alucontrolE,
                 input  logic       pcsrcI, branchI,             // Seven-stage
                 output logic       equalI,
                 output logic       equalD,
                 output logic       isbypassD,                   // Seven-stage
                 output logic [31:0]pcF,
                 input  logic [31:0]instrF,
                 output logic [31:0]dataadrM, writedata2M,
                 input  logic [31:0]readdataM,
                 output logic [5:0] opD, functD,
                 output logic       flushE,
                 output logic       stallI,
                 input  logic       memwriteI,
                 input  logic       regwriteI,
                 input  logic [1:0] regdstI,
                 input  logic       memwriteM,
                 output logic       flushI,
                 input  logic       memtoregI,
                 input  logic [1:0] immchoiceD,
                 input  logic [2:0] cmppatternchoiceD,
                 input  logic [2:0] cmppatternchoiceI,
                 input  logic       JrD, JrI,
                 output logic       isforwardaD,
                 
                 // ====================signals for channel two==========
                 
                 input  logic       branchD2,
                 input  logic [1:0] pcsrcD2,
                 input  logic       memtoregE2, memtoregM2, memtoregMUL2,
                 input  logic       alusrcE2, 
                 input  logic [1:0] regdstE2,
                 input  logic       regwriteE2, regwriteM2, regwriteMUL2, regwriteW2,
                 input  logic       ismultiplyE2, ismultiplyM2, ismultiplyMUL2,
                 input  logic [1:0] resultsrcW2,
                 input  logic [3:0] alucontrolE2,
                 input  logic       pcsrcI2, branchI2,             // Seven-stage
                 output logic       equalI2,
                 output logic       equalD2,
                 output logic       isbypassD2,                   // Seven-stage
                 input  logic [31:0]instrF2,
                 output logic [31:0]dataadrM2, writedata2M2,
                 input  logic [31:0]readdataM2,
                 output logic [5:0] opD2, functD2,
                 output logic       flushE2,                      // **
                 output logic       stallI2,
                 input  logic       memwriteI2,
                 input  logic       regwriteI2,                    //***
                 input  logic [1:0] regdstI2,                     //***
                 input  logic       memwriteM2,
                 output logic       flushI2,
                 input  logic       memtoregI2,
                 input  logic [1:0] immchoiceD2,
                 input  logic [2:0] cmppatternchoiceD2,
                 input  logic [2:0] cmppatternchoiceI2,
                 input  logic       JrD2, JrI2,
                 output logic       isforwardaD2,


                 // ====================signals for channel three==========
                 
                 input  logic       branchD3,
                 input  logic [1:0] pcsrcD3,
                 input  logic       memtoregE3, memtoregM3, memtoregMUL3,
                 input  logic       alusrcE3, 
                 input  logic [1:0] regdstE3,
                 input  logic       regwriteE3, regwriteM3, regwriteMUL3, regwriteW3,
                 input  logic       ismultiplyE3, ismultiplyM3, ismultiplyMUL3,
                 input  logic [1:0] resultsrcW3,
                 input  logic [3:0] alucontrolE3,
                 input  logic       pcsrcI3, branchI3,             // Seven-stage
                 output logic       equalI3,
                 output logic       equalD3,
                 output logic       isbypassD3,                   // Seven-stage
                 input  logic [31:0]instrF3,
                 output logic [31:0]dataadrM3, writedata2M3,
                 input  logic [31:0]readdataM3,
                 output logic [5:0] opD3, functD3,
                 output logic       flushE3,                      // **
                 output logic       stallI3,
                 input  logic       memwriteI3,
                 input  logic       regwriteI3,                    //***
                 input  logic [1:0] regdstI3,                     //***
                 input  logic       memwriteM3,
                 output logic       flushI3,
                 input  logic       memtoregI3,
                 input  logic [1:0] immchoiceD3,
                 input  logic [2:0] cmppatternchoiceD3,
                 input  logic [2:0] cmppatternchoiceI3,
                 input  logic       JrD3, JrI3,
                 output logic       isforwardaD3,


                 // ====================signals for channel four==========
                 
                 input  logic       branchD4,
                 input  logic [1:0] pcsrcD4,
                 input  logic       memtoregE4, memtoregM4, memtoregMUL4,
                 input  logic       alusrcE4, 
                 input  logic [1:0] regdstE4,
                 input  logic       regwriteE4, regwriteM4, regwriteMUL4, regwriteW4,
                 input  logic       ismultiplyE4, ismultiplyM4, ismultiplyMUL4,
                 input  logic [1:0] resultsrcW4,
                 input  logic [3:0] alucontrolE4,
                 input  logic       pcsrcI4, branchI4,             // Seven-stage
                 output logic       equalI4,
                 output logic       equalD4,
                 output logic       isbypassD4,                   // Seven-stage
                 input  logic [31:0]instrF4,
                 output logic [31:0]dataadrM4, writedata2M4,
                 input  logic [31:0]readdataM4,
                 output logic [5:0] opD4, functD4,
                 output logic       flushE4,                      // **
                 output logic       stallI4,
                 input  logic       memwriteI4,
                 input  logic       regwriteI4,                    //***
                 input  logic [1:0] regdstI4,
                 input  logic       memwriteM4,                     //***
                 output logic       flushI4,
                 input  logic       memtoregI4,
                 input  logic [1:0] immchoiceD4,
                 input  logic [2:0] cmppatternchoiceD4,
                 input  logic [2:0] cmppatternchoiceI4,
                 input  logic       JrD4, JrI4,
                 output logic       isforwardaD4);

    logic [31:0]    pcnextbrFD,  pcnextbr2FD,
                    pcnextbr3FD, pcnextbr4FD;

    logic [31:0]    pcnextFD,    pcnext2FD,  
                    pcnext3FD,   pcnext4FD, pcnext5FD;

    logic           stallF, stall2F;


    logic           lwstallI,  
                    mulstallI;
    logic           isforwardbD;
    logic [3:0]     forwardaD, forwardbD;
    logic [3:0]     forwardaE, forwardbE;
    logic [3:0]     forwardaI, forwardbI;                               // Seven-stage
    logic [3:0]     forwardaM;      //---------------------
    logic [4:0]     rsD, rtD, rdD, rsE, rtE, rdE;
    logic [4:0]     writeregE, writeregM, writeregMUL, writeregW;
    logic [31:0]    writedataM;       //---------------------------------
    logic           flushD;                                     // Seven-stage
    logic [31:0]    pcplus4F, pcbranchD, pcbranch0D;
    logic [31:0]    signimmD, immE, signimmshD;
    logic [31:0]    unsignimmD, hightimmD, immD;
    logic [31:0]    srcaD, srcbD;
    logic [31:0]    srcaE, srca2E;
    logic [31:0]    srcbE, srcb2E, srcb3E;
    logic [31:0]    srcaI, srcbI;                                       // Seven-stage
    logic [31:0]    srca2I, srcb2I;                                     // Seven-stage
    logic [31:0]    pcplus4D, instrD;
    logic [31:0]    aluoutE, aluoutM, aluoutMUL, aluoutW;
    logic [31:0]    readdataW, resultW;
    logic [31:0]    dataadrE, tmpvalE, tmpvalM, mulvalMUL, mulvalW,
                    srcM, srcMUL, readdataMUL, resultMUL;
    logic [31:0]    pcbranchI, pcbranch0I, immI;                                // Seven-stage
    logic [4:0]     rsI, rtI, rdI;                                      // Seven-stage
    logic           alignF, align2F;
    logic           stallD;
    logic [4:0]     writeregI;
    logic [4:0]     saD;
    logic [4:0]     saI;
    logic [4:0]     saE;

    // =========================temperay wires for channel two===============

    logic           normalstallI2, lwstallI2, 
                    mulstallI2;
    logic           isforwardbD2;
    logic [3:0]     forwardaD2, forwardbD2;
    logic [3:0]     forwardaE2, forwardbE2;
    logic [3:0]     forwardaI2, forwardbI2;                               // Seven-stage
    logic [3:0]     forwardaM2;      //---------------------
    logic [4:0]     rsD2, rtD2, rdD2, rsE2, rtE2, rdE2;
    logic [4:0]     writeregE2, writeregM2, writeregMUL2, writeregW2;
    logic [31:0]    writedataM2;       //---------------------------------
    logic           flushD2;                                     // Seven-stage
    logic [31:0]    pcplus8F, pcbranchD2, pcbranch0D2;
    logic [31:0]    signimmD2, immE2, signimmshD2;
    logic [31:0]    unsignimmD2, hightimmD2, immD2;
    logic [31:0]    srcaD2, srcbD2;
    logic [31:0]    srcaE2, srca2E2;
    logic [31:0]    srcbE2, srcb2E2, srcb3E2;
    logic [31:0]    srcaI2, srcbI2;                                       // Seven-stage
    logic [31:0]    srca2I2, srcb2I2;                                     // Seven-stage
    logic [31:0]    pcplus8D, instrD2;
    logic [31:0]    aluoutE2, aluoutM2, aluoutMUL2, aluoutW2;
    logic [31:0]    readdataW2, resultW2;
    logic [31:0]    dataadrE2, tmpvalE2, tmpvalM2, mulvalMUL2, mulvalW2,
                    srcM2, srcMUL2, readdataMUL2, resultMUL2;
    logic [31:0]    pcbranchI2, pcbranch0I2, immI2;                                // Seven-stage
    logic [4:0]     rsI2, rtI2, rdI2;                                      // Seven-stage
    logic           alignF2, align2F2;
    logic           stallD2;
    logic [4:0]     writeregI2;
    logic [4:0]     saD2;
    logic [4:0]     saI2;
    logic [4:0]     saE2;


    // =========================temperay wires for channel three===============

    logic           normalstallI3, lwstallI3, 
                    mulstallI3;
    logic           isforwardbD3;
    logic [3:0]     forwardaD3, forwardbD3;
    logic [3:0]     forwardaE3, forwardbE3;
    logic [3:0]     forwardaI3, forwardbI3;                               // Seven-stage
    logic [3:0]     forwardaM3;      //---------------------
    logic [4:0]     rsD3, rtD3, rdD3, rsE3, rtE3, rdE3;
    logic [4:0]     writeregE3, writeregM3, writeregMUL3, writeregW3;
    logic [31:0]    writedataM3;       //---------------------------------
    logic           flushD3;                                     // Seven-stage
    logic [31:0]    pcplus12F, pcbranchD3, pcbranch0D3;
    logic [31:0]    signimmD3, immE3, signimmshD3;
    logic [31:0]    unsignimmD3, hightimmD3, immD3;
    logic [31:0]    srcaD3, srcbD3;
    logic [31:0]    srcaE3, srca2E3;
    logic [31:0]    srcbE3, srcb2E3, srcb3E3;
    logic [31:0]    srcaI3, srcbI3;                                       // Seven-stage
    logic [31:0]    srca2I3, srcb2I3;                                     // Seven-stage
    logic [31:0]    pcplus12D, instrD3;
    logic [31:0]    aluoutE3, aluoutM3, aluoutMUL3, aluoutW3;
    logic [31:0]    readdataW3, resultW3;
    logic [31:0]    dataadrE3, tmpvalE3, tmpvalM3, mulvalMUL3, mulvalW3,
                    srcM3, srcMUL3, readdataMUL3, resultMUL3;
    logic [31:0]    pcbranchI3, pcbranch0I3, immI3;                                // Seven-stage
    logic [4:0]     rsI3, rtI3, rdI3;                                      // Seven-stage
    logic           alignF3, align2F3;
    logic           stallD3;
    logic [4:0]     writeregI3;
    logic [4:0]     saD3;
    logic [4:0]     saI3;
    logic [4:0]     saE3;


    // =========================temperay wires for channel four===============

    logic           normalstallI4, lwstallI4, 
                    mulstallI4;
    logic           isforwardbD4;
    logic [3:0]     forwardaD4, forwardbD4;
    logic [3:0]     forwardaE4, forwardbE4;
    logic [3:0]     forwardaI4, forwardbI4;                               // Seven-stage
    logic [3:0]     forwardaM4;      //---------------------
    logic [4:0]     rsD4, rtD4, rdD4, rsE4, rtE4, rdE4;
    logic [4:0]     writeregE4, writeregM4, writeregMUL4, writeregW4;
    logic [31:0]    writedataM4;       //---------------------------------
    logic           flushD4;                                     // Seven-stage
    logic [31:0]    pcplus16F, pcbranchD4, pcbranch0D4;
    logic [31:0]    signimmD4, immE4, signimmshD4;
    logic [31:0]    unsignimmD4, hightimmD4, immD4;
    logic [31:0]    srcaD4, srcbD4;
    logic [31:0]    srcaE4, srca2E4;
    logic [31:0]    srcbE4, srcb2E4, srcb3E4;
    logic [31:0]    srcaI4, srcbI4;                                       // Seven-stage
    logic [31:0]    srca2I4, srcb2I4;                                     // Seven-stage
    logic [31:0]    pcplus16D, instrD4;
    logic [31:0]    aluoutE4, aluoutM4, aluoutMUL4, aluoutW4;
    logic [31:0]    readdataW4, resultW4;
    logic [31:0]    dataadrE4, tmpvalE4, tmpvalM4, mulvalMUL4, mulvalW4,
                    srcM4, srcMUL4, readdataMUL4, resultMUL4;
    logic [31:0]    pcbranchI4, pcbranch0I4, immI4;                                // Seven-stage
    logic [4:0]     rsI4, rtI4, rdI4;                                      // Seven-stage
    logic           stallD4;
    logic [4:0]     writeregI4;
    logic [4:0]     saD4;
    logic [4:0]     saI4;
    logic [4:0]     saE4;
    logic [31:0]    pcplus20F, pcplus20D;


    hazard hazard  (/*---------flush-----------------*/
                    align2F, align2F2, align2F3,
                    pcsrcD, pcsrcD2, pcsrcD3, pcsrcD4,
                    pcsrcI, pcsrcI2, pcsrcI3, pcsrcI4,

                    flushD,  flushI,
                    flushD2, flushI2,
                    flushD3, flushI3,
                    flushD4, flushI4,

                    flushE,  flushE2,
                    flushE3, flushE4,

                    //flushMUL3, flushMUL4,
                    /*--------flush------------------*/
                    
                    /*--------stall-----------------*/
                    rsI,  rtI,  rsI2, rtI2,
                    rsI3, rtI3, rsI4, rtI4,

                    rtE,  rtE2, rtE3, rtE4,

                    writeregI,  writeregI2,  writeregI3,

                    writeregE,  writeregE2,
                    writeregE3, writeregE4,

                    writeregM,  writeregM2,
                    writeregM3, writeregM4,

                    regwriteI,  regwriteI2,
                    regwriteI3, regwriteI4,

                    regwriteE,  regwriteE2,
                    regwriteE3, regwriteE4,

                    memwriteI,  memwriteI2,
                    memwriteI3, memwriteI4,
                    
                    memtoregI,  memtoregI2,
                    memtoregI3, memtoregI4,

                    memtoregE,  memtoregE2,
                    memtoregE3, memtoregE4,

                    /***********************/
                    //memwriteM,  memwriteM2,
                    //memwriteM3, memwriteM4,
                    /**********************/

                    memtoregM,  memtoregM2, 
                    memtoregM3, memtoregM4,

                    /***********************/
                    ismultiplyE,  ismultiplyE2,
                    ismultiplyE3, ismultiplyE4,
                    /**********************/

                    ismultiplyM,  ismultiplyM2,
                    ismultiplyM3, ismultiplyM4,

                    ismultiplyMUL,  ismultiplyMUL2,
                    ismultiplyMUL3, ismultiplyMUL4,

                    branchI,  branchI2,
                    branchI3, branchI4,
                    
                    JrI, JrI2, JrI3, JrI4,

                    stallF,

                    stallD,  stallD2, 
                    stallD3, stallD4,

                    stallI,  stallI2,
                    stallI3, stallI4,

                    //stallE,  stallE2,
                    //stallE3, stallE4,

                    //stallM3, stallM4,
                    /*-------------stall------------*/

                    /*------------forwarding--------*/
                    rsD,  rtD,  rsD2, rtD2,
                    rsD3, rtD3, rsD4, rtD4,

                    rsE,  rsE2, rsE3, rsE4,

                    writeregMUL,  writeregMUL2,
                    writeregMUL3, writeregMUL4,

                    writeregW,  writeregW2,
                    writeregW3, writeregW4,

                    regwriteM,  regwriteM2,
                    regwriteM3, regwriteM4,

                    regwriteMUL,  regwriteMUL2,
                    regwriteMUL3, regwriteMUL4,

                    regwriteW,  regwriteW2,
                    regwriteW3, regwriteW4,
                    
                    branchD, branchD2, branchD3, branchD4,
                    //branchI, branchI2, branchI3, branchI4,

                    isforwardaD,  isforwardbD,
                    isforwardaD2, isforwardbD2,
                    isforwardaD3, isforwardbD3,
                    isforwardaD4, isforwardbD4,

                    forwardaD,  forwardbD,
                    forwardaD2, forwardbD2,
                    forwardaD3, forwardbD3,
                    forwardaD4, forwardbD4,

                    forwardaI,  forwardbI,
                    forwardaI2, forwardbI2,
                    forwardaI3, forwardbI3,
                    forwardaI4, forwardbI4,

                    forwardaE,  forwardbE,
                    forwardaE2, forwardbE2,
                    forwardaE3, forwardbE3,
                    forwardaE4, forwardbE4,

                    forwardaM,  forwardaM2,
                    forwardaM3, forwardaM4);


    // next PC logic (operates in fetch and decode)
    mux3 #(32) pcnextmux1 (pcplus16F, pcbranchD4,
                           {pcplus16D[31:28], instrD4[25:0],2'b00}, 
                           pcsrcD4, pcnextbrFD);

    mux3 #(32) pcnextmux2 (pcnextbrFD, pcbranchD3,
                           {pcplus12D[31:28], instrD3[25:0],2'b00}, 
                           pcsrcD3, pcnextbr2FD);

    mux3 #(32) pcnextmux3 (pcnextbr2FD, pcbranchD2,
                           {pcplus8D[31:28], instrD2[25:0],2'b00}, 
                           pcsrcD2, pcnextbr3FD);

    mux3 #(32) pcnextmux4 (pcnextbr3FD, pcbranchD,
                           {pcplus4D[31:28], instrD[25:0], 2'b00},
                           pcsrcD, pcnextbr4FD);
                           
    //assign pcnextbrFD = pcplus16F;

    mux2 #(32) pcnextmux5 (pcnextbr4FD, pcbranchI4, pcsrcI4, pcnextFD);

    mux2 #(32) pcnextmux6 (pcnextFD,    pcbranchI3, pcsrcI3, pcnext2FD);

    mux2 #(32) pcnextmux7 (pcnext2FD,   pcbranchI2, pcsrcI2, pcnext3FD);

    mux2 #(32) pcnextmux8 (pcnext3FD,   pcbranchI,  pcsrcI, pcnext4FD);
    
    //assign pcnext4FD = pcnextbrFD;

    adr_align  adr_align  (pcnext4FD,   pcnext5FD,  alignF, alignF2, alignF3);
    //assign pcnext5FD = pcnext4FD;
    /*assign alignF  = 0;
    assign alignF2 = 0;
    assign alignF3 = 0;*/
    
    // next PC logic (operates in fetch and decode)
    // mux2 #(32) pcbrmux (pcplus4F, pcbranchD, pcsrcD, pcnextbrFD);
    // mux2 #(32) pcmux   (pcnextbrFD, {pcplus4D[31:28],
                        //instrD[25:0], 2'b00}, jumpD, pcnextFD);

    // register file (operates in decode and writeback)
    regfile rf (~clk, reset,
                regwriteW,  regwriteW2,
                regwriteW3, regwriteW4,

                rsI,  rtI,  writeregW,
                rsI2, rtI2, writeregW2,
                rsI3, rtI3, writeregW3,
                rsI4, rtI4, writeregW4,

                resultW,  resultW2,
                resultW3, resultW4,

                srcaI,  srcbI,
                srcaI2, srcbI2,
                srcaI3, srcbI3,
                srcaI4, srcbI4);

    // Fetch stage logic
    assign  stall2F    =  stallF & ~(pcsrcI | pcsrcI2 | pcsrcI3 | pcsrcI4
                                     | pcsrcD[0]  | pcsrcD[1]  | pcsrcD2[0] | pcsrcD2[1]
                                     | pcsrcD3[0] | pcsrcD3[1] | pcsrcD4[0] | pcsrcD4[1]);
    flopenr #(32) pcreg1  (clk, reset, ~stall2F, pcnext5FD, pcF);
    flopenr #(1)  pcreg2  (clk, reset, ~stall2F, alignF,  align2F);
    flopenr #(1)  pcreg3  (clk, reset, ~stall2F, alignF2, align2F2);
    flopenr #(1)  pcreg4  (clk, reset, ~stall2F, alignF3, align2F3);
    
    adder         pcadd1  (pcF, 32'b100,    pcplus4F);
    adder         pcadd2  (pcF, 32'b1000,   pcplus8F);
    adder         pcadd3  (pcF, 32'b1100,   pcplus12F);
    adder         pcadd4  (pcF, 32'b10000,  pcplus16F);
    adder         pcadd5  (pcF, 32'b10100,  pcplus20F);

    // Decode stage
    flopenr  #(32)  r1D    (clk, reset, ~stallD, pcplus4F, pcplus4D);
    flopenrc #(32)  r2D    (clk, reset, ~stallD, flushD, instrF, instrD);
    //flopenrc #(32)  r3D    (clk, reset, ~stallD, flushD, pcplus8F, pcplus8D);
    signextend      se     (instrD[15:0], signimmD);
    unsignextend    ue     (instrD[15:0], unsignimmD);
    hightextend     he     (instrD[15:0], hightimmD);
    sl2             immsh  (signimmD, signimmshD);
    adder           pcaddD (pcplus4D, signimmshD, pcbranch0D);
    
    mux13 #(32) forwardadmux (aluoutM4,  resultMUL4,  resultW4, 
                             aluoutM3, resultMUL3, resultW3,
                             aluoutM2, resultMUL2, resultW2,
                             aluoutM, resultMUL, resultW,
                             32'b0, forwardaD, srcaD);

    mux13 #(32) forwardbdmux (aluoutM4,  resultMUL4,  resultW4, 
                             aluoutM3, resultMUL3, resultW3,
                             aluoutM2, resultMUL2, resultW2,
                             aluoutM, resultMUL, resultW,
                             32'b0, forwardbD, srcbD);

    //eqcmp       compD        (srcaD, srcbD, equalD);
    comparer      comparerD  (srcaD, srcbD, rtD, cmppatternchoiceD, equalD);
    mux4 #(32)  imm          (signimmD, unsignimmD, hightimmD, pcplus8D, immchoiceD, immD);
    mux2 #(32)  pcbranch     (srcaD, pcbranch0D, branchD, pcbranchD);

    assign isbypassD = isforwardaD & isforwardbD;
    assign opD       = instrD[31:26];
    assign functD    = instrD[5:0];
    assign rsD       = instrD[25:21];
    assign rtD       = instrD[20:16];
    assign rdD       = instrD[15:11];
    assign saD       = instrD[10:6];


    flopenr  #(32) r1D2    (clk, reset, ~stallD2, pcplus8F, pcplus8D);
    flopenrc #(32) r2D2    (clk, reset, ~stallD2, flushD2, instrF2, instrD2);
    //flopenrc #(32) r3D2    (clk, reset, ~stallD2, flushD2, pcplus12F, pcplus12D);
    signextend     se2     (instrD2[15:0], signimmD2);
    unsignextend   ue2     (instrD2[15:0], unsignimmD2);
    hightextend    he2     (instrD2[15:0], hightimmD2);
    sl2            immsh2  (signimmD2, signimmshD2);
    adder          pcaddD2 (pcplus8D, signimmshD2, pcbranch0D2);

    mux13 #(32) forwardadmux2 (aluoutM4,  resultMUL4,   resultW4,
                               aluoutM3, resultMUL3, resultW3, 
                               aluoutM2, resultMUL2, resultW2,
                               aluoutM, resultMUL, resultW,
                               32'b0, forwardaD2, srcaD2);

    mux13 #(32) forwardbdmux2 (aluoutM4,  resultMUL4,   resultW4,
                               aluoutM3, resultMUL3, resultW3, 
                               aluoutM2, resultMUL2, resultW2,
                               aluoutM, resultMUL, resultW,
                               32'b0, forwardbD2, srcbD2);

    //eqcmp      compD2         (srcaD2, srcbD2, equalD2);
    comparer      comparerD2 (srcaD2, srcbD2, rtD2, cmppatternchoiceD2, equalD2);
    mux4 #(32) imm2          (signimmD2, unsignimmD2, hightimmD2, pcplus12D, immchoiceD2, immD2);
    mux2 #(32) pcbranch2    (srcaD2, pcbranch0D2, branchD2, pcbranchD2);

    assign isbypassD2 = isforwardaD2 & isforwardbD2;
    assign opD2       = instrD2[31:26];
    assign functD2    = instrD2[5:0];
    assign rsD2       = instrD2[25:21];
    assign rtD2       = instrD2[20:16];
    assign rdD2       = instrD2[15:11];
    assign saD2       =  instrD2[10:6];


    flopenr  #(32) r1D3    (clk, reset, ~stallD3, pcplus12F, pcplus12D);
    flopenrc #(32) r2D3    (clk, reset, ~stallD3, flushD3, instrF3, instrD3);
    //flopenrc #(32) r3D3    (clk, reset, ~stallD3, flushD3, pcplus16F, pcplus16D);
    signextend     se3     (instrD3[15:0], signimmD3);
    unsignextend   ue3     (instrD3[15:0], unsignimmD3);
    hightextend    he3     (instrD3[15:0], hightimmD3);
    sl2            immsh3  (signimmD3, signimmshD3);
    adder          pcaddD3 (pcplus12D, signimmshD3, pcbranch0D3);

    mux13 #(32) forwardadmux3 (aluoutM4,  resultMUL4,   resultW4,
                               aluoutM3, resultMUL3, resultW3, 
                               aluoutM2, resultMUL2, resultW2,
                               aluoutM, resultMUL, resultW,
                               32'b0, forwardaD3, srcaD3);

    mux13 #(32) forwardbdmux3 (aluoutM4,  resultMUL4,   resultW4,
                               aluoutM3, resultMUL3, resultW3, 
                               aluoutM2, resultMUL2, resultW2,
                               aluoutM, resultMUL, resultW,
                               32'b0, forwardbD3, srcbD3);

    //eqcmp      compD3         (srcaD3, srcbD3, equalD3);
    comparer      comparerD3 (srcaD3, srcbD3, rtD3, cmppatternchoiceD3, equalD3);
    mux4 #(32) imm3          (signimmD3, unsignimmD3, hightimmD3, pcplus16D, immchoiceD3, immD3);
    mux2 #(32) pcbranch3     (srcaD3, pcbranch0D3, branchD3, pcbranchD3);

    assign isbypassD3 = isforwardaD3 & isforwardbD3;
    assign opD3       = instrD3[31:26];
    assign functD3    = instrD3[5:0];
    assign rsD3       = instrD3[25:21];
    assign rtD3       = instrD3[20:16];
    assign rdD3       = instrD3[15:11];
    assign saD3       =  instrD3[10:6];


    flopenr  #(32) r1D4    (clk, reset, ~stallD4, pcplus16F, pcplus16D);
    flopenrc #(32) r2D4    (clk, reset, ~stallD4, flushD4, instrF4, instrD4);
    flopenrc #(32) r3D4    (clk, reset, ~stallD4, flushD4, pcplus20F, pcplus20D);
    signextend     se4     (instrD4[15:0], signimmD4);
    unsignextend   ue4     (instrD4[15:0], unsignimmD4);
    hightextend    he4     (instrD4[15:0], hightimmD4);
    sl2            immsh4  (signimmD4, signimmshD4);
    adder          pcaddD4 (pcplus16D, signimmshD4, pcbranch0D4);

    mux13 #(32) forwardadmux4 (aluoutM4,  resultMUL4,   resultW4,
                               aluoutM3, resultMUL3, resultW3, 
                               aluoutM2, resultMUL2, resultW2,
                               aluoutM, resultMUL, resultW,
                               32'b0, forwardaD4, srcaD4);

    mux13 #(32) forwardbdmux4 (aluoutM4,  resultMUL4,   resultW4,
                               aluoutM3, resultMUL3, resultW3, 
                               aluoutM2, resultMUL2, resultW2,
                               aluoutM, resultMUL, resultW,
                               32'b0, forwardbD4, srcbD4);

    //eqcmp      compD4         (srcaD4, srcbD4, equalD4);
    comparer      comparerD4 (srcaD4, srcbD4, rtD4, cmppatternchoiceD4, equalD4);
    mux4 #(32) imm4          (signimmD4, unsignimmD4, hightimmD4, pcplus20D, immchoiceD4, immD4);
    mux2 #(32) pcbranch4     (srcaD4, pcbranch0D4, branchD4, pcbranchD4);

    assign isbypassD4 = isforwardaD4 & isforwardbD4;
    assign opD4       = instrD4[31:26];
    assign functD4    = instrD4[5:0];
    assign rsD4       = instrD4[25:21];
    assign rtD4       = instrD4[20:16];
    assign rdD4       = instrD4[15:11];
    assign saD4       = instrD4[10:6];


    // Issue stage
    flopenr  #(32) r1I (clk, reset, ~stallI, pcbranch0D, pcbranch0I);
    flopenrc #(5)  r2I (clk, reset, ~stallI, flushI, rsD, rsI);
    flopenrc #(5)  r3I (clk, reset, ~stallI, flushI, rtD, rtI);
    flopenrc #(5)  r4I (clk, reset, ~stallI, flushI, rdD, rdI);
    flopenrc #(32) r5I (clk, reset, ~stallI, flushI, immD, immI);
    flopenrc #(5)  r6I (clk, reset, ~stallI, flushI, saD, saI);

    mux9 #(32) forwardaImux (srcaI, 
                             aluoutM4, resultMUL4,
                             aluoutM3, resultMUL3,
                             aluoutM2, resultMUL2,
                             aluoutM, resultMUL,
                             forwardaI, srca2I);

    mux9 #(32) forwardbImux (srcbI, 
                             aluoutM4, resultMUL4,
                             aluoutM3, resultMUL3,
                             aluoutM2, resultMUL2,
                             aluoutM, resultMUL,
                             forwardbI, srcb2I);

    mux3 #(5)  forwardcImux (rtI, rdI, 5'b11111, regdstI, writeregI);
    mux2 #(32) pcbranch_I   (0/*srca2I*/, pcbranch0I, branchI, pcbranchI);
    //eqcmp      compI        (srca2I, srcb2I, equalI);
    comparer   comparerI  (srca2I, srcb2I, rtI, cmppatternchoiceI, equalI);


    flopenr  #(32) r1I2 (clk, reset, ~stallI2, pcbranch0D2, pcbranch0I2);
    flopenrc #(5)  r2I2 (clk, reset, ~stallI2, flushI2, rsD2, rsI2);
    flopenrc #(5)  r3I2 (clk, reset, ~stallI2, flushI2, rtD2, rtI2);
    flopenrc #(5)  r4I2 (clk, reset, ~stallI2, flushI2, rdD2, rdI2);
    flopenrc #(32) r5I2 (clk, reset, ~stallI2, flushI2, immD2, immI2);
    flopenrc #(5)  r6I2 (clk, reset, ~stallI2, flushI2, saD2, saI2);

    mux9 #(32) forwardaImux2 (srcaI2, 
                              aluoutM4,  resultMUL4,
                              aluoutM3, resultMUL3,
                              aluoutM2, resultMUL2,
                              aluoutM, resultMUL,
                              forwardaI2, srca2I2);

    mux9 #(32) forwardbImux2 (srcbI2,
                              aluoutM4,  resultMUL4,
                              aluoutM3, resultMUL3,
                              aluoutM2, resultMUL2,
                              aluoutM, resultMUL,
                              forwardbI2, srcb2I2);

    mux3 #(5) forwardcImux2 (rtI2, rdI2, 5'b11111, regdstI2, writeregI2);
    mux2 #(32) pcbranch_I2  (0/*srca2I2*/, pcbranch0I2, branchI2, pcbranchI2);
    //eqcmp     compI2        (srca2I2, srcb2I2, equalI2);
    comparer   comparerI2   (srca2I2, srcb2I2, rtI2, cmppatternchoiceI2, equalI2);


    flopenr  #(32) r1I3 (clk, reset, ~stallI3, pcbranch0D3, pcbranch0I3);
    flopenrc #(5)  r2I3 (clk, reset, ~stallI3, flushI3, rsD3, rsI3);
    flopenrc #(5)  r3I3 (clk, reset, ~stallI3, flushI3, rtD3, rtI3);
    flopenrc #(5)  r4I3 (clk, reset, ~stallI3, flushI3, rdD3, rdI3);
    flopenrc #(32) r5I3 (clk, reset, ~stallI3, flushI3, immD3, immI3);
    flopenrc #(5)  r6I3 (clk, reset, ~stallI3, flushI3, saD3, saI3);

    mux9 #(32) forwardaImux3 (srcaI3, 
                              aluoutM4,  resultMUL4,
                              aluoutM3, resultMUL3,
                              aluoutM2, resultMUL2,
                              aluoutM, resultMUL,
                              forwardaI3, srca2I3);

    mux9 #(32) forwardbImux3 (srcbI3,
                              aluoutM4,  resultMUL4,
                              aluoutM3, resultMUL3,
                              aluoutM2, resultMUL2,
                              aluoutM, resultMUL,
                              forwardbI3, srcb2I3);

    mux3 #(5) forwardcImux3 (rtI3, rdI3, 5'b11111, regdstI3, writeregI3);
    mux2 #(32) pcbranch_I3  (0/*srca2I3*/, pcbranch0I3, branchI3, pcbranchI3);
    //eqcmp     compI3        (srca2I3, srcb2I3, equalI3);
    comparer   comparerI3   (srca2I3, srcb2I3, rtI3, cmppatternchoiceI3, equalI3);

    
    flopenr  #(32) r1I4 (clk, reset, ~stallI4, pcbranch0D4, pcbranch0I4);
    flopenrc #(5)  r2I4 (clk, reset, ~stallI4, flushI4, rsD4, rsI4);
    flopenrc #(5)  r3I4 (clk, reset, ~stallI4, flushI4, rtD4, rtI4);
    flopenrc #(5)  r4I4 (clk, reset, ~stallI4, flushI4, rdD4, rdI4);
    flopenrc #(32) r5I4 (clk, reset, ~stallI4, flushI4, immD4, immI4);
    flopenrc #(5)  r6I4 (clk, reset, ~stallI4, flushI4, saD4, saI4);

    mux9 #(32) forwardaImux4 (srcaI4, 
                              aluoutM4,  resultMUL4,
                              aluoutM3, resultMUL3,
                              aluoutM2, resultMUL2,
                              aluoutM, resultMUL,
                              forwardaI4, srca2I4);

    mux9 #(32) forwardbImux4 (srcbI4,
                              aluoutM4,  resultMUL4,
                              aluoutM3, resultMUL3,
                              aluoutM2, resultMUL2,
                              aluoutM, resultMUL,
                              forwardbI4, srcb2I4);

    mux3 #(5) forwardcImux4 (rtI4, rdI4, 5'b11111, regdstI4, writeregI4);
    mux2 #(32) pcbranch_I4  (0/*srca2I4*/, pcbranch0I4, branchI4, pcbranchI4);
    //eqcmp     compI4        (srca2I4, srcb2I4, equalI4);
    comparer   comparerI4   (srca2I4, srcb2I4, rtI4, cmppatternchoiceI4, equalI4);


    // Execute stage
    floprc #(32) r1E (clk, reset, flushE, srcaI, srcaE);
    floprc #(32) r2E (clk, reset, flushE, srcbI, srcbE);
    floprc #(32) r3E (clk, reset, flushE, immI, immE);
    floprc #(5)  r4E (clk, reset, flushE, rsI, rsE);
    floprc #(5)  r5E (clk, reset, flushE, rtI, rtE);
    floprc #(5)  r6E (clk, reset, flushE, rdI, rdE);
    floprc #(5)  r7E (clk, reset, flushE, saI, saE);

    mux13 #(32) forwardaemux (srcaE, 
                              aluoutM4, resultMUL4, resultW4,
                              aluoutM3, resultMUL3, resultW3,
                              aluoutM2, resultMUL2, resultW2,
                              aluoutM, resultMUL, resultW,
                              forwardaE, srca2E);

    mux13 #(32) forwardbemux (srcbE,
                              aluoutM4, resultMUL4, resultW4,
                              aluoutM3, resultMUL3, resultW3,
                              aluoutM2, resultMUL2, resultW2,
                              aluoutM, resultMUL, resultW,
                              forwardbE, srcb2E);

    mux2  #(32) srcbmux      (srcb2E, immE, alusrcE, srcb3E);

    mux3  #(5)  wrmux        (rtE, rdE, 5'b11111, regdstE, writeregE);
    
    alu         alu          (srca2E, srcb3E, saE, alucontrolE, aluoutE);
    adder       address      (srca2E, srcb3E, dataadrE);
    //mul         mul1         (srca2E, srcb3E, tmpvalE);
    mult_gen_0  mul1         (clk, srca2E, srcb3E, mulvalMUL);

    floprc #(32) r1E2 (clk, reset, flushE2, srcaI2, srcaE2);
    floprc #(32) r2E2 (clk, reset, flushE2, srcbI2, srcbE2);
    floprc #(32) r3E2 (clk, reset, flushE2, immI2, immE2);
    floprc #(5)  r4E2 (clk, reset, flushE2, rsI2, rsE2);
    floprc #(5)  r5E2 (clk, reset, flushE2, rtI2, rtE2);
    floprc #(5)  r6E2 (clk, reset, flushE2, rdI2, rdE2);
    floprc #(5)  r7E2 (clk, reset, flushE2, saI2, saE2);

    mux13 #(32) forwardaemux2 (srcaE2, 
                              aluoutM4,  resultMUL4,  resultW4,
                              aluoutM3, resultMUL3, resultW3,
                              aluoutM2, resultMUL2, resultW2,
                              aluoutM, resultMUL, resultW,
                              forwardaE2, srca2E2);

    mux13 #(32) forwardbemux2 (srcbE2, 
                              aluoutM4,  resultMUL4,  resultW4,
                              aluoutM3, resultMUL3, resultW3,
                              aluoutM2, resultMUL2, resultW2,
                              aluoutM, resultMUL, resultW,
                              forwardbE2, srcb2E2);

    mux2 #(32) srcbmux2      (srcb2E2, immE2, alusrcE2, srcb3E2);

    mux3 #(5)  wrmux2        (rtE2, rdE2, 5'b11111, regdstE2, writeregE2);

    alu        alu2          (srca2E2, srcb3E2, saE2, alucontrolE2, aluoutE2);
    adder      address2      (srca2E2, srcb3E2, dataadrE2);
    //mul        mul12         (srca2E2, srcb3E2, tmpvalE2);
    mult_gen_0  mul2         (clk, srca2E2, srcb3E2, mulvalMUL2);
    


    floprc #(32) r1E3 (clk, reset, flushE3, srcaI3, srcaE3);
    floprc #(32) r2E3 (clk, reset, flushE3, srcbI3, srcbE3);
    floprc #(32) r3E3 (clk, reset, flushE3, immI3, immE3);
    floprc #(5)  r4E3 (clk, reset, flushE3, rsI3, rsE3);
    floprc #(5)  r5E3 (clk, reset, flushE3, rtI3, rtE3);
    floprc #(5)  r6E3 (clk, reset, flushE3, rdI3, rdE3);
    floprc #(5)  r7E3 (clk, reset, flushE3, saI3, saE3);

    mux13 #(32) forwardaemux3 (srcaE3, 
                              aluoutM4,  resultMUL4,  resultW4,
                              aluoutM3, resultMUL3, resultW3,
                              aluoutM2, resultMUL2, resultW2,
                              aluoutM, resultMUL, resultW,
                              forwardaE3, srca2E3);

    mux13 #(32) forwardbemux3 (srcbE3, 
                              aluoutM4,  resultMUL4,  resultW4,
                              aluoutM3, resultMUL3, resultW3,
                              aluoutM2, resultMUL2, resultW2,
                              aluoutM, resultMUL, resultW,
                              forwardbE3, srcb2E3);

    mux2 #(32) srcbmux3      (srcb2E3, immE3, alusrcE3, srcb3E3);

    mux3 #(5)  wrmux3        (rtE3, rdE3, 5'b11111, regdstE3, writeregE3);

    alu        alu3          (srca2E3, srcb3E3, saE3, alucontrolE3, aluoutE3);
    adder      address3      (srca2E3, srcb3E3, dataadrE3);
    //mul        mul13         (srca2E3, srcb3E3, tmpvalE3);
    mult_gen_0  mul3         (clk, srca2E3, srcb3E3, mulvalMUL3);



    floprc #(32) r1E4 (clk, reset, flushE4, srcaI4, srcaE4);
    floprc #(32) r2E4 (clk, reset, flushE4, srcbI4, srcbE4);
    floprc #(32) r3E4 (clk, reset, flushE4, immI4, immE4);
    floprc #(5)  r4E4 (clk, reset, flushE4, rsI4, rsE4);
    floprc #(5)  r5E4 (clk, reset, flushE4, rtI4, rtE4);
    floprc #(5)  r6E4 (clk, reset, flushE4, rdI4, rdE4);
    floprc #(5)  r7E4 (clk, reset, flushE4, saI4, saE4);

    mux13 #(32) forwardaemux4 (srcaE4, 
                              aluoutM4,  resultMUL4,  resultW4,
                              aluoutM3, resultMUL3, resultW3,
                              aluoutM2, resultMUL2, resultW2,
                              aluoutM, resultMUL, resultW,
                              forwardaE4, srca2E4);

    mux13 #(32) forwardbemux4 (srcbE4, 
                              aluoutM4,  resultMUL4,  resultW4,
                              aluoutM3, resultMUL3, resultW3,
                              aluoutM2, resultMUL2, resultW2,
                              aluoutM, resultMUL, resultW,
                              forwardbE4, srcb2E4);

    mux2 #(32) srcbmux4      (srcb2E4, immE4, alusrcE4, srcb3E4);

    mux3 #(5)  wrmux4        (rtE4, rdE4, 5'b11111, regdstE4, writeregE4);

    alu        alu4          (srca2E4, srcb3E4, saE4, alucontrolE4, aluoutE4);
    adder      address4      (srca2E4, srcb3E4, dataadrE4);
    //mul        mul14         (srca2E4, srcb3E4, tmpvalE4);
    mult_gen_0  mul14         (clk, srca2E4, srcb3E4, mulvalMUL4);


    // Memory stage
    flopr #(32) r1M (clk, reset, srcb2E, writedataM);
    flopr #(32) r2M (clk, reset, aluoutE, aluoutM);
    flopr #(32) r3M (clk, reset, dataadrE, dataadrM);
    //flopr #(32) r4M (clk, reset, tmpvalE, srcM);
    flopr #(5)  r5M (clk, reset, writeregE, writeregM);
    //mul2        mul2 (srcM, tmpvalM);

    mux9  #(32) muxM (writedataM, 
                      resultMUL4, resultW4,
                      resultMUL3, resultW3,
                      resultMUL2, resultW2,
                      resultMUL, resultW,
                      forwardaM, writedata2M);

    flopr #(32) r1M2 (clk, reset, srcb2E2, writedataM2);
    flopr #(32) r2M2 (clk, reset, aluoutE2, aluoutM2);
    flopr #(32) r3M2 (clk, reset, dataadrE2, dataadrM2);
    //flopr #(32) r4M2 (clk, reset, tmpvalE2, srcM2);
    flopr #(5)  r5M2 (clk, reset, writeregE2, writeregM2);
    //mul2        mul22 (srcM2, tmpvalM2);

    mux10  #(32) muxM2 (writedataM2,
                       aluoutM,  
                       resultMUL4, resultW4,
                       resultMUL3, resultW3,
                       resultMUL2, resultW2,
                       resultMUL,  resultW,
                       forwardaM2, writedata2M2);

    flopr #(32) r1M3 (clk, reset, srcb2E3, writedataM3);
    flopr #(32) r2M3 (clk, reset, aluoutE3, aluoutM3);
    flopr #(32) r3M3 (clk, reset, dataadrE3, dataadrM3);
    //flopr #(32) r4M3 (clk, reset, tmpvalE3, srcM3);
    flopr #(5)  r5M3 (clk, reset, writeregE3, writeregM3);
    //mul2        mul23 (srcM3, tmpvalM3);

    mux11  #(32) muxM3 (writedataM3,
                       aluoutM2,
                       aluoutM,
                       resultMUL4, resultW4, 
                       resultMUL3, resultW3,         
                       resultMUL2, resultW2,         
                       resultMUL,  resultW, 
                       forwardaM4, writedata2M3);


    flopr #(32) r1M4 (clk, reset, srcb2E4, writedataM4);
    flopr #(32) r2M4 (clk, reset, aluoutE4, aluoutM4);
    flopr #(32) r3M4 (clk, reset, dataadrE4, dataadrM4);
    //flopr #(32) r4M4 (clk, reset, tmpvalE4, srcM4);
    flopr #(5)  r5M4 (clk, reset, writeregE4, writeregM4);
    //mul2        mul24 (srcM4, tmpvalM4);

    mux12  #(32) muxM4 (writedataM4,
                        aluoutM3,
                        aluoutM2,
                        aluoutM,
                        resultMUL4, resultW4,
                        resultMUL3, resultW3,
                        resultMUL2, resultW2,
                        resultMUL,  resultW,
                       forwardaM4, writedata2M4);


    // Multiply stage
    flopr #(32) r1MUL (clk, reset, aluoutM, aluoutMUL);
    flopr #(5)  r2MUL (clk, reset, writeregM, writeregMUL);
    flopr #(32) r3MUL (clk, reset, readdataM, readdataMUL);
    //flopr #(32) r4MUL (clk, reset, tmpvalM, srcMUL);
    //flopr #(32) r5MUL (clk, reset, pcM, pcMUL);
    //mul3        mul3  (srcMUL, mulvalMUL);
    mux2 #(32)  rMULmux (aluoutMUL, readdataMUL, memtoregMUL, resultMUL);


    flopr #(32) r1MUL2 (clk, reset, aluoutM2, aluoutMUL2);
    flopr #(5)  r2MUL2 (clk, reset, writeregM2, writeregMUL2);
    flopr #(32) r3MUL2 (clk, reset, readdataM2, readdataMUL2);
    //flopr #(32) r4MUL2 (clk, reset, tmpvalM2, srcMUL2);
    //flopr #(32) r5MUL2 (clk, reset, pcM2, pcMUL2);
    //mul3        mul32 (srcMUL2, mulvalMUL2);
    mux2 #(32)  rMULmux2 (aluoutMUL2, readdataMUL2, memtoregMUL2, resultMUL2);


    flopr #(32) r1MUL3 (clk, reset, aluoutM3, aluoutMUL3);
    flopr #(5)  r2MUL3 (clk, reset, writeregM3, writeregMUL3);
    flopr #(32) r3MUL3 (clk, reset, readdataM3, readdataMUL3);
    //flopr #(32) r4MUL3 (clk, reset, tmpvalM3, srcMUL3);
    //flopr #(32) r5MUL3 (clk, reset, pcM3, pcMUL3);
    //mul3        mul33 (srcMUL3, mulvalMUL3);
    mux2 #(32)  rMULmux3 (aluoutMUL3, readdataMUL3, memtoregMUL3, resultMUL3);


    flopr #(32) r1MUL4 (clk, reset, aluoutM4, aluoutMUL4);
    flopr #(5)  r2MUL4 (clk, reset, writeregM4, writeregMUL4);
    flopr #(32) r3MUL4 (clk, reset, readdataM4, readdataMUL4);
    //flopr #(32) r4MUL4 (clk, reset, tmpvalM4, srcMUL4);
    //flopr #(32) r5MUL4 (clk, reset, pcM4, pcMUL4);
    //mul3        mul34 (srcMUL4, mulvalMUL4);
    mux2 #(32)  rMULmux4 (aluoutMUL4, readdataMUL4, memtoregMUL4, resultMUL4);


    // Writeback stage
    flopr #(32) r1W (clk, reset, aluoutMUL, aluoutW);
    flopr #(32) r2W (clk, reset, readdataMUL, readdataW);
    flopr #(32) r3W (clk, reset, mulvalMUL, mulvalW);
    flopr #(5)  r4W (clk, reset, writeregMUL, writeregW);
    //flopr #(32) r5W (clk, reset, pcMUL, pcW);
    mux3  #(32) resmux (aluoutW, readdataW, mulvalW, resultsrcW, resultW);


    flopr #(32) r1W2 (clk, reset, aluoutMUL2, aluoutW2);
    flopr #(32) r2W2 (clk, reset, readdataMUL2, readdataW2);
    flopr #(32) r3W2 (clk, reset, mulvalMUL2, mulvalW2);
    flopr #(5)  r4W2 (clk, reset, writeregMUL2, writeregW2);
    //flopr #(32) r5W2 (clk, reset, pcMUL2, pcW2);
    mux3  #(32) resmux2 (aluoutW2, readdataW2, mulvalW2, resultsrcW2, resultW2);


    flopr #(32) r1W3 (clk, reset, aluoutMUL3, aluoutW3);
    flopr #(32) r2W3 (clk, reset, readdataMUL3, readdataW3);
    flopr #(32) r3W3 (clk, reset, mulvalMUL3, mulvalW3);
    flopr #(5)  r4W3 (clk, reset, writeregMUL3, writeregW3);
    //flopr #(32) r5W3 (clk, reset, pcMUL3, pcW3);
    mux3  #(32) resmux3 (aluoutW3, readdataW3, mulvalW3, resultsrcW3, resultW3);


    flopr #(32) r1W4 (clk, reset, aluoutMUL4, aluoutW4);
    flopr #(32) r2W4 (clk, reset, readdataMUL4, readdataW4);
    flopr #(32) r3W4 (clk, reset, mulvalMUL4, mulvalW4);
    flopr #(5)  r4W4 (clk, reset, writeregMUL4, writeregW4);
    //flopr #(32) r5W4 (clk, reset, pcMUL4, pcW4);
    mux3  #(32) resmux4 (aluoutW4, readdataW4, mulvalW4, resultsrcW4, resultW4);

endmodule

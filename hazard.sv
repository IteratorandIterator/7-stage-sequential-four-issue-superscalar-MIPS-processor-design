module hazard (/*-----flush------*/
               input  logic       alignF, alignF2, alignF3,

               input  logic [1:0] pcsrcD, pcsrcD2, pcsrcD3, pcsrcD4,

               input  logic       pcsrcI, pcsrcI2, pcsrcI3, pcsrcI4,

               /*-----------------those signals have been declared in
               * stall-----------*/
               //input  logic       stallI, stallI2, stallI3, stallI4,

               //input  logic       stallM3, stallM4,
               /*-----------------those signals have been declared in
               * stall-----------*/

               output logic       flushD,  flushI,
                                  flushD2, flushI2,
                                  flushD3, flushI3,
                                  flushD4, flushI4,

               output logic       flushE,  flushE2,
                                  flushE3, flushE4,

               //output logic       flushMUL3, flushMUL4,
               /*-----flush------*/
               /*-----stall------*/
               input logic [4:0] rsI,  rtI,  rsI2, rtI2,
                                 rsI3, rtI3, rsI4, rtI4,

               input logic [4:0] rtE,  rtE2, rtE3, rtE4,

               input  logic [4:0] writeregI, writeregI2,
                                  writeregI3,

               input  logic [4:0] writeregE,  writeregE2,
                                  writeregE3, writeregE4,

               input  logic [4:0] writeregM,  writeregM2,
                                  writeregM3, writeregM4,

               input  logic       regwriteI,  regwriteI2,
                                  regwriteI3, regwriteI4,

               input  logic       regwriteE,  regwriteE2,
                                  regwriteE3, regwriteE4,

               input  logic       memwriteI,  memwriteI2,
                                  memwriteI3, memwriteI4,
                                  
               input  logic       memtoregI,  memtoregI2,
                                  memtoregI3, memtoregI4,

               input  logic       memtoregE,  memtoregE2,
                                  memtoregE3, memtoregE4,

               /*input  logic       memwriteM,  memwriteM2,
                                  memwriteM3, memwriteM4,*/

               input  logic       memtoregM,  memtoregM2,
                                  memtoregM3, memtoregM4,

               input  logic       ismultiplyE,  ismultiplyE2,
                                  ismultiplyE3, ismultiplyE4,

               input  logic       ismultiplyM,  ismultiplyM2,
                                  ismultiplyM3, ismultiplyM4,

               input  logic       ismultiplyMUL,  ismultiplyMUL2,
                                  ismultiplyMUL3, ismultiplyMUL4,

               input  logic       branchI,  branchI2,
                                  branchI3, branchI4,
                                  
               input  logic       JrI, JrI2, JrI3, JrI4,

               output logic       stallF,

               output logic       stallD,  stallD2,
                                  stallD3, stallD4,

               output logic       stallI,  stallI2,
                                  stallI3, stallI4,

               //output logic       stallE,  stallE2,
                                  //stallE3, stallE4,

               //output logic       stallM3, stallM4,
               /*-------------stall--------------*/
               /*-------------forwarding---------*/
               input  logic [4:0] rsD,  rtD,  rsD2, rtD2,
                                  rsD3, rtD3, rsD4, rtD4,
                                  
               input  logic [4:0] rsE,  rsE2, rsE3, rsE4,
               
               input  logic [4:0] writeregMUL,  writeregMUL2,
                                  writeregMUL3, writeregMUL4,
                                  
               input  logic [4:0] writeregW,  writeregW2,
                                  writeregW3, writeregW4,
                                  
               input  logic       regwriteM,  regwriteM2,
                                  regwriteM3, regwriteM4,
                                  
               input  logic       regwriteMUL,  regwriteMUL2,
                                  regwriteMUL3, regwriteMUL4,
                                  
               input  logic       regwriteW,  regwriteW2,
                                  regwriteW3, regwriteW4,
                                  
               input  logic       branchD, branchD2, branchD3, branchD4,   //             
               //input  logic       branchI, branchI2, branchI3, branchI4,
                                  
               output logic       isforwardaD,  isforwardbD,
                                  isforwardaD2, isforwardbD2,
                                  isforwardaD3, isforwardbD3,
                                  isforwardaD4, isforwardbD4,
                                  
               output logic [3:0] forwardaD,  forwardbD,
                                  forwardaD2, forwardbD2,
                                  forwardaD3, forwardbD3,
                                  forwardaD4, forwardbD4,
                                  
               output logic [3:0] forwardaI,  forwardbI,
                                  forwardaI2, forwardbI2,
                                  forwardaI3, forwardbI3,
                                  forwardaI4, forwardbI4,
                                  
               output logic [3:0] forwardaE,  forwardbE,
                                  forwardaE2, forwardbE2,
                                  forwardaE3, forwardbE3,
                                  forwardaE4, forwardbE4,
                                  
               output logic [3:0] forwardaM,  forwardaM2,
                                  forwardaM3, forwardaM4);

    logic stallI_all;
    flush_syn flush_syn (alignF, alignF2, alignF3,
                         
                         pcsrcD, pcsrcD2, pcsrcD3, pcsrcD4,

                         pcsrcI, pcsrcI2, pcsrcI3, pcsrcI4,

                         stallI, stallI2, stallI3, stallI4,
                         
                         stallI_all,

                         flushD,  flushI,  flushD2, flushI2,
                         flushD3, flushI3, flushD4, flushI4,

                         flushE,  flushE2, flushE3, flushE4);

                         //flushMUL3, flushMUL4);


    stall_syn stall_syn (rsI, rtI, rsI2, rtI2, rsI3, rtI3, rsI4, rtI4,
                        
                         rtE, rtE2, rtE3, rtE4,

                         writeregI, writeregI2, writeregI3,

                         writeregE, writeregE2, writeregE3, writeregE4,

                         writeregM, writeregM2, writeregM3, writeregM4,
                         
                         writeregMUL, writeregMUL2, writeregMUL3, writeregMUL4,

                         regwriteI, regwriteI2, regwriteI3,

                         regwriteE, regwriteE2, regwriteE3, regwriteE4,

                         memwriteI, memwriteI2, memwriteI3, memwriteI4,
                         
                         memtoregI, memtoregI2, memtoregI3, memtoregI4,

                         memtoregE, memtoregE2, memtoregE3, memtoregE4,

                         //memwriteM, memwriteM2, memwriteM3, memwriteM4,

                         memtoregM, memtoregM2, memtoregM3, memtoregM4,

                         ismultiplyE,  ismultiplyE2,
                         ismultiplyE3, ismultiplyE4, 

                         ismultiplyM,  ismultiplyM2,
                         ismultiplyM3, ismultiplyM4,

                         ismultiplyMUL,  ismultiplyMUL2,
                         ismultiplyMUL3, ismultiplyMUL4,

                         branchI, branchI2, branchI3, branchI4,
                         
                         JrI, JrI2, JrI3, JrI4,

                         stallF,

                         stallD, stallD2, stallD3, stallD4,

                         stallI, stallI2, stallI3, stallI4,

                         //stallE,  stallE2,                           
                         //stallE3, stallE4,

                         //stallM3, stallM4,
                         
                         stallI_all); 


    forward forward (rsD,  rtD,
                     rsD2, rtD2,
                     rsD3, rtD3,
                     rsD4, rtD4,

                     rsI,  rtI,
                     rsI2, rtI2,
                     rsI3, rtI3,
                     rsI4, rtI4,

                     rsE,  rtE,
                     rsE2, rtE2,
                     rsE3, rtE3,
                     rsE4, rtE4,

                     writeregM,  writeregMUL,   writeregW,
                     writeregM2, writeregMUL2, writeregW2,
                     writeregM3, writeregMUL3, writeregW3,
                     writeregM4, writeregMUL4, writeregW4,

                     regwriteM,  regwriteMUL,  regwriteW,
                     regwriteM2, regwriteMUL2, regwriteW2,
                     regwriteM3, regwriteMUL3, regwriteW3,
                     regwriteM4, regwriteMUL4, regwriteW4,
                     
                     branchD, branchD2, branchD3, branchD4,
                     branchI, branchI2, branchI3, branchI4,
                     
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

endmodule

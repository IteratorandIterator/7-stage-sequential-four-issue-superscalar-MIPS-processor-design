module stall_syn (input  logic [4:0] rsI,  rtI,
                                     rsI2, rtI2,
                                     rsI3, rtI3,
                                     rsI4, rtI4,

                  input  logic [4:0] rtE,  rtE2,
                                     rtE3, rtE4,

                  input  logic [4:0] writeregI,
                                     writeregI2,
                                     writeregI3,

                  input  logic [4:0] writeregE,
                                     writeregE2,
                                     writeregE3,
                                     writeregE4,

                  input  logic [4:0] writeregM,
                                     writeregM2,
                                     writeregM3,
                                     writeregM4,
                                     
                  input  logic [4:0] writeregMUL,
                                     writeregMUL2,
                                     writeregMUL3,
                                     writeregMUL4,

                  input  logic       regwriteI,
                                     regwriteI2,
                                     regwriteI3,

                  input  logic       regwriteE,
                                     regwriteE2,
                                     regwriteE3,
                                     regwriteE4,

                  input  logic       memwriteI,
                                     memwriteI2,
                                     memwriteI3,
                                     memwriteI4,
                                     
                  input  logic       memtoregI,
                                     memtoregI2,
                                     memtoregI3,
                                     memtoregI4,

                  input  logic       memtoregE,
                                     memtoregE2,
                                     memtoregE3,
                                     memtoregE4,


                  input  logic       memtoregM,
                                     memtoregM2,
                                     memtoregM3,
                                     memtoregM4,

                  input  logic       ismultiplyE,
                                     ismultiplyE2,
                                     ismultiplyE3,
                                     ismultiplyE4,

                  input  logic       ismultiplyM,
                                     ismultiplyM2,
                                     ismultiplyM3,
                                     ismultiplyM4,

                  input  logic       ismultiplyMUL, 
                                     ismultiplyMUL2,
                                     ismultiplyMUL3,
                                     ismultiplyMUL4,

                  input  logic       branchI,
                                     branchI2, 
                                     branchI3,
                                     branchI4,
                                     
                  input  logic       JrI,  JrI2,
                                     JrI3, JrI4,

                  output logic       stallF,

                  output logic       stallD,
                                     stallD2,
                                     stallD3,
                                     stallD4,

                  output logic       stallI,
                                     stallI2,
                                     stallI3,
                                     stallI4,

                  //output logic       stallE,
                                     //stallE2, 
                                     //stallE3,
                                     //stallE4,

                                     
                  output logic       stallI_all);

    logic   normalstallI2;
    logic   normalstallI3;
    logic   normalstallI4;
    
    logic   lwstallI;    
    logic   lwstallI2;
    logic   lwstallI3;
    logic   lwstallI4;

    logic   branchstallI; 
    logic   branchstallI2;
    logic   branchstallI3;
    logic   branchstallI4;

    logic   mulstallI;    
    logic   mulstallI2;   
    logic   mulstallI3;   
    logic   mulstallI4;   

    //logic   memstallM3;   
    //logic   memstallM4;   

    //logic   stallM_all;

    stall   stall (rsI,  rtI,
                   rsI2, rtI2,
                   rsI3, rtI3,
                   rsI4, rtI4,
                   
                   rtE,  rtE2,
                   rtE3, rtE4,
                   
                   writeregI,
                   writeregI2,
                   writeregI3,
                   
                   writeregE,
                   writeregE2,
                   writeregE3,
                   writeregE4,
                   
                   writeregM,
                   writeregM2,
                   writeregM3,
                   writeregM4,
                   
                   writeregMUL,
                   writeregMUL2,
                   writeregMUL3,
                   writeregMUL4,
                   
                   regwriteI,
                   regwriteI2,
                   regwriteI3,
                   
                   regwriteE,
                   regwriteE2,
                   regwriteE3,
                   regwriteE4,
                   
                   memwriteI,
                   memwriteI2,
                   memwriteI3,
                   memwriteI4,
                   
                   memtoregI,
                   memtoregI2,
                   memtoregI3,
                   memtoregI4,
                   
                   memtoregE,
                   memtoregE2,
                   memtoregE3,
                   memtoregE4,
                   
                   memtoregM,
                   memtoregM2,
                   memtoregM3,
                   memtoregM4,
                   
                   ismultiplyE,
                   ismultiplyE2,
                   ismultiplyE3,
                   ismultiplyE4,
                   
                   ismultiplyM,
                   ismultiplyM2,
                   ismultiplyM3,
                   ismultiplyM4,
                   
                   ismultiplyMUL,
                   ismultiplyMUL2,
                   ismultiplyMUL3,
                   ismultiplyMUL4,
                   
                   branchI,
                   branchI2,
                   branchI3,
                   branchI4,
                   
                   JrI,  JrI2,
                   JrI3, JrI4,
                   
                   normalstallI2,
                   normalstallI3,
                   normalstallI4,
                   
                   lwstallI,
                   lwstallI2,
                   lwstallI3,
                   lwstallI4,
                   
                   branchstallI,
                   branchstallI2,
                   branchstallI3,
                   branchstallI4,
                   
                   mulstallI,
                   mulstallI2,
                   mulstallI3,
                   mulstallI4);

    assign stallF    = stallI  | stallI2 | stallI3 | stallI4;// |
                       //stallM3 | stallM4;

    assign stallI_0  = lwstallI     | mulstallI     | branchstallI;
    assign stallI2_0 = lwstallI2    | mulstallI2    | normalstallI2 | branchstallI2;
    assign stallI3_0 = lwstallI3    | mulstallI3    | normalstallI3 | branchstallI3;
    assign stallI4_0 = lwstallI4    | mulstallI4    | normalstallI4 | branchstallI4;


    assign stallD    = stallI_all;

    assign stallD2   = stallI_all;

    assign stallD3   = stallI_all;

    assign stallD4   = stallI_all;


    assign stallI     = stallI_0;//  | stallM_all;
    assign stallI2    = stallI2_0 | branchstallI;// | stallM_all;
    assign stallI3    = stallI3_0 | branchstallI | branchstallI2;// | stallM_all;
    assign stallI4    = stallI4_0 | branchstallI | branchstallI2 | branchstallI3;// | stallM_all;
    assign stallI_all = stallI    | stallI2      | stallI3       | stallI4;


    //assign stallE    = stallM_all;
    //assign stallE2   = stallM_all;
    //assign stallE3   = stallM_all;
    //assign stallE4   = stallM_all;

    //assign stallM3    = memstallM3;
   // assign stallM4    = memstallM4;
    //assign stallM_all = stallM3 | stallM4;

endmodule

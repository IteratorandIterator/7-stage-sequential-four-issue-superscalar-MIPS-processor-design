module stall (input  logic [4:0] rsI,  rtI,
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


              output  logic      normalstallI2,
                                 normalstallI3,
                                 normalstallI4,

              output  logic      lwstallI,
                                 lwstallI2,
                                 lwstallI3,
                                 lwstallI4,

              output  logic      branchstallI,
                                 branchstallI2,
                                 branchstallI3,
                                 branchstallI4,

              output  logic      mulstallI,
                                 mulstallI2,
                                 mulstallI3,
                                 mulstallI4);

    //**************************************************************
    //**********************NORMALSTALL*****************************
    //**************************************************************
    // stall for channel two in I-stage
    logic normalstallI_1, normalstallI_2;

    logic normalstallI_3, normalstallI_4;

    assign normalstallI_1 = (writeregI == rsI2) & (rsI2 != 0);
    assign normalstallI_2 = (writeregI == rtI2) & (rtI2 != 0);

    assign normalstallI_3 = memtoregI & memwriteI2;
    assign normalstallI_4 = memwriteI & memtoregI2;

    assign normalstallI2  = (((normalstallI_1 | normalstallI_2) & regwriteI)
                            &
                            ~memwriteI2)
                            |
                            (normalstallI_3 | normalstallI_4);


    // stall for channel three in I-stage
    logic normalstallI_11, normalstallI_12;
    logic normalstallI_21, normalstallI_22;

    logic normalstallI_31, normalstallI_32;
    logic normalstallI_41, normalstallI_42;
    
    //logic normalstallI_51;
    
    logic memstallI3;

    assign normalstallI_11 = (writeregI  == rsI3) & (rsI3 != 0);
    assign normalstallI_12 = (writeregI  == rtI3) & (rtI3 != 0);

    assign normalstallI_21 = (writeregI2 == rsI3) & (rsI3 != 0);
    assign normalstallI_22 = (writeregI2 == rtI3) & (rtI3 != 0);

    assign normalstallI_31 = memtoregI & memwriteI3;
    assign normalstallI_32 = memwriteI & memtoregI3;

    assign normalstallI_41 = memtoregI2 & memwriteI3;
    assign normalstallI_42 = memwriteI2 & memtoregI3;
    
    //assign normalstallI_51 = normalstallI2 & branchI2;

    assign normalstallI3   = ((((normalstallI_11 | normalstallI_12) & regwriteI)
                             |
                             ((normalstallI_21 | normalstallI_22) & regwriteI2))
                             &
                             ~memwriteI3)
                             |
                             (normalstallI_31 | normalstallI_32)
                             |
                             (normalstallI_41 | normalstallI_42)
                             //|
                             //normalstallI_51
                             |
                             memstallI3;


    // stall for channel four in I-stage
    logic normalstallI_111, normalstallI_112;
    logic normalstallI_221, normalstallI_222;
    logic normalstallI_331, normalstallI_332;

    logic normalstallI_441, normalstallI_442;
    logic normalstallI_551, normalstallI_552;
    logic normalstallI_661, normalstallI_662;
    
    //logic normalstallI_771;
    
    logic memstallI4;

    assign normalstallI_111 = (writeregI  == rsI4) & (rsI4 != 0);
    assign normalstallI_112 = (writeregI  == rtI4) & (rtI4 != 0);

    assign normalstallI_221 = (writeregI2 == rsI4) & (rsI4 != 0);
    assign normalstallI_222 = (writeregI2 == rtI4) & (rtI4 != 0);

    assign normalstallI_331 = (writeregI3 == rsI4) & (rsI4 != 0);
    assign normalstallI_332 = (writeregI3 == rtI4) & (rtI4 != 0);

    assign normalstallI_441 = memtoregI & memwriteI4;
    assign normalstallI_442 = memwriteI & memtoregI4;

    assign normalstallI_551 = memtoregI2 & memwriteI4;
    assign normalstallI_552 = memwriteI2 & memtoregI4;

    assign normalstallI_661 = memtoregI3 & memwriteI4;
    assign normalstallI_662 = memwriteI3 & memtoregI4;
    
    //assign normalstallI_771 = (normalstallI2 & branchI2) | (normalstallI3 & branchI3);

    assign normalstallI4   = ((((normalstallI_111 | normalstallI_112) & regwriteI)
                             |
                             ((normalstallI_221 | normalstallI_222) & regwriteI2)
                             |
                             ((normalstallI_331 | normalstallI_332) & regwriteI3))
                             &
                             ~memwriteI4)
                             |
                             (normalstallI_441 | normalstallI_442)
                             |
                             (normalstallI_551 | normalstallI_552)
                             |
                             (normalstallI_661 | normalstallI_662)
                             //|
                             //normalstallI_771
                             |
                             memstallI4;

    //**************************************************************
    //**********************NORMALSTALL*****************************
    //**************************************************************



    
    //**************************************************************
    //**************************LWSTALL*****************************
    //**************************************************************
    // stalls for channel one in I-stage
    logic lwstallI_11, lwstallI_12, lwstallI_13, lwstallI_14;

    assign  lwstallI_11 = (memtoregE  & ((rtE  == rsI & rsI != 0) | (rtE  == rtI & rtI != 0)));
    assign  lwstallI_12 = (memtoregE2 & ((rtE2 == rsI & rsI != 0) | (rtE2 == rtI & rtI != 0)));
    assign  lwstallI_13 = (memtoregE3 & ((rtE3 == rsI & rsI != 0) | (rtE3 == rtI & rtI != 0)));
    assign  lwstallI_14 = (memtoregE4 & ((rtE4 == rsI & rsI != 0) | (rtE4 == rtI & rtI != 0)));

    assign  lwstallI    = (lwstallI_11 | lwstallI_12 | lwstallI_13 | lwstallI_14) & ~memwriteI;
                       
    // stalls for channel two in I-stage
    logic lwstallI_21, lwstallI_22, lwstallI_23, lwstallI_24;

    assign  lwstallI_21 = (memtoregE  & ((rtE  == rsI2 & rsI2 != 0) | (rtE  == rtI2 & rtI2 != 0)));
    assign  lwstallI_22 = (memtoregE2 & ((rtE2 == rsI2 & rsI2 != 0) | (rtE2 == rtI2 & rtI2 != 0)));
    assign  lwstallI_23 = (memtoregE3 & ((rtE3 == rsI2 & rsI2 != 0) | (rtE3 == rtI2 & rtI2 != 0)));
    assign  lwstallI_24 = (memtoregE4 & ((rtE4 == rsI2 & rsI2 != 0) | (rtE4 == rtI2 & rtI2 != 0)));

    assign  lwstallI2   = (lwstallI_21 | lwstallI_22 | lwstallI_23 | lwstallI_24) & ~memwriteI2;

    // stalls for channel three in I-stage
    logic lwstallI_31, lwstallI_32, lwstallI_33, lwstallI_34;

    assign  lwstallI_31 = (memtoregE  & ((rtE  == rsI3 & rsI3 != 0) | (rtE  == rtI3 & rtI3 != 0)));
    assign  lwstallI_32 = (memtoregE2 & ((rtE2 == rsI3 & rsI3 != 0) | (rtE2 == rtI3 & rtI3 != 0)));
    assign  lwstallI_33 = (memtoregE3 & ((rtE3 == rsI3 & rsI3 != 0) | (rtE3 == rtI3 & rtI3 != 0)));
    assign  lwstallI_34 = (memtoregE4 & ((rtE4 == rsI3 & rsI3 != 0) | (rtE4 == rtI3 & rtI3 != 0)));

    assign  lwstallI3   = (lwstallI_31 | lwstallI_32 | lwstallI_33 | lwstallI_34) & ~memwriteI3;

    // stalls for channel four in I-stage
    logic lwstallI_41, lwstallI_42, lwstallI_43, lwstallI_44;

    assign  lwstallI_41 = (memtoregE  & ((rtE  == rsI4 & rsI4 != 0) | (rtE  == rtI4 & rtI4 != 0)));
    assign  lwstallI_42 = (memtoregE2 & ((rtE2 == rsI4 & rsI4 != 0) | (rtE2 == rtI4 & rtI4 != 0)));
    assign  lwstallI_43 = (memtoregE3 & ((rtE3 == rsI4 & rsI4 != 0) | (rtE3 == rtI4 & rtI4 != 0)));
    assign  lwstallI_44 = (memtoregE4 & ((rtE4 == rsI4 & rsI4 != 0) | (rtE4 == rtI4 & rtI4 != 0)));

    assign  lwstallI4   = (lwstallI_41 | lwstallI_42 | lwstallI_43 | lwstallI_44) & ~memwriteI4;
    //**************************************************************
    //**************************LWSTALL*****************************
    //**************************************************************
    





    //**************************************************************
    //**************************BRANCHSTALL*************************
    //**************************************************************
    // stall for channel one in I-stage
    logic   branchstallI_11, branchstallI_12, branchstallI_13, branchstallI_14;

    assign  branchstallI_11 = (regwriteE     & ((writeregE == rsI & rsI != 0) | (writeregE == rtI & rtI != 0)))
                              |
                              (memtoregM     & ((writeregM == rsI & rsI != 0) | (writeregM == rtI & rtI != 0)))
                              |
                              (ismultiplyMUL & ((writeregMUL == rsI & rsI != 0) | (writeregMUL == rtI & rtI != 0)));

    assign  branchstallI_12 = (regwriteE2     & ((writeregE2 == rsI & rsI != 0) | (writeregE2 == rtI & rtI != 0)))
                              |
                              (memtoregM2     & ((writeregM2 == rsI & rsI != 0) | (writeregM2 == rtI & rtI != 0)))
                              |
                              (ismultiplyMUL2 & ((writeregMUL2 == rsI & rsI != 0) | (writeregMUL2 == rtI & rtI != 0)));

    assign  branchstallI_13 = (regwriteE3     & ((writeregE3 == rsI & rsI != 0) | (writeregE3 == rtI & rtI != 0)))
                              |
                              (memtoregM3     & ((writeregM3 == rsI & rsI != 0) | (writeregM3 == rtI & rtI != 0)))
                              |
                              (ismultiplyMUL3 & ((writeregMUL3 == rsI & rsI != 0) | (writeregMUL3 == rtI & rtI != 0)));

    assign  branchstallI_14 = (regwriteE4     & ((writeregE4 == rsI & rsI != 0) | (writeregE4 == rtI & rtI != 0)))
                              |
                              (memtoregM4     & ((writeregM4 == rsI & rsI != 0) | (writeregM4 == rtI & rtI != 0)))
                              |
                              (ismultiplyMUL4 & ((writeregMUL4 == rsI & rsI != 0) | (writeregMUL4 == rtI & rtI != 0)));

    assign  branchstallI    = (branchstallI_11 | branchstallI_12
                              | branchstallI_13 | branchstallI_14) 
                              & (branchI | JrI);


    // stall for channel two in I-stage
    logic   branchstallI_21, branchstallI_22, 
            branchstallI_23, branchstallI_24,
            branchstallI_25;

    assign  branchstallI_21 = (regwriteE     & ((writeregE == rsI2 & rsI2 != 0) | (writeregE == rtI2 & rtI2 != 0)))
                              |
                              (memtoregM     & ((writeregM == rsI2 & rsI2 != 0) | (writeregM == rtI2 & rtI2 != 0)))
                              |
                              (ismultiplyMUL & ((writeregMUL == rsI2 & rsI2 != 0) | (writeregMUL == rtI2 & rtI2 != 0)));

    assign  branchstallI_22 = (regwriteE2     & ((writeregE2 == rsI2 & rsI2 != 0) | (writeregE2 == rtI2 & rtI2 != 0)))
                              |
                              (memtoregM2     & ((writeregM2 == rsI2 & rsI2 != 0) | (writeregM2 == rtI2 & rtI2 != 0)))
                              |
                              (ismultiplyMUL2 & ((writeregMUL2 == rsI2 & rsI2 != 0) | (writeregMUL2 == rtI2 & rtI2 != 0)));

    assign  branchstallI_23 = (regwriteE3     & ((writeregE3 == rsI2 & rsI2 != 0) | (writeregE3 == rtI2 & rtI2 != 0)))
                              |
                              (memtoregM3     & ((writeregM3 == rsI2 & rsI2 != 0) | (writeregM3 == rtI2 & rtI2 != 0)))
                              |
                              (ismultiplyMUL3 & ((writeregMUL3 == rsI2 & rsI2 != 0) | (writeregMUL3 == rtI2 & rtI2 != 0)));

    assign  branchstallI_24 = (regwriteE4     & ((writeregE4 == rsI2 & rsI2 != 0) | (writeregE4 == rtI2 & rtI2 != 0)))
                              |
                              (memtoregM4     & ((writeregM4 == rsI2 & rsI2 != 0) | (writeregM4 == rtI2 & rtI2 != 0)))
                              |
                              (ismultiplyMUL4 & ((writeregMUL4 == rsI2 & rsI2 != 0) | (writeregMUL4 == rtI2 & rtI2 != 0)));

    assign branchstallI_25  = (regwriteI      & ((writeregI == rsI2 & rsI2 != 0)    | (writeregI == rtI2 & rtI2 != 0)));
    
    assign  branchstallI2   = (branchstallI_21 | branchstallI_22
                              | branchstallI_23 | branchstallI_24
                              | branchstallI_25) & (branchI2 | JrI2);


    // stall for channel three in I-stage
    logic   branchstallI_31, branchstallI_32, 
            branchstallI_33, branchstallI_34,
            branchstallI_35;

    assign  branchstallI_31 = (regwriteE     & ((writeregE == rsI3 & rsI3 != 0) | (writeregE == rtI3 & rtI3 != 0)))
                              |
                              (memtoregM     & ((writeregM == rsI3 & rsI3 != 0) | (writeregM == rtI3 & rtI3 != 0)))
                              |
                              (ismultiplyMUL & ((writeregMUL == rsI3 & rsI3 != 0) | (writeregMUL == rtI3 & rtI3 != 0)));

    assign  branchstallI_32 = (regwriteE2     & ((writeregE2 == rsI3 & rsI3 != 0) | (writeregE2 == rtI3 & rtI3 != 0)))
                              |
                              (memtoregM2     & ((writeregM2 == rsI3 & rsI3 != 0) | (writeregM2 == rtI3 & rtI3 != 0)))
                              |
                              (ismultiplyMUL2 & ((writeregMUL2 == rsI3 & rsI3 != 0) | (writeregMUL2 == rtI3 & rtI3 != 0)));

    assign  branchstallI_33 = (regwriteE3     & ((writeregE3 == rsI3 & rsI3 != 0) | (writeregE3 == rtI3 & rtI3 != 0)))
                              |
                              (memtoregM3     & ((writeregM3 == rsI3 & rsI3 != 0) | (writeregM3 == rtI3 & rtI3 != 0)))
                              |
                              (ismultiplyMUL3 & ((writeregMUL3 == rsI3 & rsI3 != 0) | (writeregMUL3 == rtI3 & rtI3 != 0)));

    assign  branchstallI_34 = (regwriteE4     & ((writeregE4 == rsI3 & rsI3 != 0) | (writeregE4 == rtI3 & rtI3 != 0)))
                              |
                              (memtoregM4     & ((writeregM4 == rsI3 & rsI3 != 0) | (writeregM4 == rtI3 & rtI3 != 0)))
                              |
                              (ismultiplyMUL4 & ((writeregMUL4 == rsI3 & rsI3 != 0) | (writeregMUL4 == rtI3 & rtI3 != 0)));
                              
    assign  branchstallI_35 = (regwriteI      & ((writeregI == rsI3 & rsI3 != 0)      | (writeregI == rtI3 & rtI3 != 0)))
                              |
                              (regwriteI2      & ((writeregI2 == rsI3 & rsI3 != 0)    | (writeregI2 == rtI3 & rtI3 != 0)));

    assign  branchstallI3   = (branchstallI_31 | branchstallI_32
                              | branchstallI_33 | branchstallI_34
                              | branchstallI_35) & (branchI3 | JrI3);


    // stall for channel four in I-stage
    logic   branchstallI_41, branchstallI_42, 
            branchstallI_43, branchstallI_44,
            branchstallI_45;

    assign  branchstallI_41 = (regwriteE     & ((writeregE == rsI4 & rsI4 != 0) | (writeregE == rtI4 & rtI4 != 0)))
                              |
                              (memtoregM     & ((writeregM == rsI4 & rsI4 != 0) | (writeregM == rtI4 & rtI4 != 0)))
                              |
                              (ismultiplyMUL & ((writeregMUL == rsI4 & rsI4 != 0) | (writeregMUL == rtI4 & rtI4 != 0)));

    assign  branchstallI_42 = (regwriteE2     & ((writeregE2 == rsI4 & rsI4 != 0) | (writeregE2 == rtI4 & rtI4 != 0)))
                              |
                              (memtoregM2     & ((writeregM2 == rsI4 & rsI4 != 0) | (writeregM2 == rtI4 & rtI4 != 0)))
                              |
                              (ismultiplyMUL2 & ((writeregMUL2 == rsI4 & rsI4 != 0) | (writeregMUL2 == rtI4 & rtI4 != 0)));

    assign  branchstallI_43 = (regwriteE3     & ((writeregE3 == rsI4 & rsI4 != 0) | (writeregE3 == rtI4 & rtI4 != 0)))
                              |
                              (memtoregM3     & ((writeregM3 == rsI4 & rsI4 != 0) | (writeregM3 == rtI4 & rtI4 != 0)))
                              |
                              (ismultiplyMUL3 & ((writeregMUL3 == rsI4 & rsI4 != 0) | (writeregMUL3 == rtI4 & rtI4 != 0)));

    assign  branchstallI_44 = (regwriteE4     & ((writeregE4 == rsI4 & rsI4 != 0) | (writeregE4 == rtI4 & rtI4 != 0)))
                              |
                              (memtoregM4     & ((writeregM4 == rsI4 & rsI4 != 0) | (writeregM4 == rtI4 & rtI4 != 0)))
                              |
                              (ismultiplyMUL4 & ((writeregMUL4 == rsI4 & rsI4 != 0) | (writeregMUL4 == rtI4 & rtI4 != 0)));
                              
    assign  branchstallI_45 = (regwriteI      & ((writeregI == rsI4 & rsI4 != 0)    | (writeregI == rtI4 & rtI4 != 0)))
                              |
                              (regwriteI2      & ((writeregI2 == rsI4 & rsI4 != 0)    | (writeregI2 == rtI4 & rtI4 != 0)))
                              |
                              (regwriteI3      & ((writeregI3 == rsI4 & rsI4 != 0)    | (writeregI3 == rtI4 & rtI4 != 0)));

    assign  branchstallI4   = (branchstallI_41 | branchstallI_42
                              | branchstallI_43 | branchstallI_44
                              | branchstallI_45) & (branchI4 | JrI4);

    //**************************************************************
    //**************************BRANCHSTALL*************************
    //**************************************************************





    //**************************************************************
    //**************************MULSTALL****************************
    //**************************************************************
    // stall for channel one
    logic   mulstallI_11, mulstallI_12, mulstallI_13, mulstallI_14;

    assign  mulstallI_11 = (ismultiplyE   & ((writeregE  == rsI & rsI != 0) | (writeregE  == rtI & rtI != 0)))
                           |
                           (ismultiplyM   & ((writeregM  == rsI & rsI != 0) | (writeregM  == rtI & rtI != 0)) & ~memwriteI);

    assign  mulstallI_12 = (ismultiplyE2  & ((writeregE2  == rsI & rsI != 0) | (writeregE2  == rtI & rtI != 0)))
                           |
                           (ismultiplyM2  & ((writeregM2  == rsI & rsI != 0) | (writeregM2  == rtI & rtI != 0)) & ~memwriteI);

    assign  mulstallI_13 = (ismultiplyE3  & ((writeregE3  == rsI & rsI != 0) | (writeregE3  == rtI & rtI != 0)))
                           |
                           (ismultiplyM3  & ((writeregM3  == rsI & rsI != 0) | (writeregM3  == rtI & rtI != 0)) & ~memwriteI);

    assign  mulstallI_14 = (ismultiplyE4  & ((writeregE4  == rsI & rsI != 0) | (writeregE4  == rtI & rtI != 0)))
                           |
                           (ismultiplyM4  & ((writeregM4  == rsI & rsI != 0) | (writeregM4  == rtI & rtI != 0)) & ~memwriteI);

    assign  mulstallI    = mulstallI_11 | mulstallI_12 | mulstallI_13 | mulstallI_14;


    // stall for channel two
    logic   mulstallI_21, mulstallI_22, mulstallI_23, mulstallI_24;

    assign  mulstallI_21 = (ismultiplyE   & ((writeregE  == rsI2 & rsI2 != 0) | (writeregE  == rtI2 & rtI2 != 0)))
                           |
                           (ismultiplyM   & ((writeregM  == rsI2 & rsI2 != 0) | (writeregM  == rtI2 & rtI2 != 0)) & ~memwriteI2);

    assign  mulstallI_22 = (ismultiplyE2  & ((writeregE2  == rsI2 & rsI2 != 0) | (writeregE2  == rtI2 & rtI2 != 0)))
                           |
                           (ismultiplyM2  & ((writeregM2  == rsI2 & rsI2 != 0) | (writeregM2  == rtI2 & rtI2 != 0)) & ~memwriteI2);

    assign  mulstallI_23 = (ismultiplyE3  & ((writeregE3  == rsI2 & rsI2 != 0) | (writeregE3  == rtI2 & rtI2 != 0)))
                           |
                           (ismultiplyM3  & ((writeregM3  == rsI2 & rsI2 != 0) | (writeregM3  == rtI2 & rtI2 != 0)) & ~memwriteI2);

    assign  mulstallI_24 = (ismultiplyE4  & ((writeregE4  == rsI2 & rsI2 != 0) | (writeregE4  == rtI2 & rtI2 != 0)))
                           |
                           (ismultiplyM4  & ((writeregM4  == rsI2 & rsI2 != 0) | (writeregM4  == rtI2 & rtI2 != 0)) & ~memwriteI2);

    assign  mulstallI2   = mulstallI_21 | mulstallI_22 | mulstallI_23 | mulstallI_24;


    // stall for channel three
    logic   mulstallI_31, mulstallI_32, mulstallI_33, mulstallI_34;

    assign  mulstallI_31 = (ismultiplyE   & ((writeregE  == rsI3 & rsI3 != 0) | (writeregE  == rtI3 & rtI3 != 0)))
                           |
                           (ismultiplyM   & ((writeregM  == rsI3 & rsI3 != 0) | (writeregM  == rtI3 & rtI3 != 0)) & ~memwriteI3);

    assign  mulstallI_32 = (ismultiplyE2  & ((writeregE2  == rsI3 & rsI3 != 0) | (writeregE2  == rtI3 & rtI3 != 0)))
                           |
                           (ismultiplyM2  & ((writeregM2  == rsI3 & rsI3 != 0) | (writeregM2  == rtI3 & rtI3 != 0)) & ~memwriteI3);

    assign  mulstallI_33 = (ismultiplyE3  & ((writeregE3  == rsI3 & rsI3 != 0) | (writeregE3  == rtI3 & rtI3 != 0)))
                           |
                           (ismultiplyM3  & ((writeregM3  == rsI3 & rsI3 != 0) | (writeregM3  == rtI3 & rtI3 != 0)) & ~memwriteI3);

    assign  mulstallI_34 = (ismultiplyE4  & ((writeregE4  == rsI3 & rsI3 != 0) | (writeregE4  == rtI3 & rtI3 != 0)))
                           |
                           (ismultiplyM4  & ((writeregM4  == rsI3 & rsI3 != 0) | (writeregM4  == rtI3 & rtI3 != 0)) & ~memwriteI3);

    assign  mulstallI3   = mulstallI_31 | mulstallI_32 | mulstallI_33 | mulstallI_34;


    // stall for channel four
    logic   mulstallI_41, mulstallI_42, mulstallI_43, mulstallI_44;

    assign  mulstallI_41 = (ismultiplyE   & ((writeregE  == rsI4 & rsI4 != 0) | (writeregE  == rtI4 & rtI4 != 0)))
                           |
                           (ismultiplyM   & ((writeregM  == rsI4 & rsI4 != 0) | (writeregM  == rtI4 & rtI4 != 0)) & ~memwriteI4);

    assign  mulstallI_42 = (ismultiplyE2  & ((writeregE2  == rsI4 & rsI4 != 0) | (writeregE2  == rtI4 & rtI4 != 0)))
                           |
                           (ismultiplyM2  & ((writeregM2  == rsI4 & rsI4 != 0) | (writeregM2  == rtI4 & rtI4 != 0)) & ~memwriteI4);

    assign  mulstallI_43 = (ismultiplyE3  & ((writeregE3  == rsI4 & rsI4 != 0) | (writeregE3  == rtI4 & rtI4 != 0)))
                           |
                           (ismultiplyM3  & ((writeregM3  == rsI4 & rsI4 != 0) | (writeregM3  == rtI4 & rtI4 != 0)) & ~memwriteI4);

    assign  mulstallI_44 = (ismultiplyE4  & ((writeregE4  == rsI4 & rsI4 != 0) | (writeregE4  == rtI4 & rtI4 != 0)))
                           |
                           (ismultiplyM4  & ((writeregM4  == rsI4 & rsI4 != 0) | (writeregM4  == rtI4 & rtI4 != 0)) & ~memwriteI4);

    assign  mulstallI4   = mulstallI_41 | mulstallI_42 | mulstallI_43 | mulstallI_44;

    //**************************************************************
    //**************************MULSTALL****************************
    //**************************************************************





    //**************************************************************
    //**************************MEMSTALL****************************
    //**************************************************************
    logic [3:0] memwrite_state;

    assign memwrite_state = {memwriteI, memwriteI2, memwriteI3, memwriteI4};

    always_comb
    begin
        case (memwrite_state)
            4'b0000: {memstallI3, memstallI4} = 2'b00;        
            4'b0001: {memstallI3, memstallI4} = 2'b00;        
            4'b0010: {memstallI3, memstallI4} = 2'b00;        
            4'b0011: {memstallI3, memstallI4} = 2'b00;       
            4'b0100: {memstallI3, memstallI4} = 2'b00;       
            4'b0101: {memstallI3, memstallI4} = 2'b00;       
            4'b0110: {memstallI3, memstallI4} = 2'b00;
            4'b0111: {memstallI3, memstallI4} = 2'b01;
            4'b1000: {memstallI3, memstallI4} = 2'b00; 
            4'b1001: {memstallI3, memstallI4} = 2'b00;
            4'b1010: {memstallI3, memstallI4} = 2'b00;
            4'b1011: {memstallI3, memstallI4} = 2'b01;
            4'b1100: {memstallI3, memstallI4} = 2'b00;
            4'b1101: {memstallI3, memstallI4} = 2'b01;
            4'b1110: {memstallI3, memstallI4} = 2'b10;
            4'b1111: {memstallI3, memstallI4} = 2'b11;
        endcase
    end
    //**************************************************************
    //**************************MEMSTALL****************************
    //**************************************************************
endmodule

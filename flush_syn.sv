module flush_syn (input  logic       alignF,
                                     alignF2,
                                     alignF3,
                               
                  input  logic [1:0] pcsrcD,
                                     pcsrcD2,
                                     pcsrcD3,
                                     pcsrcD4,
                                     
                  input  logic       pcsrcI,
                                     pcsrcI2,
                                     pcsrcI3,
                                     pcsrcI4,
                                     
                  input  logic       stallI,
                                     stallI2,
                                     stallI3,
                                     stallI4,
                                     
                  input   logic      stallI_all,
                                     
                  output  logic      flushD,  flushI,
                                     flushD2, flushI2,
                                     flushD3, flushI3,
                                     flushD4, flushI4,
                                     
                  output  logic      flushE,
                                     flushE2,
                                     flushE3,
                                     flushE4);


   logic  flushI1_0, flushI1_1;
   logic  flushI2_0, flushI2_1;
   logic  flushI3_0, flushI3_1;
   logic  flushI4_0, flushI4_1;
   logic  flushI_0;
   
   //logic  flushI_tmp;

   assign flushI1_0  = pcsrcI;
   assign flushI1_1  = pcsrcD[1] | pcsrcD[0];

   assign flushI2_0  = pcsrcI2;
   assign flushI2_1  = pcsrcD2[1] | pcsrcD[0];

   assign flushI3_0  = pcsrcI3;
   assign flushI3_1  = pcsrcD3[1] | pcsrcD3[0];

   assign flushI4_0  = pcsrcI4;
   assign flushI4_1  = pcsrcD4[1] | pcsrcD4[0];

   assign flushI_0   = flushI1_0 | flushI2_0 | flushI3_0 | flushI4_0;
   assign flushI_1   = flushI1_1 | flushI2_1 | flushI3_1 | flushI4_1;

   assign flushD     = flushI_0 | (flushI_1 & ~stallI_all) | alignF;
   assign flushD2    = flushI_0 | (flushI_1 & ~stallI_all) | alignF2;
   assign flushD3    = flushI_0 | (flushI_1 & ~stallI_all) | alignF3;
   assign flushD4    = flushI_0 | (flushI_1 & ~stallI_all) ;
   
   //assign flushI_tmp = stallI | stallI2 | stallI3 | stallI4;

   assign flushI     = /*flushI_0 | */(stallI_all & ~stallI);
   assign flushI2    = /*flushI_0 | */pcsrcI | (stallI_all & ~stallI2);
   assign flushI3    = /*flushI_0 | */pcsrcI | pcsrcI2 | (stallI_all & ~stallI3);
   assign flushI4    = /*flushI_0 | */pcsrcI | pcsrcI2 | pcsrcI3 | (stallI_all & ~stallI4);

   assign  flushE   = stallI;
   assign  flushE2  = stallI2 | flushI1_0;
   assign  flushE3  = stallI3 | flushI1_0 | flushI2_0;
   assign  flushE4  = stallI4 | flushI1_0 | flushI2_0 | flushI3_0;


endmodule

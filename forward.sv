module forward (input  logic [4:0] rsD,  rtD,
                                   rsD2, rtD2,
                                   rsD3, rtD3,
                                   rsD4, rtD4,

                input  logic [4:0] rsI,  rtI,
                                   rsI2, rtI2,
                                   rsI3, rtI3,
                                   rsI4, rtI4,

                input  logic [4:0] rsE,  rtE,
                                   rsE2, rtE2,
                                   rsE3, rtE3,
                                   rsE4, rtE4,

                input  logic [4:0] writeregM,   writeregMUL,  writeregW,
                input  logic [4:0] writeregM2, writeregMUL2, writeregW2,
                input  logic [4:0] writeregM3, writeregMUL3, writeregW3,
                input  logic [4:0] writeregM4, writeregMUL4, writeregW4,

                input  logic       regwriteM,  regwriteMUL,   regwriteW,
                input  logic       regwriteM2, regwriteMUL2,  regwriteW2,
                input  logic       regwriteM3, regwriteMUL3,  regwriteW3,
                input  logic       regwriteM4, regwriteMUL4,  regwriteW4,
                
                input  logic       branchD, branchD2, branchD3, branchD4,   //
                input  logic       branchI, branchI2, branchI3, branchI4,

                output logic       isforwardaD,  isforwardbD,
                output logic       isforwardaD2, isforwardbD2,
                output logic       isforwardaD3, isforwardbD3,
                output logic       isforwardaD4, isforwardbD4,

                output logic [3:0] forwardaD,    forwardbD,
                output logic [3:0] forwardaD2,   forwardbD2,
                output logic [3:0] forwardaD3,   forwardbD3,
                output logic [3:0] forwardaD4,   forwardbD4,

                output logic [3:0] forwardaI,    forwardbI,
                output logic [3:0] forwardaI2,   forwardbI2,
                output logic [3:0] forwardaI3,   forwardbI3,
                output logic [3:0] forwardaI4,   forwardbI4,

                output logic [3:0] forwardaE,    forwardbE,
                output logic [3:0] forwardaE2,   forwardbE2,
                output logic [3:0] forwardaE3,   forwardbE3,
                output logic [3:0] forwardaE4,   forwardbE4,     

                output logic [3:0] forwardaM,  forwardaM2,
                                   forwardaM3, forwardaM4);

    // ***************************************************************
    // ***********************Forwarding-D-stage**********************
    // ***************************************************************
    // forwarding sources to D stage (branch equality) for channel one
    always_comb
    begin
        {isforwardaD, forwardaD} = 5'b01100;         // isforwardaD 1 bit
        {isforwardbD, forwardbD} = 5'b01100;         // forwarda/bD 4 bit
        if      (rsD == 0)
                {isforwardaD, forwardaD} = 5'b11100;
        else if (rsD != 0)
            if      (rsD == writeregM4 & regwriteM4)
                {isforwardaD, forwardaD} = 5'b10000;
            else if (rsD == writeregMUL4 & regwriteMUL4)
                {isforwardaD, forwardaD} = 5'b10001;
            else if (rsD == writeregW4 & regwriteW4)
                {isforwardaD, forwardaD} = 5'b10010; // one
            else if (rsD == writeregM3 & regwriteM3)
                {isforwardaD, forwardaD} = 5'b10011;
            else if (rsD == writeregMUL3 & regwriteMUL3)
                {isforwardaD, forwardaD} = 5'b10100;
            else if (rsD == writeregW3 & writeregW3) // two
                {isforwardaD, forwardaD} = 5'b10101;
            else if (rsD == writeregM2 & regwriteM2)
                {isforwardaD, forwardaD} = 5'b10110;
            else if (rsD == writeregMUL2 & regwriteMUL2)
                {isforwardaD, forwardaD} = 5'b10111;
            else if (rsD == writeregW2 & writeregW2) // three
                {isforwardaD, forwardaD} = 5'b11000;
            else if (rsD == writeregM & regwriteM)
                {isforwardaD, forwardaD} = 5'b11001;
            else if (rsD == writeregMUL & regwriteMUL)
                {isforwardaD, forwardaD} = 5'b11010;
            else if (rsD == writeregW & writeregW) // four
                {isforwardaD, forwardaD} = 5'b11011;


       if      (rtD == 0 | (branchD == 1'b1 & rtD == 5'b00001))
                {isforwardbD, forwardbD} = 5'b11100;
       else if (rtD != 0)
            if      (rtD == writeregM4 & regwriteM4)
                {isforwardbD, forwardbD} = 5'b10000;
            else if (rtD == writeregMUL4 & regwriteMUL4)
                {isforwardbD, forwardbD} = 5'b10001;
            else if (rtD == writeregW4 & regwriteW4) // one
                {isforwardbD, forwardbD} = 5'b10010;
            else if (rtD == writeregM3 & regwriteM3)
                {isforwardbD, forwardbD} = 5'b10011;
            else if (rtD == writeregMUL3 & regwriteMUL3)
                {isforwardbD, forwardbD} = 5'b10100;
            else if (rtD == writeregW3 & writeregW3) // two
                {isforwardbD, forwardbD} = 5'b10101;
            else if (rtD == writeregM2 & regwriteM2)
                {isforwardbD, forwardbD} = 5'b10110;
            else if (rtD == writeregMUL2 & regwriteMUL2)
                {isforwardbD, forwardbD} = 5'b10111;
            else if (rtD == writeregW2 & writeregW2) // three
                {isforwardbD, forwardbD} = 5'b11000;
            else if (rtD == writeregM & regwriteM)
                {isforwardbD, forwardbD} = 5'b11001;
            else if (rtD == writeregMUL & regwriteMUL)
                {isforwardbD, forwardbD} = 5'b11010;
            else if (rtD == writeregW & writeregW) // four
                {isforwardbD, forwardbD} = 5'b11011;
    end

    // forwarding sources to D stage (branch equality) for channel two
    always_comb
    begin
        {isforwardaD2, forwardaD2} = 5'b01100;         // isforwardaD2 1 bit
        {isforwardbD2, forwardbD2} = 5'b01100;         // forwarda/bD2 4 bit
        if      (rsD2 == 0)
                {isforwardaD2, forwardaD2} = 5'b11100;
        else if (rsD2 != 0)
            if      (rsD2 == writeregM4 & regwriteM4)
                {isforwardaD2, forwardaD2} = 5'b10000;
            else if (rsD2 == writeregMUL4 & regwriteMUL4)
                {isforwardaD2, forwardaD2} = 5'b10001;
            else if (rsD2 == writeregW4 & regwriteW4)
                {isforwardaD2, forwardaD2} = 5'b10010; // one
            else if (rsD2 == writeregM3 & regwriteM3)
                {isforwardaD2, forwardaD2} = 5'b10011;
            else if (rsD2 == writeregMUL3 & regwriteMUL3)
                {isforwardaD2, forwardaD2} = 5'b10100;
            else if (rsD2 == writeregW3 & writeregW3) // two
                {isforwardaD2, forwardaD2} = 5'b10101;
            else if (rsD2 == writeregM2 & regwriteM2)
                {isforwardaD2, forwardaD2} = 5'b10110;
            else if (rsD2 == writeregMUL2 & regwriteMUL2)
                {isforwardaD2, forwardaD2} = 5'b10111;
            else if (rsD2 == writeregW2 & writeregW2) // three
                {isforwardaD2, forwardaD2} = 5'b11000;
            else if (rsD2 == writeregM & regwriteM)
                {isforwardaD2, forwardaD2} = 5'b11001;
            else if (rsD2 == writeregMUL & regwriteMUL)
                {isforwardaD2, forwardaD2} = 5'b11010;
            else if (rsD2 == writeregW & writeregW) // four
                {isforwardaD2, forwardaD2} = 5'b11011;
                
                
       if      (rtD2 == 0 | (branchD2 == 1'b1 & rtD2 == 5'b00001))
                {isforwardbD2, forwardbD2} = 5'b11100;
       else if (rtD2 != 0)
            if      (rtD2 == writeregM4 & regwriteM4)
                {isforwardbD2, forwardbD2} = 5'b10000;
            else if (rtD2 == writeregMUL4 & regwriteMUL4)
                {isforwardbD2, forwardbD2} = 5'b10001;
            else if (rtD2 == writeregW4 & regwriteW4) // one
                {isforwardbD2, forwardbD2} = 5'b10010;
            else if (rtD2 == writeregM3 & regwriteM3)
                {isforwardbD2, forwardbD2} = 5'b10011;
            else if (rtD2 == writeregMUL3 & regwriteMUL3)
                {isforwardbD2, forwardbD2} = 5'b10100;
            else if (rtD2 == writeregW3 & writeregW3) // two
                {isforwardbD2, forwardbD2} = 5'b10101;
            else if (rtD2 == writeregM2 & regwriteM2)
                {isforwardbD2, forwardbD2} = 5'b10110;
            else if (rtD2 == writeregMUL2 & regwriteMUL2)
                {isforwardbD2, forwardbD2} = 5'b10111;
            else if (rtD2 == writeregW2 & writeregW2) // three
                {isforwardbD2, forwardbD2} = 5'b11000;
            else if (rtD2 == writeregM & regwriteM)
                {isforwardbD2, forwardbD2} = 5'b11001;
            else if (rtD2 == writeregMUL & regwriteMUL)
                {isforwardbD2, forwardbD2} = 5'b11010;
            else if (rtD2 == writeregW & writeregW) // four
                {isforwardbD2, forwardbD2} = 5'b11011;
     
    end

    // forwarding sources to D stage (branch equality) for channel three
    always_comb
    begin
        {isforwardaD3, forwardaD3} = 5'b01100;         // isforwardaD3 1 bit
        {isforwardbD3, forwardbD3} = 5'b01100;         // forwarda/bD3 4 bit
        if      (rsD3 == 0)
                {isforwardaD3, forwardaD3} = 5'b11100;
        else if (rsD3 != 0)
            if      (rsD3 == writeregM4 & regwriteM4)
                {isforwardaD3, forwardaD3} = 5'b10000;
            else if (rsD3 == writeregMUL4 & regwriteMUL4)
                {isforwardaD3, forwardaD3} = 5'b10001;
            else if (rsD3 == writeregW4 & regwriteW4)
                {isforwardaD3, forwardaD3} = 5'b10010; // one
            else if (rsD3 == writeregM3 & regwriteM3)
                {isforwardaD3, forwardaD3} = 5'b10011;
            else if (rsD3 == writeregMUL3 & regwriteMUL3)
                {isforwardaD3, forwardaD3} = 5'b10100;
            else if (rsD3 == writeregW3 & writeregW3) // two
                {isforwardaD3, forwardaD3} = 5'b10101;
            else if (rsD3 == writeregM2 & regwriteM2)
                {isforwardaD3, forwardaD3} = 5'b10110;
            else if (rsD3 == writeregMUL2 & regwriteMUL2)
                {isforwardaD3, forwardaD3} = 5'b10111;
            else if (rsD3 == writeregW2 & writeregW2) // three
                {isforwardaD3, forwardaD3} = 5'b11000;
            else if (rsD3 == writeregM & regwriteM)
                {isforwardaD3, forwardaD3} = 5'b11001;
            else if (rsD3 == writeregMUL & regwriteMUL)
                {isforwardaD3, forwardaD3} = 5'b11010;
            else if (rsD3 == writeregW & writeregW) // four
                {isforwardaD3, forwardaD3} = 5'b11011;
       
                
                
       if      (rtD3 == 0 | (branchD3 == 1'b1 & rtD3 == 5'b00001))
                {isforwardbD3, forwardbD3} = 5'b11100; 
       else if (rtD3 != 0)
            if      (rtD3 == writeregM4 & regwriteM4)
                {isforwardbD3, forwardbD3} = 5'b10000;
            else if (rtD3 == writeregMUL4 & regwriteMUL4)
                {isforwardbD3, forwardbD3} = 5'b10001;
            else if (rtD3 == writeregW4 & regwriteW4) // one
                {isforwardbD3, forwardbD3} = 5'b10010;
            else if (rtD3 == writeregM3 & regwriteM3)
                {isforwardbD3, forwardbD3} = 5'b10011;
            else if (rtD3 == writeregMUL3 & regwriteMUL3)
                {isforwardbD3, forwardbD3} = 5'b10100;
            else if (rtD3 == writeregW3 & writeregW3) // two
                {isforwardbD3, forwardbD3} = 5'b10101;
            else if (rtD3 == writeregM2 & regwriteM2)
                {isforwardbD3, forwardbD3} = 5'b10110;
            else if (rtD3 == writeregMUL2 & regwriteMUL2)
                {isforwardbD3, forwardbD3} = 5'b10111;
            else if (rtD3 == writeregW2 & writeregW2) // three
                {isforwardbD3, forwardbD3} = 5'b11000;
            else if (rtD3 == writeregM & regwriteM)
                {isforwardbD3, forwardbD3} = 5'b11001;
            else if (rtD3 == writeregMUL & regwriteMUL)
                {isforwardbD3, forwardbD3} = 5'b11010;
            else if (rtD3 == writeregW & writeregW) // four
                {isforwardbD3, forwardbD3} = 5'b11011;
       else if (rtD3 == 0)
                {isforwardbD3, forwardbD3} = 5'b11100;
    end

    // forwarding sources to D stage (branch equality) for channel four
    always_comb
    begin
        {isforwardaD4, forwardaD4} = 5'b01100;         // isforwardaD4 1 bit
        {isforwardbD4, forwardbD4} = 5'b01100;         // forwarda/bD4 4 bit
        if      (rsD4 == 0)
                {isforwardaD4, forwardaD4} = 5'b11100;
        else if (rsD4 != 0)
            if      (rsD4 == writeregM4 & regwriteM4)
                {isforwardaD4, forwardaD4} = 5'b10000;
            else if (rsD4 == writeregMUL4 & regwriteMUL4)
                {isforwardaD4, forwardaD4} = 5'b10001;
            else if (rsD4 == writeregW4 & regwriteW4)
                {isforwardaD4, forwardaD4} = 5'b10010; // one
            else if (rsD4 == writeregM3 & regwriteM3)
                {isforwardaD4, forwardaD4} = 5'b10011;
            else if (rsD4 == writeregMUL3 & regwriteMUL3)
                {isforwardaD4, forwardaD4} = 5'b10100;
            else if (rsD4 == writeregW3 & writeregW3) // two
                {isforwardaD4, forwardaD4} = 5'b10101;
            else if (rsD4 == writeregM2 & regwriteM2)
                {isforwardaD4, forwardaD4} = 5'b10110;
            else if (rsD4 == writeregMUL2 & regwriteMUL2)
                {isforwardaD4, forwardaD4} = 5'b10111;
            else if (rsD4 == writeregW2 & writeregW2) // three
                {isforwardaD4, forwardaD4} = 5'b11000;
            else if (rsD4 == writeregM & regwriteM)
                {isforwardaD4, forwardaD4} = 5'b11001;
            else if (rsD4 == writeregMUL & regwriteMUL)
                {isforwardaD4, forwardaD4} = 5'b11010;
            else if (rsD4 == writeregW & writeregW) // four
                {isforwardaD4, forwardaD4} = 5'b11011;
       
       
       
       if      (rtD4 == 0 | (branchD4 == 1'b1 & rtD4 == 5'b00001))
                {isforwardbD4, forwardbD4} = 5'b11100; 
       else if (rtD4 != 0)
            if      (rtD4 == writeregM4 & regwriteM4)
                {isforwardbD4, forwardbD4} = 5'b10000;
            else if (rtD4 == writeregMUL4 & regwriteMUL4)
                {isforwardbD4, forwardbD4} = 5'b10001;
            else if (rtD4 == writeregW4 & regwriteW4) // one
                {isforwardbD4, forwardbD4} = 5'b10010;
            else if (rtD4 == writeregM3 & regwriteM3)
                {isforwardbD4, forwardbD4} = 5'b10011;
            else if (rtD4 == writeregMUL3 & regwriteMUL3)
                {isforwardbD4, forwardbD4} = 5'b10100;
            else if (rtD4 == writeregW3 & writeregW3) // two
                {isforwardbD4, forwardbD4} = 5'b10101;
            else if (rtD4 == writeregM2 & regwriteM2)
                {isforwardbD4, forwardbD4} = 5'b10110;
            else if (rtD4 == writeregMUL2 & regwriteMUL2)
                {isforwardbD4, forwardbD4} = 5'b10111;
            else if (rtD4 == writeregW2 & writeregW2) // three
                {isforwardbD4, forwardbD4} = 5'b11000;
            else if (rtD4 == writeregM & regwriteM)
                {isforwardbD4, forwardbD4} = 5'b11001;
            else if (rtD4 == writeregMUL & regwriteMUL)
                {isforwardbD4, forwardbD4} = 5'b11010;
            else if (rtD4 == writeregW & writeregW) // four
                {isforwardbD4, forwardbD4} = 5'b11011;
       
    end
    // ***************************************************************
    // ***********************Forwarding-D-stage**********************
    // ***************************************************************



    // ****************************************************************
    // ************************Forwarding-I-stage**********************
    // ****************************************************************
    // forwarding sources to I stage (branch equality) for channel one
    always_comb
    begin
        forwardaI = 4'b0000;
        forwardbI = 4'b0000;
        if (rsI != 0)
            if      (rsI == writeregM4 & regwriteM4)
                forwardaI = 4'b0001;
            else if (rsI == writeregMUL4 & regwriteMUL4)
                forwardaI = 4'b0010;                         // one
            else if (rsI == writeregM3 & regwriteM3)
                forwardaI = 4'b0011;                         
            else if (rsI == writeregMUL3 & regwriteMUL3)
                forwardaI = 4'b0100;                         // two
            else if (rsI == writeregM2 & regwriteM2)
                forwardaI = 4'b0101;                         
            else if (rsI == writeregMUL2 & regwriteMUL2)
                forwardaI = 4'b0110;                         // three
            else if (rsI == writeregM & regwriteM)
                forwardaI = 4'b0111;
            else if (rsI == writeregMUL & regwriteMUL)
                forwardaI = 4'b1000;                         // four

        if (rtI != 0 & ~(branchI == 1'b1 & rtI == 5'b00001))
            if      (rtI == writeregM4 & regwriteM4)
                forwardbI = 4'b0001;
            else if (rtI == writeregMUL4 & regwriteMUL4)
                forwardbI = 4'b0010;                         // one
            else if (rtI == writeregM3 & regwriteM3)
                forwardbI = 4'b0011;
            else if (rtI == writeregMUL3 & regwriteMUL3)
                forwardbI = 4'b0100;                         // two
            else if (rtI == writeregM2 & regwriteM2)
                forwardbI = 4'b0101;
            else if (rtI == writeregMUL2 & regwriteMUL2)
                forwardbI = 4'b0110;                         // three
            else if (rtI == writeregM & regwriteM)
                forwardbI = 4'b0111;
            else if (rtI == writeregMUL & regwriteMUL)
                forwardbI = 4'b1000;                         // four
    end

    // forwarding sources to I stage (branch equality) for channel two
    always_comb
    begin
        forwardaI2 = 4'b0000;
        forwardbI2 = 4'b0000;
        if (rsI2 != 0)
            if      (rsI2 == writeregM4 & regwriteM4)
                forwardaI2 = 4'b0001;
            else if (rsI2 == writeregMUL4 & regwriteMUL4)
                forwardaI2 = 4'b0010;                         // one
            else if (rsI2 == writeregM3 & regwriteM3)
                forwardaI2 = 4'b0011;                         
            else if (rsI2 == writeregMUL3 & regwriteMUL3)
                forwardaI2 = 4'b0100;                         // two
            else if (rsI2 == writeregM2 & regwriteM2)
                forwardaI2 = 4'b0101;                         
            else if (rsI2 == writeregMUL2 & regwriteMUL2)
                forwardaI2 = 4'b0110;                         // three
            else if (rsI2 == writeregM & regwriteM)
                forwardaI2 = 4'b0111;
            else if (rsI2 == writeregMUL & regwriteMUL)
                forwardaI2 = 4'b1000;                         // four

        if (rtI2 != 0 & ~(branchI2 == 1'b1 & rtI2 == 5'b00001))
            if      (rtI2 == writeregM4 & regwriteM4)
                forwardbI2 = 4'b0001;
            else if (rtI2 == writeregMUL4 & regwriteMUL4)
                forwardbI2 = 4'b0010;                         // one
            else if (rtI2 == writeregM3 & regwriteM3)
                forwardbI2 = 4'b0011;
            else if (rtI2 == writeregMUL3 & regwriteMUL3)
                forwardbI2 = 4'b0100;                         // two
            else if (rtI2 == writeregM2 & regwriteM2)
                forwardbI2 = 4'b0101;
            else if (rtI2 == writeregMUL2 & regwriteMUL2)
                forwardbI2 = 4'b0110;                         // three
            else if (rtI2 == writeregM & regwriteM)
                forwardbI2 = 4'b0111;
            else if (rtI2 == writeregMUL & regwriteMUL)
                forwardbI2 = 4'b1000;                         // four
    end

    // forwarding sources to I stage (branch equality) for channel three
    always_comb
    begin
        forwardaI3 = 4'b0000;
        forwardbI3 = 4'b0000;
        if (rsI3 != 0)
            if      (rsI3 == writeregM4 & regwriteM4)
                forwardaI3 = 4'b0001;
            else if (rsI3 == writeregMUL4 & regwriteMUL4)
                forwardaI3 = 4'b0010;                         // one
            else if (rsI3 == writeregM3 & regwriteM3)
                forwardaI3 = 4'b0011;                         
            else if (rsI3 == writeregMUL3 & regwriteMUL3)
                forwardaI3 = 4'b0100;                         // two
            else if (rsI3 == writeregM2 & regwriteM2)
                forwardaI3 = 4'b0101;                         
            else if (rsI3 == writeregMUL2 & regwriteMUL2)
                forwardaI3 = 4'b0110;                         // three
            else if (rsI3 == writeregM & regwriteM)
                forwardaI3 = 4'b0111;
            else if (rsI3 == writeregMUL & regwriteMUL)
                forwardaI3 = 4'b1000;                         // four

        if (rtI3 != 0 & ~(branchI3 == 1'b1 & rtI3 == 5'b00001))
            if      (rtI3 == writeregM4 & regwriteM4)
                forwardbI3 = 4'b0001;
            else if (rtI3 == writeregMUL4 & regwriteMUL4)
                forwardbI3 = 4'b0010;                         // one
            else if (rtI3 == writeregM3 & regwriteM3)
                forwardbI3 = 4'b0011;
            else if (rtI3 == writeregMUL3 & regwriteMUL3)
                forwardbI3 = 4'b0100;                         // two
            else if (rtI3 == writeregM2 & regwriteM2)
                forwardbI3 = 4'b0101;
            else if (rtI3 == writeregMUL2 & regwriteMUL2)
                forwardbI3 = 4'b0110;                         // three
            else if (rtI3 == writeregM & regwriteM)
                forwardbI3 = 4'b0111;
            else if (rtI3 == writeregMUL & regwriteMUL)
                forwardbI3 = 4'b1000;                         // four
    end

    // forwarding sources to I stage (branch equality) for channel four
    always_comb
    begin
        forwardaI4 = 4'b0000;
        forwardbI4 = 4'b0000;
        if (rsI4 != 0)
            if      (rsI4 == writeregM4 & regwriteM4)
                forwardaI4 = 4'b0001;
            else if (rsI4 == writeregMUL4 & regwriteMUL4)
                forwardaI4 = 4'b0010;                         // one
            else if (rsI4 == writeregM3 & regwriteM3)
                forwardaI4 = 4'b0011;                         
            else if (rsI4 == writeregMUL3 & regwriteMUL3)
                forwardaI4 = 4'b0100;                         // two
            else if (rsI4 == writeregM2 & regwriteM2)
                forwardaI4 = 4'b0101;                         
            else if (rsI4 == writeregMUL2 & regwriteMUL2)
                forwardaI4 = 4'b0110;                         // three
            else if (rsI4 == writeregM & regwriteM)
                forwardaI4 = 4'b0111;
            else if (rsI4 == writeregMUL & regwriteMUL)
                forwardaI4 = 4'b1000;                         // four

        if (rtI4 != 0 & ~(branchI4 == 1'b1 & rtI4 == 5'b00001))
            if      (rtI4 == writeregM4 & regwriteM4)
                forwardbI4 = 4'b0001;
            else if (rtI4 == writeregMUL4 & regwriteMUL4)
                forwardbI4 = 4'b0010;                         // one
            else if (rtI4 == writeregM3 & regwriteM3)
                forwardbI4 = 4'b0011;
            else if (rtI4 == writeregMUL3 & regwriteMUL3)
                forwardbI4 = 4'b0100;                         // two
            else if (rtI4 == writeregM2 & regwriteM2)
                forwardbI4 = 4'b0101;
            else if (rtI4 == writeregMUL2 & regwriteMUL2)
                forwardbI4 = 4'b0110;                         // three
            else if (rtI4 == writeregM & regwriteM)
                forwardbI4 = 4'b0111;
            else if (rtI4 == writeregMUL & regwriteMUL)
                forwardbI4 = 4'b1000;                         // four
    end
    // ****************************************************************
    // ************************Forwarding-I-stage**********************
    // ****************************************************************



    // ****************************************************************
    // ************************Forwarding-E-stage**********************
    // ****************************************************************
    // forwarding sources to E stage (ALU) for channel one
    always_comb
    begin
        forwardaE = 4'b0000;
        forwardbE = 4'b0000;
        if (rsE != 0)
            if      (rsE == writeregM4 & regwriteM4)
                forwardaE = 4'b0001;
            else if (rsE == writeregMUL4 & regwriteMUL4)
                forwardaE = 4'b0010;
            else if (rsE == writeregW4 & regwriteW4)
                forwardaE = 4'b0011;                        // one
            else if (rsE == writeregM3 & regwriteM3)
                forwardaE = 4'b0100;
            else if (rsE == writeregMUL3 & regwriteMUL3)
                forwardaE = 4'b0101;
            else if (rsE == writeregW3 & regwriteW3)
                forwardaE = 4'b0110;                        // two
            else if (rsE == writeregM2 & regwriteM2)
                forwardaE = 4'b0111;
            else if (rsE == writeregMUL2 & regwriteMUL2)
                forwardaE = 4'b1000;
            else if (rsE == writeregW2 & regwriteW2)
                forwardaE = 4'b1001;                        // three
            else if (rsE == writeregM & regwriteM)
                forwardaE = 4'b1010;
            else if (rsE == writeregMUL & regwriteMUL)
                forwardaE = 4'b1011;
            else if (rsE == writeregW & regwriteW)
                forwardaE = 4'b1100;                        // four

        if (rtE != 0)
            if      (rtE == writeregM4 & regwriteM4)
                forwardbE = 4'b0001;
            else if (rtE == writeregMUL4 & regwriteMUL4)
                forwardbE = 4'b0010;
            else if (rtE == writeregW4 & regwriteW4)
                forwardbE = 4'b0011;                         // one
            else if (rtE == writeregM3 & regwriteM3)
                forwardbE = 4'b0100;
            else if (rtE == writeregMUL3 & regwriteMUL3)
                forwardbE = 4'b0101;
            else if (rtE == writeregW3 & regwriteW3)
                forwardbE = 4'b0110;                         // two
            else if (rtE == writeregM2 & regwriteM2)
                forwardbE = 4'b0111;
            else if (rtE == writeregMUL2 & regwriteMUL2)
                forwardbE = 4'b1000;
            else if (rtE == writeregW2 & regwriteW2)
                forwardbE = 4'b1001;                         // three
            else if (rtE == writeregM & regwriteM)
                forwardbE = 4'b1010;
            else if (rtE == writeregMUL & regwriteMUL)
                forwardbE = 4'b1011;
            else if (rtE == writeregW & regwriteW)
                forwardbE = 4'b1100;                         // four
    end

    // forwarding sources to E stage (ALU) for channel two
    always_comb
    begin
        forwardaE2 = 4'b0000;
        forwardbE2 = 4'b0000;
        if (rsE2 != 0)
            if      (rsE2 == writeregM4 & regwriteM4)
                forwardaE2 = 4'b0001;
            else if (rsE2 == writeregMUL4 & regwriteMUL4)
                forwardaE2 = 4'b0010;
            else if (rsE2 == writeregW4 & regwriteW4)
                forwardaE2 = 4'b0011;                        // one
            else if (rsE2 == writeregM3 & regwriteM3)
                forwardaE2 = 4'b0100;
            else if (rsE2 == writeregMUL3 & regwriteMUL3)
                forwardaE2 = 4'b0101;
            else if (rsE2 == writeregW3 & regwriteW3)
                forwardaE2 = 4'b0110;                        // two
            else if (rsE2 == writeregM2 & regwriteM2)
                forwardaE2 = 4'b0111;
            else if (rsE2 == writeregMUL2 & regwriteMUL2)
                forwardaE2 = 4'b1000;
            else if (rsE2 == writeregW2 & regwriteW2)
                forwardaE2 = 4'b1001;                        // three
            else if (rsE2 == writeregM & regwriteM)
                forwardaE2 = 4'b1010;
            else if (rsE2 == writeregMUL & regwriteMUL)
                forwardaE2 = 4'b1011;
            else if (rsE2 == writeregW & regwriteW)
                forwardaE2 = 4'b1100;                        // four
                
        if (rtE2 != 0)
            if      (rtE2 == writeregM4 & regwriteM4)
                forwardbE2 = 4'b0001;
            else if (rtE2 == writeregMUL4 & regwriteMUL4)
                forwardbE2 = 4'b0010;
            else if (rtE2 == writeregW4 & regwriteW4)
                forwardbE2 = 4'b0011;                         // one
            else if (rtE2 == writeregM3 & regwriteM3)
                forwardbE2 = 4'b0100;
            else if (rtE2 == writeregMUL3 & regwriteMUL3)
                forwardbE2 = 4'b0101;
            else if (rtE2 == writeregW3 & regwriteW3)
                forwardbE2 = 4'b0110;                         // two
            else if (rtE2 == writeregM2 & regwriteM2)
                forwardbE2 = 4'b0111;
            else if (rtE2 == writeregMUL2 & regwriteMUL2)
                forwardbE2 = 4'b1000;
            else if (rtE2 == writeregW2 & regwriteW2)
                forwardbE2 = 4'b1001;                         // three
            else if (rtE2 == writeregM & regwriteM)
                forwardbE2 = 4'b1010;
            else if (rtE2 == writeregMUL & regwriteMUL)
                forwardbE2 = 4'b1011;
            else if (rtE2 == writeregW & regwriteW)
                forwardbE2 = 4'b1100;                         // four
    end


    // forwarding sources to E stage (ALU) for channel three
    always_comb
    begin
        forwardaE3 = 4'b0000;
        forwardbE3 = 4'b0000;
        if (rsE3 != 0)
            if      (rsE3 == writeregM4 & regwriteM4)
                forwardaE3 = 4'b0001;
            else if (rsE3 == writeregMUL4 & regwriteMUL4)
                forwardaE3 = 4'b0010;
            else if (rsE3 == writeregW4 & regwriteW4)
                forwardaE3 = 4'b0011;                        // one
            else if (rsE3 == writeregM3 & regwriteM3)
                forwardaE3 = 4'b0100;
            else if (rsE3 == writeregMUL3 & regwriteMUL3)
                forwardaE3 = 4'b0101;
            else if (rsE3 == writeregW3 & regwriteW3)
                forwardaE3 = 4'b0110;                        // two
            else if (rsE3 == writeregM2 & regwriteM2)
                forwardaE3 = 4'b0111;
            else if (rsE3 == writeregMUL2 & regwriteMUL2)
                forwardaE3 = 4'b1000;
            else if (rsE3 == writeregW2 & regwriteW2)
                forwardaE3 = 4'b1001;                        // three
            else if (rsE3 == writeregM & regwriteM)
                forwardaE3 = 4'b1010;
            else if (rsE3 == writeregMUL & regwriteMUL)
                forwardaE3 = 4'b1011;
            else if (rsE3 == writeregW & regwriteW)
                forwardaE3 = 4'b1100;                        // four

        if (rtE3 != 0)
            if      (rtE3 == writeregM4 & regwriteM4)
                forwardbE3 = 4'b0001;
            else if (rtE3 == writeregMUL4 & regwriteMUL4)
                forwardbE3 = 4'b0010;
            else if (rtE3 == writeregW4 & regwriteW4)
                forwardbE3 = 4'b0011;                         // one
            else if (rtE3 == writeregM3 & regwriteM3)
                forwardbE3 = 4'b0100;
            else if (rtE3 == writeregMUL3 & regwriteMUL3)
                forwardbE3 = 4'b0101;
            else if (rtE3 == writeregW3 & regwriteW3)
                forwardbE3 = 4'b0110;                         // two
            else if (rtE3 == writeregM2 & regwriteM2)
                forwardbE3 = 4'b0111;
            else if (rtE3 == writeregMUL2 & regwriteMUL2)
                forwardbE3 = 4'b1000;
            else if (rtE3 == writeregW2 & regwriteW2)
                forwardbE3 = 4'b1001;                         // three
            else if (rtE3 == writeregM & regwriteM)
                forwardbE3 = 4'b1010;
            else if (rtE3 == writeregMUL & regwriteMUL)
                forwardbE3 = 4'b1011;
            else if (rtE3 == writeregW & regwriteW)
                forwardbE3 = 4'b1100;                         // four
    end


    // forwarding sources to E stage (ALU) for channel four
    always_comb
    begin
        forwardaE4 = 4'b0000;
        forwardbE4 = 4'b0000;
        if (rsE4 != 0)
            if      (rsE4 == writeregM4 & regwriteM4)
                forwardaE4 = 4'b0001;
            else if (rsE4 == writeregMUL4 & regwriteMUL4)
                forwardaE4 = 4'b0010;
            else if (rsE4 == writeregW4 & regwriteW4)
                forwardaE4 = 4'b0011;                        // one
            else if (rsE4 == writeregM3 & regwriteM3)
                forwardaE4 = 4'b0100;
            else if (rsE4 == writeregMUL3 & regwriteMUL3)
                forwardaE4 = 4'b0101;
            else if (rsE4 == writeregW3 & regwriteW3)
                forwardaE4 = 4'b0110;                        // two
            else if (rsE4 == writeregM2 & regwriteM2)
                forwardaE4 = 4'b0111;
            else if (rsE4 == writeregMUL2 & regwriteMUL2)
                forwardaE4 = 4'b1000;
            else if (rsE4 == writeregW2 & regwriteW2)
                forwardaE4 = 4'b1001;                        // three
            else if (rsE4 == writeregM & regwriteM)
                forwardaE4 = 4'b1010;
            else if (rsE4 == writeregMUL & regwriteMUL)
                forwardaE4 = 4'b1011;
            else if (rsE4 == writeregW & regwriteW)
                forwardaE4 = 4'b1100;                        // four

        if (rtE4 != 0)
            if      (rtE4 == writeregM4 & regwriteM4)
                forwardbE4 = 4'b0001;
            else if (rtE4 == writeregMUL4 & regwriteMUL4)
                forwardbE4 = 4'b0010;
            else if (rtE4 == writeregW4 & regwriteW4)
                forwardbE4 = 4'b0011;                         // one
            else if (rtE4 == writeregM3 & regwriteM3)
                forwardbE4 = 4'b0100;
            else if (rtE4 == writeregMUL3 & regwriteMUL3)
                forwardbE4 = 4'b0101;
            else if (rtE4 == writeregW3 & regwriteW3)
                forwardbE4 = 4'b0110;                         // two
            else if (rtE4 == writeregM2 & regwriteM2)
                forwardbE4 = 4'b0111;
            else if (rtE4 == writeregMUL2 & regwriteMUL2)
                forwardbE4 = 4'b1000;
            else if (rtE4 == writeregW2 & regwriteW2)
                forwardbE4 = 4'b1001;                         // three
            else if (rtE4 == writeregM & regwriteM)
                forwardbE4 = 4'b1010;
            else if (rtE4 == writeregMUL & regwriteMUL)
                forwardbE4 = 4'b1011;
            else if (rtE4 == writeregW & regwriteW)
                forwardbE4 = 4'b1100;                         // four
    end

    // ****************************************************************
    // ************************Forwarding-E-stage**********************
    // ****************************************************************





    // ****************************************************************
    // ************************Forwarding-M-stage**********************
    // ****************************************************************
    // forwarding sources to M stage (Memory) for channel one
    always_comb
    begin
        forwardaM = 4'b0000;
        if (writeregM != 0)
            if      (writeregM == writeregMUL4 & regwriteMUL4)
                forwardaM = 4'b0001;
            else if (writeregM == writeregW4 & regwriteW4)
                forwardaM = 4'b0010;
            else if (writeregM == writeregMUL3 & regwriteMUL3)
                forwardaM = 4'b0011;
            else if (writeregM == writeregW3 & regwriteW3)
                forwardaM = 4'b0100;
            else if (writeregM == writeregMUL2 & regwriteMUL2)
                forwardaM = 4'b0101;
            else if (writeregM == writeregW2 & regwriteW2)
                forwardaM = 4'b0110;
            else if (writeregM == writeregMUL & regwriteMUL)
                forwardaM = 4'b0111;
            else if (writeregM == writeregW & regwriteW)
                forwardaM = 4'b1000;
    end

    // forwarding sources to M stage (Memory) for channel two
    always_comb
    begin
        forwardaM2 = 4'b0000;
        if (writeregM2 != 0)
            if      (writeregM2 == writeregM & regwriteM)
                forwardaM2 = 4'b0001;
            else if (writeregM2 == writeregMUL4 & regwriteMUL4)
                forwardaM2 = 4'b0010;
            else if (writeregM2 == writeregW4 & regwriteW4)
                forwardaM2 = 4'b0011;
            else if (writeregM2 == writeregMUL3 & regwriteMUL3)
                forwardaM2 = 4'b0100;
            else if (writeregM2 == writeregW3 & regwriteW3)
                forwardaM2 = 4'b0101;
            else if (writeregM2 == writeregMUL2 & regwriteMUL2)
                forwardaM2 = 4'b0110;
            else if (writeregM2 == writeregW2 & regwriteW2)
                forwardaM2 = 4'b0111;
            else if (writeregM2 == writeregMUL & regwriteMUL)
                forwardaM2 = 4'b1000;
            else if (writeregM2 == writeregW & regwriteW)
                forwardaM2 = 4'b1001;
    end

    // forwarding sources to M stage (Memory) for channel three
    always_comb
    begin
        forwardaM3 = 4'b0000;
        if (writeregM3 != 0)
            if      (writeregM3 == writeregM2 & regwriteM2)
                forwardaM3 = 4'b0001;
            else if (writeregM3 == writeregM & regwriteM)
                forwardaM3 = 4'b0010;
            else if (writeregM3 == writeregMUL4 & regwriteMUL4)
                forwardaM3 = 4'b0011;
            else if (writeregM3 == writeregW4 & regwriteW4)
                forwardaM3 = 4'b0100;
            else if (writeregM3 == writeregMUL3 & regwriteMUL3)
                forwardaM3 = 4'b0101;
            else if (writeregM3 == writeregW3 & regwriteW3)
                forwardaM3 = 4'b0110;
            else if (writeregM3 == writeregMUL2 & regwriteMUL2)
                forwardaM3 = 4'b0111;
            else if (writeregM3 == writeregW2 & regwriteW2)
                forwardaM3 = 4'b1000;
            else if (writeregM3 == writeregMUL & regwriteMUL)
                forwardaM3 = 4'b1001;
            else if (writeregM3 == writeregW & regwriteW)
                forwardaM3 = 4'b1010;
    end

    // forwarding sources to M stage (Memory) for channel four
    always_comb
    begin
        forwardaM4 = 4'b0000;
        if (writeregM4 != 0)
            if      (writeregM4 == writeregM3 & regwriteM3)
                forwardaM4 = 4'b0001;
            else if (writeregM4 == writeregM2 & regwriteM2)
                forwardaM4 = 4'b0010;
            else if (writeregM4 == writeregM & regwriteM)
                forwardaM4 = 4'b0011;
            else if (writeregM4 == writeregMUL4 & regwriteMUL4)
                forwardaM4 = 4'b0100;
            else if (writeregM4 == writeregW4 & regwriteW4)
                forwardaM4 = 4'b0101;
            else if (writeregM4 == writeregMUL3 & regwriteMUL3)
                forwardaM4 = 4'b0110;
            else if (writeregM4 == writeregW3 & regwriteW3)
                forwardaM4 = 4'b0111;
            else if (writeregM4 == writeregMUL2 & regwriteMUL2)
                forwardaM4 = 4'b1000;
            else if (writeregM4 == writeregW2 & regwriteW2)
                forwardaM4 = 4'b1001;
            else if (writeregM4 == writeregMUL & regwriteMUL)
                forwardaM4 = 4'b1010;
            else if (writeregM4 == writeregW & regwriteW)
                forwardaM4 = 4'b1011;
    end

endmodule
    // ****************************************************************
    // ************************Forwarding-M-stage**********************
    // ****************************************************************

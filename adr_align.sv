module adr_align (input  logic [31:0] pcnext2F,
                  output logic [31:0] pcnext3F,
                  output logic        alignF,
                  output logic        alignF2,
                  output logic        alignF3); 
    
    logic [3:0] choice;
    assign choice = pcnext2F[3:0];

    always_comb
    begin
        /*if      (pcnext2F[3:0] == 4'b0)
            {alignF, alignF2, alignF3, pcnext3F} = {1'b0, 1'b0, 1'b0, pcnext2F};

        else if (pcnext2F[3:0] == 4'b0100)
            {alignF, alignF2, alignF3, pcnext3F} = {1'b1, 1'b0, 1'b0, pcnext2F - 4};
        
        else if (pcnext2F[3:0] == 4'b1000)
            {alignF, alignF2, alignF3, pcnext3F} = {1'b1, 1'b1, 1'b0, pcnext2F - 8};

        else if (pcnext2F[3:0] == 4'b1100)
            {alignF, alignF2, alignF3, pcnext3F} = {1'b1, 1'b1, 1'b1, pcnext2F - 12};
    end*/
    
    case(choice)
        4'b0000: {alignF, alignF2, alignF3, pcnext3F} = {1'b0, 1'b0, 1'b0, pcnext2F};
        4'b0100: {alignF, alignF2, alignF3, pcnext3F} = {1'b1, 1'b0, 1'b0, pcnext2F - 4};
        4'b1000: {alignF, alignF2, alignF3, pcnext3F} = {1'b1, 1'b1, 1'b0, pcnext2F - 8};
        4'b1100: {alignF, alignF2, alignF3, pcnext3F} = {1'b1, 1'b1, 1'b1, pcnext2F - 12};
        default: {alignF, alignF2, alignF3, pcnext3F} = {1'b0, 1'b0, 1'b0, 1'b0};
     endcase
     
  end

endmodule

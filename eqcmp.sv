module eqcmp (input logic [31:0] a, b,
              output logic y);

    always_comb
    begin
        y = 1'b0;
        if (a == b)
            y = 1'b1;
    end
    
endmodule

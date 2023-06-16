module mux13 #(parameter WIDTH = 8)
              (input  logic [WIDTH-1:0] d0,  d1,
                                        d2,  d3,
                                        d4,  d5,
                                        d6,  d7,
                                        d8,  d9,
                                        d10, d11,
                                        d12,

              input  logic [3:0]        s,
              output logic [WIDTH-1:0]  y);

    always_comb
    begin
        case (s)
            4'b0000: y = d0;
            4'b0001: y = d1;
            4'b0010: y = d2;
            4'b0011: y = d3;
            4'b0100: y = d4;
            4'b0101: y = d5;
            4'b0110: y = d6;
            4'b0111: y = d7;
            4'b1000: y = d8;
            4'b1001: y = d9;
            4'b1010: y = d10;
            4'b1011: y = d11;
            4'b1100: y = d12;
            default: y = 0;
        endcase
    end

endmodule

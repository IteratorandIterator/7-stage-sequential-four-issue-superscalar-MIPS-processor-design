module unsignextend (input logic [15:0] a,
                   output logic [31:0] y);

    assign y = { 16'b0, a};

endmodule
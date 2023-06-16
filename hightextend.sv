module hightextend (input logic [15:0] a,
                   output logic [31:0] y);

    assign y = { a, 16'b0 };

endmodule

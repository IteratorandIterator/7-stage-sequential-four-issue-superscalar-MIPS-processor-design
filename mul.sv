module mul (input logic [31:0] d0, d1,
            output logic [31:0] y);

    assign y = d0 * d1;
    //assign y = d0;

endmodule

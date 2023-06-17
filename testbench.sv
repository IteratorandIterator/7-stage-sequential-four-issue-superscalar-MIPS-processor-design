`timescale 1ns / 1ps

module testbench ();
    logic clk;
    logic reset;
    logic we3;

    logic [31:0] pcF, writedata2M3, dataadrM3;

    // instantiate device to be tested
    top dut (clk, reset, we3, pcF, dataadrM3, writedata2M3);

    // initialize test
    initial 
        begin
            reset <= 1; # 10;
            reset <= 0;
        end

    // generate clock to sequence tests
    always
    begin
        clk <= 1; # 5;
        clk <= 0; # 5;
    end

    // check results
    always @ (negedge clk)
    begin
        if (we3)
        begin
            if (dataadrM3 === 84 & writedata2M3 === 7)
            begin
                $display("Simulation succeed");
                $stop;
            end
            else if(dataadrM3 !== 80)
            begin
                $display("Simulation failed");
                $stop;
            end
        end
    end

endmodule

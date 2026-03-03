`timescale 1ns / 1ps

module dec_2to4_tb;

    // DUT signals
    reg  [1:0] in;
    wire [3:0] out;

    // DUT instantiation
    dec_2to4 dut (
        .in  (in),
        .out (out)
    );

    // Monitor
    initial $monitor("T=%0t | in=%b | out=%b", $time, in, out);

    // Stimulus – walk through all 4 input combinations
    integer i;
    initial begin
        $dumpfile("dec_2to4.vcd");
        $dumpvars(0, dec_2to4_tb);

        for (i = 0; i < 4; i = i + 1) begin
            in = i[1:0];
            #10;
        end

        $finish;
    end

endmodule

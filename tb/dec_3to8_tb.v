`timescale 1ns / 1ps

module dec_3to8_tb;

    // DUT signals
    reg  [2:0] in;
    wire [7:0] out;

    // DUT instantiation
    dec_3to8 dut (
        .in  (in),
        .out (out)
    );

    // Monitor
    initial $monitor("T=%0t | in=%b | out=%b", $time, in, out);

    // Stimulus – walk through all 8 input combinations
    integer i;
    initial begin
        $dumpfile("dec_3to8.vcd");
        $dumpvars(0, dec_3to8_tb);

        repeat (8) begin : loop
            in = i[2:0];
            #10;
            i = i + 1;
        end

        $finish;
    end

    initial i = 0;

endmodule

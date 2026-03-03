`timescale 1ns / 1ps

module priority_encoder_8to3_tb;

    // DUT signals
    reg  [7:0] in;
    wire [2:0] out;
    wire       valid;

    // DUT instantiation
    priority_encoder_8to3 dut (
        .in    (in),
        .out   (out),
        .valid (valid)
    );

    // Monitor
    initial $monitor("T=%0t | in=%b | out=%0d valid=%b", $time, in, out, valid);

    // Stimulus
    initial begin
        $dumpfile("priority_encoder_8to3.vcd");
        $dumpvars(0, priority_encoder_8to3_tb);

        // No input active -> valid = 0
        in = 8'b0000_0000; #10;

        // Single bit active - one per lane
        in = 8'b0000_0001; #10;   // expect out=0
        in = 8'b0000_0010; #10;   // expect out=1
        in = 8'b0000_0100; #10;   // expect out=2
        in = 8'b0000_1000; #10;   // expect out=3
        in = 8'b0001_0000; #10;   // expect out=4
        in = 8'b0010_0000; #10;   // expect out=5
        in = 8'b0100_0000; #10;   // expect out=6
        in = 8'b1000_0000; #10;   // expect out=7

        // Multiple bits set - highest wins
        in = 8'b1010_0101; #10;   // expect out=7 (in[7]=1)
        in = 8'b0110_1110; #10;   // expect out=6 (in[6]=1)
        in = 8'b0001_1111; #10;   // expect out=4 (in[4]=1)
        in = 8'b0000_0011; #10;   // expect out=1 (in[1]=1)

        $finish;
    end

endmodule

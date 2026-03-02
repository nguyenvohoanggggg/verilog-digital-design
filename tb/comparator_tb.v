`timescale 1ns / 1ps

module comparator_tb;

    // DUT signals
    reg  [3:0] a;
    reg  [3:0] b;
    wire       gt;
    wire       eq;
    wire       lt;

    // DUT instantiation
    comparator dut (
        .a  (a),
        .b  (b),
        .gt (gt),
        .eq (eq),
        .lt (lt)
    );

    // Monitor
    initial $monitor("T=%0t | a=%0d  b=%0d | gt=%b eq=%b lt=%b",
                      $time, a, b, gt, eq, lt);

    // Stimulus
    initial begin
        $dumpfile("comparator.vcd");
        $dumpvars(0, comparator_tb);

        // a < b
        a = 4'd3;  b = 4'd7;  #10;
        // a = b
        a = 4'd5;  b = 4'd5;  #10;
        // a > b
        a = 4'd9;  b = 4'd2;  #10;
        // boundary: a = 0
        a = 4'd0;  b = 4'd15; #10;
        // boundary: a = 15
        a = 4'd15; b = 4'd0;  #10;
        // both max
        a = 4'd15; b = 4'd15; #10;

        $finish;
    end

endmodule

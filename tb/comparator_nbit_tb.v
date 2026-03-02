`timescale 1ns / 1ps

module comparator_nbit_tb;

    // Parameters
    localparam N = 8;

    // DUT signals
    reg  [N-1:0] a;
    reg  [N-1:0] b;
    wire         gt;
    wire         eq;
    wire         lt;

    // DUT instantiation
    comparator_nbit #(.N(N)) dut (
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
        $dumpfile("comparator_nbit.vcd");
        $dumpvars(0, comparator_nbit_tb);

        // a < b
        a = 8'd10;  b = 8'd200; #10;
        // a = b
        a = 8'd128; b = 8'd128; #10;
        // a > b
        a = 8'd250; b = 8'd3;   #10;
        // boundary: a = 0
        a = 8'd0;   b = 8'd255; #10;
        // boundary: a = 255
        a = 8'd255; b = 8'd0;   #10;
        // both max
        a = 8'd255; b = 8'd255; #10;
        // both zero
        a = 8'd0;   b = 8'd0;   #10;

        $finish;
    end

endmodule

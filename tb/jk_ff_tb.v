`timescale 1ns/1ps

module jk_ff_tb;

    reg  clk;
    reg  rst;
    reg  j;
    reg  k;
    wire q;

    //  DUT
    jk_ff dut (
        .clk  (clk),
        .rst (rst),
        .j    (j),
        .k    (k),
        .q    (q)
    );

    // Clock generation
    always #5 clk = ~clk;  //  10ns period

    initial begin
        // signals
        clk  = 0;
        rst = 0;
        j    = 0;
        k    = 0;

        // Display waveform info in console
        $monitor("T=%0t | rstn=%b | j=%b k=%b | q=%b",
                  $time, rst, j, k, q);

        //  reset
        #12 rst = 1;

        // JK = 00 : Hold
        #10 j = 0; k = 0;

        // JK = 10 : Set
        #10 j = 1; k = 0;

        // JK = 00 : Hold
        #10 j = 0; k = 0;

        // JK = 01 : Reset
        #10 j = 0; k = 1;

        // JK = 11 : Toggle
        #10 j = 1; k = 1;
        #10 j = 1; k = 1;

        //  reset again
        #10 rst = 0;
        #10 rst = 1;

        #20 $stop;
    end

endmodule

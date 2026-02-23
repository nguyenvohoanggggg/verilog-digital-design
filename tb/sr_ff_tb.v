`timescale 1ns/1ps

module sr_ff_tb;

    reg  clk;
    reg  rst;
    reg  s;
    reg  r;
    wire q;

    //  DUT
    sr_ff dut (
        .clk  (clk),
        .rst (rst),
        .s    (s),
        .r    (r),
        .q    (q)
    );

    // Clock generation
    always #5 clk = ~clk;  // 10ns period

    initial begin
        // signals
        clk  = 0;
        rst = 0;
        s    = 0;
        r    = 0;

        $monitor("T=%0t | rstn=%b | s=%b r=%b | q=%b",
                  $time, rst, s, r, q);

        //  reset
        #12 rst = 1;

        // SR = 00 : Hold
        #10 s = 0; r = 0;

        // SR = 10 : Set
        #10 s = 1; r = 0;

        // SR = 00 : Hold
        #10 s = 0; r = 0;

        // SR = 01 : Reset
        #10 s = 0; r = 1;

        // SR = 11 : Invalid (should not be used)
        #10 s = 1; r = 1;

        //  reset again
        #10 rst = 0;
        #10 rst = 1;

        #20 $stop;
    end
endmodule


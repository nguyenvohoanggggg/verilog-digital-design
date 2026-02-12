`timescale 1ns/1ps

module d_ff_tb;

    reg clk;
    reg d;
    wire q;
    wire qbar;

    // DUT
    d_ff dut (
        .clk    (clk),
        .d      (d),
        .q      (q),
        .qbar   (qbar)
    );

    // Clock generation 
    always #5 clk = ~clk;  // 10ns period

    initial begin
        // signals
        clk = 0;
        d = 0;

        $monitor("Time=%0t | d=%b | q=%b | qbar=%b",
                $time, d, q, qbar);

        // Test case
        #10 d = 1;
        #10 d = 0;
        #10 d = 1;
        #10 d = 1;
        #10 d = 0;

        #20 $stop;
    end

endmodule

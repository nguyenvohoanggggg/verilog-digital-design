`timescale 1ns/1ps

module tb_t_ff;

    reg  clk;
    reg  rst;
    reg  t;
    wire q;

    //  DUT
    t_ff dut (
        .clk  (clk),
        .rst (rst),
        .t    (t),
        .q    (q)
    );

    // Clock generation
    always #5 clk = ~clk;  // 10ns period

    initial begin
        // signals
        clk  = 0;
        rst = 0;
        t    = 0;

        $monitor("T=%0t | rstn=%b | t=%b | q=%b",
                  $time, rst, t, q);

        //  reset
        #12 rst = 1;

        // t = 0 : hold
        #10 t = 0;
        #10 t = 0;

        // t = 1 : toggle
        #10 t = 1;
        #10 t = 1;

        // t = 0 : hold
        #10 t = 0;

        // t = 1 : toggle
        #10 t = 1;

        //  reset again
        #10 rst = 0;
        #10 rst = 1;

        #10 t = 1;

        #20 $stop;
    end

endmodule

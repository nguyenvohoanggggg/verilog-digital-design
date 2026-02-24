`timescale 1ns/1ps

module d_latch_tb;

    reg  d;
    reg  en;
    wire Q;
    wire Qbar;

    //  DUT
    d_latch dut (
        .d    (d),
        .en   (en),
        .Q    (Q),
        .Qbar (Qbar)
    );

    initial begin
        // Initialize
        d  = 0;
        en = 0;

        $monitor("T=%0t | EN=%b | D=%b | Q=%b | Qbar=%b",
                  $time, en, d, Q, Qbar);

        // en = 0 : hold
        #10 d = 1;
        #10 d = 0;

        // en = 1 : Q = D
        #10 en = 1;
        #5  d  = 1;
        #5  d  = 0;
        #5  d  = 1;

        // en = 0 : hold last value
        #10 en = 0;
        #10 d  = 0;
        #10 d  = 1;

        // en = 1
        #10 en = 1;
        #5  d  = 0;
        #5  d  = 1;

        #20 $stop;
    end

endmodule

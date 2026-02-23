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
        D  = 0;
        EN = 0;

        $monitor("T=%0t | EN=%b | D=%b | Q=%b | Qbar=%b",
                  $time, en, d, Q, Qbar);

        // en = 0 : hold
        #10 D = 1;
        #10 D = 0;

        // en = 1 : Q = D
        #10 EN = 1;
        #5  D  = 1; 
        #5  D  = 0;
        #5  D  = 1;

        // en = 0 : hold last value
        #10 EN = 0;
        #10 D  = 0;
        #10 D  = 1;

        // en = 1
        #10 EN = 1;
        #5  D  = 0;
        #5  D  = 1;

        #20 $stop;
    end

endmodule

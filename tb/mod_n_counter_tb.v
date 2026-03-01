`timescale 1ns/1ps

module mod_n_counter_tb;

    parameter N = 10;
    parameter WIDTH = $clog2(N);

    reg clk;
    reg rst;
    reg en;
    wire [WIDTH-1:0] count;

    // Instantiate DUT
    mod_n_counter #(
        .N(N)
    ) dut (
        .clk(clk),
        .rst(rst),
        .en(en),
        .count(count)
    );

    // Clock generation (10ns period)
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Stimulus
    initial begin
        $display("Starting MOD-N Counter Test...");
        $monitor("Time=%0t | rst=%b en=%b count=%0d",
                  $time, rst, en, count);

        rst = 0;
        en  = 0;

        #12;
        rst = 1;      // release reset

        #10;
        en = 1;       // start counting

        #150;

        en = 0;       // stop counting
        #20;

        en = 1;       // resume
        #100;

        $display("Test Finished.");
        $finish;
    end

endmodule
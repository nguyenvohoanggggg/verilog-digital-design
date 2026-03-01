`timescale 1ns/1ps

module ring_counter_tb;

    parameter N = 4;   

    reg clk;
    reg rst;
    wire [N-1:0] out;

    // Instantiate DUT
    ring_counter #(
        .N(N)
    ) dut (
        .clk(clk),
        .rst(rst),
        .out(out)
    );

    // Clock generation (10ns period)
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Stimulus
    initial begin
        $display("Starting Ring Counter Test...");
        $monitor("Time=%0t | rst=%b | out=%b", $time, rst, out);

        rst = 0;
        #12;
        rst = 1;

        #(N*10);

        $display("Test finished.");
        $finish;
    end

    // Dump waveform
    initial begin
        $dumpfile("ring_counter.vcd");
        $dumpvars(0, ring_counter_tb);
    end

endmodule
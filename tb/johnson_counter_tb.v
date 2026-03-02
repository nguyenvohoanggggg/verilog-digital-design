`timescale 1ns/1ps

module johnson_counter_tb;

    parameter N = 4;

    reg clk;
    reg rst;
    wire [N-1:0] out;

    // Instantiate DUT
    johnson_counter #(
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
        $display("Starting Johnson Counter Test...");
        $monitor("Time=%0t | rst=%b | out=%b", $time, rst, out);

        rst = 0;
        #12;          // hold reset
        rst = 1;      // release reset

        // run 2N period
        #(2*N*10);

        $display("Test finished.");
        $finish;
    end

    // Dump waveform (ModelSim/VCD)
    initial begin
        $dumpfile("johnson_counter.vcd");
        $dumpvars(0, johnson_counter_tb);
    end

endmodule
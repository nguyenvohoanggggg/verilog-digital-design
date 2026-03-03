`timescale 1ns / 1ps

module pipo_tb;

    // Parameters
    localparam N = 8;

    // DUT signals
    reg             clk;
    reg             rst;
    reg             load;
    reg  [N-1:0]    parallel_in;
    wire [N-1:0]    parallel_out;

    // DUT instantiation
    pipo #(.N(N)) dut (
        .clk          (clk),
        .rst          (rst),
        .load         (load),
        .parallel_in  (parallel_in),
        .parallel_out (parallel_out)
    );

    // Clock: 10 ns period
    initial clk = 0;
    always #5 clk = ~clk;

    // Task: wait n rising edges
    task tick;
        input integer n;
        repeat (n) @(posedge clk);
    endtask

    // Stimulus
    initial begin
        $dumpfile("pipo.vcd");
        $dumpvars(0, pipo_tb);

        // Initialise
        rst = 0; load = 0; parallel_in = {N{1'b0}};

        // Reset for 2 cycles then release
        tick(2); rst = 1;
        $display("After reset      : parallel_out = %b  (exp 00000000)", parallel_out);

        // Load 0xA5
        parallel_in = 8'hA5; load = 1;
        tick(1); load = 0;
        $display("After load 0xA5  : parallel_out = %b  (exp 10100101)", parallel_out);

        // Hold: load=0, parallel_out must not change
        tick(3);
        $display("After hold x3    : parallel_out = %b  (unchanged)", parallel_out);

        // Load 0x3C
        parallel_in = 8'h3C; load = 1;
        tick(1); load = 0;
        $display("After load 0x3C  : parallel_out = %b  (exp 00111100)", parallel_out);

        // Async reset mid-cycle
        load = 0; #3;
        rst = 0; #2;
        $display("Async reset      : parallel_out = %b  (exp 00000000)", parallel_out);
        rst = 1;

        tick(2);
        $display("Simulation done.");
        $finish;
    end

endmodule

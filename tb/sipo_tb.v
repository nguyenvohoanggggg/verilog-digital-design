`timescale 1ns / 1ps

module sipo_tb;

    // Parameters
    localparam N = 8;

    // DUT signals
    reg          clk;
    reg          rst;
    reg          load;
    reg          shift_en;
    reg          serial_in;
    reg [N-1:0]  parallel_in;
    wire [N-1:0] parallel_out;

    // DUT instantiation
    sipo #(.N(N)) dut (
        .clk          (clk),
        .rst          (rst),
        .load         (load),
        .shift_en     (shift_en),
        .serial_in    (serial_in),
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
    integer i;
    initial begin
        $dumpfile("sipo.vcd");
        $dumpvars(0, sipo_tb);

        // Initialise
        rst = 0; load = 0; shift_en = 0;
        serial_in = 0; parallel_in = {N{1'b0}};

        // Reset for 2 cycles then release
        tick(2); rst = 1;
        $display("After reset      : parallel_out = %b  (exp 00000000)", parallel_out);

        // Shift in 8 bits serially: 1,0,1,0,0,1,0,1 (LSB first -> expect 0xA5)
        $display("Shifting in: 1 0 1 0 0 1 0 1 (LSB first)");
        shift_en = 1;
        serial_in = 1; tick(1); $display("  parallel_out = %b", parallel_out);
        serial_in = 0; tick(1); $display("  parallel_out = %b", parallel_out);
        serial_in = 1; tick(1); $display("  parallel_out = %b", parallel_out);
        serial_in = 0; tick(1); $display("  parallel_out = %b", parallel_out);
        serial_in = 0; tick(1); $display("  parallel_out = %b", parallel_out);
        serial_in = 1; tick(1); $display("  parallel_out = %b", parallel_out);
        serial_in = 0; tick(1); $display("  parallel_out = %b", parallel_out);
        serial_in = 1; tick(1);
        shift_en = 0;
        $display("After 8 shifts   : parallel_out = %b  (exp 10100101)", parallel_out);

        // Parallel preload
        parallel_in = 8'hFF; load = 1;
        tick(1); load = 0;
        $display("After load 0xFF  : parallel_out = %b  (exp 11111111)", parallel_out);

        // Async reset
        shift_en = 1; serial_in = 1; #3;
        rst = 0; #2;
        $display("Async reset      : parallel_out = %b  (exp 00000000)", parallel_out);
        rst = 1; shift_en = 0;

        tick(2);
        $display("Simulation done.");
        $finish;
    end

endmodule

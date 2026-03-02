`timescale 1ns / 1ps

module bidirectional_tb;

    // Parameters
    localparam N = 8;

    // DUT signals
    reg             clk;
    reg             rst;
    reg             load;
    reg             shift_en;
    reg             dir;             // 0 = shift left, 1 = shift right
    reg             serial_in_left;
    reg             serial_in_right;
    reg  [N-1:0]    parallel_in;
    wire [N-1:0]    data_out;

    // DUT instantiation
    bidirectional_shift #(.N(N)) dut (
        .clk            (clk),
        .rst            (rst),
        .load           (load),
        .shift_en       (shift_en),
        .dir            (dir),
        .serial_in_left (serial_in_left),
        .serial_in_right(serial_in_right),
        .parallel_in    (parallel_in),
        .data_out       (data_out)
    );

    // Clock: 10 ns period
    initial clk = 0;
    always #5 clk = ~clk;

    // Stimulus
    initial begin
        $dumpfile("bidirectional.vcd");
        $dumpvars(0, bidirectional_tb);

        // Initialise
        rst = 0; load = 0; shift_en = 0;
        dir = 0; serial_in_left = 0; serial_in_right = 0;
        parallel_in = 8'b0;

        // Reset
        @(posedge clk); @(posedge clk);
        rst = 1;

        // Parallel load 0xA5
        @(posedge clk);
        parallel_in = 8'hA5; load = 1;
        @(posedge clk); load = 0;
        $display("After load       : data_out = %b (expected 10100101)", data_out);

        // Shift left x3, serial_in_left = 0
        dir = 0; serial_in_left = 0; shift_en = 1;
        @(posedge clk);
        $display("Shift left x1    : data_out = %b (expected 01001010)", data_out);
        @(posedge clk);
        $display("Shift left x2    : data_out = %b (expected 10010100)", data_out);
        @(posedge clk);
        $display("Shift left x3    : data_out = %b (expected 00101000)", data_out);
        shift_en = 0;

        // Parallel load 0xA5 again
        parallel_in = 8'hA5; load = 1;
        @(posedge clk); load = 0;

        // Shift right x3, serial_in_right = 0
        dir = 1; serial_in_right = 0; shift_en = 1;
        @(posedge clk);
        $display("Shift right x1   : data_out = %b (expected 01010010)", data_out);
        @(posedge clk);
        $display("Shift right x2   : data_out = %b (expected 00101001)", data_out);
        @(posedge clk);
        $display("Shift right x3   : data_out = %b (expected 00010100)", data_out);
        shift_en = 0;

        // Hold: no load, no shift_en
        @(posedge clk);
        $display("Hold             : data_out = %b (unchanged)", data_out);

        // Async reset
        rst = 0; #3;
        $display("Async reset      : data_out = %b (expected 00000000)", data_out);
        rst = 1;

        #20;
        $display("Simulation done.");
        $finish;
    end

endmodule

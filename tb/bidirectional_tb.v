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

    // Task: wait n rising edges
    task tick;
        input integer n;
        repeat (n) @(posedge clk);
    endtask

    // Task: parallel load for 1 cycle then deassert
    task do_load;
        input [N-1:0] data;
        begin
            parallel_in = data;
            load = 1;
            tick(1);
            load = 0;
        end
    endtask

    // Stimulus
    initial begin
        $dumpfile("bidirectional.vcd");
        $dumpvars(0, bidirectional_tb);

        // Initialise
        rst = 0; load = 0; shift_en = 0;
        dir = 0; serial_in_left = 0; serial_in_right = 0;
        parallel_in = {N{1'b0}};

        // Reset: hold for 2 cycles then release
        tick(2);
        rst = 1;

        // ----------------------------------------------------------------
        // Parallel load
        // ----------------------------------------------------------------
        do_load(8'hA5);
        $display("After load       : data_out = %b  (exp 10100101)", data_out);

        // ----------------------------------------------------------------
        // Shift left x4, serial_in_left = 0
        // ----------------------------------------------------------------
        dir = 0; serial_in_left = 0; shift_en = 1;
        repeat (4) begin
            tick(1);
            $display("Shift left       : data_out = %b", data_out);
        end
        shift_en = 0;

        // ----------------------------------------------------------------
        // Reload and shift right x4, serial_in_right = 1
        // ----------------------------------------------------------------
        do_load(8'hA5);
        $display("After reload     : data_out = %b  (exp 10100101)", data_out);

        dir = 1; serial_in_right = 1; shift_en = 1;
        repeat (4) begin
            tick(1);
            $display("Shift right      : data_out = %b", data_out);
        end
        shift_en = 0;

        // ----------------------------------------------------------------
        // Hold: shift_en = 0, data_out must stay unchanged
        // ----------------------------------------------------------------
        tick(2);
        $display("Hold             : data_out = %b  (unchanged)", data_out);

        // ----------------------------------------------------------------
        // Async reset mid-cycle
        // ----------------------------------------------------------------
        shift_en = 1; dir = 0;
        #3;
        rst = 0;
        #2;
        $display("Async reset      : data_out = %b  (exp 00000000)", data_out);
        rst = 1; shift_en = 0;

        tick(2);
        $display("Simulation done.");
        $finish;
    end

endmodule

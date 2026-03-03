`timescale 1ns / 1ps

module piso_tb;

    // Parameters
    localparam N = 8;

    // DUT signals
    reg          clk;
    reg          rst;
    reg          load;
    reg          shift_en;
    reg [N-1:0]  parallel_in;
    wire         serial_out;

    // DUT instantiation
    piso #(.N(N)) dut (
        .clk          (clk),
        .rst          (rst),
        .load         (load),
        .shift_en     (shift_en),
        .parallel_in  (parallel_in),
        .serial_out   (serial_out)
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
        $dumpfile("piso.vcd");
        $dumpvars(0, piso_tb);

        // Initialise
        rst = 0; load = 0; shift_en = 0;
        parallel_in = {N{1'b0}};

        // Reset for 2 cycles then release
        tick(2); rst = 1;

        // Load 0xA5 = 10100101, then shift out all 8 bits MSB first
        parallel_in = 8'hA5; load = 1;
        tick(1); load = 0;
        $display("Loaded 0xA5 = 10100101 -- shifting out MSB first:");

        shift_en = 1;
        repeat (N) begin
            tick(1);
            $display("  serial_out = %b", serial_out);
        end
        shift_en = 0;

        // Load 0xFF, shift out
        parallel_in = 8'hFF; load = 1;
        tick(1); load = 0;
        $display("Loaded 0xFF = 11111111 -- shifting out:");

        shift_en = 1;
        repeat (N) begin
            tick(1);
            $display("  serial_out = %b", serial_out);
        end
        shift_en = 0;

        // Async reset mid-shift
        parallel_in = 8'hA5; load = 1;
        tick(1); load = 0;
        shift_en = 1; #3;
        rst = 0; #2;
        $display("Async reset      : serial_out = %b  (exp 0)", serial_out);
        rst = 1; shift_en = 0;

        tick(2);
        $display("Simulation done.");
        $finish;
    end

endmodule

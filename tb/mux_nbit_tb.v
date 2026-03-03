`timescale 1ns / 1ps

module mux_nbit_tb;

    // Parameters
    localparam N     = 32;
    localparam WIDTH = 5;   // $clog2(32)

    // DUT signals
    reg  [N-1:0]     data_in;
    reg  [WIDTH-1:0] sel;
    wire             data_out;

    // DUT instantiation
    mux_nbit #(.N(N)) dut (
        .data_in  (data_in),
        .sel      (sel),
        .data_out (data_out)
    );

    // Monitor
    initial $monitor("T=%0t | sel=%0d | data_in[%0d]=%b | data_out=%b",
                      $time, sel, sel, data_in[sel], data_out);

    // Stimulus
    integer i;
    initial begin
        $dumpfile("mux_nbit.vcd");
        $dumpvars(0, mux_nbit_tb);

        // Walk sel through all lanes with a walking-one pattern on data_in
        // data_in has exactly one '1' at position sel, so data_out must be 1
        for (i = 0; i < N; i = i + 1) begin
            data_in = (32'b1 << i);   // only bit i is set
            sel     = i[WIDTH-1:0];
            #10;
        end

        // All-zero data_in: data_out must always be 0
        data_in = {N{1'b0}};
        for (i = 0; i < N; i = i + 1) begin
            sel = i[WIDTH-1:0];
            #10;
        end

        // All-one data_in: data_out must always be 1
        data_in = {N{1'b1}};
        for (i = 0; i < N; i = i + 1) begin
            sel = i[WIDTH-1:0];
            #10;
        end

        $finish;
    end

endmodule

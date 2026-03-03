`timescale 1ns / 1ps

module demux_nbit_tb;

    // Parameters
    localparam N     = 16;
    localparam WIDTH = 4;   // $clog2(16)

    // DUT signals
    reg              din;
    reg  [WIDTH-1:0] sel;
    wire [N-1:0]     dout;

    // DUT instantiation
    demux_nbit #(.N(N)) dut (
        .din  (din),
        .sel  (sel),
        .dout (dout)
    );

    // Monitor
    initial $monitor("T=%0t | din=%b sel=%0d | dout=%b", $time, din, sel, dout);

    // Stimulus
    integer i;
    initial begin
        $dumpfile("demux_nbit.vcd");
        $dumpvars(0, demux_nbit_tb);

        // din = 1: route to each lane in turn
        din = 1;
        for (i = 0; i < N; i = i + 1) begin
            sel = i[WIDTH-1:0];
            #10;
        end

        // din = 0: all outputs must be 0 regardless of sel
        din = 0;
        for (i = 0; i < N; i = i + 1) begin
            sel = i[WIDTH-1:0];
            #10;
        end

        $finish;
    end

endmodule

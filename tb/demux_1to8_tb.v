`timescale 1ns/1ps

module demux_1to8_tb;

    // signals
    reg        din;
    reg  [2:0] sel;
    wire [7:0] dout;

    // DUT
    demux_1to8 dut (
        .din (din),
        .sel (sel),
        .dout(dout)
    );

    // Stimulus
    initial begin
        din = 0;
        sel = 0;

        #10;

        // Case 1: din = 0
        din = 0;
        repeat (8) begin
            #10 sel = sel + 1;
        end

        #10;

        // Case 2: din = 1
        din = 1;
        sel = 0;
        repeat (8) begin
            #10 sel = sel + 1;
        end

        #10;

        $stop;
    end

endmodule

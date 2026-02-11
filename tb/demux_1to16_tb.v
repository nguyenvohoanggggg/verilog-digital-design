`timescale 1ns/1ps

module demux_1to16_tb;

    reg         din;
    reg  [3:0]  sel;
    wire [15:0] dout;

    demux_1to16 dut (
        .din(din),
        .sel(sel),
        .dout(dout)
    );

    initial begin
        din = 0;
        sel = 0;
        #10;

        // din = 0
        repeat (16) begin
            #10 sel = sel + 1;
        end

        // din = 1
        din = 1;
        sel = 0;
        #10;
        repeat (16) begin
            #10 sel = sel + 1;
        end

        #10;
        $stop;
    end

endmodule

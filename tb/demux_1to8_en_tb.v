`timescale 1ns/1ps

module demux_1to8_en_tb;

    reg        din;
    reg        en;
    reg  [2:0] sel;
    wire [7:0] dout;

    demux_1to8_en dut (
        .din(din),
        .en(en),
        .sel(sel),
        .dout(dout)
    );

    initial begin
        din = 1;
        en  = 0;
        sel = 0;
        #10;

        // en = 0 
        repeat (8) begin
            #10 sel = sel + 1;
        end

        // en = 1 
        en = 1;
        sel = 0;
        #10;
        repeat (8) begin
            #10 sel = sel + 1;
        end

        // din = 0 
        din = 0;
        #20;

        $stop;
    end

endmodule

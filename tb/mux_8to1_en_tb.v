`timescale 1ns/1ps

module mux_8to1_en_tb;

    reg  [2:0] sel;
    reg  en;
    reg  [7:0] data_in;
    wire data_out;

    //  DUT
    mux_8to1_en dut (
        .sel     (sel),
        .en      (en),
        .data_in (data_in),
        .data_out(data_out)
    );

    initial begin
        // signals
        sel     = 3'b000;
        en      = 0;
        data_in = 8'b00000000;

        // Display waveform info in console
        $monitor("T=%0t | sel=%b en=%b | data_in=%b | data_out=%b",
                  $time, sel, en, data_in, data_out);

        // Enable the multiplexer
        #10 en = 1;

        // Test all combinations of select and data inputs
        #10 sel = 3'b000; data_in = 8'b10101010;
        #10 sel = 3'b001; data_in = 8'b10101010;
        #10 sel = 3'b010; data_in = 8'b10101010;
        #10 sel = 3'b011; data_in = 8'b10101010;
        #10 sel = 3'b100; data_in = 8'b10101010;
        #10 sel = 3'b101; data_in = 8'b10101010;
        #10 sel = 3'b110; data_in = 8'b10101010;
        #10 sel = 3'b111; data_in = 8'b10101010;

        // Disable the multiplexer
        #10 en = 0;

        #20 $stop;
    end

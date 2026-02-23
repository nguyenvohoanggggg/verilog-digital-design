`timescale 1ns/1ps

module mux_16to1_tb;

  reg  [15:0] data_in;
  reg  [3:0] sel;
  wire        data_out;

  // DUT
  mux_16to1 dut (
    .data_in (data_in),
    .sel     (sel),
    .data_out(data_out)
  );

  initial begin

    // Test case 1
    data_in = 16'b1010_1101_0110_1111;

    sel = 4'd0; #10;
    sel = 4'd1; #10;
    sel = 4'd2; #10;
    sel = 4'd3; #10;
    sel = 4'd4; #10;
    sel = 4'd5; #10;
    sel = 4'd6; #10;
    sel = 4'd7; #10;
    sel = 4'd8; #10;
    sel = 4'd9; #10;
    sel = 4'd10; #10;
    sel = 4'd11; #10;
    sel = 4'd12; #10;
    sel = 4'd13; #10;
    sel = 4'd14; #10;
    sel = 4'd15; #10;

    // Test case 2
    data_in = 16'b0101_0011_1100_0001;

    sel = 4'd0; #10;
    sel = 4'd5; #10;
    sel = 4'd10; #10;

    #10;
    $stop;
  end
endmodule

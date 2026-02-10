`timescale 1ns / 1ps

module mux_8to1_tb;

  reg  [7:0] data_in;
  reg  [2:0] sel;
  wire       data_out;

  // DUT
  mux_8to1 dut (
    .data_in (data_in),
    .sel     (sel),
    .data_out(data_out)
  );

  initial begin

    // Test case 1
    data_in = 8'b1010_1101;

    sel = 3'd0; #10;
    sel = 3'd1; #10;
    sel = 3'd2; #10;
    sel = 3'd3; #10;
    sel = 3'd4; #10;
    sel = 3'd5; #10;
    sel = 3'd6; #10;
    sel = 3'd7; #10;

    // Test case 2
    data_in = 8'b0101_0011;

    sel = 3'd0; #10;
    sel = 3'd3; #10;
    sel = 3'd6; #10;

    #10;
    $stop;   
  end

endmodule

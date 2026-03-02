// -----------------------------------------------------------------------------
// File    : mux_8to1.v
// Module  : mux_8to1
// Brief   : 8-to-1 multiplexer. Selects one bit from data_in[7:0] using
//           3-bit sel and drives it to data_out via chained ternary assigns.
// Rev     : 1.0  2026-03-02  Initial release
// -----------------------------------------------------------------------------
module mux_8to1 (
  input wire [7:0] data_in,
  input wire [2:0] sel,
  output wire data_out
);

  assign data_out = (sel == 3'b000) ? data_in[0] :
                   (sel == 3'b001) ? data_in[1] :
                   (sel == 3'b010) ? data_in[2] :
                   (sel == 3'b011) ? data_in[3] :
                   (sel == 3'b100) ? data_in[4] :
                   (sel == 3'b101) ? data_in[5] :
                   (sel == 3'b110) ? data_in[6] :
                                     data_in[7];

endmodule
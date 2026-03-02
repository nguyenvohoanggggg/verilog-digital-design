// -----------------------------------------------------------------------------
// File    : mux_8to1_en.v
// Module  : mux_8to1_en
// Brief   : 8-to-1 multiplexer with active-high enable. Passes data_in[sel]
//           to data_out when en=1; drives 0 when en=0.
// Rev     : 1.0  2026-03-02  Initial release
// -----------------------------------------------------------------------------
module mux_8to1_en (
  input wire [7:0] data_in,
  input wire [2:0] sel,
  input wire en,
  output wire data_out
);
    assign data_out = en ? data_in[sel] : 1'b0;

endmodule
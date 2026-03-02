// -----------------------------------------------------------------------------
// File    : mux_nbit.v
// Module  : mux_nbit
// Brief   : Parameterized N-to-1 multiplexer. Selects data_in[sel] using
//           a single continuous assignment; sel width is auto-derived.
// Params  : N     – number of input lanes (default 32)
//           WIDTH – sel bit-width, auto-computed as $clog2(N)
// Rev     : 1.0  2026-03-02  Initial release
// -----------------------------------------------------------------------------
module mux_nbit #(
    parameter integer N = 32,
    parameter integer WIDTH = $clog2(N)
)(
    input  wire [N-1:0]       data_in,
    input  wire [WIDTH-1:0]   sel,
    output wire               data_out
);

assign data_out = data_in[sel];

endmodule
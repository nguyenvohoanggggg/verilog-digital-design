// -----------------------------------------------------------------------------
// File    : demux_nbit.v
// Module  : demux_nbit
// Brief   : Parameterized 1-to-N demultiplexer. Routes din to dout[sel];
//           all other lanes are 0. Output width and sel width auto-derived.
// Params  : N     – number of output lanes (default 16)
//           WIDTH – sel bit-width, auto-computed as $clog2(N)
// Rev     : 1.0  2026-03-02  Initial release
// -----------------------------------------------------------------------------
module demux_nbit #(
    parameter integer N = 16,
    parameter integer WIDTH = $clog2(N)
)(
    input  wire              din,
    input  wire [WIDTH-1:0]  sel,
    output wire [N-1:0]      dout
);

assign dout = din ? ({{(N-1){1'b0}},1'b1} << sel) : {N{1'b0}};

endmodule
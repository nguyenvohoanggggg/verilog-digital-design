// -----------------------------------------------------------------------------
// File    : demux_1to8.v
// Module  : demux_1to8
// Brief   : 1-to-8 demultiplexer. Routes 1-bit din to the output lane
//           selected by sel[2:0]; unselected lanes are 0. No enable pin.
// Rev     : 1.0  2026-03-02  Initial release
// -----------------------------------------------------------------------------
module demux_1to8 (
    input  wire       din,
    input  wire [2:0] sel,
    output wire [7:0] dout
);

assign dout = din ? (8'b0000_0001 << sel) : 8'b0;

endmodule

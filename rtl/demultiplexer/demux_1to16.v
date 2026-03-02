// -----------------------------------------------------------------------------
// File    : demux_1to16.v
// Module  : demux_1to16
// Brief   : 1-to-16 demultiplexer. Routes 1-bit din to the output lane
//           selected by sel[3:0]; unselected lanes are 0. No enable pin.
// Rev     : 1.0  2026-03-02  Initial release
// -----------------------------------------------------------------------------
module demux_1to16 (
    input  wire        din,
    input  wire [3:0]  sel,
    output wire [15:0] dout
);

    assign dout = din ? (16'b1 << sel) : 16'b0;

endmodule

// -----------------------------------------------------------------------------
// File    : demux_1to8_en.v
// Module  : demux_1to8_en
// Brief   : 1-to-8 demultiplexer with active-high enable. Routes din to the
//           lane selected by sel[2:0] only when en=1; all outputs 0 otherwise.
// Rev     : 1.0  2026-03-02  Initial release
// -----------------------------------------------------------------------------
module demux_1to8_en (
    input  wire        din,
    input  wire        en,
    input  wire [2:0]  sel,
    output wire [7:0]  dout
);

    assign dout = (en && din) ? (8'b1 << sel) : 8'b0;

endmodule

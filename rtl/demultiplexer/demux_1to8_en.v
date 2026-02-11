module demux_1to8_en (
    input  wire        din,
    input  wire        en,
    input  wire [2:0]  sel,
    output wire [7:0]  dout
);

    assign dout = (en && din) ? (8'b1 << sel) : 8'b0;

endmodule

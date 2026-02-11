module demux_1to8 (
    input  wire       din,
    input  wire [2:0] sel,
    output wire [7:0] dout
);

assign dout = din ? (8'b0000_0001 << sel) : 8'b0;

endmodule

module demux_1to16 (
    input  wire        din,
    input  wire [3:0]  sel,
    output wire [15:0] dout
);

    assign dout = din ? (16'b1 << sel) : 16'b0;

endmodule

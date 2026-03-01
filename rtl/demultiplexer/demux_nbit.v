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
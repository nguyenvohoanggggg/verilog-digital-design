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
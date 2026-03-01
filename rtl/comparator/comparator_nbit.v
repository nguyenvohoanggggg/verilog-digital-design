module comparator_nbit #(
    parameter N = 4
)(
    input  wire [N-1:0] a,
    input  wire [N-1:0] b,
    output wire gt,
    output wire eq,
    output wire lt
);

assign gt = (a > b);
assign eq = (a == b);
assign lt = (a < b);

endmodule
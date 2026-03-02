// -----------------------------------------------------------------------------
// File    : comparator_nbit.v
// Module  : comparator_nbit
// Brief   : Parameterized N-bit magnitude comparator. Produces gt, eq, lt
//           flags for two N-bit unsigned operands a and b.
// Params  : N – operand width (default 4)
// Rev     : 1.0  2026-03-02  Initial release
// -----------------------------------------------------------------------------
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
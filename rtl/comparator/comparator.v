// -----------------------------------------------------------------------------
// File    : comparator.v
// Module  : comparator
// Brief   : 4-bit magnitude comparator. Produces three flags:
//           gt (a>b), eq (a==b), lt (a<b) using continuous assignments.
// Rev     : 1.0  2026-03-02  Initial release
// -----------------------------------------------------------------------------
module comparator (
    input  [3:0] a,
    input  [3:0] b,
    output gt,
    output eq,
    output lt
);

assign gt = (a > b);
assign eq = (a == b);
assign lt = (a < b);

endmodule
// -----------------------------------------------------------------------------
// File    : half_adder.v
// Module  : half_adder
// Brief   : 1-bit half adder. Computes Sum = A ^ B and Carry = A & B.
//           No carry-in; intended as a building block for larger adders.
// Rev     : 1.0  2026-03-02  Initial release
// -----------------------------------------------------------------------------
module half_adder(
    input wire A, B,
    output wire Sum, Carry
    );
    assign Sum = A ^ B;
    assign Carry = A & B;
endmodule
